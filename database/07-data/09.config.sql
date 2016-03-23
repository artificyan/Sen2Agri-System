--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: config; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

--CREATE TABLE config (
--    id integer NOT NULL,
--   key character varying NOT NULL,
--    site_id smallint,
--    value character varying NOT NULL,
--    last_updated timestamp with time zone DEFAULT now() NOT NULL
--);


ALTER TABLE config OWNER TO admin;

--
-- Name: config_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config_id_seq OWNER TO admin;

--
-- Name: config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE config_id_seq OWNED BY config.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY config ALTER COLUMN id SET DEFAULT nextval('config_id_seq'::regclass);


--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO config VALUES (242, 'processor.l4a.mission', NULL, 'SPOT', '2016-03-09 16:28:59.820251+02');
INSERT INTO config VALUES (243, 'processor.l4a.temporal_resampling_mode', NULL, 'gapfill', '2016-03-09 16:40:46.810185+02');
INSERT INTO config VALUES (244, 'processor.l4a.radius', NULL, '15', '2016-03-09 16:41:10.906469+02');
INSERT INTO config VALUES (27, 'executor.processor.l3a.path', NULL, '/bin/false', '2015-07-20 16:31:23.208369+03');
INSERT INTO config VALUES (29, 'executor.processor.l3b.path', NULL, '/bin/false', '2015-07-20 16:31:23.208369+03');
INSERT INTO config VALUES (31, 'executor.processor.l4a.path', NULL, '/bin/false', '2015-07-20 16:31:23.208369+03');
INSERT INTO config VALUES (245, 'processor.l4a.random_seed', NULL, '0', '2016-03-09 16:41:20.194169+02');
INSERT INTO config VALUES (33, 'executor.processor.l4b.path', NULL, '/bin/false', '2015-07-20 16:31:23.208369+03');
INSERT INTO config VALUES (24, 'executor.processor.l2a.path', NULL, '/bin/false', '2015-07-20 16:31:23.208369+03');
INSERT INTO config VALUES (246, 'processor.l4a.window', NULL, '6', '2016-03-09 16:41:29.945249+02');
INSERT INTO config VALUES (81, 'crop-mask.classifier.field', NULL, 'CROP', '2015-09-08 11:02:23.736295+03');
INSERT INTO config VALUES (15, 'archiver.max_age.l2a', NULL, '5', '2015-07-20 16:31:33.655476+03');
INSERT INTO config VALUES (47, 'executor.wrapper-path', NULL, '/usr/bin/sen2agri-processor-wrapper', '2015-07-23 16:54:54.092462+03');
INSERT INTO config VALUES (84, 'resources.gdalwarp.working-mem', NULL, '2048', '2015-09-08 11:03:21.87284+03');
INSERT INTO config VALUES (36, 'executor.listen-port', NULL, '7777', '2015-07-07 12:17:06.182674+03');
INSERT INTO config VALUES (35, 'executor.listen-ip', NULL, '192.168.60.52', '2015-06-03 17:03:39.541136+03');
INSERT INTO config VALUES (247, 'processor.l4a.smoothing-lambda', NULL, '2', '2016-03-09 16:41:38.409554+02');
INSERT INTO config VALUES (17, 'archiver.max_age.l3a', NULL, '1', '2015-06-02 11:39:40.357184+03');
INSERT INTO config VALUES (18, 'archiver.max_age.l3b', NULL, '1', '2015-06-02 11:39:45.99546+03');
INSERT INTO config VALUES (19, 'archiver.max_age.l4a', NULL, '1', '2015-06-02 11:39:50.928228+03');
INSERT INTO config VALUES (20, 'archiver.max_age.l4b', NULL, '1', '2015-06-02 11:39:56.99407+03');
INSERT INTO config VALUES (248, 'processor.l4a.weight', NULL, '1', '2016-03-09 16:41:46.169747+02');
INSERT INTO config VALUES (249, 'processor.l4a.nbcomp', NULL, '6', '2016-03-09 16:41:59.169527+02');
INSERT INTO config VALUES (250, 'processor.l4a.segmentation-spatial-radius', NULL, '10', '2016-03-09 16:42:09.033172+02');
INSERT INTO config VALUES (251, 'processor.l4a.range-radius', NULL, '0.65', '2016-03-09 16:42:16.59406+02');
INSERT INTO config VALUES (252, 'processor.l4a.segmentation-minsize', NULL, '200', '2016-03-09 16:42:25.393274+02');
INSERT INTO config VALUES (253, 'processor.l4a.erode-radius', NULL, '1', '2016-03-09 16:42:46.48022+02');
INSERT INTO config VALUES (26, 'executor.processor.l2a.name', NULL, 'L2A', '2015-06-03 17:02:50.028002+03');
INSERT INTO config VALUES (28, 'executor.processor.l3a.name', NULL, 'L3A', '2015-06-03 17:02:50.028002+03');
INSERT INTO config VALUES (30, 'executor.processor.l3b.name', NULL, 'L3B', '2015-06-03 17:02:50.028002+03');
INSERT INTO config VALUES (32, 'executor.processor.l4a.name', NULL, 'L4A', '2015-06-03 17:02:50.028002+03');
INSERT INTO config VALUES (34, 'executor.processor.l4b.name', NULL, 'L4B', '2015-06-03 17:02:50.028002+03');
INSERT INTO config VALUES (52, 'executor.module.path.compute-images-statistics', NULL, '/usr/bin/otbcli_ComputeImagesStatistics', '2015-08-12 17:09:17.216345+03');
INSERT INTO config VALUES (53, 'executor.module.path.train-images-classifier', NULL, '/usr/bin/otbcli_TrainImagesClassifier', '2015-08-12 17:09:18.767175+03');
INSERT INTO config VALUES (44, 'general.scratch-path', NULL, '/mnt/archive/orchestrator_temp/{job_id}/{task_id}-{module}', '2015-07-10 17:54:17.288095+03');
INSERT INTO config VALUES (121, 'processor.l3a.preproc.scatcoeffs', NULL, '/usr/share/sen2agri/scattering_coeffs_10m.txt', '2016-02-29 14:08:07.963143+02');
INSERT INTO config VALUES (56, 'crop-type.classifier', NULL, 'rf', '2015-08-17 16:13:31.839288+03');
INSERT INTO config VALUES (57, 'crop-type.classifier.rf.nbtrees', NULL, '100', '2015-08-17 16:18:01.088803+03');
INSERT INTO config VALUES (58, 'crop-type.classifier.rf.min', NULL, '5', '2015-08-17 16:18:03.362784+03');
INSERT INTO config VALUES (93, 'processor.l4a.classifier', NULL, 'rf', '2016-03-10 18:27:19.634909+02');
INSERT INTO config VALUES (86, 'processor.l4a.classifier.field', NULL, 'CODE', '2016-03-10 11:32:30.859069+02');
INSERT INTO config VALUES (59, 'crop-type.classifier.rf.max', NULL, '25', '2015-08-17 16:18:16.212714+03');
INSERT INTO config VALUES (39, 'http-listener.root-path', NULL, '/srv/sen2agri-dashboard', '2015-07-03 13:58:57.734852+03');
INSERT INTO config VALUES (40, 'http-listener.listen-port', NULL, '8080', '2015-07-03 13:59:21.338392+03');
INSERT INTO config VALUES (60, 'crop-type.classifier.svm.k', NULL, 'rbf', '2015-08-17 16:19:01.274929+03');
INSERT INTO config VALUES (61, 'crop-type.classifier.svm.opt', NULL, '1', '2015-08-17 16:20:47.419028+03');
INSERT INTO config VALUES (62, 'crop-type.classifier.field', NULL, 'CODE', '2015-08-17 16:30:02.304598+03');
INSERT INTO config VALUES (63, 'crop-type.sampling-rate', NULL, '5', '2015-08-17 16:51:31.756122+03');
INSERT INTO config VALUES (64, 'crop-type.sample-ratio', NULL, '0.75', '2015-08-17 16:51:33.240926+03');
INSERT INTO config VALUES (46, 'monitor-agent.scan-interval', NULL, '60', '2015-07-20 10:28:08.27395+03');
INSERT INTO config VALUES (94, 'processor.l4a.classifier.rf.nbtrees', NULL, '100', '2016-03-10 11:33:20.290289+02');
INSERT INTO config VALUES (87, 'processor.l4a.classifier.rf.max', NULL, '25', '2016-03-10 11:33:33.450239+02');
INSERT INTO config VALUES (95, 'processor.l4a.classifier.rf.min', NULL, '25', '2016-03-10 11:34:22.252075+02');
INSERT INTO config VALUES (89, 'processor.l4a.classifier.svm.opt', NULL, '1', '2016-03-10 11:50:42.660864+02');
INSERT INTO config VALUES (96, 'processor.l4b.classifier', NULL, 'rf', '2016-03-10 18:29:07.926989+02');
INSERT INTO config VALUES (91, 'processor.l4a.sample-ratio', NULL, '0.75', '2016-03-10 11:34:53.889769+02');
INSERT INTO config VALUES (90, 'processor.l4a.sampling-rate', NULL, '5', '2016-03-10 11:42:09.332097+02');
INSERT INTO config VALUES (43, 'executor.module.path.dummy-module', NULL, '/usr/bin/cp', '2015-07-10 11:16:14.384866+03');
INSERT INTO config VALUES (78, 'crop-mask.classifier.rf.max', NULL, '25', '2015-09-04 16:48:19.273176+03');
INSERT INTO config VALUES (79, 'crop-mask.classifier.svm.k', NULL, 'rbf', '2015-09-04 16:48:20.464703+03');
INSERT INTO config VALUES (80, 'crop-mask.classifier.svm.opt', NULL, '1', '2015-09-04 16:48:22.243448+03');
INSERT INTO config VALUES (66, 'executor.module.path.gdalwarp', NULL, '/usr/local/bin/gdalwarp', '2015-09-07 16:49:53.576478+03');
INSERT INTO config VALUES (88, 'processor.l4a.classifier.svm.k', NULL, 'rbf', '2016-03-10 11:50:39.844696+02');
INSERT INTO config VALUES (71, 'crop-mask.sampling-rate', NULL, '5', '2015-09-04 16:48:06.370707+03');
INSERT INTO config VALUES (73, 'crop-mask.sample-ratio', NULL, '0.75', '2015-09-04 16:48:11.485694+03');
INSERT INTO config VALUES (74, 'crop-mask.training-samples-number', NULL, '1000', '2015-09-04 16:48:13.125541+03');
INSERT INTO config VALUES (75, 'crop-mask.classifier', NULL, 'rf', '2015-09-04 16:48:14.508723+03');
INSERT INTO config VALUES (76, 'crop-mask.classifier.rf.nbtrees', NULL, '100', '2015-09-04 16:48:15.947322+03');
INSERT INTO config VALUES (77, 'crop-mask.classifier.rf.min', NULL, '5', '2015-09-04 16:48:17.235633+03');
INSERT INTO config VALUES (97, 'processor.l4b.classifier.field', NULL, 'CODE', '2016-03-10 18:29:16.079704+02');
INSERT INTO config VALUES (98, 'processor.l4b.classifier.rf.max', NULL, '25', '2016-03-10 18:29:20.56483+02');
INSERT INTO config VALUES (99, 'processor.l4b.classifier.rf.min', NULL, '25', '2016-03-10 18:29:28.531434+02');
INSERT INTO config VALUES (100, 'processor.l4b.classifier.rf.nbtrees', NULL, '100', '2016-03-10 18:29:30.835912+02');
INSERT INTO config VALUES (111, 'processor.l3a.weight.aot.maxaot', NULL, '0.8', '2015-12-15 16:03:45.738858+02');
INSERT INTO config VALUES (113, 'processor.l3a.weight.aot.minweight', NULL, '0.33', '2015-12-15 16:38:59.421733+02');
INSERT INTO config VALUES (114, 'processor.l3a.weight.aot.maxweight', NULL, '1', '2015-12-15 16:39:33.011849+02');
INSERT INTO config VALUES (115, 'processor.l3a.weight.cloud.coarseresolution', NULL, '240', '2015-12-15 16:39:42.524199+02');
INSERT INTO config VALUES (116, 'processor.l3a.weight.cloud.sigmasmall', NULL, '2', '2015-12-15 16:39:54.875658+02');
INSERT INTO config VALUES (117, 'processor.l3a.weight.cloud.sigmalarge', NULL, '10', '2015-12-15 16:40:31.123914+02');
INSERT INTO config VALUES (118, 'processor.l3a.weight.total.weightdatemin', NULL, '0.5', '2015-12-15 16:40:39.851801+02');
INSERT INTO config VALUES (119, 'processor.l3a.weight.total.bandsmapping', NULL, '', '2015-12-17 10:38:24.91203+02');
INSERT INTO config VALUES (54, 'executor.module.path.image-classifier', NULL, '/usr/bin/otbcli_ImageClassifier', '2015-08-12 17:09:20.418973+03');
INSERT INTO config VALUES (55, 'executor.module.path.compute-confusion-matrix', NULL, '/usr/bin/otbcli_ComputeConfusionMatrix', '2015-08-12 17:09:22.060276+03');
INSERT INTO config VALUES (82, 'executor.module.path.concatenate-images', NULL, '/usr/bin/otbcli_ConcatenateImages', '2015-09-07 10:20:52.117401+03');
INSERT INTO config VALUES (107, 'executor.module.path.color-mapping', NULL, '/usr/bin/otbcli_ColorMapping', '2015-11-17 17:06:25.784583+02');
INSERT INTO config VALUES (108, 'executor.module.path.compression', NULL, '/usr/bin/otbcli_Convert', '2015-11-17 17:06:34.7028+02');
INSERT INTO config VALUES (14, 'archiver.archive_path', NULL, '/mnt/archive/{site}/{processor}/', '2016-02-18 17:29:41.20487+02');
INSERT INTO config VALUES (65, 'executor.module.path.ogr2ogr', NULL, '/usr/local/bin/ogr2ogr', '2015-08-24 17:44:38.29255+03');
INSERT INTO config VALUES (101, 'processor.l4b.classifier.svm.k', NULL, 'rbf', '2016-03-10 18:29:41.383911+02');
INSERT INTO config VALUES (45, 'monitor-agent.disk-path', NULL, '/mnt/archive/orchestrator_temp', '2015-07-20 10:27:29.301355+03');
INSERT INTO config VALUES (120, 'processor.l3a.bandsmapping', NULL, '/usr/share/sen2agri/bands_mapping_s2.txt', '2016-02-29 14:08:01.731357+02');
INSERT INTO config VALUES (102, 'processor.l4b.classifier.svm.opt', NULL, '1', '2016-03-10 18:29:43.250971+02');
INSERT INTO config VALUES (103, 'processor.l4b.sample-ratio', NULL, '0.75', '2016-03-10 18:29:44.979786+02');
INSERT INTO config VALUES (104, 'processor.l4b.sampling-rate', NULL, '5', '2016-03-10 18:29:47.531907+02');
INSERT INTO config VALUES (105, 'processor.l4b.training-samples-number', NULL, '4000', '2016-03-10 18:29:49.221111+02');
INSERT INTO config VALUES (287, 'downloader.s2.max-retries', NULL, '3', '2016-03-15 15:44:14.118906+02');
INSERT INTO config VALUES (48, 'executor.module.path.bands-extractor', NULL, '/usr/bin/otbcli', '2015-08-12 10:27:24.844182+03');
INSERT INTO config VALUES (49, 'executor.module.path.sample-selection', NULL, '/usr/bin/otbcli', '2015-08-12 16:48:25.114731+03');
INSERT INTO config VALUES (50, 'executor.module.path.temporal-resampling', NULL, '/usr/bin/otbcli', '2015-08-12 17:09:13.694408+03');
INSERT INTO config VALUES (51, 'executor.module.path.feature-extraction', NULL, '/usr/bin/otbcli', '2015-08-12 17:09:15.485436+03');
INSERT INTO config VALUES (67, 'executor.module.path.random-selection', NULL, '/usr/bin/otbcli', '2015-09-04 16:43:25.459246+03');
INSERT INTO config VALUES (68, 'executor.module.path.temporal-features', NULL, '/usr/bin/otbcli', '2015-09-04 16:43:51.083257+03');
INSERT INTO config VALUES (69, 'executor.module.path.statistic-features', NULL, '/usr/bin/otbcli', '2015-09-04 16:43:52.389705+03');
INSERT INTO config VALUES (110, 'executor.module.path.product-formatter', NULL, '/usr/bin/otbcli', '2015-11-17 17:06:45.334415+02');
INSERT INTO config VALUES (122, 'executor.module.path.composite-mask-handler', NULL, '/usr/bin/otbcli', '2015-12-17 14:24:21.249077+02');
INSERT INTO config VALUES (123, 'executor.module.path.composite-preprocessing', NULL, '/usr/bin/otbcli', '2015-12-17 14:24:35.457171+02');
INSERT INTO config VALUES (124, 'executor.module.path.composite-weigh-aot', NULL, '/usr/bin/otbcli', '2015-12-17 14:24:43.489404+02');
INSERT INTO config VALUES (125, 'executor.module.path.composite-weigh-on-clouds', NULL, '/usr/bin/otbcli', '2015-12-17 14:24:51.897101+02');
INSERT INTO config VALUES (126, 'executor.module.path.composite-total-weight', NULL, '/usr/bin/otbcli', '2015-12-17 14:25:03.833084+02');
INSERT INTO config VALUES (127, 'executor.module.path.composite-update-synthesis', NULL, '/usr/bin/otbcli', '2015-12-17 14:25:14.193131+02');
INSERT INTO config VALUES (128, 'executor.module.path.composite-splitter', NULL, '/usr/bin/otbcli', '2015-12-17 14:25:25.800565+02');
INSERT INTO config VALUES (129, 'processor.l3b.lai.localwnd.bwr', NULL, '2', '2016-01-12 14:54:40.30341+02');
INSERT INTO config VALUES (130, 'processor.l3b.lai.localwnd.fwr', NULL, '0', '2016-01-12 14:54:40.387588+02');
INSERT INTO config VALUES (132, 'executor.module.path.lai-ndvi-rvi-extractor', NULL, '/usr/bin/otbcli', '2016-01-12 14:56:54.909962+02');
INSERT INTO config VALUES (133, 'executor.module.path.lai-models-extractor', NULL, '/usr/bin/otbcli', '2016-01-12 14:56:55.693633+02');
INSERT INTO config VALUES (134, 'executor.module.path.lai-bv-image-invertion', NULL, '/usr/bin/otbcli', '2016-01-12 14:56:56.618005+02');
INSERT INTO config VALUES (135, 'executor.module.path.lai-bv-err-image-invertion', NULL, '/usr/bin/otbcli', '2016-01-12 14:56:57.501918+02');
INSERT INTO config VALUES (136, 'executor.module.path.lai-time-series-builder', NULL, '/usr/bin/otbcli', '2016-01-12 14:56:58.365972+02');
INSERT INTO config VALUES (137, 'executor.module.path.lai-err-time-series-builder', NULL, '/usr/bin/otbcli', '2016-01-12 14:56:59.934442+02');
INSERT INTO config VALUES (138, 'executor.module.path.lai-local-window-reprocessing', NULL, '/usr/bin/otbcli', '2016-01-12 14:57:00.637874+02');
INSERT INTO config VALUES (139, 'executor.module.path.lai-local-window-reproc-splitter', NULL, '/usr/bin/otbcli', '2016-01-12 14:57:01.522161+02');
INSERT INTO config VALUES (140, 'executor.module.path.lai-fitted-reprocessing', NULL, '/usr/bin/otbcli', '2016-01-12 14:57:02.388592+02');
INSERT INTO config VALUES (141, 'executor.module.path.lai-fitted-reproc-splitter', NULL, '/usr/bin/otbcli', '2016-01-12 14:57:03.25251+02');
INSERT INTO config VALUES (142, 'executor.module.path.pheno-ndvi-metrics', NULL, '/usr/bin/otbcli', '2016-02-02 15:45:08.965906+02');
INSERT INTO config VALUES (143, 'executor.module.path.pheno-ndvi-metrics-splitter', NULL, '/usr/bin/otbcli', '2016-02-02 15:45:09.007061+02');
INSERT INTO config VALUES (144, 'executor.module.path.lai-mono-date-mask-flags', NULL, '/usr/bin/otbcli', '2016-02-02 17:07:31.362185+02');
INSERT INTO config VALUES (145, 'executor.module.path.lai-msk-flags-time-series-builder', NULL, '/usr/bin/otbcli', '2016-02-02 17:17:09.511591+02');
INSERT INTO config VALUES (254, 'processor.l4a.mahalanobis-alpha', NULL, '0.01', '2016-03-09 16:42:55.696346+02');
INSERT INTO config VALUES (255, 'processor.l4a.min-area', NULL, '20', '2016-03-09 16:43:02.69676+02');
INSERT INTO config VALUES (278, 'downloader.winter-season.start', 1, '0411', '2016-03-14 11:53:54.080902+02');
INSERT INTO config VALUES (289, 'downloader.winter-season.start', 40, '0318', '2016-03-17 14:56:29.835334+02');
INSERT INTO config VALUES (290, 'downloader.winter-season.end', 40, '0319', '2016-03-17 14:56:29.835334+02');
INSERT INTO config VALUES (197, 'downloader.s2.write-dir', NULL, '/mnt/archive/dwn/s2/default', '2016-02-26 19:26:49.986675+02');
INSERT INTO config VALUES (194, 'demmaccs.maccs-launcher', NULL, '/opt/maccs/core/4.7/bin/maccs', '2016-02-25 16:29:07.763339+02');
INSERT INTO config VALUES (131, 'processor.l3b.lai.modelsfolder', NULL, '/mnt/scratch/L3B_GeneratedModels/', '2016-02-16 11:54:47.123972+02');
INSERT INTO config VALUES (288, 'downloader.l8.max-retries', NULL, '3', '2016-03-15 15:44:22.03691+02');
INSERT INTO config VALUES (169, 'processor.l3b.lai.rsrcfgfile', NULL, '/usr/share/sen2agri/rsr_cfg.txt', '2016-02-16 11:54:47.223904+02');
INSERT INTO config VALUES (183, 'demmaccs.output-path', NULL, '/mnt/archive/maccs_dev/{site}/{processor}/', '2016-02-24 18:09:17.379905+02');
INSERT INTO config VALUES (179, 'executor.module.path.compute-image-statistics', NULL, '/usr/bin/otbcli_ComputeImagesStatistics', '2016-02-23 12:29:52.586902+02');
INSERT INTO config VALUES (279, 'downloader.winter-season.end', 1, '0412', '2016-03-14 11:53:54.080902+02');
INSERT INTO config VALUES (154, 'downloader.summer-season.end', NULL, '0930', '2016-02-04 11:44:35.847675+02');
INSERT INTO config VALUES (170, 'executor.module.path.features-with-insitu', NULL, '/usr/bin/otbcli', '2016-02-22 20:52:43.310276+02');
INSERT INTO config VALUES (149, 'downloader.max-cloud-coverage', NULL, '80', '2016-02-03 18:05:38.425734+02');
INSERT INTO config VALUES (155, 'downloader.winter-season.start', NULL, '1101', '2016-02-04 11:44:40.262676+02');
INSERT INTO config VALUES (156, 'downloader.winter-season.end', NULL, '1201', '2016-02-04 11:44:41.984022+02');
INSERT INTO config VALUES (171, 'executor.module.path.principal-component-analysis', NULL, '/usr/bin/otbcli', '2016-02-22 22:39:08.262715+02');
INSERT INTO config VALUES (153, 'downloader.summer-season.start', NULL, '0501', '2016-02-04 11:44:18.411587+02');
INSERT INTO config VALUES (191, 'demmaccs.srtm-path', NULL, '/mnt/archive/srtm', '2016-02-25 11:11:36.372405+02');
INSERT INTO config VALUES (192, 'demmaccs.swbd-path', NULL, '/mnt/archive/swbd', '2016-02-25 11:12:04.008319+02');
INSERT INTO config VALUES (196, 'demmaccs.working-dir', NULL, '/mnt/archive/demmaccs_dev_tmp/', '2016-02-25 17:31:06.01191+02');
INSERT INTO config VALUES (175, 'executor.module.path.majority-voting', NULL, '/usr/bin/otbcli', '2016-02-22 22:39:08.365578+02');
INSERT INTO config VALUES (109, 'executor.module.path.xml-statistics', NULL, '/usr/bin/otbcli', '2016-02-22 22:39:08.407059+02');
INSERT INTO config VALUES (165, 'executor.module.path.lai-bv-input-variable-generation', NULL, '/usr/bin/otbcli', '2016-02-15 18:45:57.225692+02');
INSERT INTO config VALUES (166, 'executor.module.path.lai-prosail-simulator', NULL, '/usr/bin/otbcli', '2016-02-15 18:46:00.023288+02');
INSERT INTO config VALUES (167, 'executor.module.path.lai-training-data-generator', NULL, '/usr/bin/otbcli', '2016-02-15 18:46:00.887944+02');
INSERT INTO config VALUES (168, 'executor.module.path.lai-inverse-model-learning', NULL, '/usr/bin/otbcli', '2016-02-15 18:46:01.765134+02');
INSERT INTO config VALUES (172, 'executor.module.path.mean-shift-smoothing', NULL, '/usr/bin/otbcli_MeanShiftSmoothing', '2016-02-22 22:39:08.303643+02');
INSERT INTO config VALUES (173, 'executor.module.path.lsms-segmentation', NULL, '/usr/bin/otbcli_LSMSSegmentation', '2016-02-22 22:39:08.324364+02');
INSERT INTO config VALUES (174, 'executor.module.path.lsms-small-regions-merging', NULL, '/usr/bin/otbcli_LSMSSmallRegionsMerging', '2016-02-22 22:39:08.344953+02');
INSERT INTO config VALUES (176, 'executor.module.path.image-compression', NULL, '/usr/bin/otbcli_Convert', '2016-02-22 22:39:08.386406+02');
INSERT INTO config VALUES (177, 'executor.module.path.data-smoothing', NULL, '/usr/bin/otbcli', '2016-02-23 12:29:52.38366+02');
INSERT INTO config VALUES (178, 'executor.module.path.features-without-insitu', NULL, '/usr/bin/otbcli', '2016-02-23 12:29:52.525899+02');
INSERT INTO config VALUES (180, 'executor.module.path.erosion', NULL, '/usr/bin/otbcli', '2016-02-23 12:29:52.6759+02');
INSERT INTO config VALUES (181, 'executor.module.path.trimming', NULL, '/usr/bin/otbcli', '2016-02-23 12:29:52.741611+02');
INSERT INTO config VALUES (182, 'executor.module.path.train-images-classifier-new', NULL, '/usr/bin/otbcli', '2016-02-23 12:29:52.829897+02');
INSERT INTO config VALUES (186, 'demmaccs.gips-path', NULL, '/mnt/archive/gips/', '2016-02-24 18:12:16.464479+02');
INSERT INTO config VALUES (187, 'executor.module.path.crop-mask-features-with-insitu', NULL, '/usr/local/bin/otbcli', '2016-02-24 19:07:08.416696+02');
INSERT INTO config VALUES (189, 'processor.l3a.synth_date_sched_offset', NULL, '30', '2016-02-25 09:00:47.212845+02');
INSERT INTO config VALUES (190, 'processor.l3a.half_synthesis', NULL, '15', '2016-02-25 09:00:57.21868+02');
INSERT INTO config VALUES (193, 'demmaccs.maccs-ip-address', NULL, '192.168.60.79', '2016-02-25 16:28:46.65395+02');
INSERT INTO config VALUES (92, 'processor.l4a.training-samples-number', NULL, '4000', '2016-03-10 11:40:44.732473+02');
INSERT INTO config VALUES (280, 'downloader.winter-season.start', 3, '0101', '2016-03-14 13:33:58.406607+02');
INSERT INTO config VALUES (281, 'downloader.winter-season.end', 3, '0401', '2016-03-14 13:33:58.406607+02');
INSERT INTO config VALUES (282, 'downloader.summer-season.start', 3, '0501', '2016-03-14 13:33:58.406607+02');
INSERT INTO config VALUES (283, 'downloader.summer-season.end', 3, '1001', '2016-03-14 13:33:58.406607+02');
INSERT INTO config VALUES (257, 'downloader.summer-season.start', 1, '1103', '2016-03-10 18:24:27.376442+02');
INSERT INTO config VALUES (256, 'downloader.summer-season.end', 1, '1203', '2016-03-10 18:24:25.991909+02');
INSERT INTO config VALUES (258, 'processor.l4b.temporal_resampling_mode', NULL, 'gapfill', '2016-03-10 18:40:21.140908+02');
INSERT INTO config VALUES (203, 'processor.l3b.generate_models', NULL, '0', '2016-02-29 12:03:08.445828+02');
INSERT INTO config VALUES (204, 'processor.l3b.mono_date_lai', NULL, '1', '2016-02-29 12:03:15.149961+02');
INSERT INTO config VALUES (205, 'processor.l3b.reprocess', NULL, '0', '2016-02-29 12:03:21.142049+02');
INSERT INTO config VALUES (206, 'processor.l3b.fitted', NULL, '0', '2016-02-29 12:03:27.438284+02');
INSERT INTO config VALUES (207, 'processor.l3b.production_interval', NULL, '10', '2016-02-29 12:03:31.197823+02');
INSERT INTO config VALUES (208, 'processor.l4b.crop-mask', NULL, '', '2016-03-01 08:57:09.170001+02');
INSERT INTO config VALUES (209, 'general.start_of_season', NULL, '20130131', '2016-03-01 12:07:26.368173+02');
INSERT INTO config VALUES (210, 'general.end_of_season', NULL, '20131231', '2016-03-01 12:07:31.393578+02');
INSERT INTO config VALUES (211, 'site.upload-path', NULL, '/mnt/upload/{user}', '2016-03-01 15:02:31.980394+02');
INSERT INTO config VALUES (213, 'processor.l4a.reference_data_dir', NULL, '', '2016-03-03 14:46:26.267227+02');
INSERT INTO config VALUES (198, 'downloader.l8.write-dir', NULL, '/mnt/archive/dwn/l8/default', '2016-02-26 19:30:06.821627+02');


--
-- Name: config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('config_id_seq', 290, true);


--
-- Name: config_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id);


--
-- Name: config; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE config FROM PUBLIC;
REVOKE ALL ON TABLE config FROM admin;
GRANT ALL ON TABLE config TO admin;
GRANT ALL ON TABLE config TO "sen2agri-service";


--
-- PostgreSQL database dump complete
--

