#!/usr/bin/env python
from __future__ import print_function
import argparse
import re
import os
from os.path import isfile, isdir, join
import glob
import sys
import time, datetime
import gdal
from osgeo import ogr
from sen2agri_common_db import *
general_log_path = "/tmp/"
general_log_filename = "demmaccs_launcher.log"

def GetExtent(gt, cols, rows):
    ext = []
    xarr = [0, cols]
    yarr = [0, rows]

    for px in xarr:
        for py in yarr:
            x = gt[0] + px * gt[1] + py * gt[2]
            y = gt[3] + px * gt[4] + py * gt[5]
            ext.append([x, y])
        yarr.reverse()
    return ext


def ReprojectCoords(coords, src_srs, tgt_srs):
    trans_coords = []
    transform = osr.CoordinateTransformation(src_srs, tgt_srs)
    for x, y in coords:
        x, y, z = transform.TransformPoint(x, y)
        trans_coords.append([x, y])
    return trans_coords


def get_envelope(footprints):
    geomCol = ogr.Geometry(ogr.wkbGeometryCollection)

    for footprint in footprints:
        #ring = ogr.Geometry(ogr.wkbLinearRing)
        for pt in footprint:
            #ring.AddPoint(pt[0], pt[1])
            point = ogr.Geometry(ogr.wkbPoint)
            point.AddPoint_2D(pt[0], pt[1])
            geomCol.AddGeometry(point)

        #poly = ogr.Geometry(ogr.wkbPolygon)
        #poly

    hull = geomCol.ConvexHull()
    return hull.ExportToWkt()


def get_footprint(image_filename):
    dataset = gdal.Open(image_filename, gdal.gdalconst.GA_ReadOnly)

    size_x = dataset.RasterXSize
    size_y = dataset.RasterYSize

    geo_transform = dataset.GetGeoTransform()

    spacing_x = geo_transform[1]
    spacing_y = geo_transform[5]

    extent = GetExtent(geo_transform, size_x, size_y)

    source_srs = osr.SpatialReference()
    source_srs.ImportFromWkt(dataset.GetProjection())
    epsg_code = source_srs.GetAttrValue("AUTHORITY", 1)
    target_srs = osr.SpatialReference()
    target_srs.ImportFromEPSG(4326)

    wgs84_extent = ReprojectCoords(extent, source_srs, target_srs)
    return wgs84_extent


class L1CContext(object):
    def __init__(self, l1c_list, l1c_db, processor_short_name, base_output_path):
        self.l1c_list = l1c_list
        self.l1c_db = l1c_db
        self.processor_short_name = processor_short_name
        self.base_output_path = base_output_path        


def get_previous_l2a_tiles_paths(satellite_id, l1c_product_path, l1c_date, l1c_db):
    #get all the tiles of the input. they will be used to find if there is a previous L2A product
    l1c_tiles = []
    if satellite_id == 1:
        #sentinel, all the tiles are to be found as directories in product_name/GRANULE
        l1c_tiles_dir_list = (glob.glob("{}/GRANULE/*".format(l1c_product_path)))
        for tile_dir in l1c_tiles_dir_list:
            tile = re.search(r"_T(\d\d[a-zA-Z]{3})_", tile_dir)
            if tile is not None:
                l1c_tiles.append(tile.group(1))
    elif satellite_id == 2:
        #for landsat, there is only 1 tile which can be taken from the l1c product name
        tile = re.search(r"LC8(\d{6})\d{7}LGN", l1c_product_path)
        if tile is not None:
            l1c_tiles.append(tile.group(1))
    else:
        print("Unkown satellite id :{}".format(satellite_id))
        return [] and ([], [])
    l2a_tiles = []
    l2a_tiles_paths = []
    for l1c_tile in l1c_tiles:
        l2a_tile = l1c_db.get_previous_l2a_tile_path(satellite_id, l1c_tile, l1c_date)
        if len(l2a_tile) > 0:
            l2a_tiles.append(l1c_tile)
            l2a_tiles_paths.append(l2a_tile)
    return (l2a_tiles, l2a_tiles_paths)

