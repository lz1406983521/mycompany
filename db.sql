/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : roach

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2021-03-08 20:44:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `userPw` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');
INSERT INTO `t_admin` VALUES ('2', 'admin', 'admin');
INSERT INTO `t_admin` VALUES ('3', 'c', 'c');
INSERT INTO `t_admin` VALUES ('4', 'd', 'd');
INSERT INTO `t_admin` VALUES ('5', 'e', 'e');

-- ----------------------------
-- Table structure for `t_catelog`
-- ----------------------------
DROP TABLE IF EXISTS `t_catelog`;
CREATE TABLE `t_catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_catelog
-- ----------------------------
INSERT INTO `t_catelog` VALUES ('7', '床上用品', 'no');
INSERT INTO `t_catelog` VALUES ('8', '厨卫用具', 'no');
INSERT INTO `t_catelog` VALUES ('9', '室内配饰', 'no');
INSERT INTO `t_catelog` VALUES ('10', '家具装饰品', 'no');
INSERT INTO `t_catelog` VALUES ('11', '电器用品', 'no');

-- ----------------------------
-- Table structure for `t_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catelog_id` int(11) DEFAULT NULL,
  `nannvkuan` varchar(255) DEFAULT NULL,
  `bianhao` varchar(255) DEFAULT NULL,
  `mingcheng` varchar(500) DEFAULT NULL,
  `jieshao` varchar(8000) DEFAULT NULL,
  `pinpai` varchar(255) DEFAULT NULL,
  `fujian` varchar(255) DEFAULT NULL,
  `shichangjia` int(11) DEFAULT NULL,
  `tejia` int(11) DEFAULT NULL,
  `shifoutejia` varchar(255) DEFAULT NULL,
  `kucun` int(11) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('25', '7', null, '802834', '高级大床', '高级大床', '美乐乐', 'upload/1553412262566.jpg', '3454', '3454', 'fou', '0', 'yes');
INSERT INTO `t_goods` VALUES ('26', '7', null, '324342', '高级大床', '高级大床', '美乐乐', 'upload/1553412442539.jpg', '2888', '2888', 'fou', '0', 'no');
INSERT INTO `t_goods` VALUES ('27', '7', null, '202102', '东方雅韵 圆弧防撞桌角设计', '<a href=\"https://www.meilele.com/category-cantingtaozhuang/goods-134435.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; text-decoration-line: none; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, Arial;\">\r\n<p class=\"txt-title\" style=\"margin: 11px 0px 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; height: 13px; color: rgb(85, 85, 85); line-height: 13px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;\">东方雅韵 圆弧防撞桌角设计</p>\r\n</a>', '美乐乐', 'upload/1553412577012.jpg', '1999', '1999', 'fou', '0', 'no');
INSERT INTO `t_goods` VALUES ('28', '9', null, '202103', '典藏珍品 优质橡胶木框架', '<a href=\"https://www.meilele.com/category-shafa/goods-143104.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; text-decoration-line: none; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, Arial;\">\r\n<p class=\"txt-title\" style=\"margin: 11px 0px 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; height: 13px; color: rgb(85, 85, 85); line-height: 13px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;\">典藏珍品 优质橡胶木框架</p>\r\n</a>', '美乐乐', 'upload/1553412651083.jpg', '3999', '3999', 'fou', '0', 'no');
INSERT INTO `t_goods` VALUES ('29', '7', null, '202104', ' 原木色实木复合1.5米床', '<a href=\"https://www.meilele.com/category-chuang/goods-354690.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; text-decoration-line: none; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, Arial;\">\r\n<p class=\"txt-title\" style=\"margin: 11px 0px 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; height: 13px; color: rgb(85, 85, 85); line-height: 13px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;\">简约休闲 经典圆角 原木色实木复合1.5米床</p>\r\n</a>', '美乐乐', 'upload/1553412759610.jpg', '2999', '2999', 'fou', '0', 'no');
INSERT INTO `t_goods` VALUES ('30', '10', null, '202105', '舒适黄牛真皮沙发', '<a href=\"https://www.meilele.com/category-shafa/goods-24093.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; text-decoration-line: none; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, Arial;\">\r\n<p class=\"txt-title\" style=\"margin: 11px 0px 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; height: 13px; color: rgb(85, 85, 85); line-height: 13px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;\">舒适黄牛真皮沙发 高弹性公仔棉真皮腰枕</p>\r\n</a>', '美乐乐', 'upload/1553412833186.jpg', '6999', '6999', 'fou', '0', 'no');
INSERT INTO `t_goods` VALUES ('31', '7', null, '202106', '名师力作 玫瑰描银雕花1.8米床', '<a href=\"https://www.meilele.com/category-chuang/goods-21994.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; text-decoration-line: none; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, Arial;\">\r\n<p class=\"txt-title\" style=\"margin: 11px 0px 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; height: 13px; color: rgb(85, 85, 85); line-height: 13px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;\">名师力作 玫瑰描银雕花1.8米床</p>\r\n</a>', '美乐乐', 'upload/1553412907978.jpg', '5999', '5999', 'fou', '-1', 'no');

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `shijian` varchar(50) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `img` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', 'Z-Wave是为智能家居量身定制的无线网络', 'Z-Wave是一种无线电系统，被许多智能家居设备使用。当然，Wi-Fi在浏览网页方面占据着主导地位，蓝牙在连接耳机和可穿戴设备方面也很出色，但智能家居技术需要一个低功耗、随时开机的系统，可以从你家的一端连接到另一端。智能照明、供暖和安全设备，以及智能设备和自动化控制器，使用的两个主要标准是Z-Wave和Zigbee', '2019-3-8 22:18:06', 'news', 'upload/1512742684396.jpg');
INSERT INTO `t_news` VALUES ('2', '原创家居品牌深陷同质化迷局', '在经济的高速发展带动生产能力和消费能力之余，紧随其后的是人们对品质感的追求。在此大环境之下，近几年，国产原创家居品牌成为了众多家居企业版图中越来越有份量的一个区域。它们突出的品牌风格，符合中国市场和大众审美的要求，设计师们也通过富有个人色彩的创意让家居品牌带上了一层追求品质和极致美学的光环。', '2019-3-8 22:17:52', 'news', 'upload/1512742669921.jpg');
INSERT INTO `t_news` VALUES ('3', '顾家家居回应敏华控股专利投诉 多年前往事浮出水面', '第34届深圳国际家具展上，家具行业两大巨头大战。敏华控股（01999 HK）投诉顾家家居(603816)涉嫌侵权引发了外界广泛关注。3月22日家具展闭幕后，顾家家居发表《声明》，并在接受证券时报·e公司采访时，揭开了一个鲜为人知的往事。\r\n《声明》指出，顾家家居自创立以来，始终坚持原创设计，坚持以用户为中心，持续自主研发家居产品。“坚持奋斗创新”是顾家家居的核心价值观之一，是支持顾家家居发展壮大的核心竞争力。截至目前，顾家家居已荣获百余项设计大奖，已拥有1227项原创专利。', '2019-3-4 20:16:29', 'news', 'upload/1512389787688.jpg');
INSERT INTO `t_news` VALUES ('4', '2021年整体化家居将成行业主旋律！', '2019开年以来，全屋整装延续了去年的热闹势头，一路向上。大势压城，形势相当逼人。无论你是站在门外看，还是置身其中，都可能已感受到其滔天热浪。\r\n整装步入密集探索期，在整装的问题上，去年还存在不小的争议。依然有实力企业的高管认为，这事儿成不了气候，做不起来，难度太大。但这并没有妨碍部分玩家强势进击，拿出一揽子方案推动，效果确实让人喜。', '2019-3-4 20:18:18', 'news', 'upload/1512389896126.png');
INSERT INTO `t_news` VALUES ('5', '美国六大家居品牌组团进入中国促产业新合作', '中新社东莞3月17日电(李映民 李纯)记者17日从“中国家具之都”广东东莞厚街镇政府获悉，美国六大顶级家居品牌Bernhardt，Century，Vanguard，Hancock & moore，Maitland-Smith，Stanley与该镇楷模集团签约，组团进入中国市场，将在文化、产品、设计、教育四个维度与中国企业展开深入合作。', '2019-3-4 20:20:19', 'news', 'upload/1512390017394.png');
INSERT INTO `t_news` VALUES ('19', '家居企业门户网站上线测试', '家居企业门户网站上线测试', '2019-3-24 20:18:18', 'news', null);

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` varchar(255) NOT NULL,
  `bianhao` varchar(255) DEFAULT NULL,
  `shijian` varchar(255) DEFAULT NULL,
  `zhuangtai` varchar(255) DEFAULT NULL,
  `songhuodizhi` varchar(255) DEFAULT NULL,
  `fukuanfangshi` varchar(255) DEFAULT NULL,
  `jine` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1553413024833', '20210324033704', '2021-02-24 03:37:04', 'no', '东奔西走', '货到付款', '5999', '1482826551968');

