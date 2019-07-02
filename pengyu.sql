/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : pengyu

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-07-02 13:41:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_admin
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin`;
CREATE TABLE `tp_admin` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `admin_name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT 'email',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(10) DEFAULT NULL COMMENT '秘钥',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `updatetime` int(11) DEFAULT NULL,
  `logintime` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `lastlogintime` int(11) DEFAULT NULL,
  `lastloginip` varchar(222) DEFAULT NULL,
  `loginip` varchar(15) DEFAULT NULL COMMENT '最后登录ip',
  `nav_list` text COMMENT '权限',
  `lang_type` varchar(50) NOT NULL DEFAULT '' COMMENT 'lang_type',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'agency_id',
  `suppliers_id` smallint(5) unsigned DEFAULT '0' COMMENT 'suppliers_id',
  `todolist` longtext COMMENT 'todolist',
  `role_id` smallint(5) DEFAULT '0' COMMENT '角色id',
  `status` int(11) NOT NULL COMMENT '0禁用，1启用',
  `loginfailure` int(11) NOT NULL DEFAULT '0',
  `id` int(11) DEFAULT NULL,
  `token` varchar(222) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `user_name` (`admin_name`) USING BTREE,
  KEY `agency_id` (`agency_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_admin
-- ----------------------------
INSERT INTO `tp_admin` VALUES ('1', 'admin', '', '', '9a28ce07ce875fbd14172a9ca5357d3c', '2dHDmj', '1262277023', null, '1561945094', '1561945094', '127.0.0.1', '127.0.0.1', '', '', '0', '0', null, '1', '1', '0', '0', '9127fc12-7b26-4298-a963-6433e51ee30e');
INSERT INTO `tp_admin` VALUES ('13', 'admin345', '', '', '3903607abe9a4246cd0ea06bdef44a1d', '0ZpstI', '1534991935', null, '1535019879', '1535019879', '127.0.0.1', '127.0.0.1', null, '', '0', '0', null, '10', '1', '0', '13', null);

-- ----------------------------
-- Table structure for tp_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_log`;
CREATE TABLE `tp_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `info` text,
  `ip` varchar(25) NOT NULL,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1501 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_admin_log
-- ----------------------------
INSERT INTO `tp_admin_log` VALUES ('1', '1', '添加广告位【0】', '127.0.0.1', '1500884042');
INSERT INTO `tp_admin_log` VALUES ('2', '1', '删除广告【1,2】', '127.0.0.1', '1509354162');
INSERT INTO `tp_admin_log` VALUES ('3', '1', '添加广告【7】', '127.0.0.1', '1509354203');
INSERT INTO `tp_admin_log` VALUES ('4', '1', '添加广告【8】', '127.0.0.1', '1509354217');
INSERT INTO `tp_admin_log` VALUES ('5', '1', '添加广告【9】', '127.0.0.1', '1509354230');
INSERT INTO `tp_admin_log` VALUES ('6', '1', '修改文章分类【2】', '127.0.0.1', '1509357553');
INSERT INTO `tp_admin_log` VALUES ('7', '1', '修改文章分类【3】', '127.0.0.1', '1509357563');
INSERT INTO `tp_admin_log` VALUES ('8', '1', '修改模块【306】', '127.0.0.1', '1509357732');
INSERT INTO `tp_admin_log` VALUES ('9', '1', '修改模块【303】', '127.0.0.1', '1509357743');
INSERT INTO `tp_admin_log` VALUES ('10', '1', '添加模块【307】', '127.0.0.1', '1509357768');
INSERT INTO `tp_admin_log` VALUES ('11', '1', '成功备份表【tp_admin,tp_admin_act_log,tp_admin_login_log,tp_admin_role,tp_adv,tp_adv_type,tp_art,tp_art_photo,tp_art_type,tp_button,tp_config,tp_employ,tp_links,tp_message,tp_module,tp_order,tp_publish_type,tp_temple,tp_temple_t', '127.0.0.1', '1509415730');
INSERT INTO `tp_admin_log` VALUES ('12', '1', '成功备份表【tp_admin,tp_admin_act_log,tp_admin_login_log,tp_admin_role,tp_adv,tp_adv_type,tp_art,tp_art_photo,tp_art_type,tp_button,tp_config,tp_employ,tp_links,tp_message,tp_module,tp_order,tp_publish_type,tp_temple,tp_temple_t', '127.0.0.1', '1509415747');
INSERT INTO `tp_admin_log` VALUES ('13', '1', '修改模块【304】', '127.0.0.1', '1509417268');
INSERT INTO `tp_admin_log` VALUES ('14', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509419433');
INSERT INTO `tp_admin_log` VALUES ('15', '1', '添加自营【1】', '127.0.0.1', '1509421600');
INSERT INTO `tp_admin_log` VALUES ('16', '1', '添加自营【2】', '127.0.0.1', '1509435738');
INSERT INTO `tp_admin_log` VALUES ('17', '1', '添加自营【3】', '127.0.0.1', '1509435994');
INSERT INTO `tp_admin_log` VALUES ('18', '1', '添加自营【4】', '127.0.0.1', '1509436116');
INSERT INTO `tp_admin_log` VALUES ('19', '1', '添加自营【5】', '127.0.0.1', '1509436136');
INSERT INTO `tp_admin_log` VALUES ('20', '1', '添加自营【6】', '127.0.0.1', '1509436271');
INSERT INTO `tp_admin_log` VALUES ('21', '1', '修改自营【6】', '127.0.0.1', '1509436280');
INSERT INTO `tp_admin_log` VALUES ('22', '1', '修改自营【6】', '127.0.0.1', '1509436287');
INSERT INTO `tp_admin_log` VALUES ('23', '1', '修改自营【6】', '127.0.0.1', '1509436340');
INSERT INTO `tp_admin_log` VALUES ('24', '1', '添加自营【7】', '127.0.0.1', '1509436361');
INSERT INTO `tp_admin_log` VALUES ('25', '1', '修改自营【7】', '127.0.0.1', '1509436381');
INSERT INTO `tp_admin_log` VALUES ('26', '1', '修改自营【7】', '127.0.0.1', '1509436489');
INSERT INTO `tp_admin_log` VALUES ('27', '1', '修改自营【7】', '127.0.0.1', '1509436495');
INSERT INTO `tp_admin_log` VALUES ('28', '1', '修改自营【7】', '127.0.0.1', '1509436604');
INSERT INTO `tp_admin_log` VALUES ('29', '1', '修改自营【7】', '127.0.0.1', '1509436611');
INSERT INTO `tp_admin_log` VALUES ('30', '1', '修改自营【7】', '127.0.0.1', '1509436620');
INSERT INTO `tp_admin_log` VALUES ('31', '1', '修改自营【7】', '127.0.0.1', '1509436636');
INSERT INTO `tp_admin_log` VALUES ('32', '1', '修改自营【7】', '127.0.0.1', '1509436643');
INSERT INTO `tp_admin_log` VALUES ('33', '1', '修改自营【7】', '127.0.0.1', '1509436764');
INSERT INTO `tp_admin_log` VALUES ('34', '1', '修改自营【7】', '127.0.0.1', '1509436865');
INSERT INTO `tp_admin_log` VALUES ('35', '1', '修改自营【7】', '127.0.0.1', '1509436901');
INSERT INTO `tp_admin_log` VALUES ('36', '1', '修改自营【7】', '127.0.0.1', '1509437119');
INSERT INTO `tp_admin_log` VALUES ('37', '1', '修改自营【7】', '127.0.0.1', '1509437213');
INSERT INTO `tp_admin_log` VALUES ('38', '1', '修改自营【7】', '127.0.0.1', '1509437370');
INSERT INTO `tp_admin_log` VALUES ('39', '1', '添加自营【8】', '127.0.0.1', '1509437491');
INSERT INTO `tp_admin_log` VALUES ('40', '1', '修改自营【8】', '127.0.0.1', '1509437498');
INSERT INTO `tp_admin_log` VALUES ('41', '1', '修改自营【8】', '127.0.0.1', '1509437523');
INSERT INTO `tp_admin_log` VALUES ('42', '1', '修改自营【8】', '127.0.0.1', '1509437542');
INSERT INTO `tp_admin_log` VALUES ('43', '1', '修改自营【8】', '127.0.0.1', '1509437674');
INSERT INTO `tp_admin_log` VALUES ('44', '1', '修改自营【8】', '127.0.0.1', '1509437828');
INSERT INTO `tp_admin_log` VALUES ('45', '1', '修改自营【8】', '127.0.0.1', '1509438063');
INSERT INTO `tp_admin_log` VALUES ('46', '1', '修改自营【8】', '127.0.0.1', '1509438137');
INSERT INTO `tp_admin_log` VALUES ('47', '1', '修改自营【8】', '127.0.0.1', '1509438209');
INSERT INTO `tp_admin_log` VALUES ('48', '1', '修改自营【8】', '127.0.0.1', '1509438339');
INSERT INTO `tp_admin_log` VALUES ('49', '1', '修改自营【8】', '127.0.0.1', '1509438414');
INSERT INTO `tp_admin_log` VALUES ('50', '1', '修改自营【8】', '127.0.0.1', '1509438418');
INSERT INTO `tp_admin_log` VALUES ('51', '1', '修改自营【8】', '127.0.0.1', '1509438424');
INSERT INTO `tp_admin_log` VALUES ('52', '1', '添加自营【9】', '127.0.0.1', '1509440761');
INSERT INTO `tp_admin_log` VALUES ('53', '1', '修改自营【7】', '127.0.0.1', '1509441309');
INSERT INTO `tp_admin_log` VALUES ('54', '1', '修改自营【5】', '127.0.0.1', '1509441318');
INSERT INTO `tp_admin_log` VALUES ('55', '1', '修改自营【1】', '127.0.0.1', '1509441325');
INSERT INTO `tp_admin_log` VALUES ('56', '1', '修改自营【2】', '127.0.0.1', '1509441332');
INSERT INTO `tp_admin_log` VALUES ('57', '1', '修改自营【3】', '127.0.0.1', '1509441340');
INSERT INTO `tp_admin_log` VALUES ('58', '1', '修改自营【4】', '127.0.0.1', '1509441348');
INSERT INTO `tp_admin_log` VALUES ('59', '1', '修改自营【6】', '127.0.0.1', '1509441377');
INSERT INTO `tp_admin_log` VALUES ('60', '1', '修改自营【8】', '127.0.0.1', '1509441423');
INSERT INTO `tp_admin_log` VALUES ('61', '1', '修改文章分类【4】', '127.0.0.1', '1509448888');
INSERT INTO `tp_admin_log` VALUES ('62', '1', '修改文章【3】', '127.0.0.1', '1509449093');
INSERT INTO `tp_admin_log` VALUES ('63', '1', '修改文章【4】', '127.0.0.1', '1509449217');
INSERT INTO `tp_admin_log` VALUES ('64', '1', '修改文章【4】', '127.0.0.1', '1509449491');
INSERT INTO `tp_admin_log` VALUES ('65', '1', '修改文章【4】', '127.0.0.1', '1509449545');
INSERT INTO `tp_admin_log` VALUES ('66', '1', '修改文章【4】', '127.0.0.1', '1509449563');
INSERT INTO `tp_admin_log` VALUES ('67', '1', '添加文章【10】', '127.0.0.1', '1509449645');
INSERT INTO `tp_admin_log` VALUES ('68', '1', '添加文章【11】', '127.0.0.1', '1509449653');
INSERT INTO `tp_admin_log` VALUES ('69', '1', '添加文章【12】', '127.0.0.1', '1509449662');
INSERT INTO `tp_admin_log` VALUES ('70', '1', '添加文章【13】', '127.0.0.1', '1509449669');
INSERT INTO `tp_admin_log` VALUES ('71', '1', '添加文章【14】', '127.0.0.1', '1509449677');
INSERT INTO `tp_admin_log` VALUES ('72', '1', '添加文章【15】', '127.0.0.1', '1509449686');
INSERT INTO `tp_admin_log` VALUES ('73', '1', '添加文章【16】', '127.0.0.1', '1509449695');
INSERT INTO `tp_admin_log` VALUES ('74', '1', '添加文章【17】', '127.0.0.1', '1509449705');
INSERT INTO `tp_admin_log` VALUES ('75', '1', '添加模块【308】', '127.0.0.1', '1509450092');
INSERT INTO `tp_admin_log` VALUES ('76', '1', '分配模块按钮【308】', '127.0.0.1', '1509450103');
INSERT INTO `tp_admin_log` VALUES ('77', '1', '为角色【1】分配模块权限', '127.0.0.1', '1509450110');
INSERT INTO `tp_admin_log` VALUES ('78', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509450118');
INSERT INTO `tp_admin_log` VALUES ('79', '1', '添加交易【1】', '127.0.0.1', '1509450679');
INSERT INTO `tp_admin_log` VALUES ('80', '1', '添加交易【2】', '127.0.0.1', '1509450700');
INSERT INTO `tp_admin_log` VALUES ('81', '1', '添加交易【3】', '127.0.0.1', '1509450707');
INSERT INTO `tp_admin_log` VALUES ('82', '1', '添加交易【4】', '127.0.0.1', '1509450754');
INSERT INTO `tp_admin_log` VALUES ('83', '1', '修改交易【4】', '127.0.0.1', '1509450759');
INSERT INTO `tp_admin_log` VALUES ('84', '1', '添加交易【5】', '127.0.0.1', '1509450767');
INSERT INTO `tp_admin_log` VALUES ('85', '1', '删除交易【5】', '127.0.0.1', '1509450771');
INSERT INTO `tp_admin_log` VALUES ('86', '1', '添加交易【6】', '127.0.0.1', '1509451178');
INSERT INTO `tp_admin_log` VALUES ('87', '1', '添加交易【7】', '127.0.0.1', '1509451197');
INSERT INTO `tp_admin_log` VALUES ('88', '1', '删除交易【7】', '127.0.0.1', '1509451235');
INSERT INTO `tp_admin_log` VALUES ('89', '1', '添加交易【8】', '127.0.0.1', '1509451862');
INSERT INTO `tp_admin_log` VALUES ('90', '1', '添加文章分类【7】', '127.0.0.1', '1509451972');
INSERT INTO `tp_admin_log` VALUES ('91', '1', '添加文章【18】', '127.0.0.1', '1509451998');
INSERT INTO `tp_admin_log` VALUES ('92', '1', '添加模块【309】', '127.0.0.1', '1509504452');
INSERT INTO `tp_admin_log` VALUES ('93', '1', '添加模块【310】', '127.0.0.1', '1509504479');
INSERT INTO `tp_admin_log` VALUES ('94', '1', '添加模块【311】', '127.0.0.1', '1509504495');
INSERT INTO `tp_admin_log` VALUES ('95', '1', '修改模块【311】', '127.0.0.1', '1509504545');
INSERT INTO `tp_admin_log` VALUES ('96', '1', '添加模块【312】', '127.0.0.1', '1509504581');
INSERT INTO `tp_admin_log` VALUES ('97', '1', '添加模块【313】', '127.0.0.1', '1509504618');
INSERT INTO `tp_admin_log` VALUES ('98', '1', '修改模块【311】', '127.0.0.1', '1509504633');
INSERT INTO `tp_admin_log` VALUES ('99', '1', '添加模块【314】', '127.0.0.1', '1509504660');
INSERT INTO `tp_admin_log` VALUES ('100', '1', '添加模块【315】', '127.0.0.1', '1509504681');
INSERT INTO `tp_admin_log` VALUES ('101', '1', '添加模块【316】', '127.0.0.1', '1509505233');
INSERT INTO `tp_admin_log` VALUES ('102', '1', '添加模块【317】', '127.0.0.1', '1509505339');
INSERT INTO `tp_admin_log` VALUES ('103', '1', '修改模块【316】', '127.0.0.1', '1509505357');
INSERT INTO `tp_admin_log` VALUES ('104', '1', '添加模块【318】', '127.0.0.1', '1509505430');
INSERT INTO `tp_admin_log` VALUES ('105', '1', '添加模块【319】', '127.0.0.1', '1509505495');
INSERT INTO `tp_admin_log` VALUES ('106', '1', '添加模块【320】', '127.0.0.1', '1509505529');
INSERT INTO `tp_admin_log` VALUES ('107', '1', '修改模块【320】', '127.0.0.1', '1509505543');
INSERT INTO `tp_admin_log` VALUES ('108', '1', '修改模块【319】', '127.0.0.1', '1509505555');
INSERT INTO `tp_admin_log` VALUES ('109', '1', '添加模块【321】', '127.0.0.1', '1509505602');
INSERT INTO `tp_admin_log` VALUES ('110', '1', '修改模块【321】', '127.0.0.1', '1509505644');
INSERT INTO `tp_admin_log` VALUES ('111', '1', '分配模块按钮【311】', '127.0.0.1', '1509505667');
INSERT INTO `tp_admin_log` VALUES ('112', '1', '分配模块按钮【316】', '127.0.0.1', '1509505678');
INSERT INTO `tp_admin_log` VALUES ('113', '1', '分配模块按钮【317】', '127.0.0.1', '1509505686');
INSERT INTO `tp_admin_log` VALUES ('114', '1', '分配模块按钮【313】', '127.0.0.1', '1509505700');
INSERT INTO `tp_admin_log` VALUES ('115', '1', '分配模块按钮【318】', '127.0.0.1', '1509505708');
INSERT INTO `tp_admin_log` VALUES ('116', '1', '分配模块按钮【315】', '127.0.0.1', '1509505722');
INSERT INTO `tp_admin_log` VALUES ('117', '1', '分配模块按钮【319】', '127.0.0.1', '1509505730');
INSERT INTO `tp_admin_log` VALUES ('118', '1', '分配模块按钮【320】', '127.0.0.1', '1509505741');
INSERT INTO `tp_admin_log` VALUES ('119', '1', '分配模块按钮【321】', '127.0.0.1', '1509505750');
INSERT INTO `tp_admin_log` VALUES ('120', '1', '为角色【1】分配模块权限', '127.0.0.1', '1509505766');
INSERT INTO `tp_admin_log` VALUES ('121', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509505796');
INSERT INTO `tp_admin_log` VALUES ('122', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509505818');
INSERT INTO `tp_admin_log` VALUES ('123', '1', '修改模块【321】', '127.0.0.1', '1509505835');
INSERT INTO `tp_admin_log` VALUES ('124', '1', '添加模块【322】', '127.0.0.1', '1509505850');
INSERT INTO `tp_admin_log` VALUES ('125', '1', '分配模块按钮【321】', '127.0.0.1', '1509505858');
INSERT INTO `tp_admin_log` VALUES ('126', '1', '分配模块按钮【322】', '127.0.0.1', '1509505865');
INSERT INTO `tp_admin_log` VALUES ('127', '1', '为角色【1】分配模块权限', '127.0.0.1', '1509505873');
INSERT INTO `tp_admin_log` VALUES ('128', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509505880');
INSERT INTO `tp_admin_log` VALUES ('129', '1', '添加模块【323】', '127.0.0.1', '1509506570');
INSERT INTO `tp_admin_log` VALUES ('130', '1', '添加模块【324】', '127.0.0.1', '1509506616');
INSERT INTO `tp_admin_log` VALUES ('131', '1', '分配模块按钮【324】', '127.0.0.1', '1509506626');
INSERT INTO `tp_admin_log` VALUES ('132', '1', '为角色【1】分配模块权限', '127.0.0.1', '1509506643');
INSERT INTO `tp_admin_log` VALUES ('133', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509506651');
INSERT INTO `tp_admin_log` VALUES ('134', '1', '修改模块【324】', '127.0.0.1', '1509506879');
INSERT INTO `tp_admin_log` VALUES ('135', '1', '添加文章分类【8】', '127.0.0.1', '1509507180');
INSERT INTO `tp_admin_log` VALUES ('136', '1', '添加文章分类【9】', '127.0.0.1', '1509507186');
INSERT INTO `tp_admin_log` VALUES ('137', '1', '修改文章分类【9】', '127.0.0.1', '1509507192');
INSERT INTO `tp_admin_log` VALUES ('138', '1', '添加文章分类【10】', '127.0.0.1', '1509507199');
INSERT INTO `tp_admin_log` VALUES ('139', '1', '添加文章分类【11】', '127.0.0.1', '1509507207');
INSERT INTO `tp_admin_log` VALUES ('140', '1', '添加文章分类【12】', '127.0.0.1', '1509507216');
INSERT INTO `tp_admin_log` VALUES ('141', '1', '修改文章分类【12】', '127.0.0.1', '1509507236');
INSERT INTO `tp_admin_log` VALUES ('142', '1', '删除文章分类【12】', '127.0.0.1', '1509507242');
INSERT INTO `tp_admin_log` VALUES ('143', '1', '删除文章分类【9】', '127.0.0.1', '1509507246');
INSERT INTO `tp_admin_log` VALUES ('144', '1', '添加文章分类【1】', '127.0.0.1', '1509507787');
INSERT INTO `tp_admin_log` VALUES ('145', '1', '添加文章分类【2】', '127.0.0.1', '1509507796');
INSERT INTO `tp_admin_log` VALUES ('146', '1', '添加文章分类【3】', '127.0.0.1', '1509507802');
INSERT INTO `tp_admin_log` VALUES ('147', '1', '修改文章分类【1】', '127.0.0.1', '1509507866');
INSERT INTO `tp_admin_log` VALUES ('148', '1', '修改文章分类【2】', '127.0.0.1', '1509507875');
INSERT INTO `tp_admin_log` VALUES ('149', '1', '修改文章分类【3】', '127.0.0.1', '1509507886');
INSERT INTO `tp_admin_log` VALUES ('150', '1', '添加文章分类【4】', '127.0.0.1', '1509507902');
INSERT INTO `tp_admin_log` VALUES ('151', '1', '修改文章分类【4】', '127.0.0.1', '1509507909');
INSERT INTO `tp_admin_log` VALUES ('152', '1', '添加文章分类【5】', '127.0.0.1', '1509507917');
INSERT INTO `tp_admin_log` VALUES ('153', '1', '添加文章分类【6】', '127.0.0.1', '1509507939');
INSERT INTO `tp_admin_log` VALUES ('154', '1', '添加文章分类【7】', '127.0.0.1', '1509507948');
INSERT INTO `tp_admin_log` VALUES ('155', '1', '添加文章分类【8】', '127.0.0.1', '1509507996');
INSERT INTO `tp_admin_log` VALUES ('156', '1', '添加文章分类【9】', '127.0.0.1', '1509508043');
INSERT INTO `tp_admin_log` VALUES ('157', '1', '添加文章分类【10】', '127.0.0.1', '1509508056');
INSERT INTO `tp_admin_log` VALUES ('158', '1', '添加文章分类【11】', '127.0.0.1', '1509508102');
INSERT INTO `tp_admin_log` VALUES ('159', '1', '添加文章分类【12】', '127.0.0.1', '1509508110');
INSERT INTO `tp_admin_log` VALUES ('160', '1', '添加文章分类【13】', '127.0.0.1', '1509508122');
INSERT INTO `tp_admin_log` VALUES ('161', '1', '添加文章分类【14】', '127.0.0.1', '1509508131');
INSERT INTO `tp_admin_log` VALUES ('162', '1', '添加文章分类【15】', '127.0.0.1', '1509508151');
INSERT INTO `tp_admin_log` VALUES ('163', '1', '添加文章分类【16】', '127.0.0.1', '1509508179');
INSERT INTO `tp_admin_log` VALUES ('164', '1', '添加文章分类【17】', '127.0.0.1', '1509508187');
INSERT INTO `tp_admin_log` VALUES ('165', '1', '添加文章分类【18】', '127.0.0.1', '1509508197');
INSERT INTO `tp_admin_log` VALUES ('166', '1', '添加文章分类【19】', '127.0.0.1', '1509508243');
INSERT INTO `tp_admin_log` VALUES ('167', '1', '添加文章分类【20】', '127.0.0.1', '1509508250');
INSERT INTO `tp_admin_log` VALUES ('168', '1', '添加文章分类【21】', '127.0.0.1', '1509508273');
INSERT INTO `tp_admin_log` VALUES ('169', '1', '添加文章分类【22】', '127.0.0.1', '1509508307');
INSERT INTO `tp_admin_log` VALUES ('170', '1', '添加文章分类【23】', '127.0.0.1', '1509508316');
INSERT INTO `tp_admin_log` VALUES ('171', '1', '添加文章分类【24】', '127.0.0.1', '1509508324');
INSERT INTO `tp_admin_log` VALUES ('172', '1', '修改文章分类【24】', '127.0.0.1', '1509508339');
INSERT INTO `tp_admin_log` VALUES ('173', '1', '添加文章分类【25】', '127.0.0.1', '1509508349');
INSERT INTO `tp_admin_log` VALUES ('174', '1', '添加文章分类【26】', '127.0.0.1', '1509508362');
INSERT INTO `tp_admin_log` VALUES ('175', '1', '添加文章分类【27】', '127.0.0.1', '1509508531');
INSERT INTO `tp_admin_log` VALUES ('176', '1', '添加文章分类【28】', '127.0.0.1', '1509508552');
INSERT INTO `tp_admin_log` VALUES ('177', '1', '添加文章分类【29】', '127.0.0.1', '1509508565');
INSERT INTO `tp_admin_log` VALUES ('178', '1', '添加文章分类【30】', '127.0.0.1', '1509508590');
INSERT INTO `tp_admin_log` VALUES ('179', '1', '添加文章分类【31】', '127.0.0.1', '1509508604');
INSERT INTO `tp_admin_log` VALUES ('180', '1', '添加文章分类【32】', '127.0.0.1', '1509508615');
INSERT INTO `tp_admin_log` VALUES ('181', '1', '添加文章分类【33】', '127.0.0.1', '1509508625');
INSERT INTO `tp_admin_log` VALUES ('182', '1', '为角色【1】分配模块权限', '127.0.0.1', '1509622177');
INSERT INTO `tp_admin_log` VALUES ('183', '1', '为角色【1】分配模块权限', '127.0.0.1', '1509622203');
INSERT INTO `tp_admin_log` VALUES ('184', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509622223');
INSERT INTO `tp_admin_log` VALUES ('185', '1', '为角色【1】分配模块权限', '127.0.0.1', '1509622237');
INSERT INTO `tp_admin_log` VALUES ('186', '1', '添加模块【325】', '127.0.0.1', '1509622545');
INSERT INTO `tp_admin_log` VALUES ('187', '1', '添加模块【326】', '127.0.0.1', '1509622658');
INSERT INTO `tp_admin_log` VALUES ('188', '1', '分配模块按钮【326】', '127.0.0.1', '1509622673');
INSERT INTO `tp_admin_log` VALUES ('189', '1', '添加模块【327】', '127.0.0.1', '1509622716');
INSERT INTO `tp_admin_log` VALUES ('190', '1', '分配模块按钮【327】', '127.0.0.1', '1509622730');
INSERT INTO `tp_admin_log` VALUES ('191', '1', '为角色【1】分配模块权限', '127.0.0.1', '1509622746');
INSERT INTO `tp_admin_log` VALUES ('192', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509622760');
INSERT INTO `tp_admin_log` VALUES ('193', '1', '添加广告位【3】', '127.0.0.1', '1509623169');
INSERT INTO `tp_admin_log` VALUES ('194', '1', '添加项目会分类【1】', '127.0.0.1', '1509623218');
INSERT INTO `tp_admin_log` VALUES ('195', '1', '添加项目会分类【2】', '127.0.0.1', '1509623261');
INSERT INTO `tp_admin_log` VALUES ('196', '1', '添加项目会分类【3】', '127.0.0.1', '1509623270');
INSERT INTO `tp_admin_log` VALUES ('197', '1', '修改项目会分类【3】', '127.0.0.1', '1509623287');
INSERT INTO `tp_admin_log` VALUES ('198', '1', '修改项目会分类【3】', '127.0.0.1', '1509623293');
INSERT INTO `tp_admin_log` VALUES ('199', '1', '删除广告位【3】', '127.0.0.1', '1509623299');
INSERT INTO `tp_admin_log` VALUES ('200', '1', '添加项目会分类【4】', '127.0.0.1', '1509623355');
INSERT INTO `tp_admin_log` VALUES ('201', '1', '添加项目会【1】', '127.0.0.1', '1509624460');
INSERT INTO `tp_admin_log` VALUES ('202', '1', '添加项目会【2】', '127.0.0.1', '1509624525');
INSERT INTO `tp_admin_log` VALUES ('203', '1', '添加项目会【3】', '127.0.0.1', '1509624593');
INSERT INTO `tp_admin_log` VALUES ('204', '1', '修改项目会【3】', '127.0.0.1', '1509624623');
INSERT INTO `tp_admin_log` VALUES ('205', '1', '添加自营【0】', '127.0.0.1', '1509673618');
INSERT INTO `tp_admin_log` VALUES ('206', '1', '添加自营【0】', '127.0.0.1', '1509673680');
INSERT INTO `tp_admin_log` VALUES ('207', '1', '添加自营【0】', '127.0.0.1', '1509674262');
INSERT INTO `tp_admin_log` VALUES ('208', '1', '添加自营【0】', '127.0.0.1', '1509674448');
INSERT INTO `tp_admin_log` VALUES ('209', '1', '添加自营【0】', '127.0.0.1', '1509674471');
INSERT INTO `tp_admin_log` VALUES ('210', '1', '添加自营【0】', '127.0.0.1', '1509674539');
INSERT INTO `tp_admin_log` VALUES ('211', '1', '添加自营【0】', '127.0.0.1', '1509674821');
INSERT INTO `tp_admin_log` VALUES ('212', '1', '修改文章分类【2】', '127.0.0.1', '1509681909');
INSERT INTO `tp_admin_log` VALUES ('213', '1', '添加文章【19】', '127.0.0.1', '1509681927');
INSERT INTO `tp_admin_log` VALUES ('214', '1', '添加文章【20】', '127.0.0.1', '1509681946');
INSERT INTO `tp_admin_log` VALUES ('215', '1', '为角色【1】分配模块权限', '127.0.0.1', '1509684047');
INSERT INTO `tp_admin_log` VALUES ('216', '1', '为角色【1】分配模块权限', '127.0.0.1', '1509684066');
INSERT INTO `tp_admin_log` VALUES ('217', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509685960');
INSERT INTO `tp_admin_log` VALUES ('218', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509685974');
INSERT INTO `tp_admin_log` VALUES ('219', '1', '删除金属矿【2,1】', '127.0.0.1', '1509687747');
INSERT INTO `tp_admin_log` VALUES ('220', '1', '删除非金属矿【5】', '127.0.0.1', '1509687762');
INSERT INTO `tp_admin_log` VALUES ('221', '1', '删除产品【6,5】', '127.0.0.1', '1509688477');
INSERT INTO `tp_admin_log` VALUES ('222', '1', '添加模块【328】', '127.0.0.1', '1509688507');
INSERT INTO `tp_admin_log` VALUES ('223', '1', '添加模块【329】', '127.0.0.1', '1509688524');
INSERT INTO `tp_admin_log` VALUES ('224', '1', '添加模块【330】', '127.0.0.1', '1509688544');
INSERT INTO `tp_admin_log` VALUES ('225', '1', '分配模块按钮【330】', '127.0.0.1', '1509688555');
INSERT INTO `tp_admin_log` VALUES ('226', '1', '为角色【1】分配模块权限', '127.0.0.1', '1509688563');
INSERT INTO `tp_admin_log` VALUES ('227', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509688571');
INSERT INTO `tp_admin_log` VALUES ('228', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509690339');
INSERT INTO `tp_admin_log` VALUES ('229', '1', '删除会员【6】', '127.0.0.1', '1509690493');
INSERT INTO `tp_admin_log` VALUES ('230', '1', '分配模块按钮【311】', '127.0.0.1', '1509696961');
INSERT INTO `tp_admin_log` VALUES ('231', '1', '分配模块按钮【313】', '127.0.0.1', '1509696969');
INSERT INTO `tp_admin_log` VALUES ('232', '1', '分配模块按钮【315】', '127.0.0.1', '1509696979');
INSERT INTO `tp_admin_log` VALUES ('233', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509696998');
INSERT INTO `tp_admin_log` VALUES ('234', '1', '审核金属矿《18,17》', '127.0.0.1', '1509697606');
INSERT INTO `tp_admin_log` VALUES ('235', '1', '审核金属矿《8,4》', '127.0.0.1', '1509697610');
INSERT INTO `tp_admin_log` VALUES ('236', '1', '屏蔽金属矿《8》', '127.0.0.1', '1509697615');
INSERT INTO `tp_admin_log` VALUES ('237', '1', '审核非金属矿《7,6》', '127.0.0.1', '1509697692');
INSERT INTO `tp_admin_log` VALUES ('238', '1', '屏蔽非金属矿《7》', '127.0.0.1', '1509697697');
INSERT INTO `tp_admin_log` VALUES ('239', '1', '审核附属产品《4,3》', '127.0.0.1', '1509697827');
INSERT INTO `tp_admin_log` VALUES ('240', '1', '屏蔽附属产品《3》', '127.0.0.1', '1509697831');
INSERT INTO `tp_admin_log` VALUES ('241', '1', '添加自营【0】', '127.0.0.1', '1509768270');
INSERT INTO `tp_admin_log` VALUES ('242', '1', '添加自营【0】', '127.0.0.1', '1509768297');
INSERT INTO `tp_admin_log` VALUES ('243', '1', '删除自营【11,10】', '127.0.0.1', '1509768495');
INSERT INTO `tp_admin_log` VALUES ('244', '1', '删除自营【12】', '127.0.0.1', '1509768501');
INSERT INTO `tp_admin_log` VALUES ('245', '1', '审核金属矿《24》', '127.0.0.1', '1509769330');
INSERT INTO `tp_admin_log` VALUES ('246', '1', '审核非金属矿《23》', '127.0.0.1', '1509769337');
INSERT INTO `tp_admin_log` VALUES ('247', '1', '审核附属产品《7》', '127.0.0.1', '1509769341');
INSERT INTO `tp_admin_log` VALUES ('248', '1', '审核附属产品《27》', '127.0.0.1', '1509769934');
INSERT INTO `tp_admin_log` VALUES ('249', '1', '审核金属矿《22,21》', '127.0.0.1', '1509769943');
INSERT INTO `tp_admin_log` VALUES ('250', '1', '审核非金属矿《28》', '127.0.0.1', '1509770003');
INSERT INTO `tp_admin_log` VALUES ('251', '1', '审核非金属矿《33》', '127.0.0.1', '1509782722');
INSERT INTO `tp_admin_log` VALUES ('252', '1', '审核附属产品《35,34》', '127.0.0.1', '1509783582');
INSERT INTO `tp_admin_log` VALUES ('253', '1', '添加自营【0】', '127.0.0.1', '1509783651');
INSERT INTO `tp_admin_log` VALUES ('254', '1', '添加自营【0】', '127.0.0.1', '1509783680');
INSERT INTO `tp_admin_log` VALUES ('255', '1', '分配模块按钮【304】', '127.0.0.1', '1509785074');
INSERT INTO `tp_admin_log` VALUES ('256', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1509785083');
INSERT INTO `tp_admin_log` VALUES ('257', '1', '修改自营【37】', '127.0.0.1', '1509785751');
INSERT INTO `tp_admin_log` VALUES ('258', '1', '删除自营【37】', '127.0.0.1', '1509785826');
INSERT INTO `tp_admin_log` VALUES ('259', '1', '删除自营【26】', '127.0.0.1', '1509785945');
INSERT INTO `tp_admin_log` VALUES ('260', '1', '删除自营【25】', '127.0.0.1', '1509786599');
INSERT INTO `tp_admin_log` VALUES ('261', '1', '修改文章【16】', '127.0.0.1', '1510025551');
INSERT INTO `tp_admin_log` VALUES ('262', '1', '添加文章【21】', '127.0.0.1', '1510026508');
INSERT INTO `tp_admin_log` VALUES ('263', '1', '修改文章【21】', '127.0.0.1', '1510026625');
INSERT INTO `tp_admin_log` VALUES ('264', '1', '修改文章【21】', '127.0.0.1', '1510026636');
INSERT INTO `tp_admin_log` VALUES ('265', '1', '修改文章【21】', '127.0.0.1', '1510026790');
INSERT INTO `tp_admin_log` VALUES ('266', '1', '修改文章【21】', '127.0.0.1', '1510026864');
INSERT INTO `tp_admin_log` VALUES ('267', '1', '修改文章【21】', '127.0.0.1', '1510026896');
INSERT INTO `tp_admin_log` VALUES ('268', '1', '添加自营【0】', '127.0.0.1', '1510042876');
INSERT INTO `tp_admin_log` VALUES ('269', '1', '添加自营【0】', '127.0.0.1', '1510043315');
INSERT INTO `tp_admin_log` VALUES ('270', '1', '添加自营【0】', '127.0.0.1', '1510127096');
INSERT INTO `tp_admin_log` VALUES ('271', '1', '添加自营【0】', '127.0.0.1', '1510127124');
INSERT INTO `tp_admin_log` VALUES ('272', '1', '添加自营【0】', '127.0.0.1', '1510127376');
INSERT INTO `tp_admin_log` VALUES ('273', '1', '为角色【1】分配模块权限', '127.0.0.1', '1510130187');
INSERT INTO `tp_admin_log` VALUES ('274', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1510130203');
INSERT INTO `tp_admin_log` VALUES ('275', '1', '删除留言【21,22】', '127.0.0.1', '1510130993');
INSERT INTO `tp_admin_log` VALUES ('276', '1', '添加自营【0】', '127.0.0.1', '1510132566');
INSERT INTO `tp_admin_log` VALUES ('277', '1', '修改自营【44】', '127.0.0.1', '1510132639');
INSERT INTO `tp_admin_log` VALUES ('278', '1', '修改自营【44】', '127.0.0.1', '1510133062');
INSERT INTO `tp_admin_log` VALUES ('279', '1', '修改自营【44】', '127.0.0.1', '1510133109');
INSERT INTO `tp_admin_log` VALUES ('280', '1', '修改自营【44】', '127.0.0.1', '1510133298');
INSERT INTO `tp_admin_log` VALUES ('281', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1510133372');
INSERT INTO `tp_admin_log` VALUES ('282', '1', '修改自营【45】', '127.0.0.1', '1510133942');
INSERT INTO `tp_admin_log` VALUES ('283', '1', '修改自营【47】', '127.0.0.1', '1510134291');
INSERT INTO `tp_admin_log` VALUES ('284', '1', '修改发布信息【48】', '127.0.0.1', '1510134852');
INSERT INTO `tp_admin_log` VALUES ('285', '1', '修改发布信息【48】', '127.0.0.1', '1510134871');
INSERT INTO `tp_admin_log` VALUES ('286', '1', '修改自营【49】', '127.0.0.1', '1510135412');
INSERT INTO `tp_admin_log` VALUES ('287', '1', '修改发布信息【50】', '127.0.0.1', '1510136775');
INSERT INTO `tp_admin_log` VALUES ('288', '1', '修改发布信息【50】', '127.0.0.1', '1510136805');
INSERT INTO `tp_admin_log` VALUES ('289', '1', '屏蔽金属矿《32,29》', '127.0.0.1', '1510190619');
INSERT INTO `tp_admin_log` VALUES ('290', '1', '屏蔽《46》', '127.0.0.1', '1510190944');
INSERT INTO `tp_admin_log` VALUES ('291', '1', '审核《51》', '127.0.0.1', '1510190988');
INSERT INTO `tp_admin_log` VALUES ('292', '1', '屏蔽《31》', '127.0.0.1', '1510190996');
INSERT INTO `tp_admin_log` VALUES ('293', '1', '屏蔽《51》', '127.0.0.1', '1510191496');
INSERT INTO `tp_admin_log` VALUES ('294', '1', '审核《52》', '127.0.0.1', '1510195549');
INSERT INTO `tp_admin_log` VALUES ('295', '1', '屏蔽《52》', '127.0.0.1', '1510195582');
INSERT INTO `tp_admin_log` VALUES ('296', '1', '屏蔽《52》', '127.0.0.1', '1510197523');
INSERT INTO `tp_admin_log` VALUES ('297', '1', '屏蔽《52》', '127.0.0.1', '1510197657');
INSERT INTO `tp_admin_log` VALUES ('298', '1', '屏蔽《52》', '127.0.0.1', '1510197811');
INSERT INTO `tp_admin_log` VALUES ('299', '1', '屏蔽《52》', '127.0.0.1', '1510198557');
INSERT INTO `tp_admin_log` VALUES ('300', '1', '屏蔽《52》', '127.0.0.1', '1510198699');
INSERT INTO `tp_admin_log` VALUES ('301', '1', '屏蔽《52》', '127.0.0.1', '1510199009');
INSERT INTO `tp_admin_log` VALUES ('302', '1', '屏蔽《52》', '127.0.0.1', '1510199121');
INSERT INTO `tp_admin_log` VALUES ('303', '1', '屏蔽《52》', '127.0.0.1', '1510199181');
INSERT INTO `tp_admin_log` VALUES ('304', '1', '屏蔽《52》', '127.0.0.1', '1510199269');
INSERT INTO `tp_admin_log` VALUES ('305', '1', '屏蔽《52》', '127.0.0.1', '1510199309');
INSERT INTO `tp_admin_log` VALUES ('306', '1', '屏蔽《52》', '127.0.0.1', '1510199503');
INSERT INTO `tp_admin_log` VALUES ('307', '1', '屏蔽《52》', '127.0.0.1', '1510199544');
INSERT INTO `tp_admin_log` VALUES ('308', '1', '屏蔽《52》', '127.0.0.1', '1510199593');
INSERT INTO `tp_admin_log` VALUES ('309', '1', '屏蔽《52》', '127.0.0.1', '1510199648');
INSERT INTO `tp_admin_log` VALUES ('310', '1', '屏蔽《52》', '127.0.0.1', '1510199700');
INSERT INTO `tp_admin_log` VALUES ('311', '1', '屏蔽《52》', '127.0.0.1', '1510199873');
INSERT INTO `tp_admin_log` VALUES ('312', '1', '屏蔽《52》', '127.0.0.1', '1510200748');
INSERT INTO `tp_admin_log` VALUES ('313', '1', '修改配置信息', '127.0.0.1', '1510202488');
INSERT INTO `tp_admin_log` VALUES ('314', '1', '修改配置信息', '127.0.0.1', '1510202560');
INSERT INTO `tp_admin_log` VALUES ('315', '1', '成功备份表【tp_admin,tp_admin_act_log,tp_admin_login_log,tp_admin_role,tp_adv,tp_adv_type,tp_art,tp_art_photo,tp_art_type,tp_button,tp_collect,tp_comdata,tp_config,tp_employ,tp_links,tp_message,tp_metal,tp_metal_img,tp_metal_typ', '127.0.0.1', '1510277866');
INSERT INTO `tp_admin_log` VALUES ('316', '1', '为角色【1】分配模块权限', '127.0.0.1', '1510277883');
INSERT INTO `tp_admin_log` VALUES ('317', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1510277902');
INSERT INTO `tp_admin_log` VALUES ('318', '1', '成功修复表【tp_admin,tp_admin_act_log,tp_admin_login_log,tp_admin_role,tp_adv,tp_adv_type,tp_art,tp_art_photo,tp_art_type,tp_button,tp_collect,tp_comdata,tp_config,tp_employ,tp_links,tp_message,tp_metal,tp_metal_img,tp_metal_typ', '127.0.0.1', '1510285604');
INSERT INTO `tp_admin_log` VALUES ('319', '1', '成功备份表【tp_admin,tp_admin_act_log,tp_admin_login_log,tp_admin_role,tp_adv,tp_adv_type,tp_art,tp_art_photo,tp_art_type,tp_button,tp_collect,tp_comdata,tp_config,tp_employ,tp_links,tp_message,tp_metal,tp_metal_img,tp_metal_type,tp_module,tp_mysupport,tp_order,tp_product,tp_product_img,tp_project,tp_project_type,tp_publish_type,tp_region,tp_temple,tp_temple_type,tp_trade,tp_user】', '127.0.0.1', '1510285939');
INSERT INTO `tp_admin_log` VALUES ('320', '1', '成功修复表【tp_admin,tp_admin_act_log,tp_admin_login_log,tp_admin_role,tp_adv,tp_adv_type,tp_art,tp_art_photo,tp_art_type,tp_button,tp_collect,tp_comdata,tp_config,tp_employ,tp_links,tp_message,tp_metal,tp_metal_img,tp_metal_type,tp_module,tp_mysupport,tp_order,tp_product,tp_product_img,tp_project,tp_project_type,tp_publish_type,tp_region,tp_temple,tp_temple_type,tp_trade,tp_user】', '127.0.0.1', '1510285945');
INSERT INTO `tp_admin_log` VALUES ('321', '1', '屏蔽《48》', '127.0.0.1', '1510286095');
INSERT INTO `tp_admin_log` VALUES ('322', '1', '审核发布信息《48》', '127.0.0.1', '1510286291');
INSERT INTO `tp_admin_log` VALUES ('323', '1', '成功备份表【tp_admin,tp_admin_act_log,tp_admin_login_log,tp_admin_role,tp_adv,tp_adv_type,tp_art,tp_art_photo,tp_art_type,tp_button,tp_collect,tp_comdata,tp_config,tp_employ,tp_links,tp_message,tp_metal,tp_metal_img,tp_metal_type,tp_module,tp_mysupport,tp_order,tp_product,tp_product_img,tp_project,tp_project_type,tp_publish_type,tp_region,tp_temple,tp_temple_type,tp_trade,tp_user】', '127.0.0.1', '1510286382');
INSERT INTO `tp_admin_log` VALUES ('324', '1', '备份打包【2017-11-10-11-59-21911be】', '127.0.0.1', '1510286453');
INSERT INTO `tp_admin_log` VALUES ('325', '1', '删除备份文件【2017-10-30-14-55-02a49d2,2017-10-30-15-06-d772463,2017-10-30-16-00-c05f14b,2017-10-31-10-08-29e62e9,2017-10-31-10-09-65fd25b,2017-11-10-09-37-d8c60ea,2017-11-10-11-52-102f8f6】', '127.0.0.1', '1510286473');
INSERT INTO `tp_admin_log` VALUES ('326', '1', '成功备份表【tp_admin】', '127.0.0.1', '1510288964');
INSERT INTO `tp_admin_log` VALUES ('327', '1', '成功备份表【tp_adv】', '127.0.0.1', '1510288978');
INSERT INTO `tp_admin_log` VALUES ('328', '1', '成功备份表【tp_adv】', '127.0.0.1', '1510289138');
INSERT INTO `tp_admin_log` VALUES ('329', '1', '删除备份文件【2017-11-10-11-59-21911be,2017-11-10-12-28-66862aa,2017-11-10-12-30-8e6661f,2017-11-10-12-32-f4f8c57,2017-11-10-12-34-5b1d372,2017-11-10-12-34-604da26,2017-11-10-12-34-deb4877,2017-11-10-12-35-6dc9f5c,2017-11-10-12-35-c7f28e7,2017-11-10-12-36-e668843,2017-11-10-12-37-82ee60a,2017-11-10-12-41-234adbf】', '127.0.0.1', '1510292262');
INSERT INTO `tp_admin_log` VALUES ('330', '1', '备份打包【2017-11-10-12-45-25b6439】', '127.0.0.1', '1510294946');
INSERT INTO `tp_admin_log` VALUES ('331', '1', '添加广告【10】', '127.0.0.1', '1510295025');
INSERT INTO `tp_admin_log` VALUES ('332', '1', '成功备份表【tp_adv】', '127.0.0.1', '1510295042');
INSERT INTO `tp_admin_log` VALUES ('333', '1', '删除广告【6,5】', '127.0.0.1', '1510295190');
INSERT INTO `tp_admin_log` VALUES ('334', '1', '还原备份文件【2017-11-10-14-24-ec7aed8】', '127.0.0.1', '1510297769');
INSERT INTO `tp_admin_log` VALUES ('335', '1', '还原备份文件【2017-11-10-14-24-ec7aed8】', '127.0.0.1', '1510297778');
INSERT INTO `tp_admin_log` VALUES ('336', '1', '还原备份文件【2017-11-10-14-24-ec7aed8】', '127.0.0.1', '1510298962');
INSERT INTO `tp_admin_log` VALUES ('337', '1', '成功备份表【tp_adv_type】', '127.0.0.1', '1510298993');
INSERT INTO `tp_admin_log` VALUES ('338', '1', '删除广告位【2】', '127.0.0.1', '1510299003');
INSERT INTO `tp_admin_log` VALUES ('339', '1', '删除广告位【3】', '127.0.0.1', '1510299007');
INSERT INTO `tp_admin_log` VALUES ('340', '1', '还原备份文件【2017-11-10-15-29-75897e4】', '127.0.0.1', '1510299035');
INSERT INTO `tp_admin_log` VALUES ('341', '1', '添加文章【22】', '127.0.0.1', '1510366661');
INSERT INTO `tp_admin_log` VALUES ('342', '1', '添加文章分类【8】', '127.0.0.1', '1510374473');
INSERT INTO `tp_admin_log` VALUES ('343', '1', '添加文章分类【9】', '127.0.0.1', '1510374486');
INSERT INTO `tp_admin_log` VALUES ('344', '1', '删除文章分类【8】', '127.0.0.1', '1510374492');
INSERT INTO `tp_admin_log` VALUES ('345', '1', '删除文章分类【9】', '127.0.0.1', '1510374495');
INSERT INTO `tp_admin_log` VALUES ('346', '1', '删除模块【325】', '127.0.0.1', '1511765837');
INSERT INTO `tp_admin_log` VALUES ('347', '1', '删除模块【303】', '127.0.0.1', '1511765844');
INSERT INTO `tp_admin_log` VALUES ('348', '1', '删除模块【309】', '127.0.0.1', '1511765853');
INSERT INTO `tp_admin_log` VALUES ('349', '1', '修改配置信息', '127.0.0.1', '1511767754');
INSERT INTO `tp_admin_log` VALUES ('350', '1', '添加模块【331】', '127.0.0.1', '1511767827');
INSERT INTO `tp_admin_log` VALUES ('351', '1', '添加模块【332】', '127.0.0.1', '1511767869');
INSERT INTO `tp_admin_log` VALUES ('352', '1', '添加模块【333】', '127.0.0.1', '1511768005');
INSERT INTO `tp_admin_log` VALUES ('353', '1', '添加模块【334】', '127.0.0.1', '1511768362');
INSERT INTO `tp_admin_log` VALUES ('354', '1', '分配模块按钮【334】', '127.0.0.1', '1511768368');
INSERT INTO `tp_admin_log` VALUES ('355', '1', '添加模块【335】', '127.0.0.1', '1511768454');
INSERT INTO `tp_admin_log` VALUES ('356', '1', '分配模块按钮【335】', '127.0.0.1', '1511768461');
INSERT INTO `tp_admin_log` VALUES ('357', '1', '为角色【1】分配模块权限', '127.0.0.1', '1511768478');
INSERT INTO `tp_admin_log` VALUES ('358', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1511768488');
INSERT INTO `tp_admin_log` VALUES ('359', '1', '添加文章分类【10】', '127.0.0.1', '1511769478');
INSERT INTO `tp_admin_log` VALUES ('360', '1', '添加文章分类【11】', '127.0.0.1', '1511769489');
INSERT INTO `tp_admin_log` VALUES ('361', '1', '添加文章分类【12】', '127.0.0.1', '1511769501');
INSERT INTO `tp_admin_log` VALUES ('362', '1', '删除文章分类【12】', '127.0.0.1', '1511769510');
INSERT INTO `tp_admin_log` VALUES ('363', '1', '删除文章分类【10】', '127.0.0.1', '1511769514');
INSERT INTO `tp_admin_log` VALUES ('364', '1', '添加文章分类【13】', '127.0.0.1', '1511769523');
INSERT INTO `tp_admin_log` VALUES ('365', '1', '修改文章分类【13】', '127.0.0.1', '1511769532');
INSERT INTO `tp_admin_log` VALUES ('366', '1', '添加文章分类【1】', '127.0.0.1', '1511769629');
INSERT INTO `tp_admin_log` VALUES ('367', '1', '添加文章分类【2】', '127.0.0.1', '1511769641');
INSERT INTO `tp_admin_log` VALUES ('368', '1', '添加文章分类【3】', '127.0.0.1', '1511769650');
INSERT INTO `tp_admin_log` VALUES ('369', '1', '添加文章分类【4】', '127.0.0.1', '1511769661');
INSERT INTO `tp_admin_log` VALUES ('370', '1', '添加文章分类【5】', '127.0.0.1', '1511769668');
INSERT INTO `tp_admin_log` VALUES ('371', '1', '添加文章分类【6】', '127.0.0.1', '1511769677');
INSERT INTO `tp_admin_log` VALUES ('372', '1', '添加文章分类【7】', '127.0.0.1', '1511769685');
INSERT INTO `tp_admin_log` VALUES ('373', '1', '添加文章分类【8】', '127.0.0.1', '1511769695');
INSERT INTO `tp_admin_log` VALUES ('374', '1', '添加文章分类【9】', '127.0.0.1', '1511769705');
INSERT INTO `tp_admin_log` VALUES ('375', '1', '添加文章分类【10】', '127.0.0.1', '1511769713');
INSERT INTO `tp_admin_log` VALUES ('376', '1', '添加文章分类【11】', '127.0.0.1', '1511769721');
INSERT INTO `tp_admin_log` VALUES ('377', '1', '添加文章分类【12】', '127.0.0.1', '1511769729');
INSERT INTO `tp_admin_log` VALUES ('378', '1', '添加文章分类【13】', '127.0.0.1', '1511769737');
INSERT INTO `tp_admin_log` VALUES ('379', '1', '添加文章分类【14】', '127.0.0.1', '1511769763');
INSERT INTO `tp_admin_log` VALUES ('380', '1', '添加文章分类【15】', '127.0.0.1', '1511769779');
INSERT INTO `tp_admin_log` VALUES ('381', '1', '添加文章分类【16】', '127.0.0.1', '1511769788');
INSERT INTO `tp_admin_log` VALUES ('382', '1', '添加文章分类【17】', '127.0.0.1', '1511769801');
INSERT INTO `tp_admin_log` VALUES ('383', '1', '添加文章分类【18】', '127.0.0.1', '1511769815');
INSERT INTO `tp_admin_log` VALUES ('384', '1', '添加文章分类【19】', '127.0.0.1', '1511769828');
INSERT INTO `tp_admin_log` VALUES ('385', '1', '添加文章分类【20】', '127.0.0.1', '1511769840');
INSERT INTO `tp_admin_log` VALUES ('386', '1', '添加文章分类【21】', '127.0.0.1', '1511769854');
INSERT INTO `tp_admin_log` VALUES ('387', '1', '添加文章分类【22】', '127.0.0.1', '1511769877');
INSERT INTO `tp_admin_log` VALUES ('388', '1', '添加文章分类【23】', '127.0.0.1', '1511769888');
INSERT INTO `tp_admin_log` VALUES ('389', '1', '添加文章分类【24】', '127.0.0.1', '1511769897');
INSERT INTO `tp_admin_log` VALUES ('390', '1', '添加文章分类【25】', '127.0.0.1', '1511769909');
INSERT INTO `tp_admin_log` VALUES ('391', '1', '修改文章分类【1】', '127.0.0.1', '1511771191');
INSERT INTO `tp_admin_log` VALUES ('392', '1', '修改文章分类【2】', '127.0.0.1', '1511771199');
INSERT INTO `tp_admin_log` VALUES ('393', '1', '修改文章分类【4】', '127.0.0.1', '1511771210');
INSERT INTO `tp_admin_log` VALUES ('394', '1', '修改文章分类【3】', '127.0.0.1', '1511771275');
INSERT INTO `tp_admin_log` VALUES ('395', '1', '删除文章分类【3】', '127.0.0.1', '1511771279');
INSERT INTO `tp_admin_log` VALUES ('396', '1', '删除文章分类【4】', '127.0.0.1', '1511771282');
INSERT INTO `tp_admin_log` VALUES ('397', '1', '删除文章分类【1】', '127.0.0.1', '1511771286');
INSERT INTO `tp_admin_log` VALUES ('398', '1', '添加文章分类【21】', '127.0.0.1', '1511780928');
INSERT INTO `tp_admin_log` VALUES ('399', '1', '添加文章分类【1094】', '127.0.0.1', '1511838450');
INSERT INTO `tp_admin_log` VALUES ('400', '1', '修改文章分类【1094】', '127.0.0.1', '1511838498');
INSERT INTO `tp_admin_log` VALUES ('401', '1', '添加文章分类【1095】', '127.0.0.1', '1511838524');
INSERT INTO `tp_admin_log` VALUES ('402', '1', '添加文章分类【1096】', '127.0.0.1', '1511838544');
INSERT INTO `tp_admin_log` VALUES ('403', '1', '添加文章分类【1097】', '127.0.0.1', '1511838563');
INSERT INTO `tp_admin_log` VALUES ('404', '1', '添加文章分类【1098】', '127.0.0.1', '1511838582');
INSERT INTO `tp_admin_log` VALUES ('405', '1', '添加文章分类【1099】', '127.0.0.1', '1511838636');
INSERT INTO `tp_admin_log` VALUES ('406', '1', '添加文章分类【1100】', '127.0.0.1', '1511838667');
INSERT INTO `tp_admin_log` VALUES ('407', '1', '添加文章分类【1101】', '127.0.0.1', '1511838685');
INSERT INTO `tp_admin_log` VALUES ('408', '1', '添加文章分类【1102】', '127.0.0.1', '1511838715');
INSERT INTO `tp_admin_log` VALUES ('409', '1', '添加文章分类【1103】', '127.0.0.1', '1511838734');
INSERT INTO `tp_admin_log` VALUES ('410', '1', '添加文章分类【1104】', '127.0.0.1', '1511838757');
INSERT INTO `tp_admin_log` VALUES ('411', '1', '添加文章分类【1105】', '127.0.0.1', '1511838775');
INSERT INTO `tp_admin_log` VALUES ('412', '1', '添加文章分类【1106】', '127.0.0.1', '1511838799');
INSERT INTO `tp_admin_log` VALUES ('413', '1', '修改广告【7】', '127.0.0.1', '1512455050');
INSERT INTO `tp_admin_log` VALUES ('414', '1', '修改广告【8】', '127.0.0.1', '1512455068');
INSERT INTO `tp_admin_log` VALUES ('415', '1', '修改广告【9】', '127.0.0.1', '1512455163');
INSERT INTO `tp_admin_log` VALUES ('416', '1', '修改广告【8】', '127.0.0.1', '1512455230');
INSERT INTO `tp_admin_log` VALUES ('417', '1', '修改广告位【2】', '127.0.0.1', '1512455312');
INSERT INTO `tp_admin_log` VALUES ('418', '1', '修改广告【6】', '127.0.0.1', '1512455326');
INSERT INTO `tp_admin_log` VALUES ('419', '1', '修改广告【5】', '127.0.0.1', '1512455338');
INSERT INTO `tp_admin_log` VALUES ('420', '1', '修改广告【10】', '127.0.0.1', '1512455351');
INSERT INTO `tp_admin_log` VALUES ('421', '1', '修改广告【10】', '127.0.0.1', '1512455475');
INSERT INTO `tp_admin_log` VALUES ('422', '1', '修改广告【10】', '127.0.0.1', '1512455513');
INSERT INTO `tp_admin_log` VALUES ('423', '1', '修改配置信息', '127.0.0.1', '1512456516');
INSERT INTO `tp_admin_log` VALUES ('424', '1', '修改配置信息', '127.0.0.1', '1512456702');
INSERT INTO `tp_admin_log` VALUES ('425', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1513044483');
INSERT INTO `tp_admin_log` VALUES ('426', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1513057631');
INSERT INTO `tp_admin_log` VALUES ('427', '1', '添加模块【336】', '127.0.0.1', '1513057686');
INSERT INTO `tp_admin_log` VALUES ('428', '1', '为角色【1】分配模块权限', '127.0.0.1', '1513057699');
INSERT INTO `tp_admin_log` VALUES ('429', '1', '添加模块【337】', '127.0.0.1', '1513153840');
INSERT INTO `tp_admin_log` VALUES ('430', '1', '添加模块【338】', '127.0.0.1', '1513153880');
INSERT INTO `tp_admin_log` VALUES ('431', '1', '分配模块按钮【338】', '127.0.0.1', '1513153914');
INSERT INTO `tp_admin_log` VALUES ('432', '1', '添加模块【339】', '127.0.0.1', '1513153941');
INSERT INTO `tp_admin_log` VALUES ('433', '1', '为角色【1】分配模块权限', '127.0.0.1', '1513153959');
INSERT INTO `tp_admin_log` VALUES ('434', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1513153966');
INSERT INTO `tp_admin_log` VALUES ('435', '1', '审核代理申请《1》', '127.0.0.1', '1513222018');
INSERT INTO `tp_admin_log` VALUES ('436', '1', '审核代理申请《1》', '127.0.0.1', '1513222949');
INSERT INTO `tp_admin_log` VALUES ('437', '1', '添加模块【340】', '127.0.0.1', '1513223248');
INSERT INTO `tp_admin_log` VALUES ('438', '1', '添加模块【341】', '127.0.0.1', '1513223266');
INSERT INTO `tp_admin_log` VALUES ('439', '1', '添加模块【342】', '127.0.0.1', '1513223287');
INSERT INTO `tp_admin_log` VALUES ('440', '1', '分配模块按钮【342】', '127.0.0.1', '1513223310');
INSERT INTO `tp_admin_log` VALUES ('441', '1', '添加模块【343】', '127.0.0.1', '1513223325');
INSERT INTO `tp_admin_log` VALUES ('442', '1', '添加模块【344】', '127.0.0.1', '1513223341');
INSERT INTO `tp_admin_log` VALUES ('443', '1', '分配模块按钮【344】', '127.0.0.1', '1513223350');
INSERT INTO `tp_admin_log` VALUES ('444', '1', '分配模块按钮【344】', '127.0.0.1', '1513223355');
INSERT INTO `tp_admin_log` VALUES ('445', '1', '为角色【1】分配模块权限', '127.0.0.1', '1513223368');
INSERT INTO `tp_admin_log` VALUES ('446', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1513223378');
INSERT INTO `tp_admin_log` VALUES ('447', '1', '添加套餐【1】', '127.0.0.1', '1513245173');
INSERT INTO `tp_admin_log` VALUES ('448', '1', '添加套餐【2】', '127.0.0.1', '1513245179');
INSERT INTO `tp_admin_log` VALUES ('449', '1', '添加套餐【3】', '127.0.0.1', '1513245231');
INSERT INTO `tp_admin_log` VALUES ('450', '1', '修改套餐【3】', '127.0.0.1', '1513245665');
INSERT INTO `tp_admin_log` VALUES ('451', '1', '修改套餐【3】', '127.0.0.1', '1513245679');
INSERT INTO `tp_admin_log` VALUES ('452', '1', '修改套餐【3】', '127.0.0.1', '1513245685');
INSERT INTO `tp_admin_log` VALUES ('453', '1', '删除套餐【2】', '127.0.0.1', '1513245749');
INSERT INTO `tp_admin_log` VALUES ('454', '1', '审核代理申请《2》', '127.0.0.1', '1513322162');
INSERT INTO `tp_admin_log` VALUES ('455', '1', '审核企业信息《4》', '127.0.0.1', '1513577762');
INSERT INTO `tp_admin_log` VALUES ('456', '1', '屏蔽企业信息《2》', '127.0.0.1', '1513577768');
INSERT INTO `tp_admin_log` VALUES ('457', '1', '审核企业信息《1》', '127.0.0.1', '1513579412');
INSERT INTO `tp_admin_log` VALUES ('458', '1', '屏蔽企业信息《1》', '127.0.0.1', '1513579432');
INSERT INTO `tp_admin_log` VALUES ('459', '1', '屏蔽企业信息《1》', '127.0.0.1', '1513579895');
INSERT INTO `tp_admin_log` VALUES ('460', '1', '审核企业信息《1》', '127.0.0.1', '1513580725');
INSERT INTO `tp_admin_log` VALUES ('461', '1', '屏蔽企业信息《2》', '127.0.0.1', '1513584563');
INSERT INTO `tp_admin_log` VALUES ('462', '1', '屏蔽企业信息《2》', '127.0.0.1', '1513588526');
INSERT INTO `tp_admin_log` VALUES ('463', '1', '屏蔽企业信息《2》', '127.0.0.1', '1513589472');
INSERT INTO `tp_admin_log` VALUES ('464', '1', '屏蔽企业信息《2》', '127.0.0.1', '1513590756');
INSERT INTO `tp_admin_log` VALUES ('465', '1', '审核企业信息《2》', '127.0.0.1', '1513590806');
INSERT INTO `tp_admin_log` VALUES ('466', '1', '屏蔽企业信息《4》', '127.0.0.1', '1513593219');
INSERT INTO `tp_admin_log` VALUES ('467', '1', '屏蔽企业信息《1》', '127.0.0.1', '1513658381');
INSERT INTO `tp_admin_log` VALUES ('468', '1', '屏蔽企业信息《1》', '127.0.0.1', '1513658549');
INSERT INTO `tp_admin_log` VALUES ('469', '1', '审核企业信息《1》', '127.0.0.1', '1513658582');
INSERT INTO `tp_admin_log` VALUES ('470', '1', '审核企业信息《1》', '127.0.0.1', '1513658615');
INSERT INTO `tp_admin_log` VALUES ('471', '1', '修改文章分类【1】', '127.0.0.1', '1513678963');
INSERT INTO `tp_admin_log` VALUES ('472', '1', '修改文章分类【2】', '127.0.0.1', '1513678975');
INSERT INTO `tp_admin_log` VALUES ('473', '1', '修改文章分类【3】', '127.0.0.1', '1513678986');
INSERT INTO `tp_admin_log` VALUES ('474', '1', '修改文章分类【4】', '127.0.0.1', '1513679000');
INSERT INTO `tp_admin_log` VALUES ('475', '1', '删除文章分类【5】', '127.0.0.1', '1513679006');
INSERT INTO `tp_admin_log` VALUES ('476', '1', '添加模块【345】', '127.0.0.1', '1513682118');
INSERT INTO `tp_admin_log` VALUES ('477', '1', '为角色【1】分配模块权限', '127.0.0.1', '1513682123');
INSERT INTO `tp_admin_log` VALUES ('478', '1', '修改配置信息', '127.0.0.1', '1513682317');
INSERT INTO `tp_admin_log` VALUES ('479', '1', '屏蔽企业信息《2》', '127.0.0.1', '1513763725');
INSERT INTO `tp_admin_log` VALUES ('480', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1513839505');
INSERT INTO `tp_admin_log` VALUES ('481', '1', '修改套餐【3】', '127.0.0.1', '1513854308');
INSERT INTO `tp_admin_log` VALUES ('482', '1', '修改套餐【1】', '127.0.0.1', '1513854329');
INSERT INTO `tp_admin_log` VALUES ('483', '1', '添加套餐【4】', '127.0.0.1', '1513854352');
INSERT INTO `tp_admin_log` VALUES ('484', '1', '修改套餐【4】', '127.0.0.1', '1513854479');
INSERT INTO `tp_admin_log` VALUES ('485', '1', '添加套餐【5】', '127.0.0.1', '1513854543');
INSERT INTO `tp_admin_log` VALUES ('486', '1', '添加套餐【6】', '127.0.0.1', '1513997935');
INSERT INTO `tp_admin_log` VALUES ('487', '1', '审核企业信息《2》', '127.0.0.1', '1514170004');
INSERT INTO `tp_admin_log` VALUES ('488', '1', '添加文章【23】', '127.0.0.1', '1514201243');
INSERT INTO `tp_admin_log` VALUES ('489', '1', '屏蔽企业信息《2》', '127.0.0.1', '1514433232');
INSERT INTO `tp_admin_log` VALUES ('490', '1', '屏蔽企业信息《1》', '127.0.0.1', '1514873829');
INSERT INTO `tp_admin_log` VALUES ('491', '1', '屏蔽企业信息《1》', '127.0.0.1', '1514875722');
INSERT INTO `tp_admin_log` VALUES ('492', '1', '审核企业信息《1》', '127.0.0.1', '1514875776');
INSERT INTO `tp_admin_log` VALUES ('493', '1', '审核企业信息《2》', '127.0.0.1', '1515050634');
INSERT INTO `tp_admin_log` VALUES ('494', '1', '修改套餐【1】', '127.0.0.1', '1515402666');
INSERT INTO `tp_admin_log` VALUES ('495', '1', '修改文章分类【1】', '127.0.0.1', '1516188820');
INSERT INTO `tp_admin_log` VALUES ('496', '1', '修改文章分类【2】', '127.0.0.1', '1516188843');
INSERT INTO `tp_admin_log` VALUES ('497', '1', '修改文章分类【3】', '127.0.0.1', '1516188854');
INSERT INTO `tp_admin_log` VALUES ('498', '1', '修改文章分类【4】', '127.0.0.1', '1516188966');
INSERT INTO `tp_admin_log` VALUES ('499', '1', '添加文章分类【5】', '127.0.0.1', '1516188990');
INSERT INTO `tp_admin_log` VALUES ('500', '1', '添加文章分类【6】', '127.0.0.1', '1516188999');
INSERT INTO `tp_admin_log` VALUES ('501', '1', '添加文章分类【7】', '127.0.0.1', '1516189005');
INSERT INTO `tp_admin_log` VALUES ('502', '1', '修改文章【22】', '127.0.0.1', '1516327434');
INSERT INTO `tp_admin_log` VALUES ('503', '1', '修改文章【20】', '127.0.0.1', '1516327449');
INSERT INTO `tp_admin_log` VALUES ('504', '1', '修改文章【17】', '127.0.0.1', '1516327458');
INSERT INTO `tp_admin_log` VALUES ('505', '1', '修改文章【15】', '127.0.0.1', '1516327471');
INSERT INTO `tp_admin_log` VALUES ('506', '1', '修改文章【14】', '127.0.0.1', '1516327485');
INSERT INTO `tp_admin_log` VALUES ('507', '1', '修改文章【11】', '127.0.0.1', '1516331961');
INSERT INTO `tp_admin_log` VALUES ('508', '1', '修改文章【16】', '127.0.0.1', '1516331984');
INSERT INTO `tp_admin_log` VALUES ('509', '1', '修改配置信息', '127.0.0.1', '1516353211');
INSERT INTO `tp_admin_log` VALUES ('510', '1', '修改配置信息', '127.0.0.1', '1516353592');
INSERT INTO `tp_admin_log` VALUES ('511', '1', '添加模块【346】', '127.0.0.1', '1516609279');
INSERT INTO `tp_admin_log` VALUES ('512', '1', '分配模块按钮【346】', '127.0.0.1', '1516609301');
INSERT INTO `tp_admin_log` VALUES ('513', '1', '添加模块【347】', '127.0.0.1', '1516609408');
INSERT INTO `tp_admin_log` VALUES ('514', '1', '分配模块按钮【347】', '127.0.0.1', '1516609419');
INSERT INTO `tp_admin_log` VALUES ('515', '1', '添加模块【348】', '127.0.0.1', '1516609444');
INSERT INTO `tp_admin_log` VALUES ('516', '1', '添加模块【349】', '127.0.0.1', '1516609465');
INSERT INTO `tp_admin_log` VALUES ('517', '1', '分配模块按钮【349】', '127.0.0.1', '1516609478');
INSERT INTO `tp_admin_log` VALUES ('518', '1', '为角色【1】分配模块权限', '127.0.0.1', '1516609487');
INSERT INTO `tp_admin_log` VALUES ('519', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1516609500');
INSERT INTO `tp_admin_log` VALUES ('520', '1', '修改模块【349】', '127.0.0.1', '1516677325');
INSERT INTO `tp_admin_log` VALUES ('521', '1', '分配模块按钮【349】', '127.0.0.1', '1516677336');
INSERT INTO `tp_admin_log` VALUES ('522', '1', '分配模块按钮【349】', '127.0.0.1', '1516678357');
INSERT INTO `tp_admin_log` VALUES ('523', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1516678367');
INSERT INTO `tp_admin_log` VALUES ('524', '1', '分配模块按钮【349】', '127.0.0.1', '1516678378');
INSERT INTO `tp_admin_log` VALUES ('525', '1', '添加模块【350】', '127.0.0.1', '1516678841');
INSERT INTO `tp_admin_log` VALUES ('526', '1', '分配模块按钮【350】', '127.0.0.1', '1516678853');
INSERT INTO `tp_admin_log` VALUES ('527', '1', '为角色【1】分配模块权限', '127.0.0.1', '1516678863');
INSERT INTO `tp_admin_log` VALUES ('528', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1516678884');
INSERT INTO `tp_admin_log` VALUES ('529', '1', '添加模块【351】', '127.0.0.1', '1516679956');
INSERT INTO `tp_admin_log` VALUES ('530', '1', '为角色【1】分配模块权限', '127.0.0.1', '1516679971');
INSERT INTO `tp_admin_log` VALUES ('531', '1', '审核代理人【用户15805541213】提现记录《5》', '127.0.0.1', '1516693502');
INSERT INTO `tp_admin_log` VALUES ('532', '1', '审核代理人【用户15805541213】提现记录《4》', '127.0.0.1', '1516693547');
INSERT INTO `tp_admin_log` VALUES ('533', '1', '屏蔽代理人【用户15805541213】提现记录《3》', '127.0.0.1', '1516693584');
INSERT INTO `tp_admin_log` VALUES ('534', '1', '屏蔽代理人【用户15805541213】提现记录《2》', '127.0.0.1', '1516693650');
INSERT INTO `tp_admin_log` VALUES ('535', '1', '屏蔽代理人【用户15805541213】提现记录《1》', '127.0.0.1', '1516693704');
INSERT INTO `tp_admin_log` VALUES ('536', '1', '屏蔽代理人【用户15805541213】提现记录《6》', '127.0.0.1', '1516694621');
INSERT INTO `tp_admin_log` VALUES ('537', '1', '屏蔽代理申请《3》', '127.0.0.1', '1516861616');
INSERT INTO `tp_admin_log` VALUES ('538', '1', '屏蔽代理申请《3》', '127.0.0.1', '1516862229');
INSERT INTO `tp_admin_log` VALUES ('539', '1', '屏蔽代理申请《3》', '127.0.0.1', '1516862351');
INSERT INTO `tp_admin_log` VALUES ('540', '1', '屏蔽代理申请《3》', '127.0.0.1', '1516862429');
INSERT INTO `tp_admin_log` VALUES ('541', '1', '屏蔽代理申请《4》', '127.0.0.1', '1516866022');
INSERT INTO `tp_admin_log` VALUES ('542', '1', '审核代理申请《5》', '127.0.0.1', '1516866049');
INSERT INTO `tp_admin_log` VALUES ('543', '1', '添加模块【352】', '127.0.0.1', '1517886400');
INSERT INTO `tp_admin_log` VALUES ('544', '1', '分配模块按钮【352】', '127.0.0.1', '1517886410');
INSERT INTO `tp_admin_log` VALUES ('545', '1', '为角色【1】分配模块权限', '127.0.0.1', '1517886420');
INSERT INTO `tp_admin_log` VALUES ('546', '1', '为角色【1】分配模块权限', '127.0.0.1', '1517886426');
INSERT INTO `tp_admin_log` VALUES ('547', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1517886436');
INSERT INTO `tp_admin_log` VALUES ('548', '1', '添加福利【1】', '127.0.0.1', '1517886912');
INSERT INTO `tp_admin_log` VALUES ('549', '1', '添加福利【2】', '127.0.0.1', '1517886969');
INSERT INTO `tp_admin_log` VALUES ('550', '1', '添加福利【3】', '127.0.0.1', '1517886981');
INSERT INTO `tp_admin_log` VALUES ('551', '1', '修改福利【2】', '127.0.0.1', '1517886988');
INSERT INTO `tp_admin_log` VALUES ('552', '1', '修改福利【1】', '127.0.0.1', '1517886999');
INSERT INTO `tp_admin_log` VALUES ('553', '1', '删除福利【2,3】', '127.0.0.1', '1517887007');
INSERT INTO `tp_admin_log` VALUES ('554', '1', '添加福利【4】', '127.0.0.1', '1517887021');
INSERT INTO `tp_admin_log` VALUES ('555', '1', '添加福利【5】', '127.0.0.1', '1517887028');
INSERT INTO `tp_admin_log` VALUES ('556', '1', '添加福利【6】', '127.0.0.1', '1517887036');
INSERT INTO `tp_admin_log` VALUES ('557', '1', '添加福利【7】', '127.0.0.1', '1517887044');
INSERT INTO `tp_admin_log` VALUES ('558', '1', '添加福利【8】', '127.0.0.1', '1517887052');
INSERT INTO `tp_admin_log` VALUES ('559', '1', '添加福利【9】', '127.0.0.1', '1517887061');
INSERT INTO `tp_admin_log` VALUES ('560', '1', '添加福利【10】', '127.0.0.1', '1517887074');
INSERT INTO `tp_admin_log` VALUES ('561', '1', '添加福利【11】', '127.0.0.1', '1517887082');
INSERT INTO `tp_admin_log` VALUES ('562', '1', '添加福利【12】', '127.0.0.1', '1517887089');
INSERT INTO `tp_admin_log` VALUES ('563', '1', '添加按钮【120】', '127.0.0.1', '1517893806');
INSERT INTO `tp_admin_log` VALUES ('564', '1', '分配模块按钮【342】', '127.0.0.1', '1517893820');
INSERT INTO `tp_admin_log` VALUES ('565', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1517893834');
INSERT INTO `tp_admin_log` VALUES ('566', '1', '添加套餐【1】', '127.0.0.1', '1519874354');
INSERT INTO `tp_admin_log` VALUES ('567', '1', '添加套餐【2】', '127.0.0.1', '1519876721');
INSERT INTO `tp_admin_log` VALUES ('568', '1', '添加套餐【3】', '127.0.0.1', '1519876812');
INSERT INTO `tp_admin_log` VALUES ('569', '1', '添加套餐【4】', '127.0.0.1', '1519876834');
INSERT INTO `tp_admin_log` VALUES ('570', '1', '添加套餐【5】', '127.0.0.1', '1519876870');
INSERT INTO `tp_admin_log` VALUES ('571', '1', '修改套餐【1】', '127.0.0.1', '1519876956');
INSERT INTO `tp_admin_log` VALUES ('572', '1', '修改套餐【5】', '127.0.0.1', '1519876995');
INSERT INTO `tp_admin_log` VALUES ('573', '1', '修改套餐【4】', '127.0.0.1', '1519877001');
INSERT INTO `tp_admin_log` VALUES ('574', '1', '修改套餐【3】', '127.0.0.1', '1519877005');
INSERT INTO `tp_admin_log` VALUES ('575', '1', '修改套餐【2】', '127.0.0.1', '1519877011');
INSERT INTO `tp_admin_log` VALUES ('576', '1', '修改套餐【1】', '127.0.0.1', '1519877016');
INSERT INTO `tp_admin_log` VALUES ('577', '1', '添加套餐【6】', '127.0.0.1', '1519877052');
INSERT INTO `tp_admin_log` VALUES ('578', '1', '添加套餐【7】', '127.0.0.1', '1519877085');
INSERT INTO `tp_admin_log` VALUES ('579', '1', '添加套餐【8】', '127.0.0.1', '1519877115');
INSERT INTO `tp_admin_log` VALUES ('580', '1', '添加套餐【9】', '127.0.0.1', '1519877139');
INSERT INTO `tp_admin_log` VALUES ('581', '1', '添加套餐【10】', '127.0.0.1', '1519877160');
INSERT INTO `tp_admin_log` VALUES ('582', '1', '添加套餐【11】', '127.0.0.1', '1519877267');
INSERT INTO `tp_admin_log` VALUES ('583', '1', '添加套餐【12】', '127.0.0.1', '1519877285');
INSERT INTO `tp_admin_log` VALUES ('584', '1', '添加套餐【13】', '127.0.0.1', '1519877300');
INSERT INTO `tp_admin_log` VALUES ('585', '1', '添加套餐【14】', '127.0.0.1', '1519877314');
INSERT INTO `tp_admin_log` VALUES ('586', '1', '添加套餐【15】', '127.0.0.1', '1519877327');
INSERT INTO `tp_admin_log` VALUES ('587', '1', '添加套餐【16】', '127.0.0.1', '1519877350');
INSERT INTO `tp_admin_log` VALUES ('588', '1', '修改套餐【16】', '127.0.0.1', '1519877359');
INSERT INTO `tp_admin_log` VALUES ('589', '1', '修改套餐【15】', '127.0.0.1', '1519877370');
INSERT INTO `tp_admin_log` VALUES ('590', '1', '修改套餐【14】', '127.0.0.1', '1519877379');
INSERT INTO `tp_admin_log` VALUES ('591', '1', '修改套餐【13】', '127.0.0.1', '1519877386');
INSERT INTO `tp_admin_log` VALUES ('592', '1', '修改套餐【12】', '127.0.0.1', '1519877395');
INSERT INTO `tp_admin_log` VALUES ('593', '1', '修改套餐【11】', '127.0.0.1', '1519877403');
INSERT INTO `tp_admin_log` VALUES ('594', '1', '添加套餐【17】', '127.0.0.1', '1519877460');
INSERT INTO `tp_admin_log` VALUES ('595', '1', '添加套餐【18】', '127.0.0.1', '1519877523');
INSERT INTO `tp_admin_log` VALUES ('596', '1', '添加套餐【19】', '127.0.0.1', '1519877550');
INSERT INTO `tp_admin_log` VALUES ('597', '1', '修改套餐【19】', '127.0.0.1', '1519877565');
INSERT INTO `tp_admin_log` VALUES ('598', '1', '添加套餐【20】', '127.0.0.1', '1519877605');
INSERT INTO `tp_admin_log` VALUES ('599', '1', '添加套餐【21】', '127.0.0.1', '1519877640');
INSERT INTO `tp_admin_log` VALUES ('600', '1', '修改套餐【19】', '127.0.0.1', '1519877651');
INSERT INTO `tp_admin_log` VALUES ('601', '1', '修改套餐【18】', '127.0.0.1', '1519877661');
INSERT INTO `tp_admin_log` VALUES ('602', '1', '修改套餐【21】', '127.0.0.1', '1519877693');
INSERT INTO `tp_admin_log` VALUES ('603', '1', '添加套餐【22】', '127.0.0.1', '1519877717');
INSERT INTO `tp_admin_log` VALUES ('604', '1', '修改套餐【22】', '127.0.0.1', '1519877757');
INSERT INTO `tp_admin_log` VALUES ('605', '1', '修改套餐【21】', '127.0.0.1', '1519877770');
INSERT INTO `tp_admin_log` VALUES ('606', '1', '修改套餐【19】', '127.0.0.1', '1519877782');
INSERT INTO `tp_admin_log` VALUES ('607', '1', '修改套餐【18】', '127.0.0.1', '1519877796');
INSERT INTO `tp_admin_log` VALUES ('608', '1', '修改套餐【22】', '127.0.0.1', '1519877829');
INSERT INTO `tp_admin_log` VALUES ('609', '1', '添加模块【353】', '127.0.0.1', '1520069280');
INSERT INTO `tp_admin_log` VALUES ('610', '1', '为角色【1】分配模块权限', '127.0.0.1', '1520069296');
INSERT INTO `tp_admin_log` VALUES ('611', '1', '添加角色【6】-【测试】', '127.0.0.1', '1520228226');
INSERT INTO `tp_admin_log` VALUES ('612', '1', '添加管理员【4】-【test123】', '127.0.0.1', '1520228243');
INSERT INTO `tp_admin_log` VALUES ('613', '1', '成功修复表【tp_admin_act_log】', '127.0.0.1', '1520246030');
INSERT INTO `tp_admin_log` VALUES ('614', '1', '成功备份表【tp_admin,tp_admin_act_log,tp_admin_login_log,tp_admin_role,tp_adv,tp_adv_type,tp_advs,tp_agent_account,tp_agent_apply,tp_apply_post,tp_art,tp_art_photo,tp_art_type,tp_button,tp_cash,tp_collect_post,tp_com_login_log,tp_com_money_log,tp_comdata,tp_company,tp_company_goods,tp_company_goodss,tp_company_img,tp_company_post,tp_company_resume,tp_config,tp_document,tp_employ,tp_fp,tp_goods,tp_goodss,tp_industry,tp_interview,tp_join,tp_links,tp_message,tp_metal,tp_metal_img,tp_metal_type,tp_module,tp_mysupport,tp_order,tp_point_log,tp_post,tp_product,tp_product_img,tp_project,tp_project_type,tp_publish_type,tp_recharge,tp_recommend_log,tp_region,tp_regions,tp_salary,tp_sendmsg_log,tp_sys_log,tp_temple,tp_temple_type,tp_trade,tp_user,tp_user_agent_money,tp_user_education,tp_user_expect,tp_user_info,tp_user_login_log,tp_user_workprocess,tp_welfare】', '127.0.0.1', '1520323883');
INSERT INTO `tp_admin_log` VALUES ('615', '1', '备份打包【2018-03-06-16-11-9b1783e】', '127.0.0.1', '1520323908');
INSERT INTO `tp_admin_log` VALUES ('616', '1', '成功备份表【tp_admin,tp_admin_act_log,tp_admin_login_log,tp_admin_role,tp_adv,tp_adv_type,tp_advs,tp_agent_account,tp_agent_apply,tp_apply_post,tp_art,tp_art_photo,tp_art_type,tp_button,tp_cash,tp_collect_post,tp_com_login_log,tp_com_money_log,tp_comdata,tp_company,tp_company_goods,tp_company_goodss,tp_company_img,tp_company_post,tp_company_resume,tp_config,tp_document,tp_employ,tp_fp,tp_goods,tp_goodss,tp_industry,tp_interview,tp_join,tp_links,tp_message,tp_metal,tp_metal_img,tp_metal_type,tp_module,tp_mysupport,tp_order,tp_point_log,tp_post,tp_product,tp_product_img,tp_project,tp_project_type,tp_publish_type,tp_recharge,tp_recommend_log,tp_region,tp_regions,tp_salary,tp_sendmsg_log,tp_sys_log,tp_temple,tp_temple_type,tp_trade,tp_user,tp_user_agent_money,tp_user_education,tp_user_expect,tp_user_info,tp_user_login_log,tp_user_workprocess,tp_welfare】', '127.0.0.1', '1520327034');
INSERT INTO `tp_admin_log` VALUES ('617', '1', '成功备份表【tp_admin】', '127.0.0.1', '1520327168');
INSERT INTO `tp_admin_log` VALUES ('618', '1', '删除备份文件【2018-03-06-17-03-f1dbea7】', '127.0.0.1', '1520327310');
INSERT INTO `tp_admin_log` VALUES ('619', '1', '备份打包【2018-03-06-17-06-7d3d53a】', '127.0.0.1', '1520327317');
INSERT INTO `tp_admin_log` VALUES ('620', '1', '备份打包【2018-03-06-16-11-9b1783e,2018-03-06-17-06-7d3d53a】', '127.0.0.1', '1520327497');
INSERT INTO `tp_admin_log` VALUES ('621', '1', '成功备份表【tp_adv】', '127.0.0.1', '1520327564');
INSERT INTO `tp_admin_log` VALUES ('622', '1', '成功修复表【tp_admin,tp_admin_act_log,tp_admin_login_log,tp_admin_role,tp_adv,tp_adv_type,tp_advs,tp_agent_account,tp_agent_apply,tp_apply_post,tp_art,tp_art_photo,tp_art_type,tp_button,tp_cash,tp_collect_post,tp_com_login_log,tp_com_money_log,tp_comdata,tp_company,tp_company_goods,tp_company_goodss,tp_company_img,tp_company_post,tp_company_resume,tp_config,tp_document,tp_employ,tp_fp,tp_goods,tp_goodss,tp_industry,tp_interview,tp_join,tp_links,tp_message,tp_metal,tp_metal_img,tp_metal_type,tp_module,tp_mysupport,tp_order,tp_point_log,tp_post,tp_product,tp_product_img,tp_project,tp_project_type,tp_publish_type,tp_recharge,tp_recommend_log,tp_region,tp_regions,tp_salary,tp_sendmsg_log,tp_sys_log,tp_temple,tp_temple_type,tp_trade,tp_user,tp_user_agent_money,tp_user_education,tp_user_expect,tp_user_info,tp_user_login_log,tp_user_workprocess,tp_welfare】', '127.0.0.1', '1520327612');
INSERT INTO `tp_admin_log` VALUES ('623', '1', '成功备份表【tp_advs】', '127.0.0.1', '1520327622');
INSERT INTO `tp_admin_log` VALUES ('624', '1', '还原备份文件【2018-03-06-17-13-76e5258】', '127.0.0.1', '1520327639');
INSERT INTO `tp_admin_log` VALUES ('625', '1', '还原备份文件【2018-03-06-17-13-76e5258】', '127.0.0.1', '1520332331');
INSERT INTO `tp_admin_log` VALUES ('626', '1', '修改文章分类【1】', '127.0.0.1', '1520393144');
INSERT INTO `tp_admin_log` VALUES ('627', '1', '删除文章分类【4】', '127.0.0.1', '1520393463');
INSERT INTO `tp_admin_log` VALUES ('628', '1', '删除文章分类【7】', '127.0.0.1', '1520393467');
INSERT INTO `tp_admin_log` VALUES ('629', '1', '修改文章分类【1】', '127.0.0.1', '1520393478');
INSERT INTO `tp_admin_log` VALUES ('630', '1', '修改文章分类【2】', '127.0.0.1', '1520393492');
INSERT INTO `tp_admin_log` VALUES ('631', '1', '修改文章分类【3】', '127.0.0.1', '1520393500');
INSERT INTO `tp_admin_log` VALUES ('632', '1', '添加文章分类【4】', '127.0.0.1', '1520393549');
INSERT INTO `tp_admin_log` VALUES ('633', '1', '审核企业信息《6》', '127.0.0.1', '1520406744');
INSERT INTO `tp_admin_log` VALUES ('634', '1', '分配模块按钮【353】', '127.0.0.1', '1520407493');
INSERT INTO `tp_admin_log` VALUES ('635', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1520407506');
INSERT INTO `tp_admin_log` VALUES ('636', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1520408793');
INSERT INTO `tp_admin_log` VALUES ('637', '1', '分配模块按钮【353】', '127.0.0.1', '1520408800');
INSERT INTO `tp_admin_log` VALUES ('638', '1', '审核发票信息《2,1》', '127.0.0.1', '1520410382');
INSERT INTO `tp_admin_log` VALUES ('639', '1', '屏蔽发票信息《2》', '127.0.0.1', '1520411340');
INSERT INTO `tp_admin_log` VALUES ('640', '1', '屏蔽发票信息《1》', '127.0.0.1', '1520411368');
INSERT INTO `tp_admin_log` VALUES ('641', '1', '审核发票信息《2》', '127.0.0.1', '1520411388');
INSERT INTO `tp_admin_log` VALUES ('642', '1', '审核发票信息《1》', '127.0.0.1', '1520411393');
INSERT INTO `tp_admin_log` VALUES ('643', '1', '审核发票信息《2,1》', '127.0.0.1', '1520412377');
INSERT INTO `tp_admin_log` VALUES ('644', '1', '审核发票信息《2,1》', '127.0.0.1', '1520412407');
INSERT INTO `tp_admin_log` VALUES ('645', '1', '审核发票信息《2,1》', '127.0.0.1', '1520412687');
INSERT INTO `tp_admin_log` VALUES ('646', '1', '屏蔽发票信息《2》', '127.0.0.1', '1520412723');
INSERT INTO `tp_admin_log` VALUES ('647', '1', '屏蔽发票信息《2》', '127.0.0.1', '1520412772');
INSERT INTO `tp_admin_log` VALUES ('648', '1', '屏蔽发票信息《1》', '127.0.0.1', '1520412883');
INSERT INTO `tp_admin_log` VALUES ('649', '1', '审核发票信息《2》', '127.0.0.1', '1520413042');
INSERT INTO `tp_admin_log` VALUES ('650', '1', '屏蔽代理申请《9》', '127.0.0.1', '1520561423');
INSERT INTO `tp_admin_log` VALUES ('651', '1', '屏蔽代理申请《9》', '127.0.0.1', '1520561586');
INSERT INTO `tp_admin_log` VALUES ('652', '1', '屏蔽代理申请《9》', '127.0.0.1', '1520562064');
INSERT INTO `tp_admin_log` VALUES ('653', '1', '屏蔽代理申请《9》', '127.0.0.1', '1520562184');
INSERT INTO `tp_admin_log` VALUES ('654', '1', '屏蔽代理申请《9》', '127.0.0.1', '1520562210');
INSERT INTO `tp_admin_log` VALUES ('655', '1', '屏蔽代理申请《9》', '127.0.0.1', '1520562333');
INSERT INTO `tp_admin_log` VALUES ('656', '1', '审核代理申请《9》', '127.0.0.1', '1520562366');
INSERT INTO `tp_admin_log` VALUES ('657', '1', '还原备份文件【2018-03-06-17-13-76e5258】', '127.0.0.1', '1520563486');
INSERT INTO `tp_admin_log` VALUES ('658', '1', '删除备份文件【2018-03-06-16-11-9b1783e,2018-03-06-17-06-7d3d53a,2018-03-06-17-12-656a61f,2018-03-06-17-13-76e5258】', '127.0.0.1', '1520563575');
INSERT INTO `tp_admin_log` VALUES ('659', '1', '成功备份表【tp_admin,tp_admin_act_log,tp_admin_login_log,tp_admin_role,tp_adv,tp_adv_type,tp_advs,tp_agent_account,tp_agent_apply,tp_apply_post,tp_art,tp_art_photo,tp_art_type,tp_button,tp_cash,tp_collect_post,tp_com_login_log,tp_com_money_log,tp_comdata,tp_company,tp_company_goods,tp_company_goodss,tp_company_img,tp_company_post,tp_company_resume,tp_config,tp_document,tp_employ,tp_fp,tp_goods,tp_goodss,tp_industry,tp_interview,tp_join,tp_links,tp_message,tp_metal,tp_metal_img,tp_metal_type,tp_module,tp_mysupport,tp_order,tp_point_log,tp_post,tp_product,tp_product_img,tp_project,tp_project_type,tp_publish_type,tp_recharge,tp_recommend_log,tp_region,tp_regions,tp_salary,tp_sendmsg_log,tp_sys_log,tp_temple,tp_temple_type,tp_trade,tp_user,tp_user_agent_money,tp_user_education,tp_user_expect,tp_user_info,tp_user_login_log,tp_user_workprocess,tp_welfare】', '127.0.0.1', '1520563801');
INSERT INTO `tp_admin_log` VALUES ('660', '1', '备份打包【2018-03-09-10-50-2a5f8a4】', '127.0.0.1', '1520563805');
INSERT INTO `tp_admin_log` VALUES ('661', '1', '删除数据库压缩包【】', '127.0.0.1', '1520566621');
INSERT INTO `tp_admin_log` VALUES ('662', '1', '删除数据库压缩包【】', '127.0.0.1', '1520566647');
INSERT INTO `tp_admin_log` VALUES ('663', '1', '删除数据库压缩包【2018-03-06-17-11-4bebf8.zip,2018-03-09-10-50-10fa1a.zip】', '127.0.0.1', '1520566700');
INSERT INTO `tp_admin_log` VALUES ('664', '1', '删除数据库压缩包【2018-03-06-17-11-4bebf8.zip,2018-03-09-10-50-10fa1a.zip】', '127.0.0.1', '1520566817');
INSERT INTO `tp_admin_log` VALUES ('665', '1', '删除数据库压缩包【2018-03-06-17-11-4bebf8.zip,2018-03-09-10-50-10fa1a.zip】', '127.0.0.1', '1520566822');
INSERT INTO `tp_admin_log` VALUES ('666', '1', '删除数据库压缩包【2018-03-06-17-11-4bebf8.zip,2018-03-09-10-50-10fa1a.zip】', '127.0.0.1', '1520566850');
INSERT INTO `tp_admin_log` VALUES ('667', '1', '备份打包【2018-03-09-10-50-2a5f8a4】', '127.0.0.1', '1520566880');
INSERT INTO `tp_admin_log` VALUES ('668', '1', '备份打包【2018-03-09-10-50-2a5f8a4】', '127.0.0.1', '1520566886');
INSERT INTO `tp_admin_log` VALUES ('669', '1', '成功备份表【tp_admin】', '127.0.0.1', '1520566894');
INSERT INTO `tp_admin_log` VALUES ('670', '1', '备份打包【2018-03-09-10-50-2a5f8a4,2018-03-09-11-41-6eb4350】', '127.0.0.1', '1520566898');
INSERT INTO `tp_admin_log` VALUES ('671', '1', '删除数据库压缩包【2018-03-09-11-41-596c77.zip,2018-03-09-11-41-bfd336.zip,2018-03-09-11-41-cc3c46.zip】', '127.0.0.1', '1520566906');
INSERT INTO `tp_admin_log` VALUES ('672', '1', '备份打包【2018-03-09-10-50-2a5f8a4,2018-03-09-11-41-6eb4350】', '127.0.0.1', '1520566910');
INSERT INTO `tp_admin_log` VALUES ('673', '1', '备份打包【2018-03-09-10-50-2a5f8a4】', '127.0.0.1', '1520566934');
INSERT INTO `tp_admin_log` VALUES ('674', '1', '屏蔽企业信息《5》', '127.0.0.1', '1520936125');
INSERT INTO `tp_admin_log` VALUES ('675', '1', '审核企业信息《5》', '127.0.0.1', '1520936224');
INSERT INTO `tp_admin_log` VALUES ('676', '1', '添加模块【354】', '127.0.0.1', '1521193802');
INSERT INTO `tp_admin_log` VALUES ('677', '1', '分配模块按钮【354】', '127.0.0.1', '1521193835');
INSERT INTO `tp_admin_log` VALUES ('678', '1', '为角色【1】分配模块权限', '127.0.0.1', '1521193851');
INSERT INTO `tp_admin_log` VALUES ('679', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1521193860');
INSERT INTO `tp_admin_log` VALUES ('680', '1', '添加按钮【121】', '127.0.0.1', '1521195626');
INSERT INTO `tp_admin_log` VALUES ('681', '1', '分配模块按钮【354】', '127.0.0.1', '1521195645');
INSERT INTO `tp_admin_log` VALUES ('682', '1', '分配模块按钮【342】', '127.0.0.1', '1521195655');
INSERT INTO `tp_admin_log` VALUES ('683', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1521195673');
INSERT INTO `tp_admin_log` VALUES ('684', '1', '修改按钮【120】', '127.0.0.1', '1521195788');
INSERT INTO `tp_admin_log` VALUES ('685', '1', '修改按钮【121】', '127.0.0.1', '1521195797');
INSERT INTO `tp_admin_log` VALUES ('686', '1', '添加文章【24】', '127.0.0.1', '1521254660');
INSERT INTO `tp_admin_log` VALUES ('687', '1', '添加模块【383】', '127.0.0.1', '1521690460');
INSERT INTO `tp_admin_log` VALUES ('688', '1', '添加模块【384】', '127.0.0.1', '1521690635');
INSERT INTO `tp_admin_log` VALUES ('689', '1', '添加模块【385】', '127.0.0.1', '1521690686');
INSERT INTO `tp_admin_log` VALUES ('690', '1', '添加模块【386】', '127.0.0.1', '1521697300');
INSERT INTO `tp_admin_log` VALUES ('691', '1', '添加模块【387】', '127.0.0.1', '1521697316');
INSERT INTO `tp_admin_log` VALUES ('692', '1', '添加模块【388】', '127.0.0.1', '1521697350');
INSERT INTO `tp_admin_log` VALUES ('693', '1', '添加模块【389】', '127.0.0.1', '1521697488');
INSERT INTO `tp_admin_log` VALUES ('694', '1', '添加模块【390】', '127.0.0.1', '1521698011');
INSERT INTO `tp_admin_log` VALUES ('695', '1', '添加模块【391】', '127.0.0.1', '1521698026');
INSERT INTO `tp_admin_log` VALUES ('696', '1', '添加模块【392】', '127.0.0.1', '1521698099');
INSERT INTO `tp_admin_log` VALUES ('697', '1', '添加模块【394】', '127.0.0.1', '1521698367');
INSERT INTO `tp_admin_log` VALUES ('698', '1', '添加模块【395】', '127.0.0.1', '1521698410');
INSERT INTO `tp_admin_log` VALUES ('699', '1', '添加模块【396】', '127.0.0.1', '1521698878');
INSERT INTO `tp_admin_log` VALUES ('700', '1', '添加模块【397】', '127.0.0.1', '1521698892');
INSERT INTO `tp_admin_log` VALUES ('701', '1', '添加模块【398】', '127.0.0.1', '1521698912');
INSERT INTO `tp_admin_log` VALUES ('702', '1', '添加模块【399】', '127.0.0.1', '1521698932');
INSERT INTO `tp_admin_log` VALUES ('703', '1', '添加模块【400】', '127.0.0.1', '1521698954');
INSERT INTO `tp_admin_log` VALUES ('704', '1', '修改模块【399】', '127.0.0.1', '1521701386');
INSERT INTO `tp_admin_log` VALUES ('705', '1', '修改模块【399】', '127.0.0.1', '1521701529');
INSERT INTO `tp_admin_log` VALUES ('706', '1', '修改模块【399】', '127.0.0.1', '1521702981');
INSERT INTO `tp_admin_log` VALUES ('707', '1', '修改模块【400】', '127.0.0.1', '1521703013');
INSERT INTO `tp_admin_log` VALUES ('708', '1', '添加模块【401】', '127.0.0.1', '1521703200');
INSERT INTO `tp_admin_log` VALUES ('709', '1', '添加模块【402】', '127.0.0.1', '1521703212');
INSERT INTO `tp_admin_log` VALUES ('710', '1', '修改模块【397】', '127.0.0.1', '1521703227');
INSERT INTO `tp_admin_log` VALUES ('711', '1', '修改模块【401】', '127.0.0.1', '1521703569');
INSERT INTO `tp_admin_log` VALUES ('712', '1', '修改模块【402】', '127.0.0.1', '1521703586');
INSERT INTO `tp_admin_log` VALUES ('713', '1', '修改模块【401】', '127.0.0.1', '1521703729');
INSERT INTO `tp_admin_log` VALUES ('714', '1', '修改模块【401】', '127.0.0.1', '1521703749');
INSERT INTO `tp_admin_log` VALUES ('715', '1', '添加模块【403】', '127.0.0.1', '1521705108');
INSERT INTO `tp_admin_log` VALUES ('716', '1', '添加模块【404】', '127.0.0.1', '1521705135');
INSERT INTO `tp_admin_log` VALUES ('717', '1', '修改模块【403】', '127.0.0.1', '1521705210');
INSERT INTO `tp_admin_log` VALUES ('718', '1', '修改模块【403】', '127.0.0.1', '1521705757');
INSERT INTO `tp_admin_log` VALUES ('719', '1', '修改模块【403】', '127.0.0.1', '1521706064');
INSERT INTO `tp_admin_log` VALUES ('720', '1', '修改模块【403】', '127.0.0.1', '1521706086');
INSERT INTO `tp_admin_log` VALUES ('721', '1', '修改模块【403】', '127.0.0.1', '1521706125');
INSERT INTO `tp_admin_log` VALUES ('722', '1', '修改模块【403】', '127.0.0.1', '1521706152');
INSERT INTO `tp_admin_log` VALUES ('723', '1', '修改模块【403】', '127.0.0.1', '1521706194');
INSERT INTO `tp_admin_log` VALUES ('724', '1', '修改模块【403】', '127.0.0.1', '1521706429');
INSERT INTO `tp_admin_log` VALUES ('725', '1', '修改模块【403】', '127.0.0.1', '1521707124');
INSERT INTO `tp_admin_log` VALUES ('726', '1', '修改模块【403】', '127.0.0.1', '1521707507');
INSERT INTO `tp_admin_log` VALUES ('727', '1', '修改模块【403】', '127.0.0.1', '1521707650');
INSERT INTO `tp_admin_log` VALUES ('728', '1', '修改模块【403】', '127.0.0.1', '1521707757');
INSERT INTO `tp_admin_log` VALUES ('729', '1', '修改模块【404】', '127.0.0.1', '1521707772');
INSERT INTO `tp_admin_log` VALUES ('730', '1', '修改模块【403】', '127.0.0.1', '1521707790');
INSERT INTO `tp_admin_log` VALUES ('731', '1', '修改模块【404】', '127.0.0.1', '1521707920');
INSERT INTO `tp_admin_log` VALUES ('732', '1', '修改模块【403】', '127.0.0.1', '1521707952');
INSERT INTO `tp_admin_log` VALUES ('733', '1', '修改模块【403】', '127.0.0.1', '1521708426');
INSERT INTO `tp_admin_log` VALUES ('734', '1', '修改模块【403】', '127.0.0.1', '1521708490');
INSERT INTO `tp_admin_log` VALUES ('735', '1', '修改模块【403】', '127.0.0.1', '1521709104');
INSERT INTO `tp_admin_log` VALUES ('736', '1', '修改模块【403】', '127.0.0.1', '1521709474');
INSERT INTO `tp_admin_log` VALUES ('737', '1', '修改模块【401】', '127.0.0.1', '1521709490');
INSERT INTO `tp_admin_log` VALUES ('738', '1', '修改模块【401】', '127.0.0.1', '1521709505');
INSERT INTO `tp_admin_log` VALUES ('739', '1', '修改模块【401】', '127.0.0.1', '1521709522');
INSERT INTO `tp_admin_log` VALUES ('740', '1', '修改模块【403】', '127.0.0.1', '1521709536');
INSERT INTO `tp_admin_log` VALUES ('741', '1', '修改模块【401】', '127.0.0.1', '1521709559');
INSERT INTO `tp_admin_log` VALUES ('742', '1', '修改模块【403】', '127.0.0.1', '1521709575');
INSERT INTO `tp_admin_log` VALUES ('743', '1', '修改模块【401】', '127.0.0.1', '1521709588');
INSERT INTO `tp_admin_log` VALUES ('744', '1', '删除模块【404】', '127.0.0.1', '1521710773');
INSERT INTO `tp_admin_log` VALUES ('745', '1', '删除模块【404】', '127.0.0.1', '1521710812');
INSERT INTO `tp_admin_log` VALUES ('746', '1', '删除模块【403】', '127.0.0.1', '1521710838');
INSERT INTO `tp_admin_log` VALUES ('747', '1', '删除模块【402】', '127.0.0.1', '1521710868');
INSERT INTO `tp_admin_log` VALUES ('748', '1', '删除模块【397】', '127.0.0.1', '1521710890');
INSERT INTO `tp_admin_log` VALUES ('749', '1', '删除模块【398】', '127.0.0.1', '1521710913');
INSERT INTO `tp_admin_log` VALUES ('750', '1', '分配模块按钮【291】', '127.0.0.1', '1521712979');
INSERT INTO `tp_admin_log` VALUES ('751', '1', '分配模块按钮【291】', '127.0.0.1', '1521712996');
INSERT INTO `tp_admin_log` VALUES ('752', '1', '分配模块按钮【291】', '127.0.0.1', '1521713062');
INSERT INTO `tp_admin_log` VALUES ('753', '1', '分配模块按钮【291】', '127.0.0.1', '1521713194');
INSERT INTO `tp_admin_log` VALUES ('754', '1', '分配模块按钮【291】', '127.0.0.1', '1521713216');
INSERT INTO `tp_admin_log` VALUES ('755', '1', '分配模块按钮【291】', '127.0.0.1', '1521713551');
INSERT INTO `tp_admin_log` VALUES ('756', '1', '分配模块按钮【291】', '127.0.0.1', '1521713566');
INSERT INTO `tp_admin_log` VALUES ('757', '1', '分配模块按钮【291】', '127.0.0.1', '1521713612');
INSERT INTO `tp_admin_log` VALUES ('758', '1', '分配模块按钮【291】', '127.0.0.1', '1521713691');
INSERT INTO `tp_admin_log` VALUES ('759', '1', '分配模块按钮【291】', '127.0.0.1', '1521713712');
INSERT INTO `tp_admin_log` VALUES ('760', '1', '分配模块按钮【291】', '127.0.0.1', '1521713854');
INSERT INTO `tp_admin_log` VALUES ('761', '1', '分配模块按钮【291】', '127.0.0.1', '1521713864');
INSERT INTO `tp_admin_log` VALUES ('762', '1', '分配模块按钮【291】', '127.0.0.1', '1521713873');
INSERT INTO `tp_admin_log` VALUES ('763', '1', '分配模块按钮【291】', '127.0.0.1', '1521713949');
INSERT INTO `tp_admin_log` VALUES ('764', '1', '分配模块按钮【291】', '127.0.0.1', '1521713979');
INSERT INTO `tp_admin_log` VALUES ('765', '1', '分配模块按钮【291】', '127.0.0.1', '1521714097');
INSERT INTO `tp_admin_log` VALUES ('766', '1', '分配模块按钮【291】', '127.0.0.1', '1521714112');
INSERT INTO `tp_admin_log` VALUES ('767', '1', '分配模块按钮【345】', '127.0.0.1', '1521714123');
INSERT INTO `tp_admin_log` VALUES ('768', '1', '分配模块按钮【401】', '127.0.0.1', '1521765885');
INSERT INTO `tp_admin_log` VALUES ('769', '1', '删除模块【401】', '127.0.0.1', '1521767755');
INSERT INTO `tp_admin_log` VALUES ('770', '1', '删除模块【396】', '127.0.0.1', '1521767764');
INSERT INTO `tp_admin_log` VALUES ('771', '1', '添加模块【422】', '127.0.0.1', '1521768141');
INSERT INTO `tp_admin_log` VALUES ('772', '1', '添加模块【423】', '127.0.0.1', '1521768188');
INSERT INTO `tp_admin_log` VALUES ('773', '1', '添加模块【424】', '127.0.0.1', '1521768233');
INSERT INTO `tp_admin_log` VALUES ('774', '1', '修改模块【423】', '127.0.0.1', '1521768247');
INSERT INTO `tp_admin_log` VALUES ('775', '1', '删除模块【423】', '127.0.0.1', '1521768255');
INSERT INTO `tp_admin_log` VALUES ('776', '1', '删除模块【422】', '127.0.0.1', '1521768262');
INSERT INTO `tp_admin_log` VALUES ('777', '1', '添加按钮【122】', '127.0.0.1', '1521768633');
INSERT INTO `tp_admin_log` VALUES ('778', '1', '添加按钮【123】', '127.0.0.1', '1521768760');
INSERT INTO `tp_admin_log` VALUES ('779', '1', '添加按钮【124】', '127.0.0.1', '1521768960');
INSERT INTO `tp_admin_log` VALUES ('780', '1', '添加按钮【125】', '127.0.0.1', '1521768999');
INSERT INTO `tp_admin_log` VALUES ('781', '1', '添加按钮【126】', '127.0.0.1', '1521769008');
INSERT INTO `tp_admin_log` VALUES ('782', '1', '添加模块【425】', '127.0.0.1', '1521769016');
INSERT INTO `tp_admin_log` VALUES ('783', '1', '删除模块【425】', '127.0.0.1', '1521769026');
INSERT INTO `tp_admin_log` VALUES ('784', '1', '修改按钮【85】', '127.0.0.1', '1521770621');
INSERT INTO `tp_admin_log` VALUES ('785', '1', '修改按钮【85】', '127.0.0.1', '1521770630');
INSERT INTO `tp_admin_log` VALUES ('786', '1', '修改按钮【86】', '127.0.0.1', '1521770935');
INSERT INTO `tp_admin_log` VALUES ('787', '1', '修改按钮【87】', '127.0.0.1', '1521770949');
INSERT INTO `tp_admin_log` VALUES ('788', '1', '修改按钮【88】', '127.0.0.1', '1521770972');
INSERT INTO `tp_admin_log` VALUES ('789', '1', '修改按钮【89】', '127.0.0.1', '1521770988');
INSERT INTO `tp_admin_log` VALUES ('790', '1', '修改按钮【90】', '127.0.0.1', '1521771067');
INSERT INTO `tp_admin_log` VALUES ('791', '1', '修改按钮【88】', '127.0.0.1', '1521771078');
INSERT INTO `tp_admin_log` VALUES ('792', '1', '修改按钮【85】', '127.0.0.1', '1521771677');
INSERT INTO `tp_admin_log` VALUES ('793', '1', '修改按钮【86】', '127.0.0.1', '1521771734');
INSERT INTO `tp_admin_log` VALUES ('794', '1', '修改按钮【87】', '127.0.0.1', '1521771791');
INSERT INTO `tp_admin_log` VALUES ('795', '1', '分配模块按钮【204】', '127.0.0.1', '1521771817');
INSERT INTO `tp_admin_log` VALUES ('796', '1', '修改按钮【91】', '127.0.0.1', '1521771999');
INSERT INTO `tp_admin_log` VALUES ('797', '1', '修改按钮【90】', '127.0.0.1', '1521772146');
INSERT INTO `tp_admin_log` VALUES ('798', '1', '删除按钮【125,126】', '127.0.0.1', '1521772679');
INSERT INTO `tp_admin_log` VALUES ('799', '1', '删除按钮【123,124】', '127.0.0.1', '1521772709');
INSERT INTO `tp_admin_log` VALUES ('800', '1', '删除按钮【122】', '127.0.0.1', '1521772718');
INSERT INTO `tp_admin_log` VALUES ('801', '1', '添加模块【426】', '127.0.0.1', '1521772741');
INSERT INTO `tp_admin_log` VALUES ('802', '1', '删除模块【426】', '127.0.0.1', '1521772754');
INSERT INTO `tp_admin_log` VALUES ('803', '1', '添加按钮【127】', '127.0.0.1', '1521772766');
INSERT INTO `tp_admin_log` VALUES ('804', '1', '删除按钮【127】', '127.0.0.1', '1521772782');
INSERT INTO `tp_admin_log` VALUES ('805', '1', '添加角色【7】', '127.0.0.1', '1521774057');
INSERT INTO `tp_admin_log` VALUES ('806', '1', '添加角色【8】', '127.0.0.1', '1521774086');
INSERT INTO `tp_admin_log` VALUES ('807', '1', '修改角色【8】', '127.0.0.1', '1521774098');
INSERT INTO `tp_admin_log` VALUES ('808', '1', '添加角色【9】', '127.0.0.1', '1521774113');
INSERT INTO `tp_admin_log` VALUES ('809', '1', '修改角色【9】', '127.0.0.1', '1521774124');
INSERT INTO `tp_admin_log` VALUES ('810', '1', '删除角色【9】', '127.0.0.1', '1521774708');
INSERT INTO `tp_admin_log` VALUES ('811', '1', '删除角色【6,7,8】', '127.0.0.1', '1521774726');
INSERT INTO `tp_admin_log` VALUES ('812', '1', '修改角色【1】', '127.0.0.1', '1521774979');
INSERT INTO `tp_admin_log` VALUES ('813', '1', '为角色【1】分配模块权限', '127.0.0.1', '1521785298');
INSERT INTO `tp_admin_log` VALUES ('814', '1', '为角色【1】分配模块权限', '127.0.0.1', '1521785314');
INSERT INTO `tp_admin_log` VALUES ('815', '1', '为角色【1】分配模块权限', '127.0.0.1', '1521785338');
INSERT INTO `tp_admin_log` VALUES ('816', '1', '分配模块按钮【200】', '127.0.0.1', '1521787512');
INSERT INTO `tp_admin_log` VALUES ('817', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1521789270');
INSERT INTO `tp_admin_log` VALUES ('818', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1521789293');
INSERT INTO `tp_admin_log` VALUES ('819', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1521789305');
INSERT INTO `tp_admin_log` VALUES ('820', '1', '分配模块按钮【204】', '127.0.0.1', '1521789321');
INSERT INTO `tp_admin_log` VALUES ('821', '1', '添加角色【10】', '127.0.0.1', '1521789340');
INSERT INTO `tp_admin_log` VALUES ('822', '1', '为角色【10】分配模块权限', '127.0.0.1', '1521789351');
INSERT INTO `tp_admin_log` VALUES ('823', '1', '为角色【10】分配模块权限', '127.0.0.1', '1521789371');
INSERT INTO `tp_admin_log` VALUES ('824', '1', '为角色【10】分配模块权限', '127.0.0.1', '1521789384');
INSERT INTO `tp_admin_log` VALUES ('825', '1', '为角色【10】编辑按钮权限', '127.0.0.1', '1521789397');
INSERT INTO `tp_admin_log` VALUES ('826', '1', '添加管理员【6】-【test555】', '127.0.0.1', '1521794368');
INSERT INTO `tp_admin_log` VALUES ('827', '1', '添加管理员【7】-【test666】', '127.0.0.1', '1521794427');
INSERT INTO `tp_admin_log` VALUES ('828', '1', '添加管理员【8】-【test888】', '127.0.0.1', '1521794464');
INSERT INTO `tp_admin_log` VALUES ('829', '1', '添加管理员【9】-【test4】', '127.0.0.1', '1521796102');
INSERT INTO `tp_admin_log` VALUES ('830', '1', '添加管理员【10】-【test111】', '127.0.0.1', '1521796152');
INSERT INTO `tp_admin_log` VALUES ('831', '1', '修改管理员【6】-【test555】', '127.0.0.1', '1521796443');
INSERT INTO `tp_admin_log` VALUES ('832', '1', '修改管理员【9】-【test111111111】', '127.0.0.1', '1521796464');
INSERT INTO `tp_admin_log` VALUES ('833', '1', '修改管理员【9】-【test111111111】', '127.0.0.1', '1521796472');
INSERT INTO `tp_admin_log` VALUES ('834', '1', '修改管理员【9】-【test999】', '127.0.0.1', '1521796561');
INSERT INTO `tp_admin_log` VALUES ('835', '1', '删除管理员【4】', '127.0.0.1', '1521796654');
INSERT INTO `tp_admin_log` VALUES ('836', '1', '删除管理员【8】', '127.0.0.1', '1521796663');
INSERT INTO `tp_admin_log` VALUES ('837', '1', '修改管理员【1】-【admins】', '127.0.0.1', '1521797267');
INSERT INTO `tp_admin_log` VALUES ('838', '1', '修改管理员【1】-【admin】', '127.0.0.1', '1521797322');
INSERT INTO `tp_admin_log` VALUES ('839', '1', '修改管理员【10】-【test111】', '127.0.0.1', '1521797396');
INSERT INTO `tp_admin_log` VALUES ('840', '1', '修改管理员【10】-【test111】', '127.0.0.1', '1521797423');
INSERT INTO `tp_admin_log` VALUES ('841', '1', '修改管理员【10】-【test111】', '127.0.0.1', '1521797452');
INSERT INTO `tp_admin_log` VALUES ('842', '1', '修改管理员【10】-【test111】', '127.0.0.1', '1521797925');
INSERT INTO `tp_admin_log` VALUES ('843', '1', '修改管理员【10】-【test111】', '127.0.0.1', '1521797956');
INSERT INTO `tp_admin_log` VALUES ('844', '1', '修改管理员【10】-【test111】', '127.0.0.1', '1521797967');
INSERT INTO `tp_admin_log` VALUES ('845', '1', '修改管理员【10】-【test111】', '127.0.0.1', '1521798039');
INSERT INTO `tp_admin_log` VALUES ('846', '1', '修改按钮【92】', '127.0.0.1', '1521801496');
INSERT INTO `tp_admin_log` VALUES ('847', '1', '修改按钮【93】', '127.0.0.1', '1521801515');
INSERT INTO `tp_admin_log` VALUES ('848', '1', '修改按钮【92】', '127.0.0.1', '1521801599');
INSERT INTO `tp_admin_log` VALUES ('849', '1', '修改按钮【92】', '127.0.0.1', '1521801637');
INSERT INTO `tp_admin_log` VALUES ('850', '1', '修改按钮【93】', '127.0.0.1', '1521801683');
INSERT INTO `tp_admin_log` VALUES ('851', '1', '修改按钮【93】', '127.0.0.1', '1521801711');
INSERT INTO `tp_admin_log` VALUES ('852', '1', '修改按钮【91】', '127.0.0.1', '1521801783');
INSERT INTO `tp_admin_log` VALUES ('853', '1', '修改管理员【10】-【test111】', '127.0.0.1', '1521801807');
INSERT INTO `tp_admin_log` VALUES ('854', '1', '分配模块按钮【201】', '127.0.0.1', '1521801821');
INSERT INTO `tp_admin_log` VALUES ('855', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1521801839');
INSERT INTO `tp_admin_log` VALUES ('856', '1', '修改按钮【88】', '127.0.0.1', '1521801892');
INSERT INTO `tp_admin_log` VALUES ('857', '1', '修改按钮【89】', '127.0.0.1', '1521802111');
INSERT INTO `tp_admin_log` VALUES ('858', '1', '修改按钮【88】', '127.0.0.1', '1521802145');
INSERT INTO `tp_admin_log` VALUES ('859', '1', '分配模块按钮【206】', '127.0.0.1', '1521802481');
INSERT INTO `tp_admin_log` VALUES ('860', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1521802498');
INSERT INTO `tp_admin_log` VALUES ('861', '1', '修改按钮【90】', '127.0.0.1', '1521802522');
INSERT INTO `tp_admin_log` VALUES ('862', '1', '添加文章【25】', '127.0.0.1', '1523523726');
INSERT INTO `tp_admin_log` VALUES ('863', '1', '添加文章【26】', '127.0.0.1', '1523523749');
INSERT INTO `tp_admin_log` VALUES ('864', '1', '添加管理员【11】-【hhhhhh】', '127.0.0.1', '1523523896');
INSERT INTO `tp_admin_log` VALUES ('865', '1', '添加角色【11】', '127.0.0.1', '1523524132');
INSERT INTO `tp_admin_log` VALUES ('866', '1', '修改角色【11】', '127.0.0.1', '1523524138');
INSERT INTO `tp_admin_log` VALUES ('867', '1', '添加文章【27】', '127.0.0.1', '1523524265');
INSERT INTO `tp_admin_log` VALUES ('868', '1', '添加文章【28】', '127.0.0.1', '1523524317');
INSERT INTO `tp_admin_log` VALUES ('869', '1', '添加文章【29】', '127.0.0.1', '1523524368');
INSERT INTO `tp_admin_log` VALUES ('870', '1', '添加文章【30】', '127.0.0.1', '1523524519');
INSERT INTO `tp_admin_log` VALUES ('871', '1', '添加文章【31】', '127.0.0.1', '1523524587');
INSERT INTO `tp_admin_log` VALUES ('872', '1', '添加文章【32】', '127.0.0.1', '1523524612');
INSERT INTO `tp_admin_log` VALUES ('873', '1', '添加文章【33】', '127.0.0.1', '1523524651');
INSERT INTO `tp_admin_log` VALUES ('874', '1', '添加文章【34】', '127.0.0.1', '1523524816');
INSERT INTO `tp_admin_log` VALUES ('875', '1', '添加文章【35】', '127.0.0.1', '1523524926');
INSERT INTO `tp_admin_log` VALUES ('876', '1', '添加文章【36】', '127.0.0.1', '1523525095');
INSERT INTO `tp_admin_log` VALUES ('877', '1', '添加文章【37】', '127.0.0.1', '1523525155');
INSERT INTO `tp_admin_log` VALUES ('878', '1', '添加文章【38】', '127.0.0.1', '1523525234');
INSERT INTO `tp_admin_log` VALUES ('879', '1', '添加文章【39】', '127.0.0.1', '1523525288');
INSERT INTO `tp_admin_log` VALUES ('880', '1', '添加文章【40】', '127.0.0.1', '1523525340');
INSERT INTO `tp_admin_log` VALUES ('881', '1', '添加文章【41】', '127.0.0.1', '1523525375');
INSERT INTO `tp_admin_log` VALUES ('882', '1', '添加文章【42】', '127.0.0.1', '1523525398');
INSERT INTO `tp_admin_log` VALUES ('883', '1', '添加文章【43】', '127.0.0.1', '1523525445');
INSERT INTO `tp_admin_log` VALUES ('884', '1', '添加文章【44】', '127.0.0.1', '1523525488');
INSERT INTO `tp_admin_log` VALUES ('885', '1', '添加文章【45】', '127.0.0.1', '1523525675');
INSERT INTO `tp_admin_log` VALUES ('886', '1', '添加文章【46】', '127.0.0.1', '1523525701');
INSERT INTO `tp_admin_log` VALUES ('887', '1', '添加文章【47】', '127.0.0.1', '1523525756');
INSERT INTO `tp_admin_log` VALUES ('888', '1', '添加文章【48】', '127.0.0.1', '1523525789');
INSERT INTO `tp_admin_log` VALUES ('889', '1', '添加文章【49】', '127.0.0.1', '1523525822');
INSERT INTO `tp_admin_log` VALUES ('890', '1', '添加文章【50】', '127.0.0.1', '1523525864');
INSERT INTO `tp_admin_log` VALUES ('891', '1', '添加文章【51】', '127.0.0.1', '1523525886');
INSERT INTO `tp_admin_log` VALUES ('892', '1', '添加文章【52】', '127.0.0.1', '1523525937');
INSERT INTO `tp_admin_log` VALUES ('893', '1', '添加文章【53】', '127.0.0.1', '1523525954');
INSERT INTO `tp_admin_log` VALUES ('894', '1', '添加文章【54】', '127.0.0.1', '1523526025');
INSERT INTO `tp_admin_log` VALUES ('895', '1', '添加文章【55】', '127.0.0.1', '1523526110');
INSERT INTO `tp_admin_log` VALUES ('896', '1', '添加文章【56】', '127.0.0.1', '1523526141');
INSERT INTO `tp_admin_log` VALUES ('897', '1', '添加文章【57】', '127.0.0.1', '1523526269');
INSERT INTO `tp_admin_log` VALUES ('898', '1', '添加文章【58】', '127.0.0.1', '1523526596');
INSERT INTO `tp_admin_log` VALUES ('899', '1', '添加文章【59】', '127.0.0.1', '1523527342');
INSERT INTO `tp_admin_log` VALUES ('900', '1', '修改文章【59】', '127.0.0.1', '1523528071');
INSERT INTO `tp_admin_log` VALUES ('901', '1', '修改文章【59】', '127.0.0.1', '1523528091');
INSERT INTO `tp_admin_log` VALUES ('902', '1', '修改文章【59】', '127.0.0.1', '1523528113');
INSERT INTO `tp_admin_log` VALUES ('903', '1', '修改文章【59】', '127.0.0.1', '1523528152');
INSERT INTO `tp_admin_log` VALUES ('904', '1', '修改文章【59】', '127.0.0.1', '1523528162');
INSERT INTO `tp_admin_log` VALUES ('905', '1', '修改文章【59】', '127.0.0.1', '1523528411');
INSERT INTO `tp_admin_log` VALUES ('906', '1', '修改文章【59】', '127.0.0.1', '1523529511');
INSERT INTO `tp_admin_log` VALUES ('907', '1', '修改文章【59】', '127.0.0.1', '1523529551');
INSERT INTO `tp_admin_log` VALUES ('908', '1', '修改文章【59】', '127.0.0.1', '1523529694');
INSERT INTO `tp_admin_log` VALUES ('909', '1', '修改文章【59】', '127.0.0.1', '1523529775');
INSERT INTO `tp_admin_log` VALUES ('910', '1', '修改文章【59】', '127.0.0.1', '1523530339');
INSERT INTO `tp_admin_log` VALUES ('911', '1', '修改文章【59】', '127.0.0.1', '1523530986');
INSERT INTO `tp_admin_log` VALUES ('912', '1', '修改文章【59】', '127.0.0.1', '1523531050');
INSERT INTO `tp_admin_log` VALUES ('913', '1', '修改文章【59】', '127.0.0.1', '1523531065');
INSERT INTO `tp_admin_log` VALUES ('914', '1', '修改文章【59】', '127.0.0.1', '1523531186');
INSERT INTO `tp_admin_log` VALUES ('915', '1', '修改管理员【1】-【admin】', '127.0.0.1', '1523531351');
INSERT INTO `tp_admin_log` VALUES ('916', '1', '修改管理员【1】-【admin】', '127.0.0.1', '1523531357');
INSERT INTO `tp_admin_log` VALUES ('917', '1', '修改文章【59】', '127.0.0.1', '1523531773');
INSERT INTO `tp_admin_log` VALUES ('918', '1', '修改文章【59】', '127.0.0.1', '1523531783');
INSERT INTO `tp_admin_log` VALUES ('919', '1', '修改文章【59】', '127.0.0.1', '1523531791');
INSERT INTO `tp_admin_log` VALUES ('920', '1', '修改文章【59】', '127.0.0.1', '1523531822');
INSERT INTO `tp_admin_log` VALUES ('921', '1', '修改文章【59】', '127.0.0.1', '1523531858');
INSERT INTO `tp_admin_log` VALUES ('922', '1', '修改文章【59】', '127.0.0.1', '1523531869');
INSERT INTO `tp_admin_log` VALUES ('923', '1', '修改管理员【5】-【test456】', '127.0.0.1', '1523531881');
INSERT INTO `tp_admin_log` VALUES ('924', '1', '修改管理员【5】-【test456】', '127.0.0.1', '1523531889');
INSERT INTO `tp_admin_log` VALUES ('925', '1', '添加文章【60】', '127.0.0.1', '1523531909');
INSERT INTO `tp_admin_log` VALUES ('926', '1', '修改文章【60】', '127.0.0.1', '1523582405');
INSERT INTO `tp_admin_log` VALUES ('927', '1', '删除文章【60,59】', '127.0.0.1', '1523589258');
INSERT INTO `tp_admin_log` VALUES ('928', '1', '添加文章【61】', '127.0.0.1', '1523589348');
INSERT INTO `tp_admin_log` VALUES ('929', '1', '删除文章【61,58】', '127.0.0.1', '1523589383');
INSERT INTO `tp_admin_log` VALUES ('930', '1', '修改文章【57】', '127.0.0.1', '1523589486');
INSERT INTO `tp_admin_log` VALUES ('931', '1', '修改文章【57】', '127.0.0.1', '1523591274');
INSERT INTO `tp_admin_log` VALUES ('932', '1', '删除文章【57】', '127.0.0.1', '1523591302');
INSERT INTO `tp_admin_log` VALUES ('933', '1', '删除文章【56,55,54,53,52,51,50,49,48,47,46】', '127.0.0.1', '1523599650');
INSERT INTO `tp_admin_log` VALUES ('934', '1', '删除文章【45,44,43,42,41,40,39,38,37,36,35】', '127.0.0.1', '1523599657');
INSERT INTO `tp_admin_log` VALUES ('935', '1', '修改文章【34】', '127.0.0.1', '1523599683');
INSERT INTO `tp_admin_log` VALUES ('936', '1', '屏蔽文章【34,33,32】', '127.0.0.1', '1523600186');
INSERT INTO `tp_admin_log` VALUES ('937', '1', '审核文章【34,33,32】', '127.0.0.1', '1523600194');
INSERT INTO `tp_admin_log` VALUES ('938', '1', '屏蔽文章【33,31,29】', '127.0.0.1', '1523600201');
INSERT INTO `tp_admin_log` VALUES ('939', '1', '添加文章分类【5】', '127.0.0.1', '1523602048');
INSERT INTO `tp_admin_log` VALUES ('940', '1', '添加文章分类【6】', '127.0.0.1', '1523602059');
INSERT INTO `tp_admin_log` VALUES ('941', '1', '修改文章分类【3】', '127.0.0.1', '1523602104');
INSERT INTO `tp_admin_log` VALUES ('942', '1', '修改文章分类【5】', '127.0.0.1', '1523602126');
INSERT INTO `tp_admin_log` VALUES ('943', '1', '修改文章分类【3】', '127.0.0.1', '1523602137');
INSERT INTO `tp_admin_log` VALUES ('944', '1', '修改文章分类【5】', '127.0.0.1', '1523602146');
INSERT INTO `tp_admin_log` VALUES ('945', '1', '删除文章分类【5】', '127.0.0.1', '1523602221');
INSERT INTO `tp_admin_log` VALUES ('946', '1', '添加文章分类【7】', '127.0.0.1', '1523602231');
INSERT INTO `tp_admin_log` VALUES ('947', '1', '添加文章分类【8】', '127.0.0.1', '1523602241');
INSERT INTO `tp_admin_log` VALUES ('948', '1', '删除文章分类【7】', '127.0.0.1', '1523602246');
INSERT INTO `tp_admin_log` VALUES ('949', '1', '添加广告位【4】', '127.0.0.1', '1523603509');
INSERT INTO `tp_admin_log` VALUES ('950', '1', '添加广告位【5】', '127.0.0.1', '1523603530');
INSERT INTO `tp_admin_log` VALUES ('951', '1', '修改广告位【5】', '127.0.0.1', '1523603541');
INSERT INTO `tp_admin_log` VALUES ('952', '1', '修改广告位【4】', '127.0.0.1', '1523603685');
INSERT INTO `tp_admin_log` VALUES ('953', '1', '删除广告位【4】', '127.0.0.1', '1523603709');
INSERT INTO `tp_admin_log` VALUES ('954', '1', '删除广告位【5,3】', '127.0.0.1', '1523603717');
INSERT INTO `tp_admin_log` VALUES ('955', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1523604442');
INSERT INTO `tp_admin_log` VALUES ('956', '1', '分配模块按钮【212】', '127.0.0.1', '1523604468');
INSERT INTO `tp_admin_log` VALUES ('957', '1', '分配模块按钮【212】', '127.0.0.1', '1523604478');
INSERT INTO `tp_admin_log` VALUES ('958', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1523604497');
INSERT INTO `tp_admin_log` VALUES ('959', '1', '添加广告位【6】', '127.0.0.1', '1523606057');
INSERT INTO `tp_admin_log` VALUES ('960', '1', '添加广告位【7】', '127.0.0.1', '1523606258');
INSERT INTO `tp_admin_log` VALUES ('961', '1', '修改广告位【7】', '127.0.0.1', '1523606309');
INSERT INTO `tp_admin_log` VALUES ('962', '1', '修改广告位【6】', '127.0.0.1', '1523606315');
INSERT INTO `tp_admin_log` VALUES ('963', '1', '添加广告位【8】', '127.0.0.1', '1523606334');
INSERT INTO `tp_admin_log` VALUES ('964', '1', '添加广告【11】', '127.0.0.1', '1523606496');
INSERT INTO `tp_admin_log` VALUES ('965', '1', '修改广告【11】', '127.0.0.1', '1523606510');
INSERT INTO `tp_admin_log` VALUES ('966', '1', '添加广告【12】', '127.0.0.1', '1523606586');
INSERT INTO `tp_admin_log` VALUES ('967', '1', '修改广告【12】', '127.0.0.1', '1523606597');
INSERT INTO `tp_admin_log` VALUES ('968', '1', '修改广告【12】', '127.0.0.1', '1523606609');
INSERT INTO `tp_admin_log` VALUES ('969', '1', '删除广告【12】', '127.0.0.1', '1523606700');
INSERT INTO `tp_admin_log` VALUES ('970', '1', '删除广告【8,7,9,6,5,10,11】', '127.0.0.1', '1523606710');
INSERT INTO `tp_admin_log` VALUES ('971', '1', '添加广告【13】', '127.0.0.1', '1523606723');
INSERT INTO `tp_admin_log` VALUES ('972', '1', '添加广告【14】', '127.0.0.1', '1523606742');
INSERT INTO `tp_admin_log` VALUES ('973', '1', '添加广告【15】', '127.0.0.1', '1523606915');
INSERT INTO `tp_admin_log` VALUES ('974', '1', '关闭广告【14】', '127.0.0.1', '1523606920');
INSERT INTO `tp_admin_log` VALUES ('975', '1', '关闭广告【15,14,13】', '127.0.0.1', '1523606929');
INSERT INTO `tp_admin_log` VALUES ('976', '1', '开启广告【15,14,13】', '127.0.0.1', '1523606934');
INSERT INTO `tp_admin_log` VALUES ('977', '1', '修改文章【34】', '127.0.0.1', '1524049170');
INSERT INTO `tp_admin_log` VALUES ('978', '1', '修改文章【34】', '127.0.0.1', '1524049220');
INSERT INTO `tp_admin_log` VALUES ('979', '1', '修改文章【34】', '127.0.0.1', '1524049520');
INSERT INTO `tp_admin_log` VALUES ('980', '1', '修改广告【15】', '127.0.0.1', '1528178812');
INSERT INTO `tp_admin_log` VALUES ('981', '1', '编辑管理员[12]', '127.0.0.1', '1534993386');
INSERT INTO `tp_admin_log` VALUES ('982', '1', '编辑管理员[17]', '127.0.0.1', '1534993409');
INSERT INTO `tp_admin_log` VALUES ('983', '1', '添加管理员[25]', '127.0.0.1', '1535006594');
INSERT INTO `tp_admin_log` VALUES ('984', '1', '编辑管理员[25]', '127.0.0.1', '1535006643');
INSERT INTO `tp_admin_log` VALUES ('985', '1', '编辑管理员[25]', '127.0.0.1', '1535006743');
INSERT INTO `tp_admin_log` VALUES ('986', '1', '添加管理员[26]', '127.0.0.1', '1535007197');
INSERT INTO `tp_admin_log` VALUES ('987', '1', '编辑管理员[26]', '127.0.0.1', '1535007230');
INSERT INTO `tp_admin_log` VALUES ('988', '1', '编辑管理员[26]', '127.0.0.1', '1535007249');
INSERT INTO `tp_admin_log` VALUES ('989', '1', '添加管理员[27]', '127.0.0.1', '1535008726');
INSERT INTO `tp_admin_log` VALUES ('990', '1', '添加管理员[28]', '127.0.0.1', '1535008746');
INSERT INTO `tp_admin_log` VALUES ('991', '1', '添加管理员[29]', '127.0.0.1', '1535009257');
INSERT INTO `tp_admin_log` VALUES ('992', '1', '编辑管理员[29]', '127.0.0.1', '1535009283');
INSERT INTO `tp_admin_log` VALUES ('993', '1', '编辑管理员[29]', '127.0.0.1', '1535009325');
INSERT INTO `tp_admin_log` VALUES ('994', '1', '编辑管理员[29]', '127.0.0.1', '1535009347');
INSERT INTO `tp_admin_log` VALUES ('995', '1', '删除管理员【6】', '127.0.0.1', '1535010011');
INSERT INTO `tp_admin_log` VALUES ('996', '1', '删除管理员【6】', '127.0.0.1', '1535010070');
INSERT INTO `tp_admin_log` VALUES ('997', '1', '删除管理员【21,22,23,24,25,26,27,29】', '127.0.0.1', '1535010086');
INSERT INTO `tp_admin_log` VALUES ('998', '1', '删除管理员【14,15,16,17,18,19,20】', '127.0.0.1', '1535010096');
INSERT INTO `tp_admin_log` VALUES ('999', '1', '屏蔽管理员【5,7】', '127.0.0.1', '1535010894');
INSERT INTO `tp_admin_log` VALUES ('1000', '1', '屏蔽管理员【5,7】', '127.0.0.1', '1535010900');
INSERT INTO `tp_admin_log` VALUES ('1001', '1', '审核管理员【10】', '127.0.0.1', '1535010912');
INSERT INTO `tp_admin_log` VALUES ('1002', '1', '审核管理员【10】', '127.0.0.1', '1535010919');
INSERT INTO `tp_admin_log` VALUES ('1003', '1', '屏蔽管理员【5】', '127.0.0.1', '1535011022');
INSERT INTO `tp_admin_log` VALUES ('1004', '1', '审核管理员【5,7】', '127.0.0.1', '1535011030');
INSERT INTO `tp_admin_log` VALUES ('1005', '1', '屏蔽管理员【5,10】', '127.0.0.1', '1535011785');
INSERT INTO `tp_admin_log` VALUES ('1006', '1', '屏蔽管理员【5,9】', '127.0.0.1', '1535011794');
INSERT INTO `tp_admin_log` VALUES ('1007', '1', '屏蔽管理员【7,10】', '127.0.0.1', '1535011823');
INSERT INTO `tp_admin_log` VALUES ('1008', '1', '屏蔽管理员【7,10】', '127.0.0.1', '1535011877');
INSERT INTO `tp_admin_log` VALUES ('1009', '1', '屏蔽管理员【5,10】', '127.0.0.1', '1535012020');
INSERT INTO `tp_admin_log` VALUES ('1010', '1', '屏蔽管理员【5,7,9,10,11,12,13】', '127.0.0.1', '1535012028');
INSERT INTO `tp_admin_log` VALUES ('1011', '1', '审核管理员【5,7,9】', '127.0.0.1', '1535012035');
INSERT INTO `tp_admin_log` VALUES ('1012', '1', '添加角色【12】', '127.0.0.1', '1535012808');
INSERT INTO `tp_admin_log` VALUES ('1013', '1', '添加角色【14】', '127.0.0.1', '1535012986');
INSERT INTO `tp_admin_log` VALUES ('1014', '1', '修改角色【14】', '127.0.0.1', '1535013003');
INSERT INTO `tp_admin_log` VALUES ('1015', '1', '删除角色【14】', '127.0.0.1', '1535013088');
INSERT INTO `tp_admin_log` VALUES ('1016', '1', '删除角色【13】', '127.0.0.1', '1535013096');
INSERT INTO `tp_admin_log` VALUES ('1017', '1', '添加模块【427】', '127.0.0.1', '1535013791');
INSERT INTO `tp_admin_log` VALUES ('1018', '1', '添加模块【428】', '127.0.0.1', '1535013840');
INSERT INTO `tp_admin_log` VALUES ('1019', '1', '修改模块【428】', '127.0.0.1', '1535013867');
INSERT INTO `tp_admin_log` VALUES ('1020', '1', '修改模块【428】', '127.0.0.1', '1535013888');
INSERT INTO `tp_admin_log` VALUES ('1021', '1', '修改模块【427】', '127.0.0.1', '1535014430');
INSERT INTO `tp_admin_log` VALUES ('1022', '1', '修改模块【428】', '127.0.0.1', '1535014519');
INSERT INTO `tp_admin_log` VALUES ('1023', '1', '添加模块【429】', '127.0.0.1', '1535014572');
INSERT INTO `tp_admin_log` VALUES ('1024', '1', '添加模块【430】', '127.0.0.1', '1535014591');
INSERT INTO `tp_admin_log` VALUES ('1025', '1', '删除模块【341】', '127.0.0.1', '1535014660');
INSERT INTO `tp_admin_log` VALUES ('1026', '1', '删除模块【340】', '127.0.0.1', '1535014672');
INSERT INTO `tp_admin_log` VALUES ('1027', '1', '删除模块【337】', '127.0.0.1', '1535014681');
INSERT INTO `tp_admin_log` VALUES ('1028', '1', '删除模块【331】', '127.0.0.1', '1535014692');
INSERT INTO `tp_admin_log` VALUES ('1029', '1', '修改模块【429】', '127.0.0.1', '1535014759');
INSERT INTO `tp_admin_log` VALUES ('1030', '1', '修改模块【430】', '127.0.0.1', '1535014846');
INSERT INTO `tp_admin_log` VALUES ('1031', '1', '分配模块按钮【429】', '127.0.0.1', '1535015048');
INSERT INTO `tp_admin_log` VALUES ('1032', '1', '分配模块按钮【430】', '127.0.0.1', '1535015145');
INSERT INTO `tp_admin_log` VALUES ('1033', '1', '分配模块按钮【429】', '127.0.0.1', '1535015181');
INSERT INTO `tp_admin_log` VALUES ('1034', '1', '分配模块按钮【429】', '127.0.0.1', '1535015189');
INSERT INTO `tp_admin_log` VALUES ('1035', '1', '分配模块按钮【430】', '127.0.0.1', '1535015199');
INSERT INTO `tp_admin_log` VALUES ('1036', '1', '修改按钮【128】', '127.0.0.1', '1535015652');
INSERT INTO `tp_admin_log` VALUES ('1037', '1', '删除按钮【128】', '127.0.0.1', '1535015664');
INSERT INTO `tp_admin_log` VALUES ('1038', '1', '为角色【10】分配模块权限', '127.0.0.1', '1535017317');
INSERT INTO `tp_admin_log` VALUES ('1039', '1', '为角色【10】分配模块权限', '127.0.0.1', '1535017325');
INSERT INTO `tp_admin_log` VALUES ('1040', '1', '为角色【11】分配模块权限', '127.0.0.1', '1535017395');
INSERT INTO `tp_admin_log` VALUES ('1041', '1', '为角色【11】分配模块权限', '127.0.0.1', '1535017426');
INSERT INTO `tp_admin_log` VALUES ('1042', '1', '为角色【11】分配模块权限', '127.0.0.1', '1535017436');
INSERT INTO `tp_admin_log` VALUES ('1043', '1', '为角色【10】编辑按钮权限', '127.0.0.1', '1535019690');
INSERT INTO `tp_admin_log` VALUES ('1044', '1', '编辑管理员【13】', '127.0.0.1', '1535019727');
INSERT INTO `tp_admin_log` VALUES ('1045', '1', '编辑管理员【13】', '127.0.0.1', '1535019863');
INSERT INTO `tp_admin_log` VALUES ('1046', '1', '为角色【1】分配模块权限', '127.0.0.1', '1535020876');
INSERT INTO `tp_admin_log` VALUES ('1047', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1535020888');
INSERT INTO `tp_admin_log` VALUES ('1048', '1', '为角色【10】编辑按钮权限', '127.0.0.1', '1535021375');
INSERT INTO `tp_admin_log` VALUES ('1049', '1', '修改模块【208】', '127.0.0.1', '1535026521');
INSERT INTO `tp_admin_log` VALUES ('1050', '1', '修改模块【207】', '127.0.0.1', '1535026585');
INSERT INTO `tp_admin_log` VALUES ('1051', '1', '修改模块【211】', '127.0.0.1', '1535026653');
INSERT INTO `tp_admin_log` VALUES ('1052', '1', '添加角色【15】', '127.0.0.1', '1535072415');
INSERT INTO `tp_admin_log` VALUES ('1053', '1', '添加文章【62】', '127.0.0.1', '1535079540');
INSERT INTO `tp_admin_log` VALUES ('1054', '1', '添加文章【63】', '127.0.0.1', '1535079638');
INSERT INTO `tp_admin_log` VALUES ('1055', '1', '添加文章【64】', '127.0.0.1', '1535079704');
INSERT INTO `tp_admin_log` VALUES ('1056', '1', '添加文章【65】', '127.0.0.1', '1535079750');
INSERT INTO `tp_admin_log` VALUES ('1057', '1', '添加文章【66】', '127.0.0.1', '1535079788');
INSERT INTO `tp_admin_log` VALUES ('1058', '1', '添加文章【67】', '127.0.0.1', '1535081374');
INSERT INTO `tp_admin_log` VALUES ('1059', '1', '修改文章【67】', '127.0.0.1', '1535081390');
INSERT INTO `tp_admin_log` VALUES ('1060', '1', '修改文章【67】', '127.0.0.1', '1535081405');
INSERT INTO `tp_admin_log` VALUES ('1061', '1', '修改文章【66】', '127.0.0.1', '1535090189');
INSERT INTO `tp_admin_log` VALUES ('1062', '1', '修改文章【67】', '127.0.0.1', '1535093125');
INSERT INTO `tp_admin_log` VALUES ('1063', '1', '修改文章【67】', '127.0.0.1', '1535093139');
INSERT INTO `tp_admin_log` VALUES ('1064', '1', '修改文章【67】', '127.0.0.1', '1535093436');
INSERT INTO `tp_admin_log` VALUES ('1065', '1', '修改文章【67】', '127.0.0.1', '1535093582');
INSERT INTO `tp_admin_log` VALUES ('1066', '1', '修改文章【67】', '127.0.0.1', '1535093595');
INSERT INTO `tp_admin_log` VALUES ('1067', '1', '修改文章【67】', '127.0.0.1', '1535093605');
INSERT INTO `tp_admin_log` VALUES ('1068', '1', '删除文章【66】', '127.0.0.1', '1535093750');
INSERT INTO `tp_admin_log` VALUES ('1069', '1', '删除文章【67】', '127.0.0.1', '1535096107');
INSERT INTO `tp_admin_log` VALUES ('1070', '1', '添加文章【68】', '127.0.0.1', '1535096156');
INSERT INTO `tp_admin_log` VALUES ('1071', '1', '删除文章【68】', '127.0.0.1', '1535096215');
INSERT INTO `tp_admin_log` VALUES ('1072', '1', '审核文章【65】', '127.0.0.1', '1535096307');
INSERT INTO `tp_admin_log` VALUES ('1073', '1', '屏蔽文章【65】', '127.0.0.1', '1535096326');
INSERT INTO `tp_admin_log` VALUES ('1074', '1', '屏蔽文章【65,64,63,62,34,33,32,31,30,29,28】', '127.0.0.1', '1535096332');
INSERT INTO `tp_admin_log` VALUES ('1075', '1', '审核文章【63】', '127.0.0.1', '1535096343');
INSERT INTO `tp_admin_log` VALUES ('1076', '1', '添加文章分类【9】', '127.0.0.1', '1535096848');
INSERT INTO `tp_admin_log` VALUES ('1077', '1', '添加文章分类【10】', '127.0.0.1', '1535096861');
INSERT INTO `tp_admin_log` VALUES ('1078', '1', '修改文章分类【9】', '127.0.0.1', '1535096877');
INSERT INTO `tp_admin_log` VALUES ('1079', '1', '修改文章分类【9】', '127.0.0.1', '1535096885');
INSERT INTO `tp_admin_log` VALUES ('1080', '1', '删除文章分类【9】', '127.0.0.1', '1535096909');
INSERT INTO `tp_admin_log` VALUES ('1081', '1', '添加广告位【9】', '127.0.0.1', '1535097149');
INSERT INTO `tp_admin_log` VALUES ('1082', '1', '添加广告位【10】', '127.0.0.1', '1535097278');
INSERT INTO `tp_admin_log` VALUES ('1083', '1', '修改广告位【10】', '127.0.0.1', '1535097286');
INSERT INTO `tp_admin_log` VALUES ('1084', '1', '删除广告位【10,7】', '127.0.0.1', '1535097301');
INSERT INTO `tp_admin_log` VALUES ('1085', '1', '修改广告位【8】', '127.0.0.1', '1535097501');
INSERT INTO `tp_admin_log` VALUES ('1086', '1', '添加广告【16】', '127.0.0.1', '1535097756');
INSERT INTO `tp_admin_log` VALUES ('1087', '1', '添加广告【17】', '127.0.0.1', '1535098067');
INSERT INTO `tp_admin_log` VALUES ('1088', '1', '添加文章分类【11】', '127.0.0.1', '1535100627');
INSERT INTO `tp_admin_log` VALUES ('1089', '1', '添加文章分类【12】', '127.0.0.1', '1535100686');
INSERT INTO `tp_admin_log` VALUES ('1090', '1', '添加文章分类【13】', '127.0.0.1', '1535100809');
INSERT INTO `tp_admin_log` VALUES ('1091', '1', '添加商品分类分类【11】', '127.0.0.1', '1535100871');
INSERT INTO `tp_admin_log` VALUES ('1092', '1', '添加商品分类分类【12】', '127.0.0.1', '1535101183');
INSERT INTO `tp_admin_log` VALUES ('1093', '1', '修改文章【63】', '127.0.0.1', '1535101493');
INSERT INTO `tp_admin_log` VALUES ('1094', '1', '修改文章【63】', '127.0.0.1', '1535101621');
INSERT INTO `tp_admin_log` VALUES ('1095', '1', '修改文章【63】', '127.0.0.1', '1535101630');
INSERT INTO `tp_admin_log` VALUES ('1096', '1', '修改广告【17】', '127.0.0.1', '1535101677');
INSERT INTO `tp_admin_log` VALUES ('1097', '1', '修改商品分类分类【12】', '127.0.0.1', '1535101694');
INSERT INTO `tp_admin_log` VALUES ('1098', '1', '修改商品分类分类【12】', '127.0.0.1', '1535101728');
INSERT INTO `tp_admin_log` VALUES ('1099', '1', '修改商品分类分类【12】', '127.0.0.1', '1535101751');
INSERT INTO `tp_admin_log` VALUES ('1100', '1', '修改商品分类分类【12】', '127.0.0.1', '1535101760');
INSERT INTO `tp_admin_log` VALUES ('1101', '1', '修改商品分类分类【12】', '127.0.0.1', '1535102618');
INSERT INTO `tp_admin_log` VALUES ('1102', '1', '修改商品分类分类【2】', '127.0.0.1', '1535102627');
INSERT INTO `tp_admin_log` VALUES ('1103', '1', '修改商品分类分类【3】', '127.0.0.1', '1535102649');
INSERT INTO `tp_admin_log` VALUES ('1104', '1', '添加商品分类分类【13】', '127.0.0.1', '1535102941');
INSERT INTO `tp_admin_log` VALUES ('1105', '1', '删除商品分类【12】', '127.0.0.1', '1535102949');
INSERT INTO `tp_admin_log` VALUES ('1106', '1', '修改商品分类分类【11】', '127.0.0.1', '1535102991');
INSERT INTO `tp_admin_log` VALUES ('1107', '1', '添加商品分类分类【14】', '127.0.0.1', '1535103002');
INSERT INTO `tp_admin_log` VALUES ('1108', '1', '添加商品分类分类【15】', '127.0.0.1', '1535103020');
INSERT INTO `tp_admin_log` VALUES ('1109', '1', '添加模块【431】', '127.0.0.1', '1535103263');
INSERT INTO `tp_admin_log` VALUES ('1110', '1', '为角色【1】分配模块权限', '127.0.0.1', '1535103278');
INSERT INTO `tp_admin_log` VALUES ('1111', '1', '分配模块按钮【431】', '127.0.0.1', '1535103293');
INSERT INTO `tp_admin_log` VALUES ('1112', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1535103306');
INSERT INTO `tp_admin_log` VALUES ('1113', '1', '修改商品分类分类【1】', '127.0.0.1', '1535105932');
INSERT INTO `tp_admin_log` VALUES ('1114', '1', '修改商品分类分类【2】', '127.0.0.1', '1535105943');
INSERT INTO `tp_admin_log` VALUES ('1115', '1', '修改商品分类分类【3】', '127.0.0.1', '1535105953');
INSERT INTO `tp_admin_log` VALUES ('1116', '1', '添加广告【18】', '127.0.0.1', '1535106018');
INSERT INTO `tp_admin_log` VALUES ('1117', '1', '添加品牌【1】', '127.0.0.1', '1535106123');
INSERT INTO `tp_admin_log` VALUES ('1118', '1', '修改品牌【1】', '127.0.0.1', '1535106339');
INSERT INTO `tp_admin_log` VALUES ('1119', '1', '修改品牌【1】', '127.0.0.1', '1535106361');
INSERT INTO `tp_admin_log` VALUES ('1120', '1', '修改品牌【1】', '127.0.0.1', '1535106381');
INSERT INTO `tp_admin_log` VALUES ('1121', '1', '修改品牌【1】', '127.0.0.1', '1535106393');
INSERT INTO `tp_admin_log` VALUES ('1122', '1', '添加品牌【2】', '127.0.0.1', '1535106416');
INSERT INTO `tp_admin_log` VALUES ('1123', '1', '添加品牌【3】', '127.0.0.1', '1535106440');
INSERT INTO `tp_admin_log` VALUES ('1124', '1', '添加品牌【4】', '127.0.0.1', '1535106454');
INSERT INTO `tp_admin_log` VALUES ('1125', '1', '修改品牌【1】', '127.0.0.1', '1535106491');
INSERT INTO `tp_admin_log` VALUES ('1126', '1', '删除品牌【4,3】', '127.0.0.1', '1535106594');
INSERT INTO `tp_admin_log` VALUES ('1127', '1', '添加模块【432】', '127.0.0.1', '1535106746');
INSERT INTO `tp_admin_log` VALUES ('1128', '1', '分配模块按钮【432】', '127.0.0.1', '1535106757');
INSERT INTO `tp_admin_log` VALUES ('1129', '1', '为角色【1】分配模块权限', '127.0.0.1', '1535107110');
INSERT INTO `tp_admin_log` VALUES ('1130', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1535107121');
INSERT INTO `tp_admin_log` VALUES ('1131', '1', '添加规格【1】', '127.0.0.1', '1535185877');
INSERT INTO `tp_admin_log` VALUES ('1132', '1', '添加规格【2】', '127.0.0.1', '1535185903');
INSERT INTO `tp_admin_log` VALUES ('1133', '1', '添加规格【3】', '127.0.0.1', '1535185935');
INSERT INTO `tp_admin_log` VALUES ('1134', '1', '修改规格【3】', '127.0.0.1', '1535186080');
INSERT INTO `tp_admin_log` VALUES ('1135', '1', '修改规格【3】', '127.0.0.1', '1535186152');
INSERT INTO `tp_admin_log` VALUES ('1136', '1', '删除规格【3】', '127.0.0.1', '1535186217');
INSERT INTO `tp_admin_log` VALUES ('1137', '1', '修改模块【328】', '127.0.0.1', '1535186507');
INSERT INTO `tp_admin_log` VALUES ('1138', '1', '修改模块【199】', '127.0.0.1', '1535186548');
INSERT INTO `tp_admin_log` VALUES ('1139', '1', '修改模块【248】', '127.0.0.1', '1535186811');
INSERT INTO `tp_admin_log` VALUES ('1140', '1', '修改模块【427】', '127.0.0.1', '1535186904');
INSERT INTO `tp_admin_log` VALUES ('1141', '1', '修改模块【427】', '127.0.0.1', '1535187074');
INSERT INTO `tp_admin_log` VALUES ('1142', '1', '修改模块【428】', '127.0.0.1', '1535187231');
INSERT INTO `tp_admin_log` VALUES ('1143', '1', '添加模块【433】', '127.0.0.1', '1535334946');
INSERT INTO `tp_admin_log` VALUES ('1144', '1', '添加模块【434】', '127.0.0.1', '1535334965');
INSERT INTO `tp_admin_log` VALUES ('1145', '1', '添加模块【435】', '127.0.0.1', '1535335040');
INSERT INTO `tp_admin_log` VALUES ('1146', '1', '分配模块按钮【435】', '127.0.0.1', '1535335060');
INSERT INTO `tp_admin_log` VALUES ('1147', '1', '为角色【1】分配模块权限', '127.0.0.1', '1535335075');
INSERT INTO `tp_admin_log` VALUES ('1148', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1535335086');
INSERT INTO `tp_admin_log` VALUES ('1149', '1', '添加商家【1】', '127.0.0.1', '1535359092');
INSERT INTO `tp_admin_log` VALUES ('1150', '1', '添加商家【2】', '127.0.0.1', '1535359512');
INSERT INTO `tp_admin_log` VALUES ('1151', '1', '修改商家【2】', '127.0.0.1', '1535359907');
INSERT INTO `tp_admin_log` VALUES ('1152', '1', '修改商家【2】', '127.0.0.1', '1535359940');
INSERT INTO `tp_admin_log` VALUES ('1153', '1', '修改商家【2】', '127.0.0.1', '1535359975');
INSERT INTO `tp_admin_log` VALUES ('1154', '1', '修改商家【2】', '127.0.0.1', '1535360001');
INSERT INTO `tp_admin_log` VALUES ('1155', '1', '修改商家【2】', '127.0.0.1', '1535360015');
INSERT INTO `tp_admin_log` VALUES ('1156', '1', '修改商家【2】', '127.0.0.1', '1535360028');
INSERT INTO `tp_admin_log` VALUES ('1157', '1', '修改商家【2】', '127.0.0.1', '1535360039');
INSERT INTO `tp_admin_log` VALUES ('1158', '1', '修改商家【2】', '127.0.0.1', '1535360064');
INSERT INTO `tp_admin_log` VALUES ('1159', '1', '添加门店【3】', '127.0.0.1', '1535360668');
INSERT INTO `tp_admin_log` VALUES ('1160', '1', '修改门店【3】', '127.0.0.1', '1535360687');
INSERT INTO `tp_admin_log` VALUES ('1161', '1', '删除门店【3】', '127.0.0.1', '1535360706');
INSERT INTO `tp_admin_log` VALUES ('1162', '1', '开启门店【2】', '127.0.0.1', '1535362009');
INSERT INTO `tp_admin_log` VALUES ('1163', '1', '修改门店【2】', '127.0.0.1', '1535449336');
INSERT INTO `tp_admin_log` VALUES ('1164', '1', '修改门店【2】', '127.0.0.1', '1535450939');
INSERT INTO `tp_admin_log` VALUES ('1165', '1', '修改门店【2】', '127.0.0.1', '1535451075');
INSERT INTO `tp_admin_log` VALUES ('1166', '1', '修改门店【2】', '127.0.0.1', '1535451230');
INSERT INTO `tp_admin_log` VALUES ('1167', '1', '为角色【15】分配模块权限', '127.0.0.1', '1535458915');
INSERT INTO `tp_admin_log` VALUES ('1168', '1', '添加管理员【30】', '127.0.0.1', '1535458960');
INSERT INTO `tp_admin_log` VALUES ('1169', '1', '修改按钮【96】', '127.0.0.1', '1535682160');
INSERT INTO `tp_admin_log` VALUES ('1170', '1', '修改按钮【97】', '127.0.0.1', '1535682178');
INSERT INTO `tp_admin_log` VALUES ('1171', '1', '修改按钮【96】', '127.0.0.1', '1535682304');
INSERT INTO `tp_admin_log` VALUES ('1172', '1', '修改按钮【97】', '127.0.0.1', '1535682325');
INSERT INTO `tp_admin_log` VALUES ('1173', '1', '添加模块【436】', '127.0.0.1', '1535699954');
INSERT INTO `tp_admin_log` VALUES ('1174', '1', '分配模块按钮【436】', '127.0.0.1', '1535699965');
INSERT INTO `tp_admin_log` VALUES ('1175', '1', '为角色【1】分配模块权限', '127.0.0.1', '1535699983');
INSERT INTO `tp_admin_log` VALUES ('1176', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1535699994');
INSERT INTO `tp_admin_log` VALUES ('1177', '1', '修改模块【436】', '127.0.0.1', '1535702227');
INSERT INTO `tp_admin_log` VALUES ('1178', '1', '添加模型【1】', '127.0.0.1', '1535709178');
INSERT INTO `tp_admin_log` VALUES ('1179', '1', '添加模型【2】', '127.0.0.1', '1535709262');
INSERT INTO `tp_admin_log` VALUES ('1180', '1', '添加模型【3】', '127.0.0.1', '1535709348');
INSERT INTO `tp_admin_log` VALUES ('1181', '1', '修改模型【1】', '127.0.0.1', '1535763085');
INSERT INTO `tp_admin_log` VALUES ('1182', '1', '修改模型【0】', '127.0.0.1', '1535764231');
INSERT INTO `tp_admin_log` VALUES ('1183', '1', '修改模型【0】', '127.0.0.1', '1535764285');
INSERT INTO `tp_admin_log` VALUES ('1184', '1', '修改模型【0】', '127.0.0.1', '1535764295');
INSERT INTO `tp_admin_log` VALUES ('1185', '1', '修改模型【0】', '127.0.0.1', '1535764327');
INSERT INTO `tp_admin_log` VALUES ('1186', '1', '修改模型【0】', '127.0.0.1', '1535764339');
INSERT INTO `tp_admin_log` VALUES ('1187', '1', '添加模型【4】', '127.0.0.1', '1535764377');
INSERT INTO `tp_admin_log` VALUES ('1188', '1', '修改模型【0】', '127.0.0.1', '1535764401');
INSERT INTO `tp_admin_log` VALUES ('1189', '1', '修改模型【0】', '127.0.0.1', '1535764417');
INSERT INTO `tp_admin_log` VALUES ('1190', '1', '修改模型【0】', '127.0.0.1', '1535764431');
INSERT INTO `tp_admin_log` VALUES ('1191', '1', '修改模型【0】', '127.0.0.1', '1535764482');
INSERT INTO `tp_admin_log` VALUES ('1192', '1', '修改模型【0】', '127.0.0.1', '1535764491');
INSERT INTO `tp_admin_log` VALUES ('1193', '1', '修改模型【0】', '127.0.0.1', '1535764503');
INSERT INTO `tp_admin_log` VALUES ('1194', '1', '修改模型【0】', '127.0.0.1', '1535764513');
INSERT INTO `tp_admin_log` VALUES ('1195', '1', '修改模型【0】', '127.0.0.1', '1535764523');
INSERT INTO `tp_admin_log` VALUES ('1196', '1', '修改模型【0】', '127.0.0.1', '1535764532');
INSERT INTO `tp_admin_log` VALUES ('1197', '1', '修改模型【0】', '127.0.0.1', '1535764621');
INSERT INTO `tp_admin_log` VALUES ('1198', '1', '修改模型【0】', '127.0.0.1', '1535764651');
INSERT INTO `tp_admin_log` VALUES ('1199', '1', '修改模型【0】', '127.0.0.1', '1535764660');
INSERT INTO `tp_admin_log` VALUES ('1200', '1', '修改模型【0】', '127.0.0.1', '1535764669');
INSERT INTO `tp_admin_log` VALUES ('1201', '1', '修改模型【0】', '127.0.0.1', '1535764677');
INSERT INTO `tp_admin_log` VALUES ('1202', '1', '修改模型【0】', '127.0.0.1', '1535764686');
INSERT INTO `tp_admin_log` VALUES ('1203', '1', '修改模型【0】', '127.0.0.1', '1535764697');
INSERT INTO `tp_admin_log` VALUES ('1204', '1', '修改模型【0】', '127.0.0.1', '1535764726');
INSERT INTO `tp_admin_log` VALUES ('1205', '1', '修改模型【0】', '127.0.0.1', '1535764762');
INSERT INTO `tp_admin_log` VALUES ('1206', '1', '修改模型【0】', '127.0.0.1', '1535764822');
INSERT INTO `tp_admin_log` VALUES ('1207', '1', '修改模型【0】', '127.0.0.1', '1535764832');
INSERT INTO `tp_admin_log` VALUES ('1208', '1', '修改模型【0】', '127.0.0.1', '1535766536');
INSERT INTO `tp_admin_log` VALUES ('1209', '1', '修改模型【0】', '127.0.0.1', '1535767069');
INSERT INTO `tp_admin_log` VALUES ('1210', '1', '修改模型【0】', '127.0.0.1', '1535767145');
INSERT INTO `tp_admin_log` VALUES ('1211', '1', '修改模型【0】', '127.0.0.1', '1535767178');
INSERT INTO `tp_admin_log` VALUES ('1212', '1', '修改模型【0】', '127.0.0.1', '1535767190');
INSERT INTO `tp_admin_log` VALUES ('1213', '1', '修改模型【0】', '127.0.0.1', '1535767202');
INSERT INTO `tp_admin_log` VALUES ('1214', '1', '修改模型【0】', '127.0.0.1', '1535767214');
INSERT INTO `tp_admin_log` VALUES ('1215', '1', '修改模型【0】', '127.0.0.1', '1535767223');
INSERT INTO `tp_admin_log` VALUES ('1216', '1', '修改模型【0】', '127.0.0.1', '1535767232');
INSERT INTO `tp_admin_log` VALUES ('1217', '1', '修改模型【0】', '127.0.0.1', '1535767239');
INSERT INTO `tp_admin_log` VALUES ('1218', '1', '修改模型【0】', '127.0.0.1', '1535767249');
INSERT INTO `tp_admin_log` VALUES ('1219', '1', '修改模型【0】', '127.0.0.1', '1535767555');
INSERT INTO `tp_admin_log` VALUES ('1220', '1', '修改模型【1】', '127.0.0.1', '1535767611');
INSERT INTO `tp_admin_log` VALUES ('1221', '1', '修改模型【1】', '127.0.0.1', '1535767637');
INSERT INTO `tp_admin_log` VALUES ('1222', '1', '修改模型【0】', '127.0.0.1', '1535767648');
INSERT INTO `tp_admin_log` VALUES ('1223', '1', '修改模型【0】', '127.0.0.1', '1535767663');
INSERT INTO `tp_admin_log` VALUES ('1224', '1', '修改模型【0】', '127.0.0.1', '1535767673');
INSERT INTO `tp_admin_log` VALUES ('1225', '1', '修改模型【0】', '127.0.0.1', '1535767689');
INSERT INTO `tp_admin_log` VALUES ('1226', '1', '修改模型【0】', '127.0.0.1', '1535767762');
INSERT INTO `tp_admin_log` VALUES ('1227', '1', '修改模型【0】', '127.0.0.1', '1535767771');
INSERT INTO `tp_admin_log` VALUES ('1228', '1', '修改模型【0】', '127.0.0.1', '1535767783');
INSERT INTO `tp_admin_log` VALUES ('1229', '1', '修改模型【0】', '127.0.0.1', '1535767799');
INSERT INTO `tp_admin_log` VALUES ('1230', '1', '修改模型【0】', '127.0.0.1', '1535767811');
INSERT INTO `tp_admin_log` VALUES ('1231', '1', '修改模型【0】', '127.0.0.1', '1535767837');
INSERT INTO `tp_admin_log` VALUES ('1232', '1', '修改模型【0】', '127.0.0.1', '1535767863');
INSERT INTO `tp_admin_log` VALUES ('1233', '1', '修改模型【0】', '127.0.0.1', '1535767874');
INSERT INTO `tp_admin_log` VALUES ('1234', '1', '删除模型【2】', '127.0.0.1', '1535768393');
INSERT INTO `tp_admin_log` VALUES ('1235', '1', '修改模型【0】', '127.0.0.1', '1535768416');
INSERT INTO `tp_admin_log` VALUES ('1236', '1', '修改模型【0】', '127.0.0.1', '1535768426');
INSERT INTO `tp_admin_log` VALUES ('1237', '1', '删除模型【2】', '127.0.0.1', '1535768445');
INSERT INTO `tp_admin_log` VALUES ('1238', '1', '分配模块按钮【430】', '127.0.0.1', '1535768549');
INSERT INTO `tp_admin_log` VALUES ('1239', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1535768567');
INSERT INTO `tp_admin_log` VALUES ('1240', '1', '修改按钮【105】', '127.0.0.1', '1535768714');
INSERT INTO `tp_admin_log` VALUES ('1241', '1', '修改按钮【105】', '127.0.0.1', '1535768884');
INSERT INTO `tp_admin_log` VALUES ('1242', '1', '修改按钮【105】', '127.0.0.1', '1535772964');
INSERT INTO `tp_admin_log` VALUES ('1243', '1', '添加模型【5】', '127.0.0.1', '1535866086');
INSERT INTO `tp_admin_log` VALUES ('1244', '1', '修改模型【0】', '127.0.0.1', '1535866098');
INSERT INTO `tp_admin_log` VALUES ('1245', '1', '添加规格【4】', '127.0.0.1', '1535868411');
INSERT INTO `tp_admin_log` VALUES ('1246', '1', '添加规格【5】', '127.0.0.1', '1535868490');
INSERT INTO `tp_admin_log` VALUES ('1247', '1', '添加规格【6】', '127.0.0.1', '1535868845');
INSERT INTO `tp_admin_log` VALUES ('1248', '1', '修改规格【6】', '127.0.0.1', '1535868855');
INSERT INTO `tp_admin_log` VALUES ('1249', '1', '修改规格【6】', '127.0.0.1', '1535868869');
INSERT INTO `tp_admin_log` VALUES ('1250', '1', '修改规格【6】', '127.0.0.1', '1535868879');
INSERT INTO `tp_admin_log` VALUES ('1251', '1', '添加规格【1】', '127.0.0.1', '1535869322');
INSERT INTO `tp_admin_log` VALUES ('1252', '1', '添加规格【2】', '127.0.0.1', '1535869341');
INSERT INTO `tp_admin_log` VALUES ('1253', '1', '添加规格【3】', '127.0.0.1', '1535869385');
INSERT INTO `tp_admin_log` VALUES ('1254', '1', '修改规格【3】', '127.0.0.1', '1535869395');
INSERT INTO `tp_admin_log` VALUES ('1255', '1', '修改规格【3】', '127.0.0.1', '1535869414');
INSERT INTO `tp_admin_log` VALUES ('1256', '1', '修改规格【3】', '127.0.0.1', '1535869432');
INSERT INTO `tp_admin_log` VALUES ('1257', '1', '删除规格【2,3】', '127.0.0.1', '1535962003');
INSERT INTO `tp_admin_log` VALUES ('1258', '1', '修改商品分类分类【1】', '127.0.0.1', '1535962218');
INSERT INTO `tp_admin_log` VALUES ('1259', '1', '修改商品分类分类【2】', '127.0.0.1', '1535962237');
INSERT INTO `tp_admin_log` VALUES ('1260', '1', '修改商品分类分类【3】', '127.0.0.1', '1535962261');
INSERT INTO `tp_admin_log` VALUES ('1261', '1', '修改商品分类分类【4】', '127.0.0.1', '1535962282');
INSERT INTO `tp_admin_log` VALUES ('1262', '1', '修改商品分类分类【6】', '127.0.0.1', '1535962300');
INSERT INTO `tp_admin_log` VALUES ('1263', '1', '修改商品分类分类【1】', '127.0.0.1', '1535962401');
INSERT INTO `tp_admin_log` VALUES ('1264', '1', '修改商品分类分类【2】', '127.0.0.1', '1535962411');
INSERT INTO `tp_admin_log` VALUES ('1265', '1', '修改商品分类分类【11】', '127.0.0.1', '1535962426');
INSERT INTO `tp_admin_log` VALUES ('1266', '1', '修改商品分类分类【14】', '127.0.0.1', '1535962437');
INSERT INTO `tp_admin_log` VALUES ('1267', '1', '修改商品分类分类【15】', '127.0.0.1', '1535962450');
INSERT INTO `tp_admin_log` VALUES ('1268', '1', '修改商品分类分类【3】', '127.0.0.1', '1535962458');
INSERT INTO `tp_admin_log` VALUES ('1269', '1', '为角色【1】分配模块权限', '127.0.0.1', '1535962484');
INSERT INTO `tp_admin_log` VALUES ('1270', '1', '修改品牌【1】', '127.0.0.1', '1535962637');
INSERT INTO `tp_admin_log` VALUES ('1271', '1', '修改品牌【2】', '127.0.0.1', '1535962653');
INSERT INTO `tp_admin_log` VALUES ('1272', '1', '修改规格【1】', '127.0.0.1', '1535962797');
INSERT INTO `tp_admin_log` VALUES ('1273', '1', '修改模型【1】', '127.0.0.1', '1535963270');
INSERT INTO `tp_admin_log` VALUES ('1274', '1', '修改模型【0】', '127.0.0.1', '1535963285');
INSERT INTO `tp_admin_log` VALUES ('1275', '1', '删除模型【5,3,4】', '127.0.0.1', '1535963292');
INSERT INTO `tp_admin_log` VALUES ('1276', '1', '添加模块【437】', '127.0.0.1', '1536024058');
INSERT INTO `tp_admin_log` VALUES ('1277', '1', '分配模块按钮【437】', '127.0.0.1', '1536024069');
INSERT INTO `tp_admin_log` VALUES ('1278', '1', '为角色【1】分配模块权限', '127.0.0.1', '1536024081');
INSERT INTO `tp_admin_log` VALUES ('1279', '1', '为角色【1】分配模块权限', '127.0.0.1', '1536024092');
INSERT INTO `tp_admin_log` VALUES ('1280', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1536024104');
INSERT INTO `tp_admin_log` VALUES ('1281', '1', '添加问题【0】', '127.0.0.1', '1536030310');
INSERT INTO `tp_admin_log` VALUES ('1282', '1', '添加问题【0】', '127.0.0.1', '1536030324');
INSERT INTO `tp_admin_log` VALUES ('1283', '1', '添加问题【0】', '127.0.0.1', '1536030340');
INSERT INTO `tp_admin_log` VALUES ('1284', '1', '添加问题【0】', '127.0.0.1', '1536030355');
INSERT INTO `tp_admin_log` VALUES ('1285', '1', '修改问题【4】', '127.0.0.1', '1536030413');
INSERT INTO `tp_admin_log` VALUES ('1286', '1', '删除问题【4】', '127.0.0.1', '1536030422');
INSERT INTO `tp_admin_log` VALUES ('1287', '1', '删除问题【3】', '127.0.0.1', '1536030428');
INSERT INTO `tp_admin_log` VALUES ('1288', '1', '添加问题【0】', '127.0.0.1', '1536030437');
INSERT INTO `tp_admin_log` VALUES ('1289', '1', '添加问题【0】', '127.0.0.1', '1536030443');
INSERT INTO `tp_admin_log` VALUES ('1290', '1', '添加规格【4】', '127.0.0.1', '1536127016');
INSERT INTO `tp_admin_log` VALUES ('1291', '1', '修改规格【1】', '127.0.0.1', '1536145687');
INSERT INTO `tp_admin_log` VALUES ('1292', '1', '添加规格【5】', '127.0.0.1', '1536236501');
INSERT INTO `tp_admin_log` VALUES ('1293', '1', '添加模型【6】', '127.0.0.1', '1536281280');
INSERT INTO `tp_admin_log` VALUES ('1294', '1', '添加品牌【5】', '127.0.0.1', '1536633809');
INSERT INTO `tp_admin_log` VALUES ('1295', '1', '添加品牌【6】', '127.0.0.1', '1536633919');
INSERT INTO `tp_admin_log` VALUES ('1296', '1', '修改品牌【6】', '127.0.0.1', '1536634112');
INSERT INTO `tp_admin_log` VALUES ('1297', '1', '修改品牌【6】', '127.0.0.1', '1536634123');
INSERT INTO `tp_admin_log` VALUES ('1298', '1', '修改模型【0】', '127.0.0.1', '1536649802');
INSERT INTO `tp_admin_log` VALUES ('1299', '1', '修改规格【1】', '127.0.0.1', '1536737676');
INSERT INTO `tp_admin_log` VALUES ('1300', '1', '修改规格【5】', '127.0.0.1', '1536737718');
INSERT INTO `tp_admin_log` VALUES ('1301', '1', '添加规格【6】', '127.0.0.1', '1536807117');
INSERT INTO `tp_admin_log` VALUES ('1302', '1', '添加规格【7】', '127.0.0.1', '1536809521');
INSERT INTO `tp_admin_log` VALUES ('1303', '1', '添加规格【8】', '127.0.0.1', '1536809639');
INSERT INTO `tp_admin_log` VALUES ('1304', '1', '添加规格【9】', '127.0.0.1', '1536809687');
INSERT INTO `tp_admin_log` VALUES ('1305', '1', '添加规格【10】', '127.0.0.1', '1536809890');
INSERT INTO `tp_admin_log` VALUES ('1306', '1', '添加规格【11】', '127.0.0.1', '1536809949');
INSERT INTO `tp_admin_log` VALUES ('1307', '1', '修改门店【2】', '127.0.0.1', '1536839998');
INSERT INTO `tp_admin_log` VALUES ('1308', '1', '添加规格【12】', '127.0.0.1', '1536840039');
INSERT INTO `tp_admin_log` VALUES ('1309', '1', '添加模型【7】', '127.0.0.1', '1536840063');
INSERT INTO `tp_admin_log` VALUES ('1310', '1', '添加商品分类分类【16】', '127.0.0.1', '1536885675');
INSERT INTO `tp_admin_log` VALUES ('1311', '1', '删除商品分类【16】', '127.0.0.1', '1536885685');
INSERT INTO `tp_admin_log` VALUES ('1312', '1', '添加文章分类【14】', '127.0.0.1', '1536885700');
INSERT INTO `tp_admin_log` VALUES ('1313', '1', '修改文章分类【14】', '127.0.0.1', '1536885712');
INSERT INTO `tp_admin_log` VALUES ('1314', '1', '删除文章分类【14】', '127.0.0.1', '1536885717');
INSERT INTO `tp_admin_log` VALUES ('1315', '1', '添加文章【69】', '127.0.0.1', '1536885737');
INSERT INTO `tp_admin_log` VALUES ('1316', '1', '添加规格【13】', '127.0.0.1', '1536887469');
INSERT INTO `tp_admin_log` VALUES ('1317', '1', '添加商品分类分类【17】', '127.0.0.1', '1536888161');
INSERT INTO `tp_admin_log` VALUES ('1318', '1', '添加商品分类分类【18】', '127.0.0.1', '1536892393');
INSERT INTO `tp_admin_log` VALUES ('1319', '1', '删除商品分类【17】', '127.0.0.1', '1536892401');
INSERT INTO `tp_admin_log` VALUES ('1320', '1', '添加商品分类分类【19】', '127.0.0.1', '1536892428');
INSERT INTO `tp_admin_log` VALUES ('1321', '1', '删除商品分类【15】', '127.0.0.1', '1536892493');
INSERT INTO `tp_admin_log` VALUES ('1322', '1', '删除商品分类【19】', '127.0.0.1', '1536892512');
INSERT INTO `tp_admin_log` VALUES ('1323', '1', '添加文章分类【15】', '127.0.0.1', '1536908604');
INSERT INTO `tp_admin_log` VALUES ('1324', '1', '删除文章分类【15】', '127.0.0.1', '1536908613');
INSERT INTO `tp_admin_log` VALUES ('1325', '1', '删除文章分类【13】', '127.0.0.1', '1536908638');
INSERT INTO `tp_admin_log` VALUES ('1326', '1', '删除文章分类【12】', '127.0.0.1', '1536908665');
INSERT INTO `tp_admin_log` VALUES ('1327', '1', '删除文章分类【11】', '127.0.0.1', '1536908702');
INSERT INTO `tp_admin_log` VALUES ('1328', '1', '删除文章分类【3】', '127.0.0.1', '1536908799');
INSERT INTO `tp_admin_log` VALUES ('1329', '1', '删除文章【69】', '127.0.0.1', '1536908817');
INSERT INTO `tp_admin_log` VALUES ('1330', '1', '删除文章【64】', '127.0.0.1', '1536908876');
INSERT INTO `tp_admin_log` VALUES ('1331', '1', '删除文章【33】', '127.0.0.1', '1536908927');
INSERT INTO `tp_admin_log` VALUES ('1332', '1', '删除文章【30】', '127.0.0.1', '1536908944');
INSERT INTO `tp_admin_log` VALUES ('1333', '1', '删除文章【65】', '127.0.0.1', '1536908973');
INSERT INTO `tp_admin_log` VALUES ('1334', '1', '删除文章【28】', '127.0.0.1', '1536909013');
INSERT INTO `tp_admin_log` VALUES ('1335', '1', '删除文章【25】', '127.0.0.1', '1536909045');
INSERT INTO `tp_admin_log` VALUES ('1336', '1', '删除文章【15】', '127.0.0.1', '1536909118');
INSERT INTO `tp_admin_log` VALUES ('1337', '1', '删除文章【14】', '127.0.0.1', '1536909162');
INSERT INTO `tp_admin_log` VALUES ('1338', '1', '删除文章【4】', '127.0.0.1', '1536909263');
INSERT INTO `tp_admin_log` VALUES ('1339', '1', '添加文章分类【16】', '127.0.0.1', '1536909286');
INSERT INTO `tp_admin_log` VALUES ('1340', '1', '添加文章分类【17】', '127.0.0.1', '1536909293');
INSERT INTO `tp_admin_log` VALUES ('1341', '1', '修改文章分类【16】', '127.0.0.1', '1536909303');
INSERT INTO `tp_admin_log` VALUES ('1342', '1', '删除文章分类【16】', '127.0.0.1', '1536909315');
INSERT INTO `tp_admin_log` VALUES ('1343', '1', '删除文章【24】', '127.0.0.1', '1536909328');
INSERT INTO `tp_admin_log` VALUES ('1344', '1', '删除文章【23】', '127.0.0.1', '1536909344');
INSERT INTO `tp_admin_log` VALUES ('1345', '1', '删除文章【19】', '127.0.0.1', '1536909367');
INSERT INTO `tp_admin_log` VALUES ('1346', '1', '删除文章分类【17】', '127.0.0.1', '1536909395');
INSERT INTO `tp_admin_log` VALUES ('1347', '1', '删除文章【17】', '127.0.0.1', '1536909424');
INSERT INTO `tp_admin_log` VALUES ('1348', '1', '删除文章【3】', '127.0.0.1', '1536909546');
INSERT INTO `tp_admin_log` VALUES ('1349', '1', '删除文章【1】', '127.0.0.1', '1536909568');
INSERT INTO `tp_admin_log` VALUES ('1350', '1', '删除文章【6】', '127.0.0.1', '1536909615');
INSERT INTO `tp_admin_log` VALUES ('1351', '1', '删除文章分类【6】', '127.0.0.1', '1536909644');
INSERT INTO `tp_admin_log` VALUES ('1352', '1', '删除文章分类【4】', '127.0.0.1', '1536909663');
INSERT INTO `tp_admin_log` VALUES ('1353', '1', '删除文章分类【2】', '127.0.0.1', '1536909694');
INSERT INTO `tp_admin_log` VALUES ('1354', '1', '添加文章【70】', '127.0.0.1', '1536909778');
INSERT INTO `tp_admin_log` VALUES ('1355', '1', '添加文章【71】', '127.0.0.1', '1536909791');
INSERT INTO `tp_admin_log` VALUES ('1356', '1', '添加文章【72】', '127.0.0.1', '1536909840');
INSERT INTO `tp_admin_log` VALUES ('1357', '1', '审核文章【72】', '127.0.0.1', '1536909851');
INSERT INTO `tp_admin_log` VALUES ('1358', '1', '屏蔽文章【72】', '127.0.0.1', '1536909858');
INSERT INTO `tp_admin_log` VALUES ('1359', '1', '删除文章【72】', '127.0.0.1', '1536909863');
INSERT INTO `tp_admin_log` VALUES ('1360', '1', '删除文章【71】', '127.0.0.1', '1536909879');
INSERT INTO `tp_admin_log` VALUES ('1361', '1', '添加文章分类【18】', '127.0.0.1', '1536909890');
INSERT INTO `tp_admin_log` VALUES ('1362', '1', '添加文章分类【19】', '127.0.0.1', '1536909899');
INSERT INTO `tp_admin_log` VALUES ('1363', '1', '修改文章分类【18】', '127.0.0.1', '1536909908');
INSERT INTO `tp_admin_log` VALUES ('1364', '1', '删除文章分类【18】', '127.0.0.1', '1536909914');
INSERT INTO `tp_admin_log` VALUES ('1365', '1', '添加商品分类分类【20】', '127.0.0.1', '1536909954');
INSERT INTO `tp_admin_log` VALUES ('1366', '1', '修改商品分类分类【20】', '127.0.0.1', '1536909967');
INSERT INTO `tp_admin_log` VALUES ('1367', '1', '删除商品分类【20】', '127.0.0.1', '1536909973');
INSERT INTO `tp_admin_log` VALUES ('1368', '1', '添加文章【73】', '127.0.0.1', '1536909993');
INSERT INTO `tp_admin_log` VALUES ('1369', '1', '添加品牌【7】', '127.0.0.1', '1536910868');
INSERT INTO `tp_admin_log` VALUES ('1370', '1', '修改规格【1】', '127.0.0.1', '1536910899');
INSERT INTO `tp_admin_log` VALUES ('1371', '1', '修改规格【5】', '127.0.0.1', '1536910910');
INSERT INTO `tp_admin_log` VALUES ('1372', '1', '删除规格【6】', '127.0.0.1', '1536910920');
INSERT INTO `tp_admin_log` VALUES ('1373', '1', '删除规格【10,11,13】', '127.0.0.1', '1536910930');
INSERT INTO `tp_admin_log` VALUES ('1374', '1', '添加规格【14】', '127.0.0.1', '1536911062');
INSERT INTO `tp_admin_log` VALUES ('1375', '1', '添加规格【15】', '127.0.0.1', '1536911506');
INSERT INTO `tp_admin_log` VALUES ('1376', '1', '添加规格【16】', '127.0.0.1', '1536911658');
INSERT INTO `tp_admin_log` VALUES ('1377', '1', '添加规格【17】', '127.0.0.1', '1536911752');
INSERT INTO `tp_admin_log` VALUES ('1378', '1', '添加规格【18】', '127.0.0.1', '1536911816');
INSERT INTO `tp_admin_log` VALUES ('1379', '1', '添加规格【19】', '127.0.0.1', '1536911861');
INSERT INTO `tp_admin_log` VALUES ('1380', '1', '添加规格【20】', '127.0.0.1', '1536911903');
INSERT INTO `tp_admin_log` VALUES ('1381', '1', '添加规格【21】', '127.0.0.1', '1536912126');
INSERT INTO `tp_admin_log` VALUES ('1382', '1', '添加规格【22】', '127.0.0.1', '1536912264');
INSERT INTO `tp_admin_log` VALUES ('1383', '1', '添加规格【23】', '127.0.0.1', '1536913406');
INSERT INTO `tp_admin_log` VALUES ('1384', '1', '添加规格【24】', '127.0.0.1', '1536913849');
INSERT INTO `tp_admin_log` VALUES ('1385', '1', '添加规格【25】', '127.0.0.1', '1536914070');
INSERT INTO `tp_admin_log` VALUES ('1386', '1', '添加规格【26】', '127.0.0.1', '1536914137');
INSERT INTO `tp_admin_log` VALUES ('1387', '1', '添加规格【27】', '127.0.0.1', '1536917905');
INSERT INTO `tp_admin_log` VALUES ('1388', '1', '添加规格【28】', '127.0.0.1', '1536918355');
INSERT INTO `tp_admin_log` VALUES ('1389', '1', '添加规格【29】', '127.0.0.1', '1536918405');
INSERT INTO `tp_admin_log` VALUES ('1390', '1', '添加模型【8】', '127.0.0.1', '1536918701');
INSERT INTO `tp_admin_log` VALUES ('1391', '1', '添加模型【9】', '127.0.0.1', '1536925171');
INSERT INTO `tp_admin_log` VALUES ('1392', '1', '添加模型【10】', '127.0.0.1', '1536925221');
INSERT INTO `tp_admin_log` VALUES ('1393', '1', '添加模型【11】', '127.0.0.1', '1536925234');
INSERT INTO `tp_admin_log` VALUES ('1394', '1', '添加模型【12】', '127.0.0.1', '1536925326');
INSERT INTO `tp_admin_log` VALUES ('1395', '1', '添加模型【13】', '127.0.0.1', '1536925472');
INSERT INTO `tp_admin_log` VALUES ('1396', '1', '添加模型【14】', '127.0.0.1', '1536925746');
INSERT INTO `tp_admin_log` VALUES ('1397', '1', '添加模型【15】', '127.0.0.1', '1536925870');
INSERT INTO `tp_admin_log` VALUES ('1398', '1', '添加模型【16】', '127.0.0.1', '1536925917');
INSERT INTO `tp_admin_log` VALUES ('1399', '1', '删除模型【8,7,9,10,11,12,13,14,15】', '127.0.0.1', '1536925936');
INSERT INTO `tp_admin_log` VALUES ('1400', '1', '删除模型【16】', '127.0.0.1', '1536925942');
INSERT INTO `tp_admin_log` VALUES ('1401', '1', '添加模型【17】', '127.0.0.1', '1536925985');
INSERT INTO `tp_admin_log` VALUES ('1402', '1', '添加模型【18】', '127.0.0.1', '1536926040');
INSERT INTO `tp_admin_log` VALUES ('1403', '1', '添加模型【19】', '127.0.0.1', '1536926094');
INSERT INTO `tp_admin_log` VALUES ('1404', '1', '添加模型【20】', '127.0.0.1', '1536929783');
INSERT INTO `tp_admin_log` VALUES ('1405', '1', '添加模型【21】', '127.0.0.1', '1536929871');
INSERT INTO `tp_admin_log` VALUES ('1406', '1', '添加模型【22】', '127.0.0.1', '1536930145');
INSERT INTO `tp_admin_log` VALUES ('1407', '1', '添加模型【23】', '127.0.0.1', '1536930228');
INSERT INTO `tp_admin_log` VALUES ('1408', '1', '添加模型【24】', '127.0.0.1', '1536973843');
INSERT INTO `tp_admin_log` VALUES ('1409', '1', '添加模型【25】', '127.0.0.1', '1536973915');
INSERT INTO `tp_admin_log` VALUES ('1410', '1', '添加模型【26】', '127.0.0.1', '1536974204');
INSERT INTO `tp_admin_log` VALUES ('1411', '1', '添加模型【27】', '127.0.0.1', '1536974679');
INSERT INTO `tp_admin_log` VALUES ('1412', '1', '添加模型【28】', '127.0.0.1', '1536974731');
INSERT INTO `tp_admin_log` VALUES ('1413', '1', '添加模型【29】', '127.0.0.1', '1536975335');
INSERT INTO `tp_admin_log` VALUES ('1414', '1', '删除模型【26,25,24,23,22,21,20,19,18】', '127.0.0.1', '1536975459');
INSERT INTO `tp_admin_log` VALUES ('1415', '1', '删除模型【17,27,28,29】', '127.0.0.1', '1536975466');
INSERT INTO `tp_admin_log` VALUES ('1416', '1', '添加模型【30】', '127.0.0.1', '1536975569');
INSERT INTO `tp_admin_log` VALUES ('1417', '1', '添加模型【31】', '127.0.0.1', '1536975717');
INSERT INTO `tp_admin_log` VALUES ('1418', '1', '添加模型【32】', '127.0.0.1', '1536975780');
INSERT INTO `tp_admin_log` VALUES ('1419', '1', '删除模型【32,31,30】', '127.0.0.1', '1536975852');
INSERT INTO `tp_admin_log` VALUES ('1420', '1', '添加模型【33】', '127.0.0.1', '1536975874');
INSERT INTO `tp_admin_log` VALUES ('1421', '1', '添加模型【34】', '127.0.0.1', '1536975911');
INSERT INTO `tp_admin_log` VALUES ('1422', '1', '添加属性【1111】', '127.0.0.1', '1536991437');
INSERT INTO `tp_admin_log` VALUES ('1423', '1', '添加属性【222】', '127.0.0.1', '1536991771');
INSERT INTO `tp_admin_log` VALUES ('1424', '1', '添加属性【333】', '127.0.0.1', '1536992201');
INSERT INTO `tp_admin_log` VALUES ('1425', '1', '添加属性【8888】', '127.0.0.1', '1536992288');
INSERT INTO `tp_admin_log` VALUES ('1426', '1', '删除文章【100,98,99】', '127.0.0.1', '1536992338');
INSERT INTO `tp_admin_log` VALUES ('1427', '1', '删除文章【111,110,109,108,107,106,105,104,103,102,101】', '127.0.0.1', '1536992347');
INSERT INTO `tp_admin_log` VALUES ('1428', '1', '删除文章【111,110,109,108,107,106,105,104,103,102,101】', '127.0.0.1', '1536992352');
INSERT INTO `tp_admin_log` VALUES ('1429', '1', '删除文章【111,110,109,108,107,106,105,104,103,102,101】', '127.0.0.1', '1536992360');
INSERT INTO `tp_admin_log` VALUES ('1430', '1', '成功删除商品【111,110,109,108,107,106,105,104,103,102,101】', '127.0.0.1', '1536993594');
INSERT INTO `tp_admin_log` VALUES ('1431', '1', '成功删除商品【111,110,109,108,107,106,105,104,103,102,101】', '127.0.0.1', '1536993735');
INSERT INTO `tp_admin_log` VALUES ('1432', '1', '成功删除商品【100,98,99】', '127.0.0.1', '1536993741');
INSERT INTO `tp_admin_log` VALUES ('1433', '1', '删除规格【18,19,20,21,22,23,24,25,26,27,28】', '127.0.0.1', '1536993839');
INSERT INTO `tp_admin_log` VALUES ('1434', '1', '删除规格【16,7,8,9,15,12,14,17】', '127.0.0.1', '1536993852');
INSERT INTO `tp_admin_log` VALUES ('1435', '1', '删除规格【29】', '127.0.0.1', '1536993858');
INSERT INTO `tp_admin_log` VALUES ('1436', '1', '修改规格【1】', '127.0.0.1', '1536993873');
INSERT INTO `tp_admin_log` VALUES ('1437', '1', '修改规格【1】', '127.0.0.1', '1536994001');
INSERT INTO `tp_admin_log` VALUES ('1438', '1', '删除模型【34,33】', '127.0.0.1', '1536994012');
INSERT INTO `tp_admin_log` VALUES ('1439', '1', '修改模型【0】', '127.0.0.1', '1536994020');
INSERT INTO `tp_admin_log` VALUES ('1440', '1', '修改模型【0】', '127.0.0.1', '1536994082');
INSERT INTO `tp_admin_log` VALUES ('1441', '1', '修改模型【0】', '127.0.0.1', '1536994106');
INSERT INTO `tp_admin_log` VALUES ('1442', '1', '修改模型【0】', '127.0.0.1', '1536994903');
INSERT INTO `tp_admin_log` VALUES ('1443', '1', '修改模型【0】', '127.0.0.1', '1536996849');
INSERT INTO `tp_admin_log` VALUES ('1444', '1', '修改模型【0】', '127.0.0.1', '1536997038');
INSERT INTO `tp_admin_log` VALUES ('1445', '1', '删除商品分类【18】', '127.0.0.1', '1536997073');
INSERT INTO `tp_admin_log` VALUES ('1446', '1', '添加模块【438】', '127.0.0.1', '1537007201');
INSERT INTO `tp_admin_log` VALUES ('1447', '1', '添加模块【439】', '127.0.0.1', '1537007226');
INSERT INTO `tp_admin_log` VALUES ('1448', '1', '添加模块【440】', '127.0.0.1', '1537007321');
INSERT INTO `tp_admin_log` VALUES ('1449', '1', '为角色【1】分配模块权限', '127.0.0.1', '1537007337');
INSERT INTO `tp_admin_log` VALUES ('1450', '1', '分配模块按钮【439】', '127.0.0.1', '1537007376');
INSERT INTO `tp_admin_log` VALUES ('1451', '1', '分配模块按钮【439】', '127.0.0.1', '1537007395');
INSERT INTO `tp_admin_log` VALUES ('1452', '1', '分配模块按钮【440】', '127.0.0.1', '1537007436');
INSERT INTO `tp_admin_log` VALUES ('1453', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1537007454');
INSERT INTO `tp_admin_log` VALUES ('1454', '1', '为角色【1】分配模块权限', '127.0.0.1', '1537007524');
INSERT INTO `tp_admin_log` VALUES ('1455', '1', '为角色【1】分配模块权限', '127.0.0.1', '1537007846');
INSERT INTO `tp_admin_log` VALUES ('1456', '1', '删除管理员【5,7,9,10,11,12,30】', '127.0.0.1', '1537018916');
INSERT INTO `tp_admin_log` VALUES ('1457', '1', '删除角色【15,11,12】', '127.0.0.1', '1537018949');
INSERT INTO `tp_admin_log` VALUES ('1458', '1', '为角色【1】分配模块权限', '127.0.0.1', '1537018979');
INSERT INTO `tp_admin_log` VALUES ('1459', '1', '修改文章分类【1】', '127.0.0.1', '1537019099');
INSERT INTO `tp_admin_log` VALUES ('1460', '1', '删除广告【14】', '127.0.0.1', '1537019219');
INSERT INTO `tp_admin_log` VALUES ('1461', '1', '删除广告【15】', '127.0.0.1', '1537019225');
INSERT INTO `tp_admin_log` VALUES ('1462', '1', '修改广告【17】', '127.0.0.1', '1537019233');
INSERT INTO `tp_admin_log` VALUES ('1463', '1', '删除广告位【8,2,6】', '127.0.0.1', '1537019275');
INSERT INTO `tp_admin_log` VALUES ('1464', '1', '修改模块【336】', '127.0.0.1', '1537019377');
INSERT INTO `tp_admin_log` VALUES ('1465', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1537019513');
INSERT INTO `tp_admin_log` VALUES ('1466', '1', '添加模型【35】', '127.0.0.1', '1537263881');
INSERT INTO `tp_admin_log` VALUES ('1467', '1', '添加属性【衣领】', '127.0.0.1', '1537263906');
INSERT INTO `tp_admin_log` VALUES ('1468', '1', '屏蔽商品【112】', '127.0.0.1', '1537269159');
INSERT INTO `tp_admin_log` VALUES ('1469', '1', '审核商品【114】', '127.0.0.1', '1537269165');
INSERT INTO `tp_admin_log` VALUES ('1470', '1', '添加模块【441】', '127.0.0.1', '1537321954');
INSERT INTO `tp_admin_log` VALUES ('1471', '1', '分配模块按钮【441】', '127.0.0.1', '1537322038');
INSERT INTO `tp_admin_log` VALUES ('1472', '1', '修改模块【441】', '127.0.0.1', '1537322052');
INSERT INTO `tp_admin_log` VALUES ('1473', '1', '分配模块按钮【441】', '127.0.0.1', '1537322064');
INSERT INTO `tp_admin_log` VALUES ('1474', '1', '分配模块按钮【441】', '127.0.0.1', '1537322124');
INSERT INTO `tp_admin_log` VALUES ('1475', '1', '为角色【1】分配模块权限', '127.0.0.1', '1537322142');
INSERT INTO `tp_admin_log` VALUES ('1476', '1', '为角色【1】分配模块权限', '127.0.0.1', '1537322202');
INSERT INTO `tp_admin_log` VALUES ('1477', '1', '为角色【1】分配模块权限', '127.0.0.1', '1537322221');
INSERT INTO `tp_admin_log` VALUES ('1478', '1', '为角色【1】分配模块权限', '127.0.0.1', '1537322239');
INSERT INTO `tp_admin_log` VALUES ('1479', '1', '分配模块按钮【441】', '127.0.0.1', '1537322259');
INSERT INTO `tp_admin_log` VALUES ('1480', '1', '分配模块按钮【441】', '127.0.0.1', '1537322267');
INSERT INTO `tp_admin_log` VALUES ('1481', '1', '为角色【1】分配模块权限', '127.0.0.1', '1537322281');
INSERT INTO `tp_admin_log` VALUES ('1482', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1537322304');
INSERT INTO `tp_admin_log` VALUES ('1483', '1', '删除模块【433】', '127.0.0.1', '1561711984');
INSERT INTO `tp_admin_log` VALUES ('1484', '1', '删除模块【328】', '127.0.0.1', '1561711995');
INSERT INTO `tp_admin_log` VALUES ('1485', '1', '删除模块【427】', '127.0.0.1', '1561712005');
INSERT INTO `tp_admin_log` VALUES ('1486', '1', '删除模块【211】', '127.0.0.1', '1561712025');
INSERT INTO `tp_admin_log` VALUES ('1487', '1', '删除模块【210】', '127.0.0.1', '1561712078');
INSERT INTO `tp_admin_log` VALUES ('1488', '1', '删除模块【345】', '127.0.0.1', '1561712154');
INSERT INTO `tp_admin_log` VALUES ('1489', '1', '删除模块【291】', '127.0.0.1', '1561712160');
INSERT INTO `tp_admin_log` VALUES ('1490', '1', '删除文章【21,20,18,16,13,12,11,10,9,2】', '127.0.0.1', '1561713500');
INSERT INTO `tp_admin_log` VALUES ('1491', '1', '删除模块【251】', '127.0.0.1', '1561945161');
INSERT INTO `tp_admin_log` VALUES ('1492', '1', '添加模块【442】', '127.0.0.1', '1561945627');
INSERT INTO `tp_admin_log` VALUES ('1493', '1', '分配模块按钮【442】', '127.0.0.1', '1561945638');
INSERT INTO `tp_admin_log` VALUES ('1494', '1', '为角色【1】分配模块权限', '127.0.0.1', '1561945650');
INSERT INTO `tp_admin_log` VALUES ('1495', '1', '为角色【1】编辑按钮权限', '127.0.0.1', '1561945663');
INSERT INTO `tp_admin_log` VALUES ('1496', '1', '添加用户【1】', '127.0.0.1', '1561965015');
INSERT INTO `tp_admin_log` VALUES ('1497', '1', '修改用户【1】', '127.0.0.1', '1561965113');
INSERT INTO `tp_admin_log` VALUES ('1498', '1', '修改用户【1】', '127.0.0.1', '1561965483');
INSERT INTO `tp_admin_log` VALUES ('1499', '1', '修改模块【209】', '127.0.0.1', '1561965529');
INSERT INTO `tp_admin_log` VALUES ('1500', '1', '修改用户【1】', '127.0.0.1', '1561975092');

-- ----------------------------
-- Table structure for tp_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_login_log`;
CREATE TABLE `tp_admin_login_log` (
  `log_id` bigint(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `admin_id` int(10) DEFAULT NULL COMMENT '管理员id',
  `log_info` varchar(255) DEFAULT NULL COMMENT '日志描述',
  `log_ip` varchar(30) DEFAULT NULL COMMENT 'ip地址',
  `log_url` varchar(50) DEFAULT NULL COMMENT 'url',
  `log_time` int(10) DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_admin_login_log
-- ----------------------------
INSERT INTO `tp_admin_login_log` VALUES ('1', '1', '后台登录', '127.0.0.1', null, '1535446569');
INSERT INTO `tp_admin_login_log` VALUES ('2', '30', '后台登录', '127.0.0.1', null, '1535458997');
INSERT INTO `tp_admin_login_log` VALUES ('3', '1', '后台登录', '127.0.0.1', null, '1535503350');
INSERT INTO `tp_admin_login_log` VALUES ('4', '1', '后台登录', '127.0.0.1', null, '1535513649');
INSERT INTO `tp_admin_login_log` VALUES ('5', '1', '后台登录', '127.0.0.1', null, '1535600492');
INSERT INTO `tp_admin_login_log` VALUES ('6', '1', '后台登录', '127.0.0.1', null, '1535680729');
INSERT INTO `tp_admin_login_log` VALUES ('7', '1', '后台登录', '127.0.0.1', null, '1535762735');
INSERT INTO `tp_admin_login_log` VALUES ('8', '1', '后台登录', '127.0.0.1', null, '1535768225');
INSERT INTO `tp_admin_login_log` VALUES ('9', '1', '后台登录', '127.0.0.1', null, '1535771477');
INSERT INTO `tp_admin_login_log` VALUES ('10', '1', '后台登录', '127.0.0.1', null, '1535852590');
INSERT INTO `tp_admin_login_log` VALUES ('11', '1', '后台登录', '127.0.0.1', null, '1535937039');
INSERT INTO `tp_admin_login_log` VALUES ('12', '1', '后台登录', '127.0.0.1', null, '1536021416');
INSERT INTO `tp_admin_login_log` VALUES ('13', '1', '后台登录', '127.0.0.1', null, '1536107861');
INSERT INTO `tp_admin_login_log` VALUES ('14', '1', '后台登录', '127.0.0.1', null, '1536197768');
INSERT INTO `tp_admin_login_log` VALUES ('15', '1', '后台登录', '127.0.0.1', null, '1536280218');
INSERT INTO `tp_admin_login_log` VALUES ('16', '1', '后台登录', '127.0.0.1', null, '1536369454');
INSERT INTO `tp_admin_login_log` VALUES ('17', '1', '后台登录', '127.0.0.1', null, '1536545090');
INSERT INTO `tp_admin_login_log` VALUES ('18', '1', '后台登录', '127.0.0.1', null, '1536626998');
INSERT INTO `tp_admin_login_log` VALUES ('19', '1', '后台登录', '127.0.0.1', null, '1536716833');
INSERT INTO `tp_admin_login_log` VALUES ('20', '1', '后台登录', '127.0.0.1', null, '1536799065');
INSERT INTO `tp_admin_login_log` VALUES ('21', '1', '后台登录', '127.0.0.1', null, '1536839882');
INSERT INTO `tp_admin_login_log` VALUES ('22', '1', '后台登录', '127.0.0.1', null, '1536885569');
INSERT INTO `tp_admin_login_log` VALUES ('23', '1', '后台登录', '127.0.0.1', null, '1536971964');
INSERT INTO `tp_admin_login_log` VALUES ('24', '1', '后台登录', '127.0.0.1', null, '1537018653');
INSERT INTO `tp_admin_login_log` VALUES ('25', '1', '后台登录', '127.0.0.1', null, '1537146405');
INSERT INTO `tp_admin_login_log` VALUES ('26', '1', '后台登录', '127.0.0.1', null, '1537147396');
INSERT INTO `tp_admin_login_log` VALUES ('27', '1', '后台登录', '127.0.0.1', null, '1537190173');
INSERT INTO `tp_admin_login_log` VALUES ('28', '1', '后台登录', '127.0.0.1', null, '1537230942');
INSERT INTO `tp_admin_login_log` VALUES ('29', '1', '后台登录', '127.0.0.1', null, '1537318585');
INSERT INTO `tp_admin_login_log` VALUES ('30', '1', '后台登录', '127.0.0.1', null, '1537319422');
INSERT INTO `tp_admin_login_log` VALUES ('31', '1', '后台登录', '127.0.0.1', null, '1537404196');
INSERT INTO `tp_admin_login_log` VALUES ('32', '1', '后台登录', '127.0.0.1', null, '1561692406');
INSERT INTO `tp_admin_login_log` VALUES ('33', '1', '后台登录', '127.0.0.1', null, '1561945094');

-- ----------------------------
-- Table structure for tp_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role`;
CREATE TABLE `tp_admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `tyname` varchar(30) DEFAULT NULL,
  `desc` varchar(50) DEFAULT NULL,
  `module` text,
  `button` text,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_admin_role
-- ----------------------------
INSERT INTO `tp_admin_role` VALUES ('1', '超级管理员', '系统角色', '最高权限', '248,249,250,199,200,201,202,203,204,205,206,207,208,209,442', 'a:7:{i:201;a:5:{i:0;s:2:\"85\";i:1;s:2:\"86\";i:2;s:2:\"87\";i:3;s:2:\"88\";i:4;s:2:\"89\";}i:202;a:5:{i:0;s:2:\"85\";i:1;s:2:\"86\";i:2;s:2:\"87\";i:3;s:2:\"92\";i:4;s:2:\"93\";}i:203;a:4:{i:0;s:2:\"85\";i:1;s:2:\"86\";i:2;s:2:\"87\";i:3;s:2:\"91\";}i:204;a:3:{i:0;s:2:\"85\";i:1;s:2:\"86\";i:2;s:2:\"87\";}i:206;a:1:{i:0;s:2:\"90\";}i:209;a:5:{i:0;s:2:\"85\";i:1;s:2:\"86\";i:2;s:2:\"87\";i:3;s:2:\"88\";i:4;s:2:\"89\";}i:442;a:3:{i:0;s:2:\"85\";i:1;s:2:\"86\";i:2;s:2:\"87\";}}', '0');
INSERT INTO `tp_admin_role` VALUES ('10', '测试员', null, '', '207,208,209,210,211,212,213,328,329,330,336,427,428,429,430', 'a:6:{i:209;a:5:{i:0;s:2:\"85\";i:1;s:2:\"86\";i:2;s:2:\"87\";i:3;s:2:\"88\";i:4;s:2:\"89\";}i:210;a:2:{i:0;s:2:\"85\";i:1;s:2:\"86\";}i:212;a:2:{i:0;s:2:\"85\";i:1;s:2:\"86\";}i:213;a:2:{i:0;s:2:\"85\";i:1;s:2:\"86\";}i:429;a:3:{i:0;s:2:\"85\";i:1;s:2:\"86\";i:2;s:2:\"87\";}i:430;a:5:{i:0;s:2:\"85\";i:1;s:2:\"86\";i:2;s:2:\"87\";i:3;s:2:\"96\";i:4;s:2:\"97\";}}', '1521789340');

-- ----------------------------
-- Table structure for tp_art
-- ----------------------------
DROP TABLE IF EXISTS `tp_art`;
CREATE TABLE `tp_art` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `content` longtext,
  `addtime` int(11) DEFAULT NULL,
  `member` varchar(255) DEFAULT NULL,
  `cont` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_art
-- ----------------------------

-- ----------------------------
-- Table structure for tp_button
-- ----------------------------
DROP TABLE IF EXISTS `tp_button`;
CREATE TABLE `tp_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `event` varchar(20) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `desc` varchar(30) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_button
-- ----------------------------
INSERT INTO `tp_button` VALUES ('85', '添加', null, 'add()', '0', '', 'btn-primary', 'fa-plus');
INSERT INTO `tp_button` VALUES ('86', '修改', null, 'edit()', '0', '', 'btn-success', 'fa-paste');
INSERT INTO `tp_button` VALUES ('87', '删除', null, 'del()', '0', '', 'btn-danger', 'fa-trash-o');
INSERT INTO `tp_button` VALUES ('88', '审核', null, 'isok()', '0', '', 'btn-warning', 'fa-check');
INSERT INTO `tp_button` VALUES ('89', '屏蔽', null, 'isno()', '0', '', 'btn-default', 'fa-close');
INSERT INTO `tp_button` VALUES ('90', '查看', null, 'sel()', '0', '', 'btn-info', 'fa-hand-o-up');
INSERT INTO `tp_button` VALUES ('91', '分配按钮', null, 'set_button()', '0', '', 'btn-info', 'fa-cog');
INSERT INTO `tp_button` VALUES ('92', '模块权限', null, 'module_prev()', '0', '', 'btn-info', 'fa-bars');
INSERT INTO `tp_button` VALUES ('93', '按钮权限', null, 'button_prev()', '0', '', 'btn-warning', 'fa-bullseye');
INSERT INTO `tp_button` VALUES ('94', '开启', 'isopen', 'isopen()', '0', '', 'accept.png', null);
INSERT INTO `tp_button` VALUES ('95', '关闭', 'isclose', 'isclose()', '0', '', 'cancel.png', null);
INSERT INTO `tp_button` VALUES ('96', '上架', 'goods_up', 'goods_up()', '0', '', 'btn-info', 'fa-level-up');
INSERT INTO `tp_button` VALUES ('97', '下架', 'goods_down', 'goods_down()', '0', '', 'btn-warning', 'fa-level-down');
INSERT INTO `tp_button` VALUES ('98', '锁定', 'lock', 'lock()', '0', '', 'key_delete.png', null);
INSERT INTO `tp_button` VALUES ('99', '解锁', 'unlock', 'unlock()', '0', '', 'key_go.png', null);
INSERT INTO `tp_button` VALUES ('100', '回复', 'replay', 'replay()', '0', '', 'application_go.png', null);
INSERT INTO `tp_button` VALUES ('101', '备份', 'backup', 'backup()', '0', '', 'coins.png', null);
INSERT INTO `tp_button` VALUES ('102', '修复', 'repair', 'repair()', '0', '', 'coins_add.png', null);
INSERT INTO `tp_button` VALUES ('103', '打包', 'packs', 'packs()', '0', '', 'application_side_expand.png', null);
INSERT INTO `tp_button` VALUES ('104', '还原', 'restore', 'restore()', '0', '', 'application_side_contract.png', null);
INSERT INTO `tp_button` VALUES ('105', '导入', 'imports', 'imports()', '0', '', 'btn-default', 'fa-file-excel-o');
INSERT INTO `tp_button` VALUES ('106', '打印快递单', 'print_export', 'print_export()', '0', '', 'application_put.png', null);
INSERT INTO `tp_button` VALUES ('107', '审核未通过', 'isnull', 'isnull()', '0', '', 'cross_octagon.png', null);
INSERT INTO `tp_button` VALUES ('120', '导出', null, 'derive()', '0', null, 'derive', '');
INSERT INTO `tp_button` VALUES ('121', '充值', null, 'recharge()', '0', null, 'recharge', '');

-- ----------------------------
-- Table structure for tp_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_config`;
CREATE TABLE `tp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(222) NOT NULL,
  `keywords` text NOT NULL,
  `description` text NOT NULL,
  `mobile` varchar(222) DEFAULT NULL COMMENT '普通/天',
  `whatsapp` varchar(222) DEFAULT NULL,
  `fax` varchar(222) DEFAULT NULL,
  `email` varchar(222) DEFAULT NULL,
  `address` varchar(222) DEFAULT NULL,
  `qq` varchar(222) DEFAULT NULL,
  `company` varchar(222) DEFAULT NULL,
  `icp` varchar(222) DEFAULT NULL,
  `copyright` varchar(222) DEFAULT NULL,
  `cnzz` text,
  `forbid_ip` text,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of tp_config
-- ----------------------------
INSERT INTO `tp_config` VALUES ('1', '商城', '商城', '商城', '123456789', '+86 13905515889', '+86 0551-62588298', '123456789@qq.com', '安徽合肥市科学大道118号5F创业园', '290089730', '66速聘', '皖 xxxxxxxx', '版权所有', '', '129.12.03.2#127.0.0.2#154.23.1.231', '1516353592');

-- ----------------------------
-- Table structure for tp_device_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_device_login_log`;
CREATE TABLE `tp_device_login_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `log_ip` varchar(22) DEFAULT NULL,
  `log_info` varchar(222) DEFAULT NULL,
  `log_code` varchar(50) DEFAULT NULL,
  `log_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_device_login_log
-- ----------------------------
INSERT INTO `tp_device_login_log` VALUES ('2', '1', '183.160.215.132', '编号a857634c-4c1b-4853-9f91-28f824cefa79登录', 'a857634c-4c1b-4853-9f91-28f824cefa79', '1535595854');
INSERT INTO `tp_device_login_log` VALUES ('3', '1', '183.160.215.132', '编号test登录', 'test', '1535609569');
INSERT INTO `tp_device_login_log` VALUES ('4', '1', '183.160.215.132', '编号test登录', 'test', '1535609671');
INSERT INTO `tp_device_login_log` VALUES ('5', '1', '183.160.215.132', '编号1111111登录', '1111111', '1535609795');
INSERT INTO `tp_device_login_log` VALUES ('6', '1', '183.160.215.132', '编号test登录', 'test', '1535609821');
INSERT INTO `tp_device_login_log` VALUES ('7', '1', '183.160.215.132', '编号1111111登录', '1111111', '1535609899');
INSERT INTO `tp_device_login_log` VALUES ('8', '1', '183.160.215.132', '编号test登录', 'test', '1535609938');
INSERT INTO `tp_device_login_log` VALUES ('9', '1', '183.160.215.132', '编号test登录', 'test', '1535610253');
INSERT INTO `tp_device_login_log` VALUES ('10', '1', '183.160.215.132', '编号test登录', 'test', '1535610309');
INSERT INTO `tp_device_login_log` VALUES ('11', '1', '183.160.215.132', '编号1111111登录', '1111111', '1535610372');
INSERT INTO `tp_device_login_log` VALUES ('12', '1', '183.160.215.132', '编号1111111登录', '1111111', '1535610419');
INSERT INTO `tp_device_login_log` VALUES ('13', '1', '183.160.215.132', '编号test登录', 'test', '1535610569');
INSERT INTO `tp_device_login_log` VALUES ('14', '1', '183.160.215.132', '编号test登录', 'test', '1535611245');
INSERT INTO `tp_device_login_log` VALUES ('15', '1', '183.160.215.132', '编号test登录', 'test', '1535611362');
INSERT INTO `tp_device_login_log` VALUES ('16', '1', '127.0.0.1', '编号b03eca5d-ed8c-4205-bb58-9a9c35b062cb登录', 'b03eca5d-ed8c-4205-bb58-9a9c35b062cb', '1535613104');
INSERT INTO `tp_device_login_log` VALUES ('17', '1', '127.0.0.1', '编号登录', '', '1535613966');
INSERT INTO `tp_device_login_log` VALUES ('18', '1', '127.0.0.1', '编号登录', '', '1535613997');
INSERT INTO `tp_device_login_log` VALUES ('19', '1', '127.0.0.1', '编号登录', null, '1535614642');
INSERT INTO `tp_device_login_log` VALUES ('20', '1', '127.0.0.1', '编号11登录', '11', '1535614724');
INSERT INTO `tp_device_login_log` VALUES ('21', '1', '127.0.0.1', '设备号[11]登录', '11', '1535614839');
INSERT INTO `tp_device_login_log` VALUES ('22', '1', '127.0.0.1', '设备号[11]登录', '11', '1535614896');
INSERT INTO `tp_device_login_log` VALUES ('23', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535684872');
INSERT INTO `tp_device_login_log` VALUES ('24', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535693861');
INSERT INTO `tp_device_login_log` VALUES ('25', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535694095');
INSERT INTO `tp_device_login_log` VALUES ('26', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535694271');
INSERT INTO `tp_device_login_log` VALUES ('27', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535694392');
INSERT INTO `tp_device_login_log` VALUES ('28', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535695152');
INSERT INTO `tp_device_login_log` VALUES ('29', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535696406');
INSERT INTO `tp_device_login_log` VALUES ('30', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535696721');
INSERT INTO `tp_device_login_log` VALUES ('31', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535696782');
INSERT INTO `tp_device_login_log` VALUES ('32', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535697567');
INSERT INTO `tp_device_login_log` VALUES ('33', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535697719');
INSERT INTO `tp_device_login_log` VALUES ('34', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535698031');
INSERT INTO `tp_device_login_log` VALUES ('35', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535698319');
INSERT INTO `tp_device_login_log` VALUES ('36', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535698487');
INSERT INTO `tp_device_login_log` VALUES ('37', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535698578');
INSERT INTO `tp_device_login_log` VALUES ('38', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535698666');
INSERT INTO `tp_device_login_log` VALUES ('39', '1', '183.160.215.132', '设备号[test]登录', 'test', '1535698714');
INSERT INTO `tp_device_login_log` VALUES ('40', '1', '127.0.0.1', '设备号[11]登录', '11', '1535791103');

-- ----------------------------
-- Table structure for tp_import
-- ----------------------------
DROP TABLE IF EXISTS `tp_import`;
CREATE TABLE `tp_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(222) NOT NULL,
  `filepath` varchar(222) NOT NULL,
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='导入文件表';

-- ----------------------------
-- Records of tp_import
-- ----------------------------
INSERT INTO `tp_import` VALUES ('1', '20180901\\201809011602-通讯录.xlsx', '/uploads/import/20180901\\201809011602-通讯录.xlsx', '0', '1535788969');
INSERT INTO `tp_import` VALUES ('2', '20180901\\201809011604-通讯录.xlsx', '/uploads/import/20180901\\201809011604-通讯录.xlsx', '0', '1535789042');
INSERT INTO `tp_import` VALUES ('3', '20180901\\201809011606-通讯录.xlsx', '/uploads/import/20180901\\201809011606-通讯录.xlsx', '0', '1535789184');
INSERT INTO `tp_import` VALUES ('4', '20180901\\201809011612-通讯录.xlsx', '/uploads/import/20180901\\201809011612-通讯录.xlsx', '0', '1535789563');
INSERT INTO `tp_import` VALUES ('5', '20180901\\201809011806-商品测试数据.xlsx', '/uploads/import/20180901\\201809011806-商品测试数据.xlsx', '0', '1535796362');
INSERT INTO `tp_import` VALUES ('6', '20180901\\201809011806-商品测试数据.xlsx', '/uploads/import/20180901\\201809011806-商品测试数据.xlsx', '0', '1535796384');
INSERT INTO `tp_import` VALUES ('7', '20180901\\201809011808-商品测试数据.xlsx', '/uploads/import/20180901\\201809011808-商品测试数据.xlsx', '0', '1535796490');
INSERT INTO `tp_import` VALUES ('8', '20180901\\201809011808-商品测试数据.xlsx', '/uploads/import/20180901\\201809011808-商品测试数据.xlsx', '0', '1535796520');
INSERT INTO `tp_import` VALUES ('9', '20180901\\201809011808-商品测试数据.xlsx', '/uploads/import/20180901\\201809011808-商品测试数据.xlsx', '0', '1535796527');
INSERT INTO `tp_import` VALUES ('10', '20180901\\201809011808-商品测试数据.xlsx', '/uploads/import/20180901\\201809011808-商品测试数据.xlsx', '0', '1535796535');
INSERT INTO `tp_import` VALUES ('11', '20180901\\201809011809-商品测试数据.xlsx', '/uploads/import/20180901\\201809011809-商品测试数据.xlsx', '0', '1535796562');
INSERT INTO `tp_import` VALUES ('12', '20180901\\201809011814-商品测试数据.xlsx', '/uploads/import/20180901\\201809011814-商品测试数据.xlsx', '0', '1535796871');
INSERT INTO `tp_import` VALUES ('13', '20180901\\201809011836-商品测试数据.xlsx', '/uploads/import/20180901\\201809011836-商品测试数据.xlsx', '0', '1535798186');
INSERT INTO `tp_import` VALUES ('14', '20180901\\201809011836-商品测试数据.xlsx', '/uploads/import/20180901\\201809011836-商品测试数据.xlsx', '0', '1535798210');
INSERT INTO `tp_import` VALUES ('15', '20180901\\201809011837-商品测试数据.xlsx', '/uploads/import/20180901\\201809011837-商品测试数据.xlsx', '0', '1535798256');
INSERT INTO `tp_import` VALUES ('16', '20180901\\201809011842-商品测试数据.xlsx', '/uploads/import/20180901\\201809011842-商品测试数据.xlsx', '0', '1535798562');
INSERT INTO `tp_import` VALUES ('17', '20180901\\201809011844-商品测试数据.xlsx', '/uploads/import/20180901\\201809011844-商品测试数据.xlsx', '0', '1535798669');
INSERT INTO `tp_import` VALUES ('18', '20180902\\201809020953-新建 XLS 工作表.xls', '/uploads/import/20180902\\201809020953-新建 XLS 工作表.xls', '0', '1535853230');
INSERT INTO `tp_import` VALUES ('19', '20180902\\201809021005-新建 XLS 工作表.xls', '/uploads/import/20180902\\201809021005-新建 XLS 工作表.xls', '0', '1535853923');
INSERT INTO `tp_import` VALUES ('20', '20180902\\201809021008-新建 XLS 工作表.xls', '/uploads/import/20180902\\201809021008-新建 XLS 工作表.xls', '0', '1535854107');
INSERT INTO `tp_import` VALUES ('21', '20180902\\201809021009-新建 XLS 工作表.xls', '/uploads/import/20180902\\201809021009-新建 XLS 工作表.xls', '0', '1535854169');
INSERT INTO `tp_import` VALUES ('22', '20180902\\201809021011-新建 XLS 工作表.xls', '/uploads/import/20180902\\201809021011-新建 XLS 工作表.xls', '0', '1535854310');
INSERT INTO `tp_import` VALUES ('23', '20180902\\201809021030-新建 XLS 工作表.xls', '/uploads/import/20180902\\201809021030-新建 XLS 工作表.xls', '0', '1535855446');
INSERT INTO `tp_import` VALUES ('24', '20180902\\201809021033-新建 XLS 工作表.xls', '/uploads/import/20180902\\201809021033-新建 XLS 工作表.xls', '0', '1535855613');
INSERT INTO `tp_import` VALUES ('25', '20180902\\201809021034-新建 XLS 工作表.xls', '/uploads/import/20180902\\201809021034-新建 XLS 工作表.xls', '0', '1535855669');
INSERT INTO `tp_import` VALUES ('26', '20180902\\201809021035-新建 XLS 工作表.xls', '/uploads/import/20180902\\201809021035-新建 XLS 工作表.xls', '0', '1535855706');
INSERT INTO `tp_import` VALUES ('27', '20180902\\201809021035-新建 XLS 工作表.xls', '/uploads/import/20180902\\201809021035-新建 XLS 工作表.xls', '0', '1535855746');
INSERT INTO `tp_import` VALUES ('28', '20180902\\201809021103-商品测试数据.xlsx', '/uploads/import/20180902\\201809021103-商品测试数据.xlsx', '0', '1535857384');
INSERT INTO `tp_import` VALUES ('29', '20180902\\201809021103-商品测试数据.xlsx', '/uploads/import/20180902\\201809021103-商品测试数据.xlsx', '0', '1535857388');

-- ----------------------------
-- Table structure for tp_member
-- ----------------------------
DROP TABLE IF EXISTS `tp_member`;
CREATE TABLE `tp_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_member
-- ----------------------------
INSERT INTO `tp_member` VALUES ('1', 'aa', 'e10adc3949ba59abbe56e057f20f883e', '1561975092');

-- ----------------------------
-- Table structure for tp_module
-- ----------------------------
DROP TABLE IF EXISTS `tp_module`;
CREATE TABLE `tp_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(222) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `target` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `sortnum` int(11) DEFAULT NULL,
  `button` varchar(200) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `icon` varchar(222) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `button` (`button`)
) ENGINE=MyISAM AUTO_INCREMENT=443 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_module
-- ----------------------------
INSERT INTO `tp_module` VALUES ('199', '系统设置', '-0-199-', '1', '0', '0', '', '', 'fa-navicon');
INSERT INTO `tp_module` VALUES ('200', '权限设定', '-199-200-', 'click', '199', '0', '', '', null);
INSERT INTO `tp_module` VALUES ('201', '管理员管理', '-199-200-201-', 'click', '200', '0', '85,86,87,88,89', '/system/admin', null);
INSERT INTO `tp_module` VALUES ('202', '角色管理', '-199-200-202-', 'click', '200', '0', '85,86,87,92,93', '/system/role', null);
INSERT INTO `tp_module` VALUES ('203', '模块管理', '-199-200-203-', 'click', '200', '0', '85,86,87,91', '/system/module', null);
INSERT INTO `tp_module` VALUES ('204', '操作按钮', '-199-200-204-', 'click', '200', '0', '85,86,87', '/system/button', null);
INSERT INTO `tp_module` VALUES ('205', '系统日志', '-199-205-', 'click', '199', '0', '', '', null);
INSERT INTO `tp_module` VALUES ('206', '系统日志', '-199-205-206-', 'click', '205', '0', '90', '/system/logs', null);
INSERT INTO `tp_module` VALUES ('207', '信息管理', '-0-207-', '1', '0', '0', '', '', 'fa-list-alt');
INSERT INTO `tp_module` VALUES ('208', '文章管理', '-207-208-', '1', '207', '0', '', '', 'fa-newspaper-o');
INSERT INTO `tp_module` VALUES ('209', '文章', '-207-208-209-', '1', '208', '0', '85,86,87,88,89', '/infor/art', '');
INSERT INTO `tp_module` VALUES ('237', '系统备份', '-199-237-', 'click', '199', '0', '', '', null);
INSERT INTO `tp_module` VALUES ('238', '数据备份', '-199-237-238-', 'click', '237', '0', '101,102', '/backup/backup_list', null);
INSERT INTO `tp_module` VALUES ('239', '数据打包', '-199-237-239-', 'click', '237', '0', '87,103,104,105', '/backup/packs', null);
INSERT INTO `tp_module` VALUES ('240', '数据包下载', '-199-237-240-', 'click', '237', '0', '87', '/backup/download', null);
INSERT INTO `tp_module` VALUES ('248', '全局', '-0-248-', '1', '0', '1000', null, '', 'fa-cog');
INSERT INTO `tp_module` VALUES ('249', '全局管理', '-248-249-', '1', '248', '0', null, '/app/site', null);
INSERT INTO `tp_module` VALUES ('250', '网站设置', '-248-249-250-', '1', '249', '0', '', '/config/site', null);
INSERT INTO `tp_module` VALUES ('442', '账号管理', '-207-208-442-', '1', '208', '0', '85,86,87', '/infor/member', '');
