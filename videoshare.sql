/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.5.15 : Database - videoshare
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`videoshare` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `videoshare`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`adminname`,`password`) values (1,'admin1','123');

/*Table structure for table `advise` */

DROP TABLE IF EXISTS `advise`;

CREATE TABLE `advise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(11) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `iswatched` int(11) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `advise` */

insert  into `advise`(`id`,`receiver_id`,`content`,`iswatched`,`createtime`) values (10,14,'【视频】 听说的爱情 审核通过',1,'2020-05-06'),(11,14,'【官方】 视频质量不错，再接再厉',1,'2020-05-06'),(12,13,'【用户】 王五 关注你了',0,'2020-05-06'),(13,11,'【官方】 通知一下，有优惠活动',1,'2020-05-08'),(14,12,'【官方】 感谢老铁的支持！',1,'2020-05-11');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  `iswatched` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

insert  into `feedback`(`id`,`uid`,`uname`,`content`,`contact`,`createtime`,`iswatched`) values (2,12,'张三','其实没什么建议，随便说一下，总体体验不错哈哈哈哈','zhangsan@qq.com','2020-05-11',2),(3,13,'李四','建议优化一下上传功能，只上传视频就行，自动生成那个截图。','13719778322','2020-05-11',1),(4,11,'谦风','总体体验不错，不过不知道是否是服务器原因，加载比较慢','vx：123456','2020-05-07',1);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_id` int(11) DEFAULT NULL,
  `receive_id` int(11) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `sendtype` int(11) DEFAULT NULL,
  `receivetype` int(11) DEFAULT NULL,
  `iswatched` int(11) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`id`,`send_id`,`receive_id`,`content`,`sendtype`,`receivetype`,`iswatched`,`createtime`) values (1,11,12,'兄弟你好拽哟',1,1,1,'2020-04-29'),(2,13,12,'海景不错呀，能不能教我拍呀\nThanks♪(･ω･)ﾉ',1,1,1,'2020-04-29'),(4,14,12,'你觉得我会关注你么，小瘪三？？？',1,1,1,'2020-04-29');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`email`,`username`,`password`) values (11,'aaaa@qq.com','谦风','123456789'),(12,'zhangsan@qq.com','张三','1234567'),(13,'lisi@qq.com','李四','123456'),(14,'wangwu@qq.com','王五','123456'),(15,'ssss@qq.com','谁是谁的谁','123456'),(16,'ssssss@126.com','张xx','123456'),(17,'moshang@qq.com','陌上桑','123456');

/*Table structure for table `user_collect` */

DROP TABLE IF EXISTS `user_collect`;

CREATE TABLE `user_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `collector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

/*Data for the table `user_collect` */

insert  into `user_collect`(`id`,`video_id`,`collector_id`) values (109,16,12),(110,9,11),(111,16,11),(112,15,11),(113,22,11);

/*Table structure for table `user_item` */

DROP TABLE IF EXISTS `user_item`;

CREATE TABLE `user_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `u_img` varchar(256) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `introduce` varchar(256) DEFAULT NULL,
  `fans` int(11) DEFAULT NULL,
  `concern` int(11) DEFAULT NULL,
  `v_num` int(11) DEFAULT NULL,
  `c_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `user_item` */

insert  into `user_item`(`id`,`user_id`,`username`,`u_img`,`birthday`,`introduce`,`fans`,`concern`,`v_num`,`c_num`) values (1,11,'谦风','upload/564f4dd7e4b748319012b547537594a8_12312.jpg','2020-04-05','小鲜肉一枚，20岁未婚，工资2w，单身可撩，wx：7758258         嘻嘻嘻',2,3,8,4),(2,12,'张三','upload/f6d56e7c8ba646868aced5b27f060054_t013c8826685076ff8d.jpg','2020-04-14','抖音常客\n喜欢打游戏、篮球等等等',2,4,4,1),(3,13,'李四','assets/images/avatars/avatar-4.jpg','2020-04-18','我很帅，你信不？',3,2,1,0),(4,14,'王五','assets/images/avatars/avatar-6.jpg','2020-04-20','爱旅行的王五！你爱了么？',2,1,3,0),(5,15,'谁是谁的谁','assets/images/avatars/avatar-7.jpg','2020-04-20','该用户很懒，没有留下介绍，你才懒呢，略略略',1,0,0,0),(6,16,'张xx','upload/c8b79f34cc0e45b2803bd43bc93fa5c5_t013c8826685076ff8d.jpg','2020-05-04','I am a student.\nAre you ?♪(･ω･)ﾉ',0,0,1,0),(7,17,'陌上桑','assets/images/avatars/avatar-4.jpg','2020-05-08','该用户很懒，没有留下介绍',0,0,0,0);

