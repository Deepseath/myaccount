-- Adminer 5.1.0 MySQL 8.0.24 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `bill_deposit`;
CREATE TABLE `bill_deposit` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `type` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '存款类型',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '存款存入时间',
  `end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '存款到期时间',
  `money` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `cycle` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '存款周期，单位：月',
  `bank` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '存款银行',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '帐号信息',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '存款备注说明',
  `money_changelog` json NOT NULL COMMENT '存款金额变动记录',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `deleted_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据删除时间',
  PRIMARY KEY (`id`),
  KEY `delete_time` (`deleted_time`),
  KEY `end_date` (`end_date`),
  KEY `bank` (`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定期存款明细';


DROP TABLE IF EXISTS `bill_record`;
CREATE TABLE `bill_record` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '流水日期',
  `type` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '动账类别',
  `platform` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '购物平台',
  `bank` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付渠道',
  `money` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `cycle` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '周期性',
  `cycle_type` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '周期动账类别',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '说明',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `deleted_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据删除时间',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `type` (`type`),
  KEY `cycle` (`cycle`),
  KEY `delete_time` (`deleted_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='账单流水日志';


DROP TABLE IF EXISTS `bill_type`;
CREATE TABLE `bill_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `is_income` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否是收入。0=支出；1=收入',
  `sort` int unsigned NOT NULL DEFAULT '0' COMMENT '排序号，顺序排序',
  `name` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型名称',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `deleted_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `delete_time` (`deleted_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='消费类型';


-- 2025-04-03 05:13:17 UTC
