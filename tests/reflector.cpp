#include "reflector.hpp"

Reflector::Reflector(QObject *parent) : QObject(parent) {}

ConfigurationParameterInfo
Reflector::ReflectConfigurationParameterInfo(const ConfigurationParameterInfo &value)
{
    return value;
}

ConfigurationParameterInfoList
Reflector::ReflectConfigurationParameterInfoList(const ConfigurationParameterInfoList &value)
{
    return value;
}

ConfigurationParameterValue
Reflector::ReflectConfigurationParameterValue(const ConfigurationParameterValue &value)
{
    return value;
}

ConfigurationParameterValueList
Reflector::ReflectConfigurationParameterValueList(const ConfigurationParameterValueList &value)
{
    return value;
}

JobConfigurationParameterValue
Reflector::ReflectJobConfigurationParameterValue(const JobConfigurationParameterValue &value)
{
    return value;
}

JobConfigurationParameterValueList Reflector::ReflectJobConfigurationParameterValueList(
    const JobConfigurationParameterValueList &value)
{
    return value;
}

ConfigurationCategory Reflector::ReflectConfigurationCategory(const ConfigurationCategory &value)
{
    return value;
}

ConfigurationCategoryList
Reflector::ReflectConfigurationCategoryList(const ConfigurationCategoryList &value)
{
    return value;
}

Site Reflector::ReflectSite(const Site &value) { return value; }

SiteList Reflector::ReflectSiteList(const SiteList &value) { return value; }

ConfigurationSet Reflector::ReflectConfigurationSet(const ConfigurationSet &value) { return value; }

ConfigurationUpdateAction
Reflector::ReflectConfigurationUpdateAction(const ConfigurationUpdateAction &value)
{
    return value;
}

ConfigurationUpdateActionList
Reflector::ReflectConfigurationUpdateActionList(const ConfigurationUpdateActionList &value)
{
    return value;
}

JobConfigurationUpdateAction
Reflector::ReflectJobConfigurationUpdateAction(const JobConfigurationUpdateAction &value)
{
    return value;
}

JobConfigurationUpdateActionList
Reflector::ReflectJobConfigurationUpdateActionList(const JobConfigurationUpdateActionList &value)
{
    return value;
}

KeyedMessage Reflector::ReflectKeyedMessage(const KeyedMessage &value) { return value; }

KeyedMessageList Reflector::ReflectKeyedMessageList(const KeyedMessageList &value) { return value; }

Product Reflector::ReflectProduct(const Product &value) { return value; }

ProductList Reflector::ReflectProductList(const ProductList &value) { return value; }

ProductToArchive Reflector::ReflectProductToArchive(const ProductToArchive &value) { return value; }

ProductToArchiveList Reflector::ReflectProductToArchiveList(const ProductToArchiveList &value)
{
    return value;
}

ArchivedProduct Reflector::ReflectArchivedProduct(const ArchivedProduct &value) { return value; }

ArchivedProductList Reflector::ReflectArchivedProductList(const ArchivedProductList &value)
{
    return value;
}

ExecutionStatusList Reflector::ReflectExecutionStatusList(const ExecutionStatusList &value)
{
    return value;
}

NewJob Reflector::ReflectNewJob(const NewJob &value) { return value; }

TaskIdList Reflector::ReflectTaskIdList(const TaskIdList &value) { return value; }

NewTask Reflector::ReflectNewTask(const NewTask &value) { return value; }

NewStep Reflector::ReflectNewStep(const NewStep &value) { return value; }

NewStepList Reflector::ReflectNewStepList(const NewStepList &value) { return value; }

ExecutionStatistics Reflector::ReflectExecutionStatistics(const ExecutionStatistics &value)
{
    return value;
}

TaskRunnableEvent Reflector::ReflectTaskRunnableEvent(const TaskRunnableEvent &value)
{
    return value;
}

TaskFinishedEvent Reflector::ReflectTaskFinishedEvent(const TaskFinishedEvent &value)
{
    return value;
}

ProductAvailableEvent Reflector::ReflectProductAvailableEvent(const ProductAvailableEvent &value)
{
    return value;
}

JobCancelledEvent Reflector::ReflectJobCancelledEvent(const JobCancelledEvent &value)
{
    return value;
}

JobPausedEvent Reflector::ReflectJobPausedEvent(const JobPausedEvent &value) { return value; }

JobResumedEvent Reflector::ReflectJobResumedEvent(const JobResumedEvent &value) { return value; }

JobSubmittedEvent Reflector::ReflectJobSubmittedEvent(const JobSubmittedEvent &value)
{
    return value;
}

StepFailedEvent Reflector::ReflectStepFailedEvent(const StepFailedEvent &value) { return value; }

UnprocessedEvent Reflector::ReflectUnprocessedEvent(const UnprocessedEvent &value) { return value; }

UnprocessedEventList Reflector::ReflectUnprocessedEventList(const UnprocessedEventList &value)
{
    return value;
}

NodeStatistics Reflector::ReflectNodeStatistics(const NodeStatistics &value) { return value; }

StepArgument Reflector::ReflectStepArgument(const StepArgument &value) { return value; }

StepArgumentList Reflector::ReflectStepArgumentList(const StepArgumentList &value) { return value; }

NewExecutorStep Reflector::ReflectNewExecutorStep(const NewExecutorStep &value) { return value; }

NewExecutorStepList Reflector::ReflectNewExecutorStepList(const NewExecutorStepList &value)
{
    return value;
}

JobStepToRun Reflector::ReflectJobStepToRun(const JobStepToRun &value) { return value; }

JobStepToRunList Reflector::ReflectJobStepToRunList(const JobStepToRunList &value) { return value; }

StepConsoleOutput Reflector::ReflectStepConsoleOutput(const StepConsoleOutput &value)
{
    return value;
}

StepConsoleOutputList Reflector::ReflectStepConsoleOutputList(const StepConsoleOutputList &value)
{
    return value;
}

DashboardSearch Reflector::ReflectDashboardSearch(const DashboardSearch &value) { return value; }