/*Table structure for table `user_relation` */

DROP TABLE IF EXISTS `user_relation`;

CREATE TABLE `user_relation` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `fansid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `user_relation` */

insert  into `user_relation`(`rid`,`userid`,`fansid`) values (9,12,13),(10,13,12),(11,11,13),(14,11,12),(16,12,11),(17,14,12),(18,15,12),(19,13,11),(20,14,11),(21,13,14);

/*Table structure for table `video` */

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `vname` varchar(50) DEFAULT NULL,
  `vnote` varchar(256) DEFAULT NULL,
  `vimg` varchar(256) DEFAULT NULL,
  `vsrc` varchar(256) DEFAULT NULL,
  `vtype` varchar(50) DEFAULT NULL,
  `collected` int(11) DEFAULT NULL,
  `watched` int(11) DEFAULT NULL,
  `iswatched` int(11) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `video` */

insert  into `video`(`id`,`user_id`,`vname`,`vnote`,`vimg`,`vsrc`,`vtype`,`collected`,`watched`,`iswatched`,`createtime`) values (4,11,'情侣日常作妖2','抖音小视频转载','upload/f12a2f65983b49e4918ff13a7386fcd7_test.PNG','upload/36c403912be846deb7c5f4a90313c7ae_e740c99bff46cacac8fd9e09251dc232.mp4',NULL,0,42,3,'2020-04-11'),(5,11,'小公主日常','烁楠的小公主？？？','upload/ce350de2fc9d4f65886db9c5e734a4ec_test2.PNG','upload/e692ee2a8ad24bef9daba49b625627e0_0e8682f7526ad31f45c057820cb082a4.mp4',NULL,1,7,1,'2020-04-11'),(7,11,'穿女朋友的衣服','（搞笑）穿女朋友衣服','upload/daa5d2299a7849a09313ecfb18b27555_12345.PNG','upload/0c00caaf7ed546e5a562a3ebcdf23d10_901a7dcfb7ea6c2a23d1031872b457ad.mp4',NULL,0,2,1,'2020-04-12'),(8,11,'弟弟憨批','这是一个憨批弟弟','upload/6291fc330bdf43b38639ff09bb7493da_85e6c593a904c326f2ddd6e7c105761.jpg','upload/67577ba9a3c94e71a4eea3e37ca2de22_c498cfb79b99e3dbfd71027a5c0ff270.mp4',NULL,0,4,1,'2020-04-12'),(9,11,'王者荣耀','李白飞飞飞','upload/82ead1c722dc4ab1bda3a2931994fc68_libai.PNG','upload/27cc14aae2e84655a21ea84805df3575_3e493324364e5f6fdbe8791eedc7f0f9.mp4',NULL,1,2,1,'2020-04-13'),(10,11,'兰博基尼','兰博car','upload/1c98751bc16645ee964539ec33e4c126_car.PNG','upload/57df7ad66edd444c808b743dec72c3c4_0c23ac2653e47449d8822cb7303bad85.mp4',NULL,0,1,1,'2020-04-13'),(11,11,'我不看电视了','抖音搞笑','upload/f9f2baf8f08142aea2d12f5c30a9d443_kandianshi.PNG','upload/3e48132a7ddd41008640b5f8f25217aa_ca3e2118577dfcbe2e44075093bece52.mp4',NULL,0,2,1,'2020-04-13'),(12,11,'取名字（连山）','取个好名字哟','upload/e67279cb0bb34462b3841162d11d389f_liansa.PNG','upload/b4802685fbad4c55b7f66cb98a8e6a77_168d82a40a01de33dd7d813ea3028745.mp4',NULL,0,4,1,'2020-04-13'),(14,11,'睡觉觉','sleep zzzz','upload/cb496c6f330249b5a95f05fe0e16701e_sleep.PNG','upload/d62cadd831b443c38b69ba1222fa1408_c449d84a8ee14b9d1d2618f1715ab62d.mp4',NULL,0,1,1,'2020-04-13'),(15,12,'情侣day','虐狗','upload/b4fffc3ca4574f9d95a0ba59c547b43d_test.PNG','upload/6741e6dcaef04c6da071b9f92cd3a7bb_e740c99bff46cacac8fd9e09251dc232.mp4',NULL,1,33,1,'2020-04-14'),(16,13,'老朱生日hi','这是两年前老朱的生日','upload/69de1a564b304b779b0acd071d495b7c_zhu.PNG','upload/583009f420c74d4694a214182126ae39_峻农生日.mp4',NULL,2,129,1,'2020-04-18'),(17,14,'The Sea','海上游荡，突突突','upload/658fe7503f9e42ccb612d1e81eeda013_1.PNG','upload/929568528c23424a85f92f21a8918527_56d8730b2d54e8272f84da78144f8c28.mp4',NULL,0,9,1,'2020-04-20'),(18,12,'Blue Sea','蔚蓝的海，你见过么？','upload/ef6ceed94a02429b9a8ef53a309b89be_hai.PNG','upload/12734822d24646478b1bc94384f40546_海边小视频.mp4',NULL,0,3,1,'2020-04-21'),(21,12,'视频test','视频测试私信功能，指定用户。','upload/0f56b6ae3fcd48bbba1facdd26203102_547.PNG','upload/2870c1e94bfc437a92b0319b3e14f96d_f05a7ea240bbfb2f952e9a5df4f1be3d.mp4',NULL,0,4,1,'2020-04-30'),(22,12,'wzry','准备战斗吧','upload/45f2cf45bb6e4cc6a02542fa798e7f2d_wzh.PNG','upload/9ce5400311fc4e06b3c349474ccc43c4_d2c78599ea29c014384809f868ff9974.mp4',NULL,1,2,1,'2020-04-30'),(23,16,'上号','兄弟们上号，准备开团','upload/573dba39aec940c2884fa7934844f474_shanghao.PNG','upload/2bbc2ab55b494289af331bd14d76018a_05ad53b628e5532b9d52eb09d9d7d716.mp4',NULL,0,0,1,'2020-05-04'),(25,14,'兰博基尼','冲冲冲car','upload/7e87fc6956264b95b7ef1b8ec629ae24_car.PNG','upload/8aad07d2e0ab42079c0ff33890930e94_0c23ac2653e47449d8822cb7303bad85.mp4',NULL,0,0,1,'2020-05-05'),(28,14,'听说的爱情','一个男孩会遇见两个女孩，一个教会如何爱，一个才陪伴他。。','upload/d2234cf282c74fe99b20d20e26cabefa_kandianshi.PNG','upload/b00b21b7865e4a9cb28a931d0469cc96_6cb51837c1666cee4778de4a63f5e370.mp4',NULL,0,1,1,'2020-05-06');

/*Table structure for table `video_comment` */

DROP TABLE IF EXISTS `video_comment`;

CREATE TABLE `video_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `v_comment` varchar(256) DEFAULT NULL,
  `v_createtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `video_comment` */

insert  into `video_comment`(`id`,`video_id`,`user_id`,`v_comment`,`v_createtime`) values (8,16,11,'老朱好帅，守立好酷，烁楠牛皮','2020-04-24'),(12,16,13,'生日快乐！','2020-05-10'),(13,16,14,'报数 1','2020-05-10'),(14,16,15,'报数 2','2020-05-10'),(15,16,16,'报数 3','2020-05-10'),(16,16,17,'开开心心的喔','2020-05-10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