def launch_demmaccs(l1c_context):
    if len(l1c_context.l1c_list) == 0:
        return
    tiles_dir_list = []
    #get site short name
    site_short_name = l1c_context.l1c_db.get_short_name("site", l1c_context.l1c_list[0][1])    

    for l1c in l1c_context.l1c_list:        
        if l1c[3].endswith("/"):
            l2a_basename = os.path.basename(l1c[3][:len(l1c[3]) - 1])
        else:
            l2a_basename = os.path.basename(l1c[3])

        satellite_id = int(l1c[2])
        if satellite_id != 1 and satellite_id != 2:
            log(general_log_path, "Unkown satellite id :{}".format(satellite_id), general_log_filename)
            sys.exit(-1)
        if l2a_basename.startswith("S2"):
            l2a_basename = l2a_basename.replace("L1C", "L2A")
        elif l2a_basename.startswith("LC8"):
            l2a_basename += "_L2A"
        else:
            log(general_log_path, "The L1C product name is bad:{}".format(l2a_basename), general_log_filename)
            sys.exit(-1)
            
        l2a_tiles, l2a_tiles_paths = get_previous_l2a_tiles_paths(satellite_id, l1c[3], l1c[4], l1c_context.l1c_db)

        if len(l2a_tiles) != len(l2a_tiles_paths):
            log(general_log_path, "The lengths of lists l1c tiles and previous l2a tiles are different for {}".format(l2a_basename), general_log_filename)
            sys.exit(-1)
        #create the output_path. it will hold all the tiles found inside the l1c
        #for sentinel, this output path will be something like /path/to/poduct/site_name/processor_name/....MSIL2A.../
        #for landsat, this output path will be something like /path/to/poduct/site_name/processor_name/LC8...._L2A/
        output_path = base_output_path.replace("{site}", site_short_name)
        if not output_path.endswith("/"):
            output_path += "/"
        output_path = output_path + l2a_basename + "/"
        log(general_log_path, "Creating the output path {}".format(output_path), general_log_filename)
        log(general_log_path, "Launching demmaccs.py", general_log_filename)
        l2a_processed_tiles = []
        wkt = []
        sat_id = 0
        acquisition_date = ""
        base_abs_path = os.path.dirname(os.path.abspath(__file__)) + "/"
        demmaccs_command = [base_abs_path + "demmaccs.py", "--srtm", demmaccs_config.srtm_path, "--swbd", demmaccs_config.swbd_path, "-p", "5", "--gip-dir", demmaccs_config.gips_path, "--working-dir", demmaccs_config.working_dir, "--maccs-address", demmaccs_config.maccs_ip_address, "--maccs-launcher", demmaccs_config.maccs_launcher, "--dem-launcher",  base_abs_path + "dem.py", "--delete-temp", "False", l1c[3], output_path]
        if len(l2a_tiles) > 0:
            print("{}".format(l2a_tiles))
            demmaccs_command.append("--prev-l2a-tiles")
            demmaccs_command += l2a_tiles
            demmaccs_command.append("--prev-l2a-tiles-paths")
            demmaccs_command += l2a_tiles_paths
       
        if run_command(demmaccs_command) == 0:
            tiles_dir_list = (glob.glob("{}/*.DBL.DIR".format(output_path)))
            log(output_path, "Creating common footprint for tiles: DBL.DIR List: {}".format(tiles_dir_list), general_log_filename)
            wgs84_extent_list = []
            for tile_dir in tiles_dir_list:
                tile_img = (glob.glob("{}/*_FRE_R1.DBL.TIF".format(tile_dir)))
                if len(tile_img) > 0:
                    wgs84_extent_list.append(get_footprint(tile_img[0]))
            wkt = get_envelope(wgs84_extent_list)

            if len(wkt) == 0:
                log(output_path, "Could not create the footprint", general_log_filename)
            else:
                sat_id, acquisition_date = get_product_info(os.path.basename(output_path[:len(output_path) - 1]))
                if sat_id > 0 and acquisition_date != None:
                    log(output_path, "Mark the state as present in the database for product {}".format(output_path), general_log_filename)
                    #looking in processed_tiles file to take all the processed tiles by MACCS. If none was processed, only the input from
                    #downloader_history table will be set. No l2a product will be added into product table
                    processed_tiles_filename = (output_path[:len(output_path) - 1] if output_path.endswith("/") else output_path) + "/processed_tiles"
                    if os.path.isfile(processed_tiles_filename):
                        with open(processed_tiles_filename, 'r') as result_processed_tiles:
                            l2a_processed_tiles = result_processed_tiles.readline().split()                    
                            print(l2a_processed_tiles)
                        #os.remove(processed_tiles_filename)
                else:
                    log(output_path,"Could not get the acquisition date from the product name {}".format(output_path), general_log_filename)
        else:
            log(output_path, "demmaccs.py script didn't work!", general_log_filename)
        l1c_db.set_processed_product(1, l1c[1], l1c[0], l2a_processed_tiles, output_path, os.path.basename(output_path[:len(output_path) - 1]), wkt, sat_id, acquisition_date)


parser = argparse.ArgumentParser(
    description="Launcher for DEM MACCS script")
parser.add_argument('-c', '--config', default="/etc/sen2agri/sen2agri.conf", help="configuration file")

args = parser.parse_args()

# get the db configuration from cfg file
config = Config()
if not config.loadConfig(args.config):
    log(general_log_path, "Could not load the config from configuration file", general_log_filename)
    sys.exit(-1)

#load configuration from db for demmaccs processor 
l1c_db = L1CInfo(config.host, config.database, config.user, config.password)
demmaccs_config = l1c_db.get_demmaccs_config()
if demmaccs_config is None:
    log(general_log_path, "Could not load the config from database", general_log_filename)
    sys.exit(-1)
#load the unprocessed l1c products from db
#TODO: will have to get the product_date also
#TODO: sort l1c_list by date (the oldest first)
l1c_list = l1c_db.get_unprocessed_l1c()

#do nothing
if len(l1c_list) == 0:
    log(general_log_path, "No unprocessed L1C found in DB", general_log_filename)
    sys.exit(0)

#by convention, the processor ID for dem-maccs will always be 1 within the DB
processor_short_name = l1c_db.get_short_name("processor", 1)
base_output_path = demmaccs_config.output_path.replace("{processor}", processor_short_name)

l1c_context_list = []
for l1c_site in l1c_list:
    l1c_context_list.append(L1CContext(l1c_site, l1c_db, processor_short_name, base_output_path))
    print("-----------------------------------")
    print("{}".format(l1c_site))

#p = Pool(5)
#p.map(launch_demmacs, l1c_context_list)

#for l1c_context in l1c_context_list:
#    launch_demmaccs(l1c_context)

launch_demmaccs(l1c_context_list[0])




