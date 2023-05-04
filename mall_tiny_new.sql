/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : mall_tiny_new

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 03/05/2023 23:45:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `show_status` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `read_count` int NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_help
-- ----------------------------

-- ----------------------------
-- Table structure for cms_help_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_help_category`;
CREATE TABLE `cms_help_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `help_count` int NULL DEFAULT NULL COMMENT '',
  `show_status` int NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_help_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_member_report
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_report`;
CREATE TABLE `cms_member_report`  (
  `id` bigint NULL DEFAULT NULL,
  `report_type` int NULL DEFAULT NULL COMMENT '',
  `report_member_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `create_time` datetime NULL DEFAULT NULL,
  `report_object` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `report_status` int NULL DEFAULT NULL COMMENT '',
  `handle_status` int NULL DEFAULT NULL COMMENT '',
  `note` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_member_report
-- ----------------------------

-- ----------------------------
-- Table structure for cms_prefrence_area
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pic` varbinary(500) NULL DEFAULT NULL COMMENT '',
  `sort` int NULL DEFAULT NULL,
  `show_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_prefrence_area
-- ----------------------------

-- ----------------------------
-- Table structure for cms_prefrence_area_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_prefrence_area_product_relation
-- ----------------------------
INSERT INTO `cms_prefrence_area_product_relation` VALUES (1, 1, 12);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (2, 1, 13);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (3, 1, 14);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (4, 1, 18);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (5, 1, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (6, 2, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (7, 1, 22);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (24, 1, 23);

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pic` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `product_count` int NULL DEFAULT NULL COMMENT '',
  `recommend_status` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `collect_count` int NULL DEFAULT NULL,
  `read_count` int NULL DEFAULT NULL,
  `comment_count` int NULL DEFAULT NULL,
  `album_pics` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `description` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `show_status` int NULL DEFAULT NULL COMMENT '',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `forward_count` int NULL DEFAULT NULL COMMENT '',
  `category_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject
-- ----------------------------

-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL
  `icon` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `subject_count` int NULL DEFAULT NULL COMMENT '',
  `show_status` int NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `show_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
INSERT INTO `cms_subject_product_relation` VALUES (1, 1, 26);
INSERT INTO `cms_subject_product_relation` VALUES (2, 1, 27);
INSERT INTO `cms_subject_product_relation` VALUES (3, 1, 28);
INSERT INTO `cms_subject_product_relation` VALUES (4, 1, 29);
INSERT INTO `cms_subject_product_relation` VALUES (5, 2, 30);
INSERT INTO `cms_subject_product_relation` VALUES (6, 2, 31);
INSERT INTO `cms_subject_product_relation` VALUES (7, 2, 35);
INSERT INTO `cms_subject_product_relation` VALUES (29, 2, 36);
INSERT INTO `cms_subject_product_relation` VALUES (30, 2, 32);
INSERT INTO `cms_subject_product_relation` VALUES (31, 3, 33);
INSERT INTO `cms_subject_product_relation` VALUES (38, 3, 34);

-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `attend_count` int NULL DEFAULT NULL COMMENT '',
  `attention_count` int NULL DEFAULT NULL COMMENT '',
  `read_count` int NULL DEFAULT NULL,
  `award_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `attend_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_topic
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_category`;
CREATE TABLE `cms_topic_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `subject_count` int NULL DEFAULT NULL COMMENT '',
  `show_status` int NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_topic_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_comment`;
CREATE TABLE `cms_topic_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `topic_id` bigint NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `show_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_topic_comment
-- ----------------------------

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `product_sku_id` bigint NULL DEFAULT NULL,
  `member_id` bigint NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL COMMENT '',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `sp1` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `sp2` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `sp3` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `product_pic` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `product_name` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `product_sub_title` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `product_sku_code` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `member_nickname` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `create_date` datetime NULL DEFAULT NULL COMMENT '',
  `modify_date` datetime NULL DEFAULT NULL COMMENT '',
  `delete_status` int NULL DEFAULT 0 COMMENT '',
  `product_category_id` bigint NULL DEFAULT NULL COMMENT '',
  `product_brand` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `product_attr` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
INSERT INTO `oms_cart_item` VALUES (17, 27, 98, 1, 1, 2699.00, 'only one', '', NULL, NULL, 'Chroma Elderwood Blade', 'Chroma Elderwood Blade', '201808270027001', 'windir', '2023-04-06 04:07:33', '2023-04-06 04:07:33', 1, 19, '小米', '7437788', NULL);
INSERT INTO `oms_cart_item` VALUES (18, 28, 99, 1, 1, 50.00, '1080P', ' 50$', NULL, NULL, 'Music Virtual Concert Flyer', 'Music Virtual Concert Flyer Modern Style', '201808270027001', 'windir', '2023-04-06 04:07:47', '2023-04-06 04:07:47', 1, 19, '小米', '7437789', NULL);
INSERT INTO `oms_cart_item` VALUES (19, 30, 100, 1, 1, 50.00, 'only one', '', NULL, NULL, '500B Gems', '500B Gems (bilions not milions)', '201808270029001', 'windir', '2023-04-06 04:31:04', '2023-04-06 04:31:04', 1, 8, '海澜之家', 'HNTBJ2E042A', NULL);
INSERT INTO `oms_cart_item` VALUES (20, 27, 98, 1, 2, 2699.00, 'only one', '', NULL, NULL, 'Chroma Elderwood Blade', 'Chroma Elderwood Blade', '201808270027001', 'windir', '2023-04-06 05:17:54', '2023-04-06 07:55:54', 1, 19, '小米', '7437788', NULL);
INSERT INTO `oms_cart_item` VALUES (21, 27, 98, 1, 1, 2699.00, 'only one', '', NULL, NULL, 'Chroma Elderwood Blade', 'Chroma Elderwood Blade', '201808270027001', 'windir', '2023-04-06 08:02:01', '2023-04-06 08:02:01', 1, 19, '小米', '7437788', NULL);
INSERT INTO `oms_cart_item` VALUES (22, 27, 98, 1, 21, 2699.00, 'only one', '', NULL, NULL, 'Chroma Elderwood Blade', 'Chroma Elderwood Blade', '201808270027001', 'windir', '2023-04-06 08:04:07', '2023-04-06 08:22:05', 1, 19, '小米', '7437788', NULL);
INSERT INTO `oms_cart_item` VALUES (23, 30, 100, 1, 1, 50.00, 'only one', '', NULL, NULL, '500B Gems', '500B Gems (bilions not milions)', '201808270029001', 'windir', '2023-05-01 11:43:33', '2023-05-01 11:43:33', 1, 8, 'E', 'HNTBJ2E042A', NULL);
INSERT INTO `oms_cart_item` VALUES (24, 26, 92, 1, 1, 3788.00, 'only one', '', NULL, NULL, 'Ordinal Kubz #6446', 'By \r\nKeungz\r\nOrdinal Kubz are a 10,000 Ordinal NFT collection by Keungz.', '201806070026003', 'windir', '2023-05-01 12:08:01', '2023-05-01 12:08:01', 1, 19, 'A', '6946605', NULL);
INSERT INTO `oms_cart_item` VALUES (25, 39, 111, 1, 1, 590.00, 'red', NULL, NULL, NULL, 'aaa', 'as', 'red', 'windir', '2023-05-03 11:43:54', '2023-05-03 11:43:54', 1, 34, 'A', '213214', NULL);
INSERT INTO `oms_cart_item` VALUES (26, 30, 100, 1, 1, 50.00, 'only one', '', NULL, NULL, '500B Gems', '500B Gems (bilions not milions)', '201808270029001', 'windir', '2023-05-03 12:00:10', '2023-05-04 05:18:30', 1, 8, 'E', 'HNTBJ2E042A', NULL);
INSERT INTO `oms_cart_item` VALUES (27, 39, 111, 1, 1, 590.00, 'red', NULL, NULL, NULL, 'aaa', 'as', 'red', 'windir', '2023-05-03 12:01:04', '2023-05-03 12:01:04', 1, 34, 'A', '213214', NULL);
INSERT INTO `oms_cart_item` VALUES (28, 36, 81, 1, 1, 2500.00, '2500$', '', NULL, 'https://production-gameflipusercontent.fingershock.com/us-east-1:b5878284-b8d3-4ad1-91ed-6ba4a03f72e1/49b6fc2c-00ec-49d9-9cfa-9ee2a76c1698/923366c0-2f94-4a86-a80c-d86fd0135c1b/640x640.webp', 'Buying CSGO Skins/Knifes/Gloves DM', 'Looking for preferably Karambits, Butterflies, Skeletons, Bayonets, M9 Bayonets. Ideally looking for Fades, Slaughters, Dopplers, Gamma Dopplers', '201806070023004', 'windir', '2023-05-04 05:01:03', '2023-05-04 05:01:03', 1, 19, 'K', '6799345', NULL);
INSERT INTO `oms_cart_item` VALUES (29, 30, 100, 1, 1, 50.00, 'only one', '', NULL, 'https://production-gameflipusercontent.fingershock.com/us-east-1:871446a8-3bde-47ef-a601-2fd9a991c2e2/e3855e90-f495-416c-a95d-e48f54f2fa24/01cdf09e-43a4-42f9-87d2-abd94c212609/640x640.webp', '500B Gems', '500B Gems (bilions not milions)', '201808270029001', 'windir', '2023-05-04 05:19:07', '2023-05-04 05:19:07', 1, 8, 'E', 'HNTBJ2E042A', NULL);
INSERT INTO `oms_cart_item` VALUES (30, 36, 81, 1, 2, 2500.00, '2500$', '', NULL, 'https://production-gameflipusercontent.fingershock.com/us-east-1:b5878284-b8d3-4ad1-91ed-6ba4a03f72e1/49b6fc2c-00ec-49d9-9cfa-9ee2a76c1698/923366c0-2f94-4a86-a80c-d86fd0135c1b/640x640.webp', 'Buying CSGO Skins/Knifes/Gloves DM', 'Looking for preferably Karambits, Butterflies, Skeletons, Bayonets, M9 Bayonets. Ideally looking for Fades, Slaughters, Dopplers, Gamma Dopplers', '201806070023004', 'windir', '2023-05-04 06:23:57', '2023-05-04 06:54:30', 0, 19, 'K', '6799345', NULL);

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `send_status` int NULL DEFAULT NULL COMMENT '',
  `receive_status` int NULL DEFAULT NULL COMMENT '',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `phone` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `province` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `city` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `region` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `detail_address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------
INSERT INTO `oms_company_address` VALUES (1, 'Boston somewhere', 1, 1, 'product A', '18000000000', 'MA', 'Boston', '', 'boston university');
INSERT INTO `oms_company_address` VALUES (2, 'LA somewhere', 1, 1, 'product B', '18000000000', 'CA', 'LA', '', 'LA addresss');

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '',
  `member_id` bigint NOT NULL,
  `coupon_id` bigint NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `create_time` datetime NULL DEFAULT NULL COMMENT '',
  `member_username` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `pay_type` int NULL DEFAULT NULL COMMENT '',
  `source_type` int NULL DEFAULT NULL COMMENT '',
  `status` int NULL DEFAULT NULL COMMENT '',
  `order_type` int NULL DEFAULT NULL COMMENT '',
  `delivery_company` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `delivery_sn` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `auto_confirm_day` int NULL DEFAULT NULL COMMENT '',
  `integration` int NULL DEFAULT NULL COMMENT '',
  `growth` int NULL DEFAULT NULL COMMENT '',
  `promotion_info` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `bill_type` int NULL DEFAULT NULL COMMENT '',
  `bill_header` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `bill_content` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `receiver_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '',
  `receiver_phone` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '',
  `receiver_post_code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `receiver_province` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `receiver_city` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `receiver_region` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `note` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `confirm_status` int NULL DEFAULT NULL COMMENT '',
  `delete_status` int NOT NULL DEFAULT 0 COMMENT '',
  `use_integration` int NULL DEFAULT NULL COMMENT '',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '',
  `comment_time` datetime NULL DEFAULT NULL COMMENT '',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (27, 1, NULL, '2023040501000002', '2023-04-06 05:05:49', 'test', 2799.00, 2769.00, 30.00, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Johny', '5417326589', '02135', 'MA', 'Boston', 'Allston', '88 Brighton Ave', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-04-06 05:05:49');
INSERT INTO `oms_order` VALUES (28, 1, NULL, '2023040501000004', '2023-04-06 07:57:56', 'test', 5398.00, 5388.00, 10.00, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Christy.Wu', '9642368459', '02135', 'MA', 'Boston', 'Allston', 'Jail Avenue', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-04-06 07:57:56');
INSERT INTO `oms_order` VALUES (29, 1, NULL, '2023040501000006', '2023-04-06 08:03:51', 'test', 2699.00, 2689.00, 10.00, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Johny', '5417326589', '02135', 'MA', 'Boston', 'Allston', '88 Brighton Ave', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-04-06 08:03:51');
INSERT INTO `oms_order` VALUES (30, 1, NULL, '2023040501000008', '2023-04-06 08:23:08', 'test', 56679.00, 56669.00, 10.00, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Johny', '5417326589', '02135', 'MA', 'Boston', 'Allston', '88 Brighton Ave', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-04-06 08:23:08');
INSERT INTO `oms_order` VALUES (31, 1, NULL, '2023050101000002', '2023-05-01 12:07:21', 'test', 50.00, 40.00, 10.00, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Johny', '5417326589', '02135', 'MA', 'Boston', 'Allston', '88 Brighton Ave', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-05-01 12:07:21');
INSERT INTO `oms_order` VALUES (32, 1, NULL, '2023050101000004', '2023-05-01 12:08:15', 'test', 3788.00, 3778.00, 10.00, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Johny', '5417326589', '02135', 'MA', 'Boston', 'Allston', '88 Brighton Ave', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-05-01 12:08:15');
INSERT INTO `oms_order` VALUES (33, 1, NULL, '2023050201000002', '2023-05-03 11:44:00', 'test', 590.00, 580.00, 10.00, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Johny', '5417326589', '02135', 'MA', 'Boston', 'Allston', '88 Brighton Ave', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-05-03 11:44:00');
INSERT INTO `oms_order` VALUES (34, 1, NULL, '2023050301000002', '2023-05-03 12:01:09', 'test', 590.00, 580.00, 10.00, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Johny', '5417326589', '02135', 'MA', 'Boston', 'Allston', '88 Brighton Ave', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-05-03 12:01:09');
INSERT INTO `oms_order` VALUES (35, 1, NULL, '2023050301000004', '2023-05-04 05:01:21', 'test', 2500.00, 2490.00, 10.00, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Johny', '5417326589', '02135', 'MA', 'Boston', 'Allston', '88 Brighton Ave', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-05-04 05:01:21');
INSERT INTO `oms_order` VALUES (36, 1, NULL, '2023050301000006', '2023-05-04 05:18:40', 'test', 50.00, 40.00, 10.00, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Alex', '8619587452', '02134', 'OR', 'Corvallis', 'Oregon', '1728 NW KING BLVD', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-05-04 05:18:40');
INSERT INTO `oms_order` VALUES (37, 1, NULL, '2023050301000008', '2023-05-04 06:54:39', 'test', 50.00, 40.00, 10.00, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Johny', '5417326589', '02135', 'MA', 'Boston', 'Allston', '88 Brighton Ave', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-05-04 06:54:39');

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NULL DEFAULT NULL COMMENT '',
  `order_sn` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `product_id` bigint NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `product_quantity` int NULL DEFAULT NULL COMMENT '',
  `product_sku_id` bigint NULL DEFAULT NULL COMMENT '',
  `product_sku_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `product_category_id` bigint NULL DEFAULT NULL COMMENT '',
  `sp1` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `sp2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `gift_integration` int NULL DEFAULT 0,
  `gift_growth` int NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
INSERT INTO `oms_order_item` VALUES (46, 27, '2023040501000002', 27, NULL, 'Chroma Elderwood Blade', 'A', '7437788', 2699.00, 1, 98, '201808270027001', 19, 'only one', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (47, 27, '2023040501000002', 28, NULL, 'Music Virtual Concert Flyer', 'A', '7437789', 50.00, 1, 99, '201808270027001', 19, '1080P', ' 50$', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (48, 27, '2023040501000002', 30, NULL, '500B Gems', 'B', 'HNTBJ2E042A', 50.00, 1, 100, '201808270029001', 8, 'only one', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (49, 28, '2023040501000004', 27, NULL, 'Chroma Elderwood Blade', 'A', '7437788', 2699.00, 2, 98, '201808270027001', 19, 'only one', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (50, 29, '2023040501000006', 27, NULL, 'Chroma Elderwood Blade', 'A', '7437788', 2699.00, 1, 98, '201808270027001', 19, 'only one', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (51, 30, '2023040501000008', 27, NULL, 'Chroma Elderwood Blade', 'A', '7437788', 2699.00, 21, 98, '201808270027001', 19, 'only one', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (52, 31, '2023050101000002', 30, NULL, '500B Gems', 'E', 'HNTBJ2E042A', 50.00, 1, 100, '201808270029001', 8, 'only one', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (53, 32, '2023050101000004', 26, NULL, 'Ordinal Kubz #6446', 'A', '6946605', 3788.00, 1, 92, '201806070026003', 19, 'only one', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (54, 33, '2023050201000002', 39, NULL, 'aaa', 'A', '213214', 590.00, 1, 111, 'red', 34, 'red', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (55, 34, '2023050301000002', 39, NULL, 'aaa', 'A', '213214', 590.00, 1, 111, 'red', 34, 'red', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (56, 35, '2023050301000004', 36, 'https://production-gameflipusercontent.fingershock.com/us-east-1:b5878284-b8d3-4ad1-91ed-6ba4a03f72e1/49b6fc2c-00ec-49d9-9cfa-9ee2a76c1698/923366c0-2f94-4a86-a80c-d86fd0135c1b/640x640.webp', 'Buying CSGO Skins/Knifes/Gloves DM', 'K', '6799345', 2500.00, 1, 81, '201806070023004', 19, '2500$', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (57, 36, '2023050301000006', 30, NULL, '500B Gems', 'E', 'HNTBJ2E042A', 50.00, 1, 100, '201808270029001', 8, 'only one', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (58, 37, '2023050301000008', 30, 'https://production-gameflipusercontent.fingershock.com/us-east-1:871446a8-3bde-47ef-a601-2fd9a991c2e2/e3855e90-f495-416c-a95d-e48f54f2fa24/01cdf09e-43a4-42f9-87d2-abd94c212609/640x640.webp', '500B Gems', 'E', 'HNTBJ2E042A', 50.00, 1, 100, '201808270029001', 8, 'only one', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NULL DEFAULT NULL COMMENT '',
  `operate_man` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `create_time` datetime NULL DEFAULT NULL COMMENT '',
  `order_status` int NULL DEFAULT NULL COMMENT '',
  `note` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
INSERT INTO `oms_order_operate_history` VALUES (15, 23, 'backend manager', '2018-10-16 14:41:28', 2, 'complete ship');
INSERT INTO `oms_order_operate_history` VALUES (16, 13, 'backend manager', '2018-10-16 14:42:17', 2, 'complete ship');
INSERT INTO `oms_order_operate_history` VALUES (17, 18, 'backend manager', '2018-10-16 14:42:17', 2, 'complete ship');
INSERT INTO `oms_order_operate_history` VALUES (18, 26, 'backend manager', '2018-10-30 14:37:44', 4, 'order close');
INSERT INTO `oms_order_operate_history` VALUES (19, 25, 'backend manager', '2018-10-30 15:07:01', 0, 'change reciever info');
INSERT INTO `oms_order_operate_history` VALUES (20, 25, 'backend manager', '2018-10-30 15:08:13', 0, 'change fee info');
INSERT INTO `oms_order_operate_history` VALUES (21, 25, 'backend manager', '2018-10-30 15:08:31', 0, 'change note info: xxx');
INSERT INTO `oms_order_operate_history` VALUES (22, 25, 'backend manager', '2018-10-30 15:08:39', 4, 'order close: 2222');

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NULL DEFAULT NULL COMMENT '',
  `company_address_id` bigint NULL DEFAULT NULL COMMENT '',
  `product_id` bigint NULL DEFAULT NULL COMMENT '',
  `order_sn` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `create_time` datetime NULL DEFAULT NULL COMMENT '',
  `member_username` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `return_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `return_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `return_phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `status` int NULL DEFAULT NULL COMMENT '',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '',
  `product_pic` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `product_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `product_brand` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `product_attr` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT ';',
  `product_count` int NULL DEFAULT NULL COMMENT '',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `product_real_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '',
  `reason` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `proof_pics` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `handle_note` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `handle_man` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `receive_man` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '',
  `receive_note` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退货类型',
  `sort` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '退货原因表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
INSERT INTO `oms_order_return_reason` VALUES (1, 'quality problem', 1, 0, '2018-10-17 10:00:45');
INSERT INTO `oms_order_return_reason` VALUES (2, 'too large', 1, 1, '2018-10-17 10:01:03');
INSERT INTO `oms_order_return_reason` VALUES (3, 'dislike color', 1, 1, '2018-10-17 10:01:13');
INSERT INTO `oms_order_return_reason` VALUES (4, '7 days no reason return', 1, 1, '2018-10-17 10:01:47');
INSERT INTO `oms_order_return_reason` VALUES (5, 'price problem', 1, 0, '2018-10-17 10:01:57');
INSERT INTO `oms_order_return_reason` VALUES (13, 'other problem', 0, 1, '2018-10-19 16:28:51');
INSERT INTO `oms_order_return_reason` VALUES (14, 'shipping problem', 0, 1, '2018-10-19 16:29:01');
INSERT INTO `oms_order_return_reason` VALUES (15, 'service problem', 0, 1, '2018-10-19 16:29:11');

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int NULL DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int NULL DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int NULL DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int NULL DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int NULL DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
INSERT INTO `oms_order_setting` VALUES (1, 60, 120, 15, 7, 7);

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cover_pic` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pic_count` int NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '相册表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_album
-- ----------------------------

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `album_id` bigint NULL DEFAULT NULL,
  `pic` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '画册图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_album_pic
-- ----------------------------

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `first_letter` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `sort` int NULL DEFAULT NULL,
  `factory_status` int NULL DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int NULL DEFAULT NULL,
  `product_count` int NULL DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int NULL DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '专区大图',
  `brand_story` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '品牌故事',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES (1, 'A', 'W', 0, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(5).jpg', '', 'story A');
INSERT INTO `pms_brand` VALUES (2, 'B', 'S', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (1).jpg', NULL, 'story B');
INSERT INTO `pms_brand` VALUES (3, 'C', 'H', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/17f2dd9756d9d333bee8e60ce8c03e4c_222_222.jpg', NULL, 'story C');
INSERT INTO `pms_brand` VALUES (4, 'D', 'G', 30, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/dc794e7e74121272bbe3ce9bc41ec8c3_222_222.jpg', NULL, 'story D');
INSERT INTO `pms_brand` VALUES (5, 'E', 'F', 20, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', NULL, 'story E');
INSERT INTO `pms_brand` VALUES (6, 'F', 'M', 500, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/1e34aef2a409119018a4c6258e39ecfb_222_222.png', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg', 'story F');
INSERT INTO `pms_brand` VALUES (21, 'G', 'O', 0, 1, 1, 88, 500, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', '', 'story G');
INSERT INTO `pms_brand` VALUES (49, 'H', 'S', 200, 1, 1, 77, 400, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/18d8bc3eb13533fab466d702a0d3fd1f40345bcd.jpg', NULL, 'story H');
INSERT INTO `pms_brand` VALUES (50, 'R', 'H', 200, 1, 1, 66, 300, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/99d3279f1029d32b929343b09d3c72de_222_222.jpg', '', 'story R');
INSERT INTO `pms_brand` VALUES (51, 'J', 'A', 200, 1, 1, 55, 200, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, 'story J');
INSERT INTO `pms_brand` VALUES (58, 'K', 'N', 0, 1, 1, 33, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '', 'story K');

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `star` int NULL DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime NULL DEFAULT NULL,
  `show_status` int NULL DEFAULT NULL,
  `product_attribute` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_couont` int NULL DEFAULT NULL,
  `read_count` int NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `pics` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment_id` bigint NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '产品评价回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `charge_type` int NULL DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10, 2) NULL DEFAULT NULL,
  `continme_fee` decimal(10, 2) NULL DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '目的地（省、市）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '运费模版' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_feight_template
-- ----------------------------

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `member_level_id` bigint NULL DEFAULT NULL,
  `member_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品会员价格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_id` bigint NULL DEFAULT NULL,
  `product_category_id` bigint NULL DEFAULT NULL,
  `feight_template_id` bigint NULL DEFAULT NULL,
  `product_attribute_category_id` bigint NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '货号',
  `delete_status` int NULL DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int NULL DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int NULL DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int NULL DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int NULL DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `sale` int NULL DEFAULT NULL COMMENT '销量',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价格',
  `gift_growth` int NULL DEFAULT 0 COMMENT '赠送的成长值',
  `gift_point` int NULL DEFAULT 0 COMMENT '赠送的积分',
  `use_point_limit` int NULL DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '商品描述',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价',
  `stock` int NULL DEFAULT NULL COMMENT '库存',
  `low_stock` int NULL DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '单位',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int NULL DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `album_pics` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `detail_desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `detail_html` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '产品详情网页内容',
  `detail_mobile_html` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '移动端网页详情',
  `promotion_start_time` datetime NULL DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime NULL DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int NULL DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int NULL DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES (22, 6, 7, 0, 1, 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '', 1, 1, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'test', '', 0.00, 100, 0, '', 0.00, 1, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'A', 'A');
INSERT INTO `pms_product` VALUES (24, 6, 7, 0, NULL, 'xxx', '', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'xxx', '', 0.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'A', 'A');
INSERT INTO `pms_product` VALUES (26, 3, 8, 0, 3, 'Ordinal Kubz #6446', 'https://i.seadn.io/gcs/files/80d615cf3ba9651a17d3070b7e6c211c.png?auto=format&w=1000', '6946605', 0, 1, 1, 1, 0, 100, 0, 3788.00, NULL, 3788, 3788, 0, 'By \r\nKeungz\r\nOrdinal Kubz are a 10,000 Ordinal NFT collection by Keungz.', '', 4288.00, 1000, 0, 'unit', 0.00, 1, '2,3,1', '', '', 'https://i.seadn.io/gcs/files/b4e4b222042f5d2662192314e7a73a0f.png?auto=format&w=1000, https://i.seadn.io/gcs/files/b292ebd728c78125219211dda67f8de7.png?auto=format&w=1000', '', '', '<p><img class=\"wscnph\" src=\" https://i.seadn.io/gcs/files/fc2f11b229ff5cc2acf996d1647fb765.png?auto=format&w=1000 \" /><img class=\"wscnph\" src=\" https://i.seadn.io/gcs/files/fc2f11b229ff5cc2acf996d1647fb765.png?auto=format&w=1000 \" /></p>', '', NULL, NULL, 0, 1, 'A', 'B');
INSERT INTO `pms_product` VALUES (27, 6, 19, 0, 3, 'Chroma Elderwood Blade', 'https://production-gameflipusercontent.fingershock.com/us-east-1:871446a8-3bde-47ef-a601-2fd9a991c2e2/e81ec867-998d-4333-a8e3-994aa49b6299/d221cb40-ef42-4fc7-8bab-684e47be9812/640x640.webp', '7437788', 0, 1, 1, 1, 0, 0, 0, 2699.00, NULL, 2699, 2699, 0, 'Chroma Elderwood Blade', 'Chroma Elderwood Blade', 200.00, 100, 0, '', 0.00, 0, '', '', '', 'https://i.ebayimg.com/images/g/dVoAAOSwvThjUMxa/s-l500.jpg', '', '', '<p><img class=\"wscnph\" src=\" https://production-gameflipusercontent.fingershock.com/us-east-1:871446a8-3bde-47ef-a601-2fd9a991c2e2/09350631-5854-4301-bdd4-905a67535887/112f67c3-cc22-43ea-831d-88fd86fc81ed/640x640.webp \" width=\"500\" /></p>', '', NULL, NULL, 0, 3, 'B', 'B');
INSERT INTO `pms_product` VALUES (28, 6, 35, 0, 3, 'Music Virtual Concert Flyer', 'https://elements-cover-images-0.imgix.net/3d69f85b-5aa0-41fc-852c-c0375af60052?auto=compress%2Cformat&fit=max&w=1170&s=59a2ca134f50e5b8770b83f97045414f', '7437789', 0, 1, 1, 1, 0, 0, 0, 649.00, NULL, 649, 649, 0, 'Music Virtual Concert Flyer Modern Style', '', 649.00, 100, 0, '', 0.00, 0, '', '', '', 'https://elements-preview-images-0.imgix.net/458e671e-01ee-4513-9b99-e94824473efe?auto=compress%2Cformat&fit=max&w=1370&s=06a71f6e9d01a821c3d6d6b28e5fa072', '', '', '<p><img class=\"wscnph\" src=\" https://elements-preview-images-0.imgix.net/2378d706-bd30-4782-83e6-7c8fdcfca8b5?auto=compress%2Cformat&fit=max&w=1370&s=b0a2e5bfe654eac5352a15da1824f515\" /><img class=\"wscnph\" src=\" https://elements-preview-images-0.imgix.net/458e671e-01ee-4513-9b99-e94824473efe?auto=compress%2Cformat&fit=max&w=1370&s=06a71f6e9d01a821c3d6d6b28e5fa072 \" /></p>', '', NULL, NULL, 0, 4, 'C', 'B');
INSERT INTO `pms_product` VALUES (29, 51, 45, 0, 3, 'photograph', 'https://i.seadn.io/gcs/files/fddc4fe6455414bdc86da1edaa8447ce.jpg?auto=format&w=1000', '7437799', 0, 1, 1, 1, 0, 0, 0, 5499.00, NULL, 5499, 5499, 0, 'By \r\nnature_photographs_\r\nphotograph of a flower with uniqe editing.', '', 5499.00, 100, 0, '', 0.00, 0, '', '', '', 'https://i.seadn.io/gcs/files/fddc4fe6455414bdc86da1edaa8447ce.jpg?auto=format&w=1000', '', '', '<p><img class=\"wscnph\" src=\" https://i.seadn.io/gae/xbjdlu0hc2f3YYDi7zPk3JkJ-bBBfwKD_Rv14SP22L1gM0-aAzOYbrnOLzusBZed1xBGUmplExqAlwcoyiY36CnZrf1GJVU-EF4V4A?auto=format&w=1000 \" /></p>', '', NULL, NULL, 0, 0, 'D', 'B');
INSERT INTO `pms_product` VALUES (30, 50, 8, 0, 1, '500B Gems', 'https://production-gameflipusercontent.fingershock.com/us-east-1:871446a8-3bde-47ef-a601-2fd9a991c2e2/e3855e90-f495-416c-a95d-e48f54f2fa24/01cdf09e-43a4-42f9-87d2-abd94c212609/640x640.webp', 'HNTBJ2E042A', 0, 1, 1, 1, 0, 0, 0, 98.00, NULL, 0, 0, 0, '500B Gems (bilions not milions)', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', 'https://production-gameflipusercontent.fingershock.com/us-east-1:871446a8-3bde-47ef-a601-2fd9a991c2e2/e3855e90-f495-416c-a95d-e48f54f2fa24/01cdf09e-43a4-42f9-87d2-abd94c212609/640x640.webp', '', '', '', '', NULL, NULL, 0, 0, 'E', 'C');
INSERT INTO `pms_product` VALUES (31, 50, 48, 0, 1, 'Demon Slayer', 'https://images3.alphacoders.com/100/1000030.jpg', 'HNTBJ2E080A', 0, 1, 1, 1, 0, 0, 0, 98.00, NULL, 0, 0, 0, 'anime role', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', 'https://imgnew.outlookindia.com/uploadimage/library/16_9/16_9_5/IMAGE_1679302987.webp', '', '', '<p><img class=\"wscnph\" src=\" https://imgnew.outlookindia.com/uploadimage/library/16_9/16_9_5/IMAGE_1679302987.webp \" /></p>', '', NULL, NULL, 0, 0, 'F', 'C');
INSERT INTO `pms_product` VALUES (32, 50, 8, 0, NULL, 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HNTBJ2E153A', 1, 1, 0, 0, 0, 0, 0, 68.00, NULL, 0, 0, 0, 'T-shirt', '', 68.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'G', 'C');
INSERT INTO `pms_product` VALUES (33, 6, 35, 0, NULL, 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '4609652', 1, 1, 0, 0, 0, 0, 0, 2499.00, NULL, 0, 0, 0, 'AI TV', '', 2499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'H', 'D');
INSERT INTO `pms_product` VALUES (34, 6, 35, 0, NULL, 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', 1, 1, 0, 0, 0, 0, 0, 3999.00, NULL, 0, 0, 0, ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K TV', '', 3999.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'R', 'D');
INSERT INTO `pms_product` VALUES (35, 58, 29, 0, NULL, 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', 1, 1, 0, 0, 0, 0, 0, 369.00, NULL, 0, 0, 0, 'NIKE ROSHE RUN STYLE 511881-010', '', 369.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'J', 'E');
INSERT INTO `pms_product` VALUES (36, 58, 19, 0, NULL, 'Buying CSGO Skins/Knifes/Gloves DM', 'https://production-gameflipusercontent.fingershock.com/us-east-1:b5878284-b8d3-4ad1-91ed-6ba4a03f72e1/49b6fc2c-00ec-49d9-9cfa-9ee2a76c1698/923366c0-2f94-4a86-a80c-d86fd0135c1b/640x640.webp', '6799345', 0, 1, 1, 1, 0, 0, 0, 499.00, NULL, 0, 0, 0, 'Looking for preferably Karambits, Butterflies, Skeletons, Bayonets, M9 Bayonets. Ideally looking for Fades, Slaughters, Dopplers, Gamma Dopplers', '', 499.00, 100, 0, '', 0.00, 0, '', '', '', 'https://production-gameflipusercontent.fingershock.com/us-east-1:b5878284-b8d3-4ad1-91ed-6ba4a03f72e1/49b6fc2c-00ec-49d9-9cfa-9ee2a76c1698/923366c0-2f94-4a86-a80c-d86fd0135c1b/640x640.webp', '', '', '', '', NULL, NULL, 0, 0, 'K', 'E');
INSERT INTO `pms_product` VALUES (40, 1, 29, 0, 1, '123s', '', '123', 1, 1, 1, 1, 0, 55, 0, 33.00, NULL, 0, 0, 0, '1', 'dsa', 33.00, 44, 0, '44', 0.00, 0, '', '', '', '', '', '', '<p>dsa</p>', '', NULL, NULL, 0, 0, 'A', 'd');
INSERT INTO `pms_product` VALUES (41, 5, 46, 0, 1, 'Test', '', '1231234', 1, 1, 1, 1, 0, 7777, 0, 55.00, NULL, 0, 0, 0, '1223', 'dsada', 56.00, 44, 0, '654', 0.00, 0, '', '', '', '', '', '', '<p>123213sda</p>', '', NULL, NULL, 0, 0, 'E', 'colorful');
INSERT INTO `pms_product` VALUES (43, 1, 29, 0, 1, 'testt', '', 'asd123', 0, 1, 1, 1, 0, 55, 0, 44.00, NULL, 0, 0, 0, 'tet', 'asd', 55.00, 55, 0, '2', 0.00, 0, '', '', '', '', '', '', '<p>awd</p>', '', NULL, NULL, 0, 0, 'A', 'd');

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `select_type` int NULL DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int NULL DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int NULL DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int NULL DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int NULL DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int NULL DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int NULL DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int NULL DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品属性参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
INSERT INTO `pms_product_attribute` VALUES (1, 1, 'Unit', 2, 1, '1,2,3,4,5,6', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (13, 0, 'Unit', 1, 1, '1,2,3,4,5,6', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (20, 0, 'Unit', 2, 1, '1,2,3,4,5,6', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (24, 1, 'Unit', 1, 0, '1,2,3,4,5,6', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (32, 2, 'Unit', 0, 1, '1,2,3,4,5,6', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (37, 1, 'Unit', 1, 1, '1,2,3,4,5,6', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (42, 2, 'Unit', 0, 1, '1,2,3,4,5,6', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (45, 3, 'Unit', 0, 0, '1,2,3,4,5,6', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (49, 11, 'test', 0, 0, '1,2,3', 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `attribute_count` int NULL DEFAULT 0 COMMENT '属性数量',
  `param_count` int NULL DEFAULT 0 COMMENT '参数数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '产品属性分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
INSERT INTO `pms_product_attribute_category` VALUES (1, 'Category 1', 2, 5);
INSERT INTO `pms_product_attribute_category` VALUES (2, 'Category 2', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (3, 'Category 3', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (4, 'Category 4', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (5, 'Category 5', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (6, 'Category 6', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (10, 'Category 7', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (11, 'c6', 1, 0);

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `product_attribute_id` bigint NULL DEFAULT NULL,
  `value` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '存储产品参数信息的表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
INSERT INTO `pms_product_attribute_value` VALUES (11, 22, 7, 'x,xx');
INSERT INTO `pms_product_attribute_value` VALUES (12, 22, 24, '1');
INSERT INTO `pms_product_attribute_value` VALUES (13, 22, 25, '2');
INSERT INTO `pms_product_attribute_value` VALUES (14, 22, 37, '3');
INSERT INTO `pms_product_attribute_value` VALUES (15, 22, 38, '4');
INSERT INTO `pms_product_attribute_value` VALUES (16, 22, 39, '5');
INSERT INTO `pms_product_attribute_value` VALUES (183, 31, 24, '1');
INSERT INTO `pms_product_attribute_value` VALUES (184, 31, 25, '2');
INSERT INTO `pms_product_attribute_value` VALUES (185, 31, 37, '3');
INSERT INTO `pms_product_attribute_value` VALUES (186, 31, 38, '4');
INSERT INTO `pms_product_attribute_value` VALUES (187, 31, 39, '5');
INSERT INTO `pms_product_attribute_value` VALUES (201, 30, 38, '1');
INSERT INTO `pms_product_attribute_value` VALUES (202, 30, 39, '2');
INSERT INTO `pms_product_attribute_value` VALUES (204, 26, 45, '1');
INSERT INTO `pms_product_attribute_value` VALUES (205, 26, 46, '2');
INSERT INTO `pms_product_attribute_value` VALUES (206, 26, 47, '3');
INSERT INTO `pms_product_attribute_value` VALUES (207, 26, 48, '4');
INSERT INTO `pms_product_attribute_value` VALUES (214, 27, 45, '1');
INSERT INTO `pms_product_attribute_value` VALUES (215, 27, 46, '2');
INSERT INTO `pms_product_attribute_value` VALUES (216, 27, 47, '3');
INSERT INTO `pms_product_attribute_value` VALUES (217, 27, 48, '4');
INSERT INTO `pms_product_attribute_value` VALUES (219, 28, 45, '1');
INSERT INTO `pms_product_attribute_value` VALUES (220, 28, 46, '2');
INSERT INTO `pms_product_attribute_value` VALUES (221, 28, 47, '3');
INSERT INTO `pms_product_attribute_value` VALUES (222, 28, 48, '4');
INSERT INTO `pms_product_attribute_value` VALUES (223, 29, 43, '1');
INSERT INTO `pms_product_attribute_value` VALUES (224, 29, 45, '2');
INSERT INTO `pms_product_attribute_value` VALUES (225, 29, 46, '3');
INSERT INTO `pms_product_attribute_value` VALUES (226, 29, 47, '4');
INSERT INTO `pms_product_attribute_value` VALUES (227, 29, 48, '5');
INSERT INTO `pms_product_attribute_value` VALUES (228, 37, 7, '1');
INSERT INTO `pms_product_attribute_value` VALUES (229, 37, 24, '2');
INSERT INTO `pms_product_attribute_value` VALUES (230, 37, 25, '3');
INSERT INTO `pms_product_attribute_value` VALUES (231, 37, 37, '4');
INSERT INTO `pms_product_attribute_value` VALUES (232, 37, 38, '5');
INSERT INTO `pms_product_attribute_value` VALUES (233, 37, 39, '6');
INSERT INTO `pms_product_attribute_value` VALUES (234, 38, 35, '1');
INSERT INTO `pms_product_attribute_value` VALUES (235, 38, 32, '2');
INSERT INTO `pms_product_attribute_value` VALUES (236, 38, 33, '3');
INSERT INTO `pms_product_attribute_value` VALUES (237, 38, 42, '4');
INSERT INTO `pms_product_attribute_value` VALUES (238, 39, 35, '1');
INSERT INTO `pms_product_attribute_value` VALUES (239, 39, 32, '2');
INSERT INTO `pms_product_attribute_value` VALUES (240, 39, 33, '3');
INSERT INTO `pms_product_attribute_value` VALUES (241, 39, 42, '4');
INSERT INTO `pms_product_attribute_value` VALUES (242, 40, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (243, 40, 37, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (244, 41, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (245, 41, 37, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (246, 43, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (247, 43, 37, NULL);

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `level` int NULL DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int NULL DEFAULT NULL,
  `product_unit` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `nav_status` int NULL DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '产品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
INSERT INTO `pms_product_category` VALUES (1, 0, 'Gaming', 0, 100, 'unit', 1, 1, 1, NULL, 'Gaming', 'Gaming');
INSERT INTO `pms_product_category` VALUES (2, 0, 'Items', 0, 100, 'unit', 1, 1, 1, NULL, 'PFPs', 'PFPs');
INSERT INTO `pms_product_category` VALUES (3, 0, 'Art', 0, 100, 'unit', 1, 1, 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png', 'Art', 'Art');
INSERT INTO `pms_product_category` VALUES (4, 0, 'Photography', 0, 100, 'unit', 1, 1, 1, NULL, 'Photography', 'Photography');
INSERT INTO `pms_product_category` VALUES (5, 0, 'Anime', 0, 100, 'unit', 1, 1, 1, NULL, 'Membership', 'Membership');
INSERT INTO `pms_product_category` VALUES (7, 1, 'online', 1, 100, 'unit', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png', 'online', 'online');
INSERT INTO `pms_product_category` VALUES (8, 1, 'steam', 1, 100, 'unit', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_tshirt.png', 'steam', 'steam');
INSERT INTO `pms_product_category` VALUES (9, 1, 'a', 1, 100, 'unit', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xiuxianku.png', 'dnf', 'dnf');
INSERT INTO `pms_product_category` VALUES (10, 1, 'b', 1, 100, 'unit', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_niuzaiku.png', 'b', 'b');
INSERT INTO `pms_product_category` VALUES (11, 1, 'c', 1, 100, 'unit', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_chenshan.png', 'c', 'c');
INSERT INTO `pms_product_category` VALUES (19, 2, 'csgo', 1, 0, 'unit', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_shouji.png', 'csgo', 'csgo');
INSERT INTO `pms_product_category` VALUES (29, 1, 'd', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xie.png', 'd', 'd');
INSERT INTO `pms_product_category` VALUES (30, 2, 'cf', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_peijian.png', 'cf', 'cf');
INSERT INTO `pms_product_category` VALUES (31, 2, 'pubg', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_sheying.png', '', '');
INSERT INTO `pms_product_category` VALUES (32, 2, 'a', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', '');
INSERT INTO `pms_product_category` VALUES (33, 2, 'b', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', '');
INSERT INTO `pms_product_category` VALUES (34, 2, 'c', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_zhineng.png', '', '');
INSERT INTO `pms_product_category` VALUES (35, 3, 'music', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (36, 3, 'paint', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (37, 3, 'a', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (38, 3, 'b', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (39, 3, 'c', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (40, 3, 'd', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (41, 3, 'e', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (42, 3, 'g', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (43, 4, 'people', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (44, 4, 'view', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (45, 4, 'natural', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (46, 4, 'colorful', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (47, 4, 'a', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (48, 5, 'a', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (49, 5, 'b', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (50, 5, 'c', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (51, 5, 'd', 1, 0, '', 1, 1, 0, '', '', '');

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint NULL DEFAULT NULL,
  `product_attribute_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
INSERT INTO `pms_product_category_attribute_relation` VALUES (1, 24, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (5, 26, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (7, 28, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (9, 25, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (10, 25, 25);

-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `full_price` decimal(10, 2) NULL DEFAULT NULL,
  `reduce_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '产品满减表(只针对同商品)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
INSERT INTO `pms_product_full_reduction` VALUES (14, 22, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (16, 24, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (44, 31, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (46, 32, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (48, 33, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (53, 36, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (54, 35, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (55, 34, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (56, 30, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (57, 26, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (59, 27, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (60, 28, 500.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (61, 28, 1000.00, 120.00);
INSERT INTO `pms_product_full_reduction` VALUES (62, 29, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `count` int NULL DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '产品阶梯价格表(只针对同商品)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
INSERT INTO `pms_product_ladder` VALUES (18, 22, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (48, 31, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (50, 32, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (52, 33, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (57, 36, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (58, 35, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (59, 34, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (60, 30, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (61, 26, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (64, 27, 2, 0.80, 0.00);
INSERT INTO `pms_product_ladder` VALUES (65, 27, 3, 0.75, 0.00);
INSERT INTO `pms_product_ladder` VALUES (66, 28, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (67, 29, 0, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `price_old` decimal(10, 2) NULL DEFAULT NULL,
  `price_new` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_old` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_new` decimal(10, 2) NULL DEFAULT NULL,
  `gift_point_old` int NULL DEFAULT NULL COMMENT '赠送的积分',
  `gift_point_new` int NULL DEFAULT NULL,
  `use_point_limit_old` int NULL DEFAULT NULL,
  `use_point_limit_new` int NULL DEFAULT NULL,
  `operate_man` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `vertify_man` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `status` int NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '反馈详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品审核记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------
INSERT INTO `pms_product_vertify_record` VALUES (1, 1, '2018-04-27 16:36:41', 'test', 1, 'pass');
INSERT INTO `pms_product_vertify_record` VALUES (2, 2, '2018-04-27 16:36:41', 'test', 1, 'pass');

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'sku编码',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `stock` int NULL DEFAULT 0 COMMENT '库存',
  `low_stock` int NULL DEFAULT NULL COMMENT '预警库存',
  `sp1` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sp3` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '展示图片',
  `sale` int NULL DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单品促销价格',
  `lock_stock` int NULL DEFAULT 0 COMMENT '锁定库存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'sku的库存' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
INSERT INTO `pms_sku_stock` VALUES (12, 22, '111', 99.00, 0, NULL, 'x', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (13, 22, '112', 99.00, 0, NULL, 'xx', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2018032614134591_20180326141345650 (4).png', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (80, 36, '201806070023003', 99.00, 0, NULL, '500$', '', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', NULL, NULL, 1);
INSERT INTO `pms_sku_stock` VALUES (81, 36, '201806070023004', 2500.00, 5, NULL, '2500$', '', NULL, 'https://production-gameflipusercontent.fingershock.com/us-east-1:b5878284-b8d3-4ad1-91ed-6ba4a03f72e1/49b6fc2c-00ec-49d9-9cfa-9ee2a76c1698/923366c0-2f94-4a86-a80c-d86fd0135c1b/640x640.webp', NULL, NULL, 1);
INSERT INTO `pms_sku_stock` VALUES (92, 26, '201806070026003', 3788.00, 1, NULL, 'only one', '', NULL, 'https://i.seadn.io/gcs/files/80d615cf3ba9651a17d3070b7e6c211c.png?auto=format&w=1000', NULL, 3588.00, 0);
INSERT INTO `pms_sku_stock` VALUES (98, 27, '201808270027001', 2699.00, 1, NULL, 'only one', '', NULL, 'https://production-gameflipusercontent.fingershock.com/us-east-1:871446a8-3bde-47ef-a601-2fd9a991c2e2/e81ec867-998d-4333-a8e3-994aa49b6299/d221cb40-ef42-4fc7-8bab-684e47be9812/640x640.webp', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (99, 28, '201808270027001', 50.00, 50, NULL, 'vip', ' 50$', NULL, 'https://elements-cover-images-0.imgix.net/3d69f85b-5aa0-41fc-852c-c0375af60052?auto=compress%2Cformat&fit=max&w=1170&s=59a2ca134f50e5b8770b83f97045414f', NULL, NULL, -23);
INSERT INTO `pms_sku_stock` VALUES (100, 30, '201808270029001', 50.00, 99, NULL, 'only one', '', NULL, 'https://production-gameflipusercontent.fingershock.com/us-east-1:871446a8-3bde-47ef-a601-2fd9a991c2e2/e3855e90-f495-416c-a95d-e48f54f2fa24/01cdf09e-43a4-42f9-87d2-abd94c212609/640x640.webp', NULL, NULL, -4);
INSERT INTO `pms_sku_stock` VALUES (107, 29, '201808270029002', 6299.00, 100, NULL, 'standard', '', NULL, 'https://i.seadn.io/gcs/files/fddc4fe6455414bdc86da1edaa8447ce.jpg?auto=format&w=1000', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (108, 29, '201808270029003', 5499.00, 100, NULL, 'luxury', '', NULL, 'https://i.seadn.io/gcs/files/fddc4fe6455414bdc86da1edaa8447ce.jpg?auto=format&w=1000', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (109, 31, '201808270029002', 299.00, 100, NULL, 'standard', '', NULL, 'https://images3.alphacoders.com/100/1000030.jpg', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (110, 31, '201808270029003', 499.00, 100, NULL, 'luxury', '', NULL, 'https://imgnew.outlookindia.com/uploadimage/library/16_9/16_9_5/IMAGE_1679302987.webp', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (112, 40, 'only one', 12.00, 5, 56, '1', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (113, 40, 'hot 4', 123.00, 5, 66, '4', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (114, 41, 'three', 421.00, 444, 32, '3', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (115, 41, 'one', 43221.00, 444, 2, '1', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (116, 43, '1', 44.00, 55, 0, '1', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (117, 43, '1', 33.00, 44, 0, '3', NULL, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` int NULL DEFAULT NULL COMMENT '优惠卷类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `platform` int NULL DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
  `count` int NULL DEFAULT NULL COMMENT '数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `per_limit` int NULL DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `use_type` int NULL DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `note` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `publish_count` int NULL DEFAULT NULL COMMENT '发行数量',
  `use_count` int NULL DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int NULL DEFAULT NULL COMMENT '领取数量',
  `enable_time` datetime NULL DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '优惠码',
  `member_level` int NULL DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '优惠卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
INSERT INTO `sms_coupon` VALUES (2, 0, 'a', 0, 92, 10.00, 1, 100.00, '2023-05-29 14:04:12', '2023-05-03 16:40:47', 0, 'up100$ -10$', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (3, 0, 'b', 0, 92, 50.00, 1, 1000.00, '2023-05-29 14:04:12', '2023-05-03 16:40:47', 2, 'test', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (4, 0, 'c', 0, 92, 300.00, 1, 2000.00, '2023-05-29 14:04:12', '2023-05-03 16:40:47', 1, 'test', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (7, 0, 'd', 0, 93, 50.00, 1, 500.00, '2023-05-29 14:04:12', '2023-05-03 16:40:47', 1, 'up500$ -50$', 100, 0, 7, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (8, 0, 'e', 0, 100, 100.00, 1, 1000.00, '2023-05-29 14:04:12', '2023-05-03 16:40:47', 0, 'test', 100, 0, 1, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (9, 0, 'f', 0, 100, 5.00, 1, 100.00, '2023-05-29 14:04:12', '2023-05-03 16:40:47', 0, NULL, 100, 0, 1, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (10, 0, 'g', 0, 100, 15.00, 1, 200.00, '2023-05-29 14:04:12', '2023-05-03 16:40:47', 0, NULL, 100, 0, 1, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (11, 0, 'h', 0, 1000, 50.00, 1, 1000.00, '2023-05-29 14:04:12', '2023-05-03 16:40:47', 0, NULL, 1000, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (12, 0, 'i', 1, 1, 10.00, 1, 100.00, '2023-05-29 14:04:12', '2023-05-03 16:40:47', 0, NULL, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (19, 0, 'j', 0, 100, 100.00, 1, 1000.00, '2023-05-29 14:04:12', '2023-05-03 16:40:47', 1, 'test', 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (20, 0, 'k', 0, 100, 200.00, 1, 1000.00, '2023-05-29 14:04:12', '2023-05-03 16:40:47', 2, 'test', 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (21, 0, 'xxx', 0, 100, 10.00, 1, 100.00, '2023-05-29 14:04:12', '2023-05-03 16:40:47', 2, NULL, 100, 0, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint NULL DEFAULT NULL,
  `member_id` bigint NULL DEFAULT NULL,
  `coupon_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `member_nickname` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '领取人昵称',
  `get_type` int NULL DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
  `create_time` datetime NULL DEFAULT NULL,
  `use_status` int NULL DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
  `use_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单编号',
  `order_sn` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单号码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE,
  INDEX `idx_coupon_id`(`coupon_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '优惠券使用、领取历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------
INSERT INTO `sms_coupon_history` VALUES (2, 2, 1, '4931048380330002', 'windir', 1, '2023-05-29 14:04:12', 0, '2023-05-29 14:04:12', 12, '2023-05-29 14:04:12');
INSERT INTO `sms_coupon_history` VALUES (3, 3, 1, '4931048380330003', 'windir', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (4, 4, 1, '4931048380330004', 'windir', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (11, 7, 1, '4931048380330001', 'windir', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (12, 2, 4, '0340981248320004', 'zhensan', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (13, 3, 4, '0342977234360004', 'zhensan', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (14, 4, 4, '0343342928830004', 'zhensan', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (15, 2, 5, '0351883832180005', 'lisi', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (16, 3, 5, '0352201672680005', 'lisi', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (17, 4, 5, '0352505810180005', 'lisi', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (18, 2, 6, '0356114588380006', 'wangwu', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (19, 3, 6, '0356382856920006', 'wangwu', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (20, 4, 6, '0356656798470006', 'wangwu', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (21, 2, 3, '0363644984620003', 'windy', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (22, 3, 3, '0363932820300003', 'windy', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (23, 4, 3, '0364238275840003', 'windy', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (24, 2, 7, '0385034833070007', 'lion', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (25, 3, 7, '0385350208650007', 'lion', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (26, 4, 7, '0385632733900007', 'lion', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (27, 2, 8, '0388779132990008', 'shari', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (28, 3, 8, '0388943658810008', 'shari', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (29, 4, 8, '0389069398320008', 'shari', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (30, 2, 9, '0390753935250009', 'aewen', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (31, 3, 9, '0390882954470009', 'aewen', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (32, 4, 9, '0391025542810009', 'aewen', 1, '2023-05-29 14:04:12', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint NULL DEFAULT NULL,
  `product_category_id` bigint NULL DEFAULT NULL,
  `product_category_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '产品分类名称',
  `parent_category_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '父分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '优惠券和产品分类关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_category_relation` VALUES (4, 19, 30, 'j', 'j');

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_sn` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '优惠券和产品的关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_relation` VALUES (9, 21, 33, 'test', 'test');

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `status` int NULL DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '秒杀时间段名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '限时购表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
INSERT INTO `sms_flash_promotion` VALUES (2, 'test1', '2019-01-28', '2019-01-15', 0, '2018-11-16 11:12:13');
INSERT INTO `sms_flash_promotion` VALUES (3, 'test2', '2018-11-03', '2019-02-28', 1, '2018-11-16 11:11:31');
INSERT INTO `sms_flash_promotion` VALUES (4, 'test3', '2018-11-24', '2018-11-25', 0, '2018-11-16 11:12:19');
INSERT INTO `sms_flash_promotion` VALUES (5, 'test4', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:24');
INSERT INTO `sms_flash_promotion` VALUES (6, 'test5', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:31');
INSERT INTO `sms_flash_promotion` VALUES (7, 'test6', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:35');
INSERT INTO `sms_flash_promotion` VALUES (8, 'test7', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:39');
INSERT INTO `sms_flash_promotion` VALUES (9, 'test8', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:42');
INSERT INTO `sms_flash_promotion` VALUES (13, 'test9', '2018-11-01', '2018-11-30', 0, '2018-11-19 10:34:24');

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `member_phone` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `subscribe_time` datetime NULL DEFAULT NULL COMMENT '会员订阅时间',
  `send_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '限时购通知记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_log
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint NULL DEFAULT NULL,
  `flash_promotion_session_id` bigint NULL DEFAULT NULL COMMENT '编号',
  `product_id` bigint NULL DEFAULT NULL,
  `flash_promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int NULL DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int NULL DEFAULT NULL COMMENT '每人限购数量',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品限时购与商品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
INSERT INTO `sms_flash_promotion_product_relation` VALUES (1, 2, 1, 26, 3000.00, 10, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (2, 2, 1, 27, 2000.00, 10, 1, 20);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (3, 2, 1, 28, 599.00, 19, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (4, 2, 1, 29, 4999.00, 10, 1, 100);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (9, 2, 1, 26, 2999.00, 100, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (10, 2, 2, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (11, 2, 2, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (12, 2, 2, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (13, 2, 2, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (14, 2, 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (15, 2, 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (16, 2, 4, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (17, 2, 4, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (18, 2, 5, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (19, 2, 6, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (20, 2, 6, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (21, 3, 1, 26, 3000.00, 100, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (22, 3, 1, 27, 1999.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (23, 3, 1, 28, 599.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (24, 3, 1, 29, 4999.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (25, 3, 2, 31, 90.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (26, 3, 2, 32, 60.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (27, 3, 2, 33, 2299.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (28, 3, 2, 34, 3888.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (29, 3, 3, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (30, 3, 3, 35, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (31, 3, 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (32, 3, 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (33, 3, 4, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (34, 3, 4, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (35, 3, 4, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (36, 3, 4, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (37, 3, 5, 26, 3688.00, 100, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (38, 3, 5, 27, 2599.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (39, 3, 5, 28, 599.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (40, 3, 5, 29, 4999.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (41, 3, 6, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (42, 3, 6, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (43, 3, 6, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (44, 3, 6, 29, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '场次名称',
  `start_time` time NULL DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time NULL DEFAULT NULL COMMENT '每日结束时间',
  `status` int NULL DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '限时购场次表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
INSERT INTO `sms_flash_promotion_session` VALUES (1, '8:00', '08:00:00', '10:00:33', 1, '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session` VALUES (2, '10:00', '10:00:00', '12:00:00', 1, '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session` VALUES (3, '12:00', '12:00:00', '14:00:00', 1, '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session` VALUES (4, '14:00', '14:00:00', '16:00:00', 1, '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session` VALUES (5, '16:00', '16:00:00', '18:00:00', 1, '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session` VALUES (6, '18:00', '18:00:00', '20:00:00', 1, '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session` VALUES (7, '20:00', '20:00:33', '21:00:33', 0, '2018-11-16 13:22:55');

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int NULL DEFAULT NULL COMMENT '点击数',
  `order_count` int NULL DEFAULT NULL COMMENT '下单数',
  `url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `note` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '首页轮播广告表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
INSERT INTO `sms_home_advertise` VALUES (9, 'advertising1', 0, 'https://i.seadn.io/gcs/files/392cce734769b2334c31c7e84efe1e10.gif?auto=format&w=1920', '2018-11-01 00:00:00', '2018-11-24 00:00:00', 1, 0, 0, 'http://localhost:8081/', 'test', 40);
INSERT INTO `sms_home_advertise` VALUES (10, 'advertising2', 0, 'https://images6.alphacoders.com/117/1173817.jpg', '2018-11-13 00:00:00', '2018-11-24 00:00:00', 1, 0, 0, 'http://localhost:8081/', NULL, 50);
INSERT INTO `sms_home_advertise` VALUES (11, 'advertising3', 0, 'https://images4.alphacoders.com/123/1237092.jpg', '2018-11-13 00:00:00', '2018-11-30 00:00:00', 1, 0, 0, 'http://localhost:8081/', NULL, 60);

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_id` bigint NULL DEFAULT NULL,
  `brand_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `recommend_status` int NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '首页推荐品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
INSERT INTO `sms_home_brand` VALUES (1, 1, 'a', 1, 200);
INSERT INTO `sms_home_brand` VALUES (2, 2, 'b', 1, 0);
INSERT INTO `sms_home_brand` VALUES (6, 6, 'c', 1, 300);
INSERT INTO `sms_home_brand` VALUES (8, 5, 'd', 1, 100);
INSERT INTO `sms_home_brand` VALUES (32, 50, 'e', 1, 0);
INSERT INTO `sms_home_brand` VALUES (33, 51, 'f', 1, 0);
INSERT INTO `sms_home_brand` VALUES (35, 3, 'g', 1, 0);
INSERT INTO `sms_home_brand` VALUES (36, 4, 'h', 1, 0);
INSERT INTO `sms_home_brand` VALUES (37, 5, 'i', 1, 0);
INSERT INTO `sms_home_brand` VALUES (38, 1, 'j', 1, 0);
INSERT INTO `sms_home_brand` VALUES (39, 21, 'k', 1, 0);

-- ----------------------------
-- Table structure for sms_home_category
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_category`;
CREATE TABLE `sms_home_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint NULL DEFAULT NULL COMMENT '二级分类id',
  `category_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL COMMENT '广告位置：0->PC广告首页；1->app广告轮播',
  `status` int NULL DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `pic` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sms_home_category
-- ----------------------------
INSERT INTO `sms_home_category` VALUES (1, 19, 'FPS', 0, 1, 'https://i.seadn.io/gcs/files/6cdaf5f7fc406df1b2861ade634aad63.png?auto=format&w=1920', 'http://localhost:8081/#/detail/26', 10);
INSERT INTO `sms_home_category` VALUES (2, 7, 'Gaming', 0, 1, 'https://i.seadn.io/gcs/files/eea841af8a42ca249a979b71cf2c11f8.png?auto=format&w=1920', 'http://localhost:8081/#/detail/27', 20);

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `product_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `recommend_status` int NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '新鲜好物表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
INSERT INTO `sms_home_new_product` VALUES (2, 27, 'Chroma Elderwood Blade', 1, 200);
INSERT INTO `sms_home_new_product` VALUES (8, 26, 'Ordinal Kubz #6446', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (9, 36, 'Buying CSGO Skins/Knifes/Gloves DM', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (10, 28, 'Music Virtual Concert Flyer', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (11, 29, 'phone', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (12, 30, '500B Gems', 1, 0);

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `product_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `recommend_status` int NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '人气推荐商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
INSERT INTO `sms_home_recommend_product` VALUES (3, 26, 'Ordinal Kubz #6446', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (4, 27, 'Chroma Elderwood Blade', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (5, 28, 'Music Virtual Concert Flyer', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (6, 29, 'phone', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (7, 30, '500B Gems', 1, 100);

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint NULL DEFAULT NULL,
  `subject_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `recommend_status` int NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '首页推荐专题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
INSERT INTO `sms_home_recommend_subject` VALUES (14, 1, 'test', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (15, 2, 'test', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (16, 3, 'test', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (17, 4, 'test', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (18, 5, 'test', 1, 100);
INSERT INTO `sms_home_recommend_subject` VALUES (19, 6, 'test', 1, 0);

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `status` int NULL DEFAULT 1 COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '后台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES (1, 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, 'test account', NULL, '2018-09-29 13:55:30', '2018-09-29 13:55:39', 1);
INSERT INTO `ums_admin` VALUES (3, 'admin', '$2a$10$HIukCOoyY2lk9FP8YSxWNuxPJIfXpORkOfpEP61yHiaM34m6TcMh6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/170157_yIl3_1767531.jpg', 'admin@163.com', 'product manager', 'system manager', '2018-10-08 13:32:47', '2019-03-20 15:38:50', 1);
INSERT INTO `ums_admin` VALUES (5, 'song', '$2a$10$c3BwtguWKeNk9nRBPghVXOuL6byqEY3Am2rGvlXmV8ykToZSiCPzm', NULL, 'ssl654534335@gmail.com', 'sss', NULL, '2023-05-01 10:49:09', NULL, 1);

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_id` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `user_agent` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '浏览器登录类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '后台用户登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
INSERT INTO `ums_admin_login_log` VALUES (18, 1, '2023-04-06 06:29:24', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (19, 1, '2023-04-06 06:29:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (20, 1, '2023-04-06 06:29:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (21, 3, '2023-04-06 06:29:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (22, 3, '2023-04-06 06:29:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (23, 3, '2023-04-06 06:33:43', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (24, 3, '2023-04-06 06:33:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (25, 3, '2023-04-06 06:33:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (26, 3, '2023-04-06 06:33:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (27, 3, '2023-04-06 06:33:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (28, 1, '2023-04-06 06:34:10', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (29, 1, '2023-04-26 04:04:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (30, 1, '2023-04-26 04:04:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (31, 1, '2023-04-26 04:06:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (32, 1, '2023-04-26 04:15:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (33, 1, '2023-04-26 04:21:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (34, 1, '2023-04-26 04:40:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (35, 1, '2023-04-26 04:40:27', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (36, 1, '2023-04-26 04:41:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (37, 1, '2023-04-26 05:21:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (38, 1, '2023-04-26 05:22:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (39, 1, '2023-04-26 05:25:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (40, 1, '2023-04-26 05:29:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (41, 1, '2023-04-28 04:45:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (42, 1, '2023-04-28 07:06:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (43, 1, '2023-04-28 07:38:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (44, 1, '2023-04-28 08:09:52', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (45, 1, '2023-04-28 09:30:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (46, 1, '2023-04-28 11:13:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (47, 1, '2023-05-01 09:53:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (48, 1, '2023-05-01 09:53:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (49, 1, '2023-05-01 09:53:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (50, 1, '2023-05-01 09:54:10', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (51, 1, '2023-05-01 09:55:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (52, 1, '2023-05-01 09:56:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (53, 1, '2023-05-01 09:56:09', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (54, 1, '2023-05-01 09:56:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (55, 1, '2023-05-01 09:58:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (56, 1, '2023-05-01 09:58:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (57, 3, '2023-05-01 09:59:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (58, 3, '2023-05-01 10:00:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (59, 3, '2023-05-01 10:00:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (60, 1, '2023-05-01 10:00:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (61, 1, '2023-05-01 10:00:40', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (62, 1, '2023-05-01 10:24:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (63, 1, '2023-05-01 10:29:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (64, 1, '2023-05-01 11:02:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (65, 1, '2023-05-01 12:05:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (66, 3, '2023-05-01 12:13:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (67, 1, '2023-05-01 12:14:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (68, 1, '2023-05-02 02:01:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (69, 1, '2023-05-03 10:45:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (70, 1, '2023-05-03 11:00:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (71, 1, '2023-05-03 11:35:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (72, 1, '2023-05-03 11:44:54', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (73, 1, '2023-05-04 03:42:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (74, 1, '2023-05-04 04:45:57', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (75, 1, '2023-05-04 05:53:47', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (76, 1, '2023-05-04 05:54:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (77, 1, '2023-05-04 06:00:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (78, 1, '2023-05-04 06:56:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (79, 1, '2023-05-04 09:37:02', '0:0:0:0:0:0:0:1', NULL, NULL);

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_id` bigint NULL DEFAULT NULL,
  `permission_id` bigint NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '后台用户和权限关系表(除角色中定义的权限以外的加减权限)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_permission_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_id` bigint NULL DEFAULT NULL,
  `role_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '后台用户和角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
INSERT INTO `ums_admin_role_relation` VALUES (38, 3, 2);
INSERT INTO `ums_admin_role_relation` VALUES (39, 3, 1);
INSERT INTO `ums_admin_role_relation` VALUES (40, 3, 3);
INSERT INTO `ums_admin_role_relation` VALUES (41, 3, 4);
INSERT INTO `ums_admin_role_relation` VALUES (42, 3, 5);
INSERT INTO `ums_admin_role_relation` VALUES (43, 3, 8);
INSERT INTO `ums_admin_role_relation` VALUES (49, 5, 1);
INSERT INTO `ums_admin_role_relation` VALUES (50, 5, 2);
INSERT INTO `ums_admin_role_relation` VALUES (51, 5, 3);
INSERT INTO `ums_admin_role_relation` VALUES (52, 5, 4);
INSERT INTO `ums_admin_role_relation` VALUES (53, 5, 5);
INSERT INTO `ums_admin_role_relation` VALUES (54, 5, 8);
INSERT INTO `ums_admin_role_relation` VALUES (55, 1, 3);
INSERT INTO `ums_admin_role_relation` VALUES (56, 1, 4);
INSERT INTO `ums_admin_role_relation` VALUES (57, 1, 1);
INSERT INTO `ums_admin_role_relation` VALUES (58, 1, 5);
INSERT INTO `ums_admin_role_relation` VALUES (59, 1, 8);
INSERT INTO `ums_admin_role_relation` VALUES (60, 1, 3);

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `change_type` int NULL DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int NULL DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `source_type` int NULL DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '成长值变化历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
INSERT INTO `ums_growth_change_history` VALUES (1, 1, '2018-08-29 17:16:35', 0, 1000, 'test', 'test', 1);

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `change_type` int NULL DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int NULL DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `source_type` int NULL DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '积分变化历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_integration_change_history
-- ----------------------------

-- ----------------------------
-- Table structure for ums_integration_consume_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_consume_setting`;
CREATE TABLE `ums_integration_consume_setting`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int NULL DEFAULT NULL COMMENT '每一元需要抵扣的积分数量',
  `max_percent_per_order` int NULL DEFAULT NULL COMMENT '每笔订单最高抵用百分比',
  `use_unit` int NULL DEFAULT NULL COMMENT '每次使用积分最小单位100',
  `coupon_status` int NULL DEFAULT NULL COMMENT '是否可以和优惠券同用；0->不可以；1->可以',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '积分消费设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------
INSERT INTO `ums_integration_consume_setting` VALUES (1, 100, 50, 100, 1);

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint NULL DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` int NULL DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` int NULL DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `city` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `source_type` int NULL DEFAULT NULL COMMENT '用户来源',
  `integration` int NULL DEFAULT NULL COMMENT '积分',
  `growth` int NULL DEFAULT NULL COMMENT '成长值',
  `luckey_count` int NULL DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int NULL DEFAULT NULL COMMENT '历史积分数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `idx_phone`(`phone` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES (1, 1, 'test', '$2a$10$zUnskPAYscI1P4qQYICN.OvFU63eELVwqegx/thOqkxN2shB5KDEy', 'windir', '18061581849', 1, '2018-08-02 10:35:44', NULL, 1, '2009-06-01', '上海', '学生', 'test', NULL, 5000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (3, 4, 'windy', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windy', '18061581848', 1, '2018-08-03 16:46:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (4, 4, 'zhengsan', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'zhengsan', '18061581847', 1, '2018-11-12 14:12:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (5, 4, 'lisi', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lisi', '18061581841', 1, '2018-11-12 14:12:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (6, 4, 'wangwu', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'wangwu', '18061581842', 1, '2018-11-12 14:13:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (7, 4, 'lion', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lion', '18061581845', 1, '2018-11-12 14:21:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (8, 4, 'shari', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'shari', '18061581844', 1, '2018-11-12 14:22:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (9, 4, 'aewen', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'aewen', '18061581843', 1, '2018-11-12 14:22:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `growth_point` int NULL DEFAULT NULL,
  `default_status` int NULL DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int NULL DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int NULL DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int NULL DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int NULL DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int NULL DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int NULL DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int NULL DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '会员等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
INSERT INTO `ums_member_level` VALUES (1, 'gold vip', 1000, 0, 199.00, 5, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (2, 'platinum vip', 5000, 0, 99.00, 10, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (3, 'diamon vip', 15000, 0, 69.00, 15, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (4, 'normal vip', 1, 1, 199.00, 20, 1, 1, 1, 1, 0, 0, NULL);

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `login_type` int NULL DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '会员登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_login_log
-- ----------------------------
INSERT INTO `ums_member_login_log` VALUES (1, 1, '2023-04-06 07:11:28', '127.0.0.1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES (2, 1, '2023-04-06 07:16:31', '127.0.0.1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES (3, 1, '2023-04-06 07:53:10', '127.0.0.1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES (4, 1, '2023-04-06 07:55:19', '127.0.0.1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES (5, 1, '2023-04-06 08:21:40', '127.0.0.1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES (6, 1, '2023-04-28 11:15:51', '127.0.0.1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES (7, 1, '2023-05-01 10:50:00', '127.0.0.1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES (8, 1, '2023-05-01 12:14:01', '127.0.0.1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES (9, 1, '2023-05-03 11:43:45', '127.0.0.1', NULL, NULL, NULL);
INSERT INTO `ums_member_login_log` VALUES (10, 1, '2023-05-04 06:55:41', '127.0.0.1', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ums_member_member_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
CREATE TABLE `ums_member_member_tag_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NULL DEFAULT NULL,
  `tag_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户和标签关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_member_tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_product_category_relation`;
CREATE TABLE `ums_member_product_category_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NULL DEFAULT NULL,
  `product_category_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '会员与产品分类关系表（用户喜欢的分类）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_product_category_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `default_status` int NULL DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '城市',
  `region` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '详细地址(街道)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '会员收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
INSERT INTO `ums_member_receive_address` VALUES (1, 1, 'Johny', '5417326589', 0, '02135', 'MA', 'Boston', 'Allston', '88 Brighton Ave');
INSERT INTO `ums_member_receive_address` VALUES (3, 1, 'Alex', '8619587452', 0, '02134', 'OR', 'Corvallis', 'Oregon', '1728 NW KING BLVD');
INSERT INTO `ums_member_receive_address` VALUES (4, 1, 'Christy.Wu', '9642368459', 1, '02135', 'MA', 'Boston', 'Allston', 'Jail Avenue');

-- ----------------------------
-- Table structure for ums_member_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_rule_setting`;
CREATE TABLE `ums_member_rule_setting`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int NULL DEFAULT NULL COMMENT '连续签到天数',
  `continue_sign_point` int NULL DEFAULT NULL COMMENT '连续签到赠送数量',
  `consume_per_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '每消费多少元获取1个点',
  `low_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '最低获取点数的订单金额',
  `max_point_per_order` int NULL DEFAULT NULL COMMENT '每笔订单最高获取点数',
  `type` int NULL DEFAULT NULL COMMENT '类型：0->积分规则；1->成长值规则',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '会员积分成长规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_rule_setting
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NULL DEFAULT NULL,
  `consume_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '累计消费金额',
  `order_count` int NULL DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int NULL DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int NULL DEFAULT NULL COMMENT '评价数',
  `return_order_count` int NULL DEFAULT NULL COMMENT '退货数量',
  `login_count` int NULL DEFAULT NULL COMMENT '登录次数',
  `attend_count` int NULL DEFAULT NULL COMMENT '关注数量',
  `fans_count` int NULL DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int NULL DEFAULT NULL,
  `collect_subject_count` int NULL DEFAULT NULL,
  `collect_topic_count` int NULL DEFAULT NULL,
  `collect_comment_count` int NULL DEFAULT NULL,
  `invite_friend_count` int NULL DEFAULT NULL,
  `recent_order_time` datetime NULL DEFAULT NULL COMMENT '最后一次下订单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '会员统计信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_statistics_info
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_tag
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_tag`;
CREATE TABLE `ums_member_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `finish_order_count` int NULL DEFAULT NULL COMMENT '自动打标签完成订单数量',
  `finish_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '自动打标签完成订单金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_tag
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_task
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_task`;
CREATE TABLE `ums_member_task`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `growth` int NULL DEFAULT NULL COMMENT '赠送成长值',
  `intergration` int NULL DEFAULT NULL COMMENT '赠送积分',
  `type` int NULL DEFAULT NULL COMMENT '任务类型：0->新手任务；1->日常任务',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '会员任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_task
-- ----------------------------

-- ----------------------------
-- Table structure for ums_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_menu`;
CREATE TABLE `ums_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父级ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `level` int NULL DEFAULT NULL COMMENT '菜单级数',
  `sort` int NULL DEFAULT NULL COMMENT '菜单排序',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '前端名称',
  `icon` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '前端图标',
  `hidden` int NULL DEFAULT NULL COMMENT '前端隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '后台菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_menu
-- ----------------------------
INSERT INTO `ums_menu` VALUES (1, 0, '2020-02-02 14:50:36', 'Product', 0, 0, 'pms', 'product', 0);
INSERT INTO `ums_menu` VALUES (2, 1, '2020-02-02 14:51:50', 'Product List', 1, 0, 'product', 'product-list', 0);
INSERT INTO `ums_menu` VALUES (3, 1, '2020-02-02 14:52:44', 'Add Product', 1, 0, 'addProduct', 'product-add', 0);
INSERT INTO `ums_menu` VALUES (4, 1, '2020-02-02 14:53:51', 'Product Category', 1, 0, 'productCate', 'product-cate', 0);
INSERT INTO `ums_menu` VALUES (5, 1, '2020-02-02 14:54:51', 'Product Attribute', 1, 0, 'productAttr', 'product-attr', 0);
INSERT INTO `ums_menu` VALUES (6, 1, '2020-02-02 14:56:29', 'Product Management', 1, 0, 'brand', 'product-brand', 0);
INSERT INTO `ums_menu` VALUES (7, 0, '2020-02-02 16:54:07', 'Order', 0, 0, 'oms', 'order', 1);
INSERT INTO `ums_menu` VALUES (8, 7, '2020-02-02 16:55:18', 'Order List', 1, 0, 'order', 'product-list', 0);
INSERT INTO `ums_menu` VALUES (9, 7, '2020-02-02 16:56:46', 'Order Setting', 1, 0, 'orderSetting', 'order-setting', 0);
INSERT INTO `ums_menu` VALUES (10, 7, '2020-02-02 16:57:39', 'Return Apply', 1, 0, 'returnApply', 'order-return', 0);
INSERT INTO `ums_menu` VALUES (11, 7, '2020-02-02 16:59:40', 'Retrun Reason', 1, 0, 'returnReason', 'order-return-reason', 0);
INSERT INTO `ums_menu` VALUES (12, 0, '2020-02-04 16:18:00', 'Marketing', 0, 0, 'sms', 'sms', 1);
INSERT INTO `ums_menu` VALUES (14, 12, '2020-02-04 16:20:16', 'DIscount List', 1, 0, 'coupon', 'sms-coupon', 0);
INSERT INTO `ums_menu` VALUES (16, 12, '2020-02-07 16:22:38', 'Product Recomment', 1, 0, 'homeBrand', 'product-brand', 0);
INSERT INTO `ums_menu` VALUES (17, 12, '2020-02-07 16:23:14', 'New Product Recomment', 1, 0, 'homeNew', 'sms-new', 0);
INSERT INTO `ums_menu` VALUES (18, 12, '2020-02-07 16:26:38', 'Hot Product Recomment', 1, 0, 'homeHot', 'sms-hot', 0);
INSERT INTO `ums_menu` VALUES (19, 12, '2020-02-07 16:28:16', 'Topic Recomment', 1, 0, 'homeSubject', 'sms-subject', 0);
INSERT INTO `ums_menu` VALUES (20, 12, '2020-02-07 16:28:42', 'Advertising Recommnet', 1, 0, 'homeAdvertise', 'sms-ad', 0);
INSERT INTO `ums_menu` VALUES (21, 0, '2020-02-07 16:29:13', 'Auth', 0, 0, 'ums', 'ums', 0);
INSERT INTO `ums_menu` VALUES (22, 21, '2020-02-07 16:29:51', 'User List', 1, 0, 'admin', 'ums-admin', 0);
INSERT INTO `ums_menu` VALUES (23, 21, '2020-02-07 16:30:13', 'Role List', 1, 0, 'role', 'ums-role', 0);
INSERT INTO `ums_menu` VALUES (24, 21, '2020-02-07 16:30:53', 'Menu List', 1, 0, 'menu', 'ums-menu', 0);
INSERT INTO `ums_menu` VALUES (25, 21, '2020-02-07 16:31:13', 'Resource List', 1, 0, 'resource', 'ums-resource', 0);

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pid` bigint NULL DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` int NULL DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '前端资源路径',
  `status` int NULL DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '后台用户权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
INSERT INTO `ums_permission` VALUES (1, 0, 'product', NULL, NULL, 0, NULL, 1, '2018-09-29 16:15:14', 0);
INSERT INTO `ums_permission` VALUES (2, 1, 'product list', 'pms:product:read', NULL, 1, '/pms/product/index', 1, '2018-09-29 16:17:01', 0);
INSERT INTO `ums_permission` VALUES (3, 1, 'add product', 'pms:product:create', NULL, 1, '/pms/product/add', 1, '2018-09-29 16:18:51', 0);
INSERT INTO `ums_permission` VALUES (4, 1, 'product category', 'pms:productCategory:read', NULL, 1, '/pms/productCate/index', 1, '2018-09-29 16:23:07', 0);
INSERT INTO `ums_permission` VALUES (5, 1, 'product attribute', 'pms:productAttribute:read', NULL, 1, '/pms/productAttr/index', 1, '2018-09-29 16:24:43', 0);
INSERT INTO `ums_permission` VALUES (6, 1, 'brand management', 'pms:brand:read', NULL, 1, '/pms/brand/index', 1, '2018-09-29 16:25:45', 0);
INSERT INTO `ums_permission` VALUES (7, 2, 'edit product', 'pms:product:update', NULL, 2, '/pms/product/updateProduct', 1, '2018-09-29 16:34:23', 0);
INSERT INTO `ums_permission` VALUES (8, 2, 'delete product', 'pms:product:delete', NULL, 2, '/pms/product/delete', 1, '2018-09-29 16:38:33', 0);
INSERT INTO `ums_permission` VALUES (9, 4, 'add product category', 'pms:productCategory:create', NULL, 2, '/pms/productCate/create', 1, '2018-09-29 16:43:23', 0);
INSERT INTO `ums_permission` VALUES (10, 4, 'change product category', 'pms:productCategory:update', NULL, 2, '/pms/productCate/update', 1, '2018-09-29 16:43:55', 0);
INSERT INTO `ums_permission` VALUES (11, 4, 'delete product category', 'pms:productCategory:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:44:38', 0);
INSERT INTO `ums_permission` VALUES (12, 5, 'add product attribute', 'pms:productAttribute:create', NULL, 2, '/pms/productAttr/create', 1, '2018-09-29 16:45:25', 0);
INSERT INTO `ums_permission` VALUES (13, 5, 'change product attribute', 'pms:productAttribute:update', NULL, 2, '/pms/productAttr/update', 1, '2018-09-29 16:48:08', 0);
INSERT INTO `ums_permission` VALUES (14, 5, 'delete product attribute', 'pms:productAttribute:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:48:44', 0);
INSERT INTO `ums_permission` VALUES (15, 6, 'add brand', 'pms:brand:create', NULL, 2, '/pms/brand/add', 1, '2018-09-29 16:49:34', 0);
INSERT INTO `ums_permission` VALUES (16, 6, 'change brand', 'pms:brand:update', NULL, 2, '/pms/brand/update', 1, '2018-09-29 16:50:55', 0);
INSERT INTO `ums_permission` VALUES (17, 6, 'delete brand', 'pms:brand:delete', NULL, 2, '/pms/brand/delete', 1, '2018-09-29 16:50:59', 0);
INSERT INTO `ums_permission` VALUES (18, 0, 'homepage', NULL, NULL, 0, NULL, 1, '2018-09-29 16:51:57', 0);

-- ----------------------------
-- Table structure for ums_resource
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource`;
CREATE TABLE `ums_resource`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '资源URL',
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `category_id` bigint NULL DEFAULT NULL COMMENT '资源分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '后台资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_resource
-- ----------------------------
INSERT INTO `ums_resource` VALUES (1, '2020-02-04 17:04:55', 'Product Management', '/brand/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (2, '2020-02-04 17:05:35', 'Product Attribute Category Management', '/productAttribute/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (3, '2020-02-04 17:06:13', 'Product Attribute Management', '/productAttribute/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (4, '2020-02-04 17:07:15', 'Product Catogory Management', '/productCategory/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (5, '2020-02-04 17:09:16', 'Product Managemeny', '/product/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (6, '2020-02-04 17:09:53', 'Product Stock Management', '/sku/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (8, '2020-02-05 14:43:37', 'Order Management', '/order/**', '', 2);
INSERT INTO `ums_resource` VALUES (9, '2020-02-05 14:44:22', 'Returen Order Apply Management', '/returnApply/**', '', 2);
INSERT INTO `ums_resource` VALUES (10, '2020-02-05 14:45:08', 'Return Reason Management', '/returnReason/**', '', 2);
INSERT INTO `ums_resource` VALUES (11, '2020-02-05 14:45:43', 'Order Setting Management', '/orderSetting/**', '', 2);
INSERT INTO `ums_resource` VALUES (12, '2020-02-05 14:46:23', 'Recieve Address Management', '/companyAddress/**', '', 2);
INSERT INTO `ums_resource` VALUES (13, '2020-02-07 16:37:22', 'Discount Management', '/coupon/**', '', 3);
INSERT INTO `ums_resource` VALUES (14, '2020-02-07 16:37:59', 'Discount Apply Record Management', '/couponHistory/**', '', 3);
INSERT INTO `ums_resource` VALUES (15, '2020-02-07 16:38:28', 'Limit Purchase Management', '/flash/**', '', 3);
INSERT INTO `ums_resource` VALUES (16, '2020-02-07 16:38:59', 'Limit Purchase Product Management', '/flashProductRelation/**', '', 3);
INSERT INTO `ums_resource` VALUES (17, '2020-02-07 16:39:22', 'Limit Time Management', '/flashSession/**', '', 3);
INSERT INTO `ums_resource` VALUES (18, '2020-02-07 16:40:07', 'Homepage Advertising Management', '/home/advertise/**', '', 3);
INSERT INTO `ums_resource` VALUES (19, '2020-02-07 16:40:34', 'Homepage Product Management', '/home/brand/**', '', 3);
INSERT INTO `ums_resource` VALUES (20, '2020-02-07 16:41:06', 'Homepage New Product Management', '/home/newProduct/**', '', 3);
INSERT INTO `ums_resource` VALUES (21, '2020-02-07 16:42:16', 'Homepage Hot Recomment Management', '/home/recommendProduct/**', '', 3);
INSERT INTO `ums_resource` VALUES (23, '2020-02-07 16:44:56', 'Product Recomment Product', '/prefrenceArea/**', '', 5);
INSERT INTO `ums_resource` VALUES (24, '2020-02-07 16:45:39', 'Product Topic Management', '/subject/**', '', 5);
INSERT INTO `ums_resource` VALUES (25, '2020-02-07 16:47:34', 'Back-End Management', '/admin/**', '', 4);
INSERT INTO `ums_resource` VALUES (26, '2020-02-07 16:48:24', 'Back-End Role Management', '/role/**', '', 4);
INSERT INTO `ums_resource` VALUES (27, '2020-02-07 16:48:48', 'Back-End Menu Management', '/menu/**', '', 4);
INSERT INTO `ums_resource` VALUES (28, '2020-02-07 16:49:18', 'Back-End Resource Relationship Management', '/resourceCategory/**', '', 4);
INSERT INTO `ums_resource` VALUES (29, '2020-02-07 16:49:45', 'Back-End Resource Managent', '/resource/**', '', 4);

-- ----------------------------
-- Table structure for ums_resource_category
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource_category`;
CREATE TABLE `ums_resource_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '资源分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_resource_category
-- ----------------------------
INSERT INTO `ums_resource_category` VALUES (1, '2020-02-05 10:21:44', 'Product Module', 0);
INSERT INTO `ums_resource_category` VALUES (2, '2020-02-05 10:22:34', 'Order Module', 0);
INSERT INTO `ums_resource_category` VALUES (3, '2020-02-05 10:22:48', 'Market Module', 0);
INSERT INTO `ums_resource_category` VALUES (4, '2020-02-05 10:23:04', 'Auth Module', 0);
INSERT INTO `ums_resource_category` VALUES (5, '2020-02-07 16:34:27', 'Description Module', 0);
INSERT INTO `ums_resource_category` VALUES (6, '2020-02-07 16:35:49', 'Other Module', 0);

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `admin_count` int NULL DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` int NULL DEFAULT 1 COMMENT '启用状态：0->禁用；1->启用',
  `sort` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '后台用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES (1, 'product manager', 'product manager', 0, '2018-09-30 15:46:11', 1, 0);
INSERT INTO `ums_role` VALUES (2, 'order manager', 'just look and change order', 0, '2018-09-30 15:53:45', 1, 0);
INSERT INTO `ums_role` VALUES (3, 'product category manager', 'product category manager', 0, '2018-09-30 15:53:56', 1, 0);
INSERT INTO `ums_role` VALUES (4, 'brand manager', 'brand manager', 0, '2020-08-24 10:58:35', 1, 0);
INSERT INTO `ums_role` VALUES (5, 'super manager', 'have all look and operate function', 0, '2020-02-02 15:11:05', 1, 0);
INSERT INTO `ums_role` VALUES (8, 'auth manager', 'only have auth manage function', 0, '2020-08-24 10:57:35', 1, 0);

-- ----------------------------
-- Table structure for ums_role_menu_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_menu_relation`;
CREATE TABLE `ums_role_menu_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '后台角色菜单关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role_menu_relation
-- ----------------------------
INSERT INTO `ums_role_menu_relation` VALUES (53, 2, 7);
INSERT INTO `ums_role_menu_relation` VALUES (54, 2, 8);
INSERT INTO `ums_role_menu_relation` VALUES (55, 2, 9);
INSERT INTO `ums_role_menu_relation` VALUES (56, 2, 10);
INSERT INTO `ums_role_menu_relation` VALUES (57, 2, 11);
INSERT INTO `ums_role_menu_relation` VALUES (96, 6, 21);
INSERT INTO `ums_role_menu_relation` VALUES (97, 6, 22);
INSERT INTO `ums_role_menu_relation` VALUES (98, 6, 23);
INSERT INTO `ums_role_menu_relation` VALUES (99, 6, 24);
INSERT INTO `ums_role_menu_relation` VALUES (100, 6, 25);
INSERT INTO `ums_role_menu_relation` VALUES (101, 7, 21);
INSERT INTO `ums_role_menu_relation` VALUES (102, 7, 22);
INSERT INTO `ums_role_menu_relation` VALUES (103, 7, 23);
INSERT INTO `ums_role_menu_relation` VALUES (104, 7, 24);
INSERT INTO `ums_role_menu_relation` VALUES (105, 7, 25);
INSERT INTO `ums_role_menu_relation` VALUES (106, 8, 21);
INSERT INTO `ums_role_menu_relation` VALUES (107, 8, 22);
INSERT INTO `ums_role_menu_relation` VALUES (108, 8, 23);
INSERT INTO `ums_role_menu_relation` VALUES (109, 8, 24);
INSERT INTO `ums_role_menu_relation` VALUES (110, 8, 25);
INSERT INTO `ums_role_menu_relation` VALUES (135, 1, 1);
INSERT INTO `ums_role_menu_relation` VALUES (136, 1, 2);
INSERT INTO `ums_role_menu_relation` VALUES (137, 1, 3);
INSERT INTO `ums_role_menu_relation` VALUES (138, 1, 4);
INSERT INTO `ums_role_menu_relation` VALUES (139, 1, 5);
INSERT INTO `ums_role_menu_relation` VALUES (140, 1, 6);
INSERT INTO `ums_role_menu_relation` VALUES (189, 5, 1);
INSERT INTO `ums_role_menu_relation` VALUES (190, 5, 2);
INSERT INTO `ums_role_menu_relation` VALUES (191, 5, 3);
INSERT INTO `ums_role_menu_relation` VALUES (192, 5, 4);
INSERT INTO `ums_role_menu_relation` VALUES (193, 5, 5);
INSERT INTO `ums_role_menu_relation` VALUES (194, 5, 6);
INSERT INTO `ums_role_menu_relation` VALUES (195, 5, 7);
INSERT INTO `ums_role_menu_relation` VALUES (196, 5, 8);
INSERT INTO `ums_role_menu_relation` VALUES (197, 5, 9);
INSERT INTO `ums_role_menu_relation` VALUES (198, 5, 10);
INSERT INTO `ums_role_menu_relation` VALUES (199, 5, 11);
INSERT INTO `ums_role_menu_relation` VALUES (200, 5, 12);
INSERT INTO `ums_role_menu_relation` VALUES (201, 5, 13);
INSERT INTO `ums_role_menu_relation` VALUES (202, 5, 14);
INSERT INTO `ums_role_menu_relation` VALUES (203, 5, 16);
INSERT INTO `ums_role_menu_relation` VALUES (204, 5, 17);
INSERT INTO `ums_role_menu_relation` VALUES (205, 5, 18);
INSERT INTO `ums_role_menu_relation` VALUES (206, 5, 19);
INSERT INTO `ums_role_menu_relation` VALUES (207, 5, 20);
INSERT INTO `ums_role_menu_relation` VALUES (208, 5, 21);
INSERT INTO `ums_role_menu_relation` VALUES (209, 5, 22);
INSERT INTO `ums_role_menu_relation` VALUES (210, 5, 23);
INSERT INTO `ums_role_menu_relation` VALUES (211, 5, 24);
INSERT INTO `ums_role_menu_relation` VALUES (212, 5, 25);

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NULL DEFAULT NULL,
  `permission_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '后台用户角色和权限关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
INSERT INTO `ums_role_permission_relation` VALUES (1, 1, 1);
INSERT INTO `ums_role_permission_relation` VALUES (2, 1, 2);
INSERT INTO `ums_role_permission_relation` VALUES (3, 1, 3);
INSERT INTO `ums_role_permission_relation` VALUES (4, 1, 7);
INSERT INTO `ums_role_permission_relation` VALUES (5, 1, 8);
INSERT INTO `ums_role_permission_relation` VALUES (6, 2, 4);
INSERT INTO `ums_role_permission_relation` VALUES (7, 2, 9);
INSERT INTO `ums_role_permission_relation` VALUES (8, 2, 10);
INSERT INTO `ums_role_permission_relation` VALUES (9, 2, 11);
INSERT INTO `ums_role_permission_relation` VALUES (10, 3, 5);
INSERT INTO `ums_role_permission_relation` VALUES (11, 3, 12);
INSERT INTO `ums_role_permission_relation` VALUES (12, 3, 13);
INSERT INTO `ums_role_permission_relation` VALUES (13, 3, 14);
INSERT INTO `ums_role_permission_relation` VALUES (14, 4, 6);
INSERT INTO `ums_role_permission_relation` VALUES (15, 4, 15);
INSERT INTO `ums_role_permission_relation` VALUES (16, 4, 16);
INSERT INTO `ums_role_permission_relation` VALUES (17, 4, 17);

-- ----------------------------
-- Table structure for ums_role_resource_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_resource_relation`;
CREATE TABLE `ums_role_resource_relation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `resource_id` bigint NULL DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 272 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '后台角色资源关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role_resource_relation
-- ----------------------------
INSERT INTO `ums_role_resource_relation` VALUES (103, 2, 8);
INSERT INTO `ums_role_resource_relation` VALUES (104, 2, 9);
INSERT INTO `ums_role_resource_relation` VALUES (105, 2, 10);
INSERT INTO `ums_role_resource_relation` VALUES (106, 2, 11);
INSERT INTO `ums_role_resource_relation` VALUES (107, 2, 12);
INSERT INTO `ums_role_resource_relation` VALUES (170, 1, 1);
INSERT INTO `ums_role_resource_relation` VALUES (171, 1, 2);
INSERT INTO `ums_role_resource_relation` VALUES (172, 1, 3);
INSERT INTO `ums_role_resource_relation` VALUES (173, 1, 4);
INSERT INTO `ums_role_resource_relation` VALUES (174, 1, 5);
INSERT INTO `ums_role_resource_relation` VALUES (175, 1, 6);
INSERT INTO `ums_role_resource_relation` VALUES (176, 1, 23);
INSERT INTO `ums_role_resource_relation` VALUES (177, 1, 24);
INSERT INTO `ums_role_resource_relation` VALUES (178, 6, 25);
INSERT INTO `ums_role_resource_relation` VALUES (179, 6, 26);
INSERT INTO `ums_role_resource_relation` VALUES (180, 6, 27);
INSERT INTO `ums_role_resource_relation` VALUES (181, 6, 28);
INSERT INTO `ums_role_resource_relation` VALUES (182, 6, 29);
INSERT INTO `ums_role_resource_relation` VALUES (205, 7, 25);
INSERT INTO `ums_role_resource_relation` VALUES (206, 7, 26);
INSERT INTO `ums_role_resource_relation` VALUES (207, 7, 27);
INSERT INTO `ums_role_resource_relation` VALUES (208, 7, 28);
INSERT INTO `ums_role_resource_relation` VALUES (209, 7, 29);
INSERT INTO `ums_role_resource_relation` VALUES (210, 7, 31);
INSERT INTO `ums_role_resource_relation` VALUES (211, 8, 25);
INSERT INTO `ums_role_resource_relation` VALUES (212, 8, 26);
INSERT INTO `ums_role_resource_relation` VALUES (213, 8, 27);
INSERT INTO `ums_role_resource_relation` VALUES (214, 8, 28);
INSERT INTO `ums_role_resource_relation` VALUES (215, 8, 29);
INSERT INTO `ums_role_resource_relation` VALUES (244, 5, 1);
INSERT INTO `ums_role_resource_relation` VALUES (245, 5, 2);
INSERT INTO `ums_role_resource_relation` VALUES (246, 5, 3);
INSERT INTO `ums_role_resource_relation` VALUES (247, 5, 4);
INSERT INTO `ums_role_resource_relation` VALUES (248, 5, 5);
INSERT INTO `ums_role_resource_relation` VALUES (249, 5, 6);
INSERT INTO `ums_role_resource_relation` VALUES (250, 5, 8);
INSERT INTO `ums_role_resource_relation` VALUES (251, 5, 9);
INSERT INTO `ums_role_resource_relation` VALUES (252, 5, 10);
INSERT INTO `ums_role_resource_relation` VALUES (253, 5, 11);
INSERT INTO `ums_role_resource_relation` VALUES (254, 5, 12);
INSERT INTO `ums_role_resource_relation` VALUES (255, 5, 13);
INSERT INTO `ums_role_resource_relation` VALUES (256, 5, 14);
INSERT INTO `ums_role_resource_relation` VALUES (257, 5, 15);
INSERT INTO `ums_role_resource_relation` VALUES (258, 5, 16);
INSERT INTO `ums_role_resource_relation` VALUES (259, 5, 17);
INSERT INTO `ums_role_resource_relation` VALUES (260, 5, 18);
INSERT INTO `ums_role_resource_relation` VALUES (261, 5, 19);
INSERT INTO `ums_role_resource_relation` VALUES (262, 5, 20);
INSERT INTO `ums_role_resource_relation` VALUES (263, 5, 21);
INSERT INTO `ums_role_resource_relation` VALUES (264, 5, 22);
INSERT INTO `ums_role_resource_relation` VALUES (265, 5, 23);
INSERT INTO `ums_role_resource_relation` VALUES (266, 5, 24);
INSERT INTO `ums_role_resource_relation` VALUES (267, 5, 25);
INSERT INTO `ums_role_resource_relation` VALUES (268, 5, 26);
INSERT INTO `ums_role_resource_relation` VALUES (269, 5, 27);
INSERT INTO `ums_role_resource_relation` VALUES (270, 5, 28);
INSERT INTO `ums_role_resource_relation` VALUES (271, 5, 29);

SET FOREIGN_KEY_CHECKS = 1;