-- ----------------------------
-- Table structure for `t_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `id` varchar(255) NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('1553413024847', '1553413024833', '31', '1');

-- ----------------------------
-- Table structure for `t_reply`
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `reply` text,
  `addDate` varchar(30) DEFAULT NULL,
  `replyDate` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `createTs` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reply
-- ----------------------------
INSERT INTO `t_reply` VALUES ('1', 'abc123', '我的建议测试', '我的建议测试content', '我的建议测试反馈', '2021-3-5', '2021-3-5', '2342342@qq.com', '2021-03-08 20:30:11');
INSERT INTO `t_reply` VALUES ('2', 'aaaa', '我的想法测试', 'reply想法', '想法反馈', '2021-3-5', '2021-3-5', '234234@qq.com', '2021-03-08 20:30:13');
INSERT INTO `t_reply` VALUES ('6', '游客', '企业门户', '企业门户', null, '2021-3-5', null, '', '2021-03-08 20:30:06');
INSERT INTO `t_reply` VALUES ('7', 'aaaa', '用户aaaa', '用户aaaa用户aaaa用户aaaa用户aaaa用户aaaa用户aaaa', null, '2021-3-5', null, '', '2021-03-08 20:30:07');
INSERT INTO `t_reply` VALUES ('8', '游客', 'sdfsdfsdf', 'sdfsdfdsf', null, '2021-3-5', null, 'dsff', '2021-03-08 20:30:10');

-- ----------------------------
-- Table structure for `t_single`
-- ----------------------------
DROP TABLE IF EXISTS `t_single`;
CREATE TABLE `t_single` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `subtype` varchar(20) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `createTs` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_single
-- ----------------------------
INSERT INTO `t_single` VALUES ('1', '企业介绍', '<div>&nbsp; &nbsp; &nbsp; &nbsp;企业门户网是一家集专业活动隔断、酒店屏风、折叠屏风等的研发、设计、生产、销售、安装为一体的企业。，通过技术的不断创新，使产品具有更好的隔音效果和更灵活的移动间隔空间功能。办公家具门户网移动隔断有65型、85型、100型、125超高型和65型无框玻璃、85型有框玻璃屏风，及32型折叠屏风等七种型号，其中超高型活动隔断具有世 界领先的技术水平，采用超强钢轨、进口吊轮、特制驳口和自动转向系统，可达16m，隔音系数可达55db，适合于大型高档会议厅、宴会厅、展览厅、展 览馆和其它专业场馆使用。各种型号的活动隔断均可任意角度转弯，实现全方位、多角度灵活分隔空间，充分展现了室内空间的分隔艺术。</div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; 办公家具门户网移动隔断产品广泛应用于酒店宴会厅、多功能厅、会议室等需要灵活间隔的场所。全面推行ISO9001质量体系，并以款式多样，工艺精湛、诚信 合作为宗旨，活动隔断产品设计与生产都经过严格的工序，从研发到安装都一丝不苟，通过严格的检测流程才将产品交付客户使用。</div>', 'intro', 'upload/1553345135255.jpg', '2021-03-08 20:25:01');
INSERT INTO `t_single` VALUES ('2', '联系我们', '<p><b>电话:010-888888<br />\r\n地址：北京市二环</b></p>', 'contact', '', '2021-02-24 15:07:05');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `loginname` varchar(255) DEFAULT NULL,
  `loginpw` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1482826551968', 'abc123', 'abc123', 'hello2', '男', '32', 'sz', '1356256552', '6544651@qq.com', '34543588', 'no');
INSERT INTO `t_user` VALUES ('1508772963890', 'abcde', 'abcde', 'aaa', '男', '23', 'sdfsdf', '234234', 'dsfwef@qq.com', null, 'no');
INSERT INTO `t_user` VALUES ('1508773036662', 'aaaa', 'aaaa', 'aaa', '男', '23', 'sdfsdf', '234234', 'dsfwef@qq.com', null, 'no');
INSERT INTO `t_user` VALUES ('1508773126021', 'bbbb', 'bbbb', 'aaa', '男', '23', 'sdfsdf', '234234', 'dsfwef@qq.com', null, 'no');
INSERT INTO `t_user` VALUES ('1508773286833', 'eeee', 'eeee', 'eeee', '男', '23', 'afdf', '324234', 'dsfsdf@qq.com', null, 'no');
INSERT INTO `t_user` VALUES ('1512134211043', 'qazqaz', 'qazqaz', '张三', '男', '20', 'sdsad', '12345678', '', null, 'no');
