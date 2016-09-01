/*=========================================================================
  *
  * Program:      Sen2agri-Processors
  * Language:     C++
  * Copyright:    2015-2016, CS Romania, office@c-s.ro
  * See COPYRIGHT file for details.
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.

 =========================================================================*/
 
#pragma once

#include "otbWrapperApplication.h"
#include "otbWrapperApplicationFactory.h"
#include "otbWrapperApplicationRegistry.h"
#include "otbWrapperInputImageListParameter.h"

#include "otbVectorImage.h"
#include "otbImageList.h"

#include "otbStreamingResampleImageFilter.h"

//Transform
#include "itkScalableAffineTransform.h"
//#include "itkIdentityTransform.h"
#include "itkScaleTransform.h"

#include "../../MACCSMetadata/include/MACCSMetadataReader.hpp"
#include "../../MACCSMetadata/include/SPOT4MetadataReader.hpp"

// Filters
#include "otbMultiChannelExtractROI.h"

#include "otbCropTypeFeatureExtractionFilter.h"
#include "otbTemporalResamplingFilter.h"
#include "otbTemporalMergingFilter.h"

#include "otbSpotMaskFilter.h"
#include "otbLandsatMaskFilter.h"
#include "otbSentinelMaskFilter.h"

#include "TimeSeriesReader.h"

#include <string>

typedef otb::CropTypeFeatureExtractionFilter<ImageType>     CropTypeFeatureExtractionFilterType;
typedef otb::ObjectList<CropTypeFeatureExtractionFilterType>
                                                            CropTypeFeatureExtractionFilterListType;
class CropTypePreprocessing : public TimeSeriesReader
{
public:
    typedef CropTypePreprocessing Self;
    typedef TimeSeriesReader Superclass;
    typedef itk::SmartPointer<Self> Pointer;
    typedef itk::SmartPointer<const Self> ConstPointer;

    itkNewMacro(Self)
    itkTypeMacro(CropTypePreprocessing, TimeSeriesReader)

    CropTypePreprocessing()
    {
        m_TemporalResampler = TemporalResamplingFilterType::New();
        m_FeatureExtractor = CropTypeFeatureExtractionFilterType::New();
    }

    otb::Wrapper::FloatVectorImageType * GetOutput()
    {
        // Merge the rasters and the masks
        ConcatenateVectorImagesFilterType::Pointer bandsConcat = ConcatenateVectorImagesFilterType::New();
        ConcatenateVectorImagesFilterType::Pointer maskConcat = ConcatenateVectorImagesFilterType::New();
        // Also build the image dates structures
        otb::SensorDataCollection sdCollection;

        int index = 0;
        std::string lastMission = "";
        for (const ImageDescriptor& id : m_Descriptors) {
            if (id.mission != lastMission) {
                otb::SensorData sd;
                sd.sensorName = id.mission;
                sd.outDates = m_SensorOutDays[id.mission];
                sdCollection.push_back(sd);
                lastMission = id.mission;
            }

            auto &sd = sdCollection.back();
            int inDay = getDaysFromEpoch(id.aquisitionDate);

            sd.inDates.push_back(inDay);

            bandsConcat->PushBackInput(id.bands);
            maskConcat->PushBackInput(id.mask);
            index++;
        }
        m_ImageMergers->PushBack(bandsConcat);
        m_ImageMergers->PushBack(maskConcat);

        // Set the temporal resampling / gap filling filter
        m_TemporalResampler->SetInputRaster(bandsConcat->GetOutput());
        m_TemporalResampler->SetInputMask(maskConcat->GetOutput());
        // The output days will be updated later
        m_TemporalResampler->SetInputData(sdCollection);

        // Set the feature extractor
        m_FeatureExtractor->SetInput(m_TemporalResampler->GetOutput());

        return m_FeatureExtractor->GetOutput();
    }


private:
    TemporalResamplingFilterType::Pointer             m_TemporalResampler;
    CropTypeFeatureExtractionFilterType::Pointer      m_FeatureExtractor;
};

typedef otb::ObjectList<CropTypePreprocessing>              CropTypePreprocessingList;
