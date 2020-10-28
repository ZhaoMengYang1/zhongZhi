/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.5.13 : Database - webupload
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`webupload` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `webupload`;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(100) NOT NULL COMMENT '书名',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `publishDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '出版日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `books` */

insert  into `books`(`id`,`title`,`price`,`publishDate`) values (1,'Java编程思想','98.50','2005-01-02 00:00:00'),(2,'HeadFirst设计模式','55.70','2010-11-09 00:00:00'),(3,'第一行Android代码','69.90','2015-06-23 00:00:00'),(4,'C++编程思想','88.50','2004-01-09 00:00:00'),(5,'HeadFirst Java','55.70','2013-12-17 00:00:00'),(11,'王城公园','22.00','2020-09-27 00:00:00'),(12,'添加add','22.00','2020-09-27 00:00:00'),(13,'添加方法','22.00','2020-09-26 00:00:00'),(14,'postman','88.00','2020-09-25 00:00:00'),(15,'rookie','33.00','2020-09-28 00:00:00'),(16,'jumbo','55.00','2020-09-23 00:00:00'),(17,'八佰','99.00','2020-09-22 00:00:00');

/*Table structure for table `file_info` */

DROP TABLE IF EXISTS `file_info`;

CREATE TABLE `file_info` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `file_name` varchar(255) NOT NULL COMMENT '文件名',
  `size` bigint(20) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `type` varchar(10) NOT NULL COMMENT '文件类型',
  `media_time` bigint(20) DEFAULT '0' COMMENT 'MP3或者MP4时长',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  `path` varchar(2048) NOT NULL COMMENT '文件绝对路径',
  `file_md5` varchar(512) NOT NULL COMMENT '文件唯一指纹',
  `url` varchar(2048) NOT NULL COMMENT '项目中的路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `file_info` */

insert  into `file_info`(`id`,`file_name`,`size`,`type`,`media_time`,`upload_time`,`path`,`file_md5`,`url`) values ('fa2048ad48c04c8694559be65ae6bf14','alongAcrossThrough',15068,'png',NULL,'2020-10-09 09:23:52','D:\\down\\software\\apache-tomcat-8.5.46\\webapps\\ROOT\\upload\\alongAcrossThrough.png','15068-1d71ac52706fc6cefd42e5abd6299e67-alongAcrossThrough.png','/upload/alongAcrossThrough.png');

/*Table structure for table `sys_file_record` */

DROP TABLE IF EXISTS `sys_file_record`;

CREATE TABLE `sys_file_record` (
  `id` varchar(40) NOT NULL COMMENT '记录ID',
  `org_name` varchar(1000) DEFAULT NULL COMMENT '源文件名',
  `server_local_name` varchar(100) DEFAULT NULL COMMENT '服务器生成的文件名',
  `server_local_path` varchar(1000) DEFAULT NULL COMMENT '服务器储存路径',
  `network_path` varchar(1000) DEFAULT NULL COMMENT '网络路径，生成的文件夹+系统生成文件名',
  `upload_type` int(5) DEFAULT '1' COMMENT '上传类型',
  `md5_value` varchar(120) DEFAULT NULL COMMENT '文件MD5值',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `is_merge` int(5) DEFAULT NULL COMMENT '是否合并',
  `is_zone` int(11) DEFAULT NULL COMMENT '是否分片 0 否 1是',
  `zone_total` int(11) DEFAULT NULL COMMENT '分片总数',
  `zone_date` datetime DEFAULT NULL COMMENT '分片时间',
  `zone_merge_date` datetime DEFAULT NULL COMMENT '分片合并时间',
  `file_type` varchar(100) DEFAULT NULL COMMENT '文件类型',
  `upload_device` varchar(1000) DEFAULT NULL COMMENT '设备信息',
  `upload_ip` varchar(100) DEFAULT NULL COMMENT '上传设备IP',
  `upload_count` bigint(11) DEFAULT '1' COMMENT '上传统计',
  `download_count` bigint(11) DEFAULT '1' COMMENT '下载统计',
  `storage_date` datetime DEFAULT NULL COMMENT '储存日期',
  `create_by` varchar(40) DEFAULT NULL COMMENT '上传人员',
  `create_time` datetime DEFAULT NULL COMMENT '上传日期',
  `del_flag` int(5) DEFAULT '1' COMMENT '删除标记 1正常 -1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传记录';

/*Data for the table `sys_file_record` */

insert  into `sys_file_record`(`id`,`org_name`,`server_local_name`,`server_local_path`,`network_path`,`upload_type`,`md5_value`,`file_size`,`is_merge`,`is_zone`,`zone_total`,`zone_date`,`zone_merge_date`,`file_type`,`upload_device`,`upload_ip`,`upload_count`,`download_count`,`storage_date`,`create_by`,`create_time`,`del_flag`) values ('1309401825115074561','indexafter.PNG','1309401826881310721.PNG','c://webupload/fileData/webuploadfile/image/2020/0925/15/1309401826881310721.PNG','/storage/webuploadfile/image/2020/0925/15//1309401826881310721.PNG',2,'d4565d2d3ddb4b6e80f9c8fd29191d3f',9427,1,1,1,'2020-09-25 15:58:16','2020-09-25 15:58:17','image','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36','0:0:0:0:0:0:0:1',1,0,'2120-09-25 15:58:16',NULL,'2020-09-25 15:58:16',1),('1310402413948719106','indexpage.PNG','1310402415652114432.PNG','c://webupload/fileData/webuploadfile/image/2020/0928/10/1310402415652114432.PNG','/storage/webuploadfile/image/2020/0928/10//1310402415652114432.PNG',2,'a72858c7abf39afcf1ff6bbb50280467',12268,1,1,1,'2020-09-28 10:14:15','2020-09-28 10:14:16','image','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36','0:0:0:0:0:0:0:1',1,0,'2120-09-28 10:14:15',NULL,'2020-09-28 10:14:15',1),('1310402531808661505','分片.png','1310402534288003072.png','c://webupload/fileData/webuploadfile/image/2020/0928/10/1310402534288003072.png','/storage/webuploadfile/image/2020/0928/10//1310402534288003072.png',2,'dc220dda0094406fd8dd35a515d6213f',47382,1,1,1,'2020-09-28 10:14:44','2020-09-28 10:14:44','image','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36','0:0:0:0:0:0:0:1',1,0,'2120-09-28 10:14:44',NULL,'2020-09-28 10:14:44',1),('1310466975100248066','旋转.png','1310466976585486336.png','c://webupload/fileData/webuploadfile/image/2020/0928/14/1310466976585486336.png','/storage/webuploadfile/image/2020/0928/14//1310466976585486336.png',2,'d9d534753d9e5e0abf5f73ee60371eeb',618717,1,1,1,'2020-09-28 14:30:48','2020-09-28 14:30:49','image','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36','0:0:0:0:0:0:0:1',1,0,'2120-09-28 14:30:48',NULL,'2020-09-28 14:30:48',1),('1315488410927554562','httpResponse.jpg','1315488414468018176.jpg','c://webupload/fileData/webuploadfile/image/2020/1012/11/1315488414468018176.jpg','/storage/webuploadfile/image/2020/1012/11//1315488414468018176.jpg',2,'ca21b31811b18b834233646e34c27586',36723,1,1,1,'2020-10-12 11:04:11','2020-10-12 11:04:13','image','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36','0:0:0:0:0:0:0:1',1,0,'2120-10-12 11:04:11',NULL,'2020-10-12 11:04:11',1),('1315491656417075201','httpDetailed.jpg','1315491658296594432.jpg','c://webupload/fileData/webuploadfile/image/2020/1012/11/1315491658296594432.jpg','/storage/webuploadfile/image/2020/1012/11//1315491658296594432.jpg',2,'1dcd42930c5da71f8050807196b61e6a',106334,1,1,1,'2020-10-12 11:17:06','2020-10-12 11:17:06','image','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36','0:0:0:0:0:0:0:1',1,0,'2120-10-12 11:17:06',NULL,'2020-10-12 11:17:06',1);

/*Table structure for table `sys_file_zone_record` */

DROP TABLE IF EXISTS `sys_file_zone_record`;

CREATE TABLE `sys_file_zone_record` (
  `id` varchar(40) NOT NULL COMMENT '分片ID',
  `zone_name` varchar(100) DEFAULT NULL COMMENT '分片名称',
  `zone_path` varchar(1000) DEFAULT NULL COMMENT '分片的文件路径',
  `zone_md5` varchar(100) DEFAULT NULL COMMENT '分片MD5',
  `zone_record_date` datetime DEFAULT NULL COMMENT '分片记录MD5值',
  `zone_check_date` datetime DEFAULT NULL COMMENT '上传完成校验日期',
  `zone_total_count` int(11) DEFAULT NULL COMMENT '总的分片数',
  `zone_total_size` bigint(11) DEFAULT NULL COMMENT '总的文件大小',
  `zone_start_size` bigint(11) DEFAULT NULL COMMENT '分片起始位置',
  `zone_end_size` bigint(11) DEFAULT NULL COMMENT '分片结束位置',
  `zone_total_md5` varchar(100) DEFAULT NULL COMMENT '总文件的MD5值',
  `zone_now_index` int(11) DEFAULT NULL COMMENT '当前分片索引',
  `zone_suffix` varchar(100) DEFAULT NULL COMMENT '分片文件后缀',
  `file_record_id` varchar(40) DEFAULT NULL COMMENT '文件记录ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件分片记录';

/*Data for the table `sys_file_zone_record` */

/*Table structure for table `upload_content` */

DROP TABLE IF EXISTS `upload_content`;

CREATE TABLE `upload_content` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `records_id` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `folder_num` varchar(255) DEFAULT NULL,
  `folder_time` varchar(50) DEFAULT NULL,
  `folder_type` varchar(100) DEFAULT NULL,
  `project_info` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `upload_content` */

insert  into `upload_content`(`id`,`name`,`records_id`,`path`,`folder_num`,`folder_time`,`folder_type`,`project_info`) values ('8888888','stone','8888888','D:/java/myWorker','项目编号','20201028','uploadFileA','项目信息'),('9999999','louis','9999999','D:/java/myWorker','项目编号','20201028','uploadFileA','项目信息');

/*Table structure for table `upload_record` */

DROP TABLE IF EXISTS `upload_record`;

CREATE TABLE `upload_record` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `folder_num` varchar(255) DEFAULT NULL,
  `folder_time` varchar(50) DEFAULT NULL,
  `folder_type` varchar(100) DEFAULT NULL,
  `project_info` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `upload_record` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
