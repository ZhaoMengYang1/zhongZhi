/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.20-log : Database - mydisk
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mydisk` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mydisk`;

/*Table structure for table `t_file` */

DROP TABLE IF EXISTS `t_file`;

CREATE TABLE `t_file` (
  `fid` char(32) NOT NULL,
  `fname` varchar(200) NOT NULL,
  `folder` tinyint(1) NOT NULL,
  `fileExt` char(20) DEFAULT NULL,
  `fileSize` bigint(20) DEFAULT NULL,
  `fileurl` varchar(500) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `uid` char(32) NOT NULL,
  `pid` char(32) DEFAULT NULL,
  `privated` tinyint(1) DEFAULT '1',
  `createtime` datetime DEFAULT NULL,
  `deltime` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[1]homedisk';

/*Data for the table `t_file` */

insert  into `t_file`(`fid`,`fname`,`folder`,`fileExt`,`fileSize`,`fileurl`,`deleted`,`uid`,`pid`,`privated`,`createtime`,`deltime`,`remark`) values ('85860EAFAC584EEE8BBB1FCB65F062FC','wangwu',1,NULL,0,'/wangwu',0,'D1841476433B4D22873E8ED650FC84E2',NULL,1,'2018-12-20 23:16:27',NULL,NULL);

/*Table structure for table `t_recycled` */

DROP TABLE IF EXISTS `t_recycled`;

CREATE TABLE `t_recycled` (
  `fid` char(32) NOT NULL,
  `fname` varchar(200) NOT NULL,
  `folder` tinyint(1) NOT NULL,
  `fileExt` char(20) DEFAULT NULL,
  `fileSize` bigint(20) DEFAULT NULL,
  `fileurl` varchar(500) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `uid` char(32) NOT NULL,
  `pid` char(32) DEFAULT NULL,
  `privated` tinyint(1) DEFAULT '1',
  `createtime` datetime DEFAULT NULL,
  `deltime` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[1]homedisk';

/*Data for the table `t_recycled` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `uid` char(32) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `admin` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  `fid` char(32) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[1]homedisk';

/*Data for the table `t_user` */

insert  into `t_user`(`uid`,`uname`,`password`,`locked`,`admin`,`deleted`,`createTime`,`fid`) values ('1','admin','xMpCOKC5I4INzFCab3WEmw==',0,1,0,NULL,NULL),('D1841476433B4D22873E8ED650FC84E2','wangwu','xMpCOKC5I4INzFCab3WEmw==',0,0,0,'2018-12-20 23:16:27','85860EAFAC584EEE8BBB1FCB65F062FC');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
