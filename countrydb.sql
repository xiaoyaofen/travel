/*
Navicat MySQL Data Transfer

Source Server         : royidb
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : countrydb

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2021-03-11 00:31:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ly_admin
-- ----------------------------
DROP TABLE IF EXISTS `ly_admin`;
CREATE TABLE `ly_admin` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ly_country
-- ----------------------------
DROP TABLE IF EXISTS `ly_country`;
CREATE TABLE `ly_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `story` varchar(255) DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ly_countryeat
-- ----------------------------
DROP TABLE IF EXISTS `ly_countryeat`;
CREATE TABLE `ly_countryeat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ly_countrynew
-- ----------------------------
DROP TABLE IF EXISTS `ly_countrynew`;
CREATE TABLE `ly_countrynew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ly_countryview
-- ----------------------------
DROP TABLE IF EXISTS `ly_countryview`;
CREATE TABLE `ly_countryview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ly_leader
-- ----------------------------
DROP TABLE IF EXISTS `ly_leader`;
CREATE TABLE `ly_leader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `story` varchar(255) DEFAULT NULL,
  `envelop` varchar(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ly_user
-- ----------------------------
DROP TABLE IF EXISTS `ly_user`;
CREATE TABLE `ly_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `state` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
