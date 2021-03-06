﻿-- 20160414 --
update `cms_category` set extend_id = NULL where extend_id = 0;
update `cms_category_type` set extend_id = NULL where extend_id = 0;
update `cms_model` set extend_id = NULL where extend_id = 0;
ALTER TABLE  `sys_user_token` ADD  `site_id` INT NOT NULL COMMENT  '站点ID' AFTER  `auth_token` , ADD INDEX (  `site_id` );
ALTER TABLE  `sys_extend` ADD  `item_type` varchar(20) NOT NULL COMMENT '扩展类型' AFTER  `id`,ADD  `item_id` INT NOT NULL COMMENT  '扩展项目ID' AFTER  `item_type`;
UPDATE  `public_cms`.`sys_extend` SET  `item_type` =  'model',`item_id` =  7 WHERE  `sys_extend`.`id` =1;
UPDATE  `public_cms`.`sys_extend` SET  `item_type` =  'category',`item_id` =  19 WHERE  `sys_extend`.`id` =2;
UPDATE  `public_cms`.`sys_extend` SET  `item_type` =  'category',`item_id` =  20 WHERE  `sys_extend`.`id` =3;
-- 20160416 --
ALTER TABLE  `sys_site` ADD  `use_static` TINYINT( 1 ) NOT NULL COMMENT  '启用静态化' AFTER  `name`;
ALTER TABLE  `sys_site` ADD  `use_ssi` TINYINT( 1 ) NOT NULL COMMENT  '启用服务器端包含' AFTER  `site_path`;
ALTER TABLE  `cms_page_data` CHANGE  `user_id`  `user_id` INT( 11 ) NOT NULL COMMENT  '提交用户';
ALTER TABLE `cms_page_data` DROP `type`;
ALTER TABLE `sys_dept_page` DROP `type`;
-- 20160419 --
RENAME TABLE  `public_cms`.`cms_page_data` TO  `public_cms`.`cms_place` ;
RENAME TABLE  `public_cms`.`cms_page_data_attribute` TO  `public_cms`.`cms_place_attribute` ;
ALTER TABLE  `cms_place_attribute` CHANGE  `page_data_id`  `place_id` INT( 11 ) NOT NULL COMMENT  '位置ID';
update `sys_moudle` set `authorized_url`='cmsPlace/clear' where `id`=54;
update `sys_moudle` set `authorized_url`='cmsPlace/check' where `id`=52;
update `sys_moudle` set `authorized_url`='cmsPlace/refresh' where `id`=51;
update `sys_moudle` set `authorized_url`='cmsPlace/delete' where `id`=50;
update `sys_moudle` set `authorized_url`='cmsContent/lookup,cmsPage/lookup_content_list,file/doUpload,cmsPlace/save' where `id`=49;
update `sys_moudle` set `authorized_url`='cmsPage/saveMetaData,file/doUpload,cmsPage/clearCache' where `id`=48;
-- 20160504 --
ALTER TABLE  `cms_content_attribute` CHANGE  `text`  `text` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT  '内容';
-- 20160506 --
ALTER TABLE  `cms_category` CHANGE  `english_name`  `code` VARCHAR( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT  '编码';
ALTER TABLE  `cms_content_attribute` CHANGE  `text`  `text` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT  '内容';
update `cms_category` set path = replace(path,'englishName','code'),content_path=replace(content_path,'englishName','code');
-- 20160509 --
ALTER TABLE  `cms_category` CHANGE  `content_path`  `content_path` VARCHAR( 500 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT  '内容路径';
ALTER TABLE  `cms_category` CHANGE  `template_path`  `template_path` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT  '模板路径';
INSERT INTO `sys_moudle` VALUES ('30', '<i class=\"icon-globe icon-large\"></i> 页面管理', 'cmsPage/placeList', 'sysUser/lookup,sysUser/lookup_content_list,cmsPage/placeDataList,cmsPage/placeDataAdd,cmsPlace/save,cmsTemplate/publishPlace,cmsPage/publishPlace,cmsPage/push_page,cmsPage/push_page_list', '4', '0');
update  `sys_moudle` set `authorized_url` ='cmsContent/push_content,cmsContent/push_content_list,cmsContent/push_to_content,cmsContent/push_page,cmsContent/push_page_list,cmsPage/placeDataAdd,cmsPlace/save,cmsContent/related' WHERE id = 23;
delete from `sys_moudle`  where id = 29;
INSERT INTO `sys_moudle` VALUES ('29', '推荐', 'cmsCategory/push_page', 'cmsCategory/push_page_list,cmsPage/placeDataAdd,cmsPlace/save', '24', '0');
-- 20160519 --

CREATE TABLE IF NOT EXISTS `log_upload` (
  `id` bigint(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `channel` varchar(50) NOT NULL COMMENT '操作取到',
  `image` tinyint(1) NOT NULL COMMENT '图片',
  `ip` varchar(64) default NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `file_path` varchar(500) NOT NULL COMMENT '文件路径',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `create_date` (`create_date`),
  KEY `ip` (`ip`),
  KEY `site_id` (`site_id`),
  KEY `channel` (`channel`),
  KEY `image` (`image`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上传日志' AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `sys_cluster` (
  `uuid` varchar(40) NOT NULL COMMENT 'uuid',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `heartbeat_date` datetime NOT NULL COMMENT '心跳时间',
  `master` tinyint(1) NOT NULL COMMENT '是否管理',
  PRIMARY KEY  (`uuid`),
  KEY `create_date` (`create_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='服务器集群' ;

UPDATE  `public_cms`.`sys_moudle` SET  `parent_id` =  '30' WHERE  `sys_moudle`.`parent_id` =29;
insert into `sys_moudle`(`id`,`name`,`url`,`authorized_url`,`parent_id`,`sort`) values ('40','修改模板元数据','cmsTemplate/metadata','cmsTemplate/saveMetadata','39','0');
UPDATE  `public_cms`.`sys_moudle` SET  `url` =  'cmsTemplate/content',`authorized_url` =  'cmsTemplate/save,cmsTemplate/chipLookup' WHERE  `sys_moudle`.`id` =41;
-- 20160723 --
ALTER TABLE `sys_domain`  DROP `login_path`,  DROP `register_path`;
UPDATE `sys_site` SET `site_path` = `dynamic_path` where `use_static`= 0;
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE IF NOT EXISTS `sys_config` (
  `id` int(11) NOT NULL auto_increment COMMENT 'ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `code` varchar(50) NOT NULL COMMENT '配置项编码',
  `subcode` varchar(50) NOT NULL COMMENT '子编码',
  `data` longtext NOT NULL COMMENT '值',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `site_id` (`site_id`,`code`,`subcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='站点配置' AUTO_INCREMENT=1 ;
