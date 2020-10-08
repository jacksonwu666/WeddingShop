/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 03/10/2020 22:58:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '新娘礼服');
INSERT INTO `category` VALUES ('2', '婚房布置');
INSERT INTO `category` VALUES ('3', '喜糖请柬');
INSERT INTO `category` VALUES ('4', '接亲婚宴');
INSERT INTO `category` VALUES ('5', '婚庆床品');
INSERT INTO `category` VALUES ('6', '新娘嫁妆');
INSERT INTO `category` VALUES ('7', '新郎穿搭');
INSERT INTO `category` VALUES ('8', '结婚酒水');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `itemid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int(0) NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `fk_0001`(`pid`) USING BTREE,
  INDEX `fk_0002`(`oid`) USING BTREE,
  CONSTRAINT `fk_0001` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_0002` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('03769bb34965456b89a120291c858c62', 1, 1299, '1', 'eff8ddc369dd46e38fadad20e42ebea9');
INSERT INTO `orderitem` VALUES ('06d0dc408ce54e2db96461027dcc461f', 1, 12.8, '4', 'be9e43513db8497c801b91e06f713c53');
INSERT INTO `orderitem` VALUES ('0758f3180b9443ca913b6e0028012999', 2, 28, '4', 'b8b8635ad5464c0fb21810e56f90d807');
INSERT INTO `orderitem` VALUES ('084390008f724df4a2bf43e693c5f2a6', 1, 48, '1', '1919fe7f3cba4e42b3d60cb1edbe530a');
INSERT INTO `orderitem` VALUES ('09d9cc3e859f4fb3a2f8767eae9a534e', 2, 25, '2', '428bbb53638a497090828057e005f032');
INSERT INTO `orderitem` VALUES ('0d20f547d6e0415abb9310a6b0de9cc7', 2, 28, '4', '596c75e4840946149746d000d73d04e5');
INSERT INTO `orderitem` VALUES ('0e2320f4eb254fc3a7d035123b43a884', 1, 21, '7', '0655525134b1432b8801aba344168161');
INSERT INTO `orderitem` VALUES ('107606c9eb8649bda2fd0bcf8de60e88', 1, 21, '7', '3c568f2397bf40319e9a671eef396b23');
INSERT INTO `orderitem` VALUES ('11b08693e3504c75b28f5d6a8a33d09f', 1, 14, '4', '330959cb49274383b60f8455c62b8ea2');
INSERT INTO `orderitem` VALUES ('13d24cf7260b41d29b774c4de79a7475', 1, 15, '3', '6da1b994e51f46b781af98713bbf3265');
INSERT INTO `orderitem` VALUES ('15aa03ef024442debc47a5b19641cbfe', 1, 15, '6', '5c211d7bf5da476285ef6f9d0194ac5c');
INSERT INTO `orderitem` VALUES ('15c3a1c67b3b4697b9b13b6b538afe6a', 1, 14, '4', '4e3d72d068ba485e95bd013422fabcd5');
INSERT INTO `orderitem` VALUES ('19a1f322bd564415b9d43cf98d0b7da2', 1, 15, '3', 'c4300f64f42949a386f0623530beb69c');
INSERT INTO `orderitem` VALUES ('20cd6069d6854ab29f0de57566a172db', 1, 48, '1', '9132d6a4995741e09eb74c763114a6d8');
INSERT INTO `orderitem` VALUES ('21bd7b8fcc71426aa14b809178bbf175', 1, 128, '10', '69e6c3b9062245009ee4e697bab4e68c');
INSERT INTO `orderitem` VALUES ('22e88b89008c4d779c37f0742d84ab58', 1, 48, '1', '2cbb4b00e79449d1a49fa71fd918ee97');
INSERT INTO `orderitem` VALUES ('23a100283fda459093efd4543934a384', 1, 14, '4', '08ea69439e614e3cb0f0144d516be4eb');
INSERT INTO `orderitem` VALUES ('249a88f44d7a48f7aab03846499ecb50', 1, 15, '6', '1919fe7f3cba4e42b3d60cb1edbe530a');
INSERT INTO `orderitem` VALUES ('24e592e2e61d406db37a84c1d66dd025', 3, 42, '4', '814742325a604e76ae96c76d1ca0e956');
INSERT INTO `orderitem` VALUES ('28b8a50ee47b44ad81613cfb2148e353', 1, 13.9, '3', '9132d6a4995741e09eb74c763114a6d8');
INSERT INTO `orderitem` VALUES ('2f39f3963e9c49a98f3518b23f6c1869', 1, 15, '6', '52a2037ce3cf4a7daf7a205a73db0d17');
INSERT INTO `orderitem` VALUES ('305edc883edc44b89ed93aceab808364', 2, 27.8, '3', 'e0a7e7d36cd44679b0aba46a3984146c');
INSERT INTO `orderitem` VALUES ('3092ec86e2ca4369a0ea5260f5ccc3fa', 5, 64, '4', '2cbb4b00e79449d1a49fa71fd918ee97');
INSERT INTO `orderitem` VALUES ('3157c22ccd924e5889d3711207ef0eba', 1, 21.8, '7', 'e0a7e7d36cd44679b0aba46a3984146c');
INSERT INTO `orderitem` VALUES ('3416c971fd0e4885a8e246a40d2b3f78', 1, 48, '1', 'e0a7e7d36cd44679b0aba46a3984146c');
INSERT INTO `orderitem` VALUES ('40be39859dce4a40b1ebcbc49dbb9eeb', 1, 48, '1', '9e49fe350d8b4127834fd0dd70fe04e9');
INSERT INTO `orderitem` VALUES ('422a015a993d4072a30b42a297c886db', 1, 48, '1', '52a2037ce3cf4a7daf7a205a73db0d17');
INSERT INTO `orderitem` VALUES ('47386918202043f5ae5b51093e3121be', 1, 21, '7', 'c604ab354c7d4cd3a8960acf13406fbf');
INSERT INTO `orderitem` VALUES ('4c73010293884adcb1e8af6133391368', 1, 21, '7', '3464942b6a2e44ba9a1f29e5185c2c76');
INSERT INTO `orderitem` VALUES ('4efca528ebbc488d847a9fe48f756f84', 5, 64, '4', '9132d6a4995741e09eb74c763114a6d8');
INSERT INTO `orderitem` VALUES ('4f054dfcb2214bd383579688d9ed8850', 1, 48, '1', '17851784d6bf405c817fbbce2b3ba849');
INSERT INTO `orderitem` VALUES ('4fd60f9c926146f3897e6cabfadf82bf', 1, 48, '1', 'd483492da59b4f4990e06cf39b86f6bf');
INSERT INTO `orderitem` VALUES ('50f95613c28643de8fbc12808c335b27', 1, 14, '4', '52a2037ce3cf4a7daf7a205a73db0d17');
INSERT INTO `orderitem` VALUES ('510676f091994bc3afde6f8a3335c4fe', 1, 10, '8', 'b7e02313a7b945adb1ef8964eaa1be6e');
INSERT INTO `orderitem` VALUES ('53c1cb1c87bd4126ba273ea3c96bf3e9', 1, 21, '7', '4e3d72d068ba485e95bd013422fabcd5');
INSERT INTO `orderitem` VALUES ('54b15fd18f7548229a48ad0011bf7e32', 1, 19, '2', '388b7a3e38934ce3b8796cfa19c656e6');
INSERT INTO `orderitem` VALUES ('5564c5dfd6c44091a46b0f1fff85e405', 1, 128, '10', '5f97ff1771cc449c901052a8ce61ef84');
INSERT INTO `orderitem` VALUES ('574c4fe305aa4fe8acff3653839fd8a6', 1, 10, '8', '52a2037ce3cf4a7daf7a205a73db0d17');
INSERT INTO `orderitem` VALUES ('5864e4c6090c4653b0ef0be109835c91', 2, 21.6, '6', 'f322369d55b14b5fb34d783d482cb8ef');
INSERT INTO `orderitem` VALUES ('5b6f9a6d05814481a200d52b8855c5fe', 1, 21, '7', '8e20181d744d4bacbcc2065b43662062');
INSERT INTO `orderitem` VALUES ('5cc790062de84de598bd951976356e22', 1, 12.8, '4', 'fd6beceeb4854b349a4d2ba06e92d7b8');
INSERT INTO `orderitem` VALUES ('5d9d1bfe0a22474f9eb61df785eeebd9', 1, 15, '3', '5f97ff1771cc449c901052a8ce61ef84');
INSERT INTO `orderitem` VALUES ('5feee7813706457593316a5acec78f42', 1, 15, '6', '874db50874b44f469a7193bd297b9335');
INSERT INTO `orderitem` VALUES ('6138b250c9ba4ccaaf28bbed016ee062', 1, 1299, '1', '60ec76ce03b64893aae872d434b54a99');
INSERT INTO `orderitem` VALUES ('62655c4441504597afb9d29632540a9d', 1, 48, '1', 'c049623052fc40079115245f8cbdaa83');
INSERT INTO `orderitem` VALUES ('67f4b0cc04c84874bed23ff289575abc', 1, 10, '8', '1919fe7f3cba4e42b3d60cb1edbe530a');
INSERT INTO `orderitem` VALUES ('684620b11e3d4a269b7573aa63604cc1', 1, 15, '3', 'fc3143ecdcdc40b0a3384cdea0464846');
INSERT INTO `orderitem` VALUES ('7049cbb1877b40268d2051dc009601ce', 1, 14, '4', '6da1b994e51f46b781af98713bbf3265');
INSERT INTO `orderitem` VALUES ('7796f3bd101d4fb5a4f447621e58b548', 1, 15, '3', '89e6948b474a4b978cca6f5ca7e3ecc5');
INSERT INTO `orderitem` VALUES ('7804184fa14b419e997d3cb3e961373f', 1, 15, '6', '4e89bbd8442e47bfad2e7dde65a012a9');
INSERT INTO `orderitem` VALUES ('8462f720d88f45d1be0940eda6fbea1f', 1, 14, '4', '7271379e6d5f4355b731affaf0ff19f0');
INSERT INTO `orderitem` VALUES ('847d579341964262a992105657346c8c', 1, 10.8, '8', 'e0a7e7d36cd44679b0aba46a3984146c');
INSERT INTO `orderitem` VALUES ('898d71278acc45c7a5d1dfafa53a068e', 1, 13, '5', 'a108b6f24d3f4aafae4929dee4065fde');
INSERT INTO `orderitem` VALUES ('8ef993ca2cda422ab3bba408289e122b', 2, 27.8, '3', '9e49fe350d8b4127834fd0dd70fe04e9');
INSERT INTO `orderitem` VALUES ('966a962146b24d55a34c817b1e308fe2', 1, 21, '7', '6da1b994e51f46b781af98713bbf3265');
INSERT INTO `orderitem` VALUES ('9987d4d604d8449bb2c58d705b4bd657', 1, 48, '1', '69e6c3b9062245009ee4e697bab4e68c');
INSERT INTO `orderitem` VALUES ('9af4bc10dd6a44999051763f61f74f1e', 1, 19, '2', '874db50874b44f469a7193bd297b9335');
INSERT INTO `orderitem` VALUES ('9f07fa158ff84937875461dfaa3f010e', 1, 13.9, '3', 'e6c6221ace744c0b91988de5f2118ee3');
INSERT INTO `orderitem` VALUES ('9f9502cb9ae447f0a09b6da11a40a7a3', 1, 15, '6', 'b7e02313a7b945adb1ef8964eaa1be6e');
INSERT INTO `orderitem` VALUES ('a5218b58f6bf49f8a0df03c8923bb837', 1, 21, '7', '596c75e4840946149746d000d73d04e5');
INSERT INTO `orderitem` VALUES ('a65efe54cde64a1eb7e9c3e151067188', 1, 21.8, '7', '2cbb4b00e79449d1a49fa71fd918ee97');
INSERT INTO `orderitem` VALUES ('a7fb8980c5e547129f0d9cb0abaf0d57', 1, 12.8, '5', '2e7d1b7680eb4c7f8eb2c883d9455310');
INSERT INTO `orderitem` VALUES ('ac9dc227a4ec4531892aa229590547b8', 1, 13, '5', 'd483492da59b4f4990e06cf39b86f6bf');
INSERT INTO `orderitem` VALUES ('b13ce760767a4a95a86e9bd59b505e36', 1, 2299, '31', '60ec76ce03b64893aae872d434b54a99');
INSERT INTO `orderitem` VALUES ('b35e83fdfd1340878075f9efd05e227b', 1, 208, '14', 'b681ca86d9234c93bfb65ff639f7ad95');
INSERT INTO `orderitem` VALUES ('b5e5b649418048adb74a9bb1bebc2c50', 1, 21, '7', '388b7a3e38934ce3b8796cfa19c656e6');
INSERT INTO `orderitem` VALUES ('badec8fc714b4ff79bd62c9ae79b2d99', 1, 14, '4', '0655525134b1432b8801aba344168161');
INSERT INTO `orderitem` VALUES ('c06588206cfc40dcab65afa4b58b68a0', 1, 13.9, '3', '2cbb4b00e79449d1a49fa71fd918ee97');
INSERT INTO `orderitem` VALUES ('c0ca6d84a739442a882ba588a60fe03f', 1, 21.8, '7', '9132d6a4995741e09eb74c763114a6d8');
INSERT INTO `orderitem` VALUES ('c3f1227f866f4524b8beecd9634d9d4d', 1, 15, '3', '4e3d72d068ba485e95bd013422fabcd5');
INSERT INTO `orderitem` VALUES ('c77f2a6af8ed4abbaae8bed1b2c09fc2', 1, 15, '3', '7271379e6d5f4355b731affaf0ff19f0');
INSERT INTO `orderitem` VALUES ('c9a67857f679473197fcff45ecc3ddd1', 1, 10, '8', 'c4300f64f42949a386f0623530beb69c');
INSERT INTO `orderitem` VALUES ('cc588ba106bc4ffb849f35263e39c52d', 1, 19, '2', '7fbb30092a3b4f72a44eb0ec0addf2ed');
INSERT INTO `orderitem` VALUES ('cd3c6683ea3d43229a2acb98c79d227c', 1, 10.8, '6', '9132d6a4995741e09eb74c763114a6d8');
INSERT INTO `orderitem` VALUES ('ce9c5bd07f5848f78464bef4d4781c54', 1, 21, '7', 'e2b1139b15a24ada806d3a6298049326');
INSERT INTO `orderitem` VALUES ('cf28d88e9b93478aa65dc2c9545c1b60', 1, 19, '2', 'be9e43513db8497c801b91e06f713c53');
INSERT INTO `orderitem` VALUES ('d03dcaf677424353b06d38345ffc9e4b', 1, 14, '4', '388b7a3e38934ce3b8796cfa19c656e6');
INSERT INTO `orderitem` VALUES ('d3ce1e40167d455baf93c4f9aa1cdfb1', 1, 21.8, '7', 'f29f8bd19ab44673b998610aa1c5e7fd');
INSERT INTO `orderitem` VALUES ('d8d41802f8334e4bb5e778c9254a2ade', 1, 15, '6', '3c568f2397bf40319e9a671eef396b23');
INSERT INTO `orderitem` VALUES ('d9b9711659c04906b30d170c4ceb5d4f', 1, 48, '1', 'a108b6f24d3f4aafae4929dee4065fde');
INSERT INTO `orderitem` VALUES ('dec0a9db9c9a4d1da93de54a119acb4d', 1, 208, '13', 'a108b6f24d3f4aafae4929dee4065fde');
INSERT INTO `orderitem` VALUES ('e90187e5316f49b2ad77252c3f37320a', 1, 10.8, '6', '2cbb4b00e79449d1a49fa71fd918ee97');
INSERT INTO `orderitem` VALUES ('ed75881db43c4e9cad5c6f40962037a1', 1, 15, '3', '874db50874b44f469a7193bd297b9335');
INSERT INTO `orderitem` VALUES ('f47f1360f3fe498780d2649cc5e60579', 1, 14, '4', '3464942b6a2e44ba9a1f29e5185c2c76');
INSERT INTO `orderitem` VALUES ('f48dd72d1ad64aa6a3eb6dc3f3effe4d', 1, 19, '2', '89e6948b474a4b978cca6f5ca7e3ecc5');
INSERT INTO `orderitem` VALUES ('f51aa4f79b21417b8b7d70554eb68c58', 1, 13, '5', 'e2b1139b15a24ada806d3a6298049326');
INSERT INTO `orderitem` VALUES ('f5b04b8c2f1344fbbce9e44407d2be2f', 1, 2299, '31', 'eff8ddc369dd46e38fadad20e42ebea9');
INSERT INTO `orderitem` VALUES ('f7a7dfd9818542e6993d1ec6a875e38c', 1, 15, '3', '52a2037ce3cf4a7daf7a205a73db0d17');
INSERT INTO `orderitem` VALUES ('f9c6570e68b243d092c60b90095802f8', 1, 13.9, '3', 'f322369d55b14b5fb34d783d482cb8ef');
INSERT INTO `orderitem` VALUES ('fbdbedeaeff045d99eabe1453817d937', 1, 21, '7', '546b33c8a8fa4fde8519961f3a52dff0');
INSERT INTO `orderitem` VALUES ('fbe31fc624f24bb687d77029839dc86c', 2, 25, '2', 'f29f8bd19ab44673b998610aa1c5e7fd');
INSERT INTO `orderitem` VALUES ('fe0975f4281d4124b4d152e91abcdf15', 1, 15, '3', '388b7a3e38934ce3b8796cfa19c656e6');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ordertime` datetime(0) NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `state` int(0) NULL DEFAULT NULL,
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0655525134b1432b8801aba344168161', '2020-10-02 15:50:54', 35, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('08ea69439e614e3cb0f0144d516be4eb', '2020-10-02 16:25:06', 14, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('17851784d6bf405c817fbbce2b3ba849', '2020-10-03 12:01:59', 48, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('1919fe7f3cba4e42b3d60cb1edbe530a', '2020-10-02 17:21:22', 73, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('2cbb4b00e79449d1a49fa71fd918ee97', '2020-10-01 14:30:43', 158.50000000000003, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('2e7d1b7680eb4c7f8eb2c883d9455310', '2020-10-02 15:28:16', 12.800000000000008, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('330959cb49274383b60f8455c62b8ea2', '2020-10-02 15:50:30', 14, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('3464942b6a2e44ba9a1f29e5185c2c76', '2020-10-03 08:34:55', 35, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('388b7a3e38934ce3b8796cfa19c656e6', '2020-10-02 16:01:35', 69, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('3c568f2397bf40319e9a671eef396b23', '2020-10-02 15:49:59', 36, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('428bbb53638a497090828057e005f032', '2020-10-02 14:06:37', 25, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('4e3d72d068ba485e95bd013422fabcd5', '2020-10-02 15:53:25', 50, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('4e89bbd8442e47bfad2e7dde65a012a9', '2020-10-02 17:20:40', 15, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('52a2037ce3cf4a7daf7a205a73db0d17', '2020-10-02 17:21:53', 102, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('546b33c8a8fa4fde8519961f3a52dff0', '2020-10-03 08:32:19', 21, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('596c75e4840946149746d000d73d04e5', '2020-10-03 08:35:33', 49, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('5c211d7bf5da476285ef6f9d0194ac5c', '2020-10-02 15:49:34', 15, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('5f97ff1771cc449c901052a8ce61ef84', '2020-10-03 12:51:12', 143, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('60ec76ce03b64893aae872d434b54a99', '2020-09-27 00:14:42', 3598, 0, '江苏', '旺旺', '11111', 'b3969cc6b31942b59af44fa738c26f83');
INSERT INTO `orders` VALUES ('69e6c3b9062245009ee4e697bab4e68c', '2020-10-03 12:02:16', 176, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('6da1b994e51f46b781af98713bbf3265', '2020-10-02 15:58:09', 50, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('7271379e6d5f4355b731affaf0ff19f0', '2020-10-02 16:26:05', 29, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('7fbb30092a3b4f72a44eb0ec0addf2ed', '2020-10-03 11:09:44', 19, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('814742325a604e76ae96c76d1ca0e956', '2020-10-02 16:38:47', 42, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('874db50874b44f469a7193bd297b9335', '2020-10-02 15:32:58', 49.000000000000014, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('89e6948b474a4b978cca6f5ca7e3ecc5', '2020-10-02 15:31:03', 34.000000000000014, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('8e20181d744d4bacbcc2065b43662062', '2020-10-03 02:22:04', 21, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('9132d6a4995741e09eb74c763114a6d8', '2020-10-01 14:38:25', 158.50000000000003, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('9e49fe350d8b4127834fd0dd70fe04e9', '2020-10-01 14:38:43', 75.80000000000001, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('a108b6f24d3f4aafae4929dee4065fde', '2020-10-03 01:27:14', 269, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('b681ca86d9234c93bfb65ff639f7ad95', '2020-10-03 13:21:11', 208, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('b7e02313a7b945adb1ef8964eaa1be6e', '2020-10-02 17:20:55', 25, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('b8b8635ad5464c0fb21810e56f90d807', '2020-10-02 16:31:03', 28, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('be9e43513db8497c801b91e06f713c53', '2020-10-02 15:30:48', 31.800000000000008, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('c049623052fc40079115245f8cbdaa83', '2020-10-03 11:57:31', 48, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('c4300f64f42949a386f0623530beb69c', '2020-10-03 11:03:35', 25, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('c604ab354c7d4cd3a8960acf13406fbf', '2020-10-02 15:47:58', 21, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('d483492da59b4f4990e06cf39b86f6bf', '2020-10-03 01:26:10', 61, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('e0a7e7d36cd44679b0aba46a3984146c', '2020-10-02 15:11:23', 108.4, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('e2b1139b15a24ada806d3a6298049326', '2020-10-02 16:39:40', 34, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('e6c6221ace744c0b91988de5f2118ee3', '2020-10-02 15:28:38', 13.900000000000007, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('eff8ddc369dd46e38fadad20e42ebea9', '2020-09-27 00:11:38', 3598, 0, '江苏', '旺旺', '11111', 'b3969cc6b31942b59af44fa738c26f83');
INSERT INTO `orders` VALUES ('f29f8bd19ab44673b998610aa1c5e7fd', '2020-10-02 14:07:19', 46.8, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('f322369d55b14b5fb34d783d482cb8ef', '2020-10-02 15:28:52', 35.50000000000001, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('fc3143ecdcdc40b0a3384cdea0464846', '2020-10-02 16:20:52', 15, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');
INSERT INTO `orders` VALUES ('fd6beceeb4854b349a4d2ba06e92d7b8', '2020-10-02 15:29:17', 12.800000000000008, 0, NULL, NULL, NULL, 'b5bc465f29ad4c3f90f383266d0f9a47');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `market_price` double NULL DEFAULT NULL,
  `pimage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pimage1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_price` double NULL DEFAULT NULL,
  `pdate` date NULL DEFAULT NULL,
  `is_hot` int(0) NULL DEFAULT NULL,
  `pdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pflag` int(0) NULL DEFAULT NULL,
  `cid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `sfk_0001`(`cid`) USING BTREE,
  CONSTRAINT `sfk_0001` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '娘家女方、婆家男方婚房客厅全套', 56, 'img/product/product-1.jpg', NULL, 48, '2020-09-30', 1, '娘家女方、婆家男方婚房客厅全套', 0, '2');
INSERT INTO `product` VALUES ('10', '韩版灰色长款修身显瘦伴娘服', 218, 'img/product/product-19.jpg', 'img/product/product-20.jpg', 128, '2020-10-03', 0, '韩版灰色长款修身显瘦伴娘服', 0, '1');
INSERT INTO `product` VALUES ('11', '春夏季酒红色显瘦日常可穿敬酒服', 230, 'img/product/product-21.jpg', 'img/product/product-22.jpg', 158, '2020-10-03', 0, '春夏季酒红色显瘦日常可穿敬酒服 修身版型 宫廷式花边袖 超大裙摆', 0, '1');
INSERT INTO `product` VALUES ('12', '胧月佳人•法式孕妇遮肚短袖婚纱•送三件套', 1536, 'img/product/product-23.jpg', 'img/product/product-24.jpg', 578, '2020-10-03', 0, '梦幻般的立体堆叠泡泡袖，更显端庄公主的气质，精致贴花，清新动人。内置收腰鱼骨，专为东方女性设计的版型。', 0, '1');
INSERT INTO `product` VALUES ('13', '锦绣系列•盛世牡丹秀禾服', 418, 'img/product/product-22.jpg', NULL, 208, '2020-09-30', 0, '盛世牡丹秀禾服', 0, '1');
INSERT INTO `product` VALUES ('14', '锦绣系列•花容月色流苏坠秀禾服', 418, 'img/product/product-21.jpg', NULL, 208, '2020-09-30', 0, '花容月色流苏坠秀禾服', 0, '1');
INSERT INTO `product` VALUES ('15', 'baby黄晓明同款金缕红裳孕妇可穿秀禾', 418, 'img/product/product-23.jpg', NULL, 208, '2020-09-30', 0, 'baby黄晓明同款金缕红裳孕妇可穿秀禾', 0, '1');
INSERT INTO `product` VALUES ('16', '锦绣系列•华灯初上秀禾服', 244, 'img/product/product-24.jpg', NULL, 208, '2020-09-30', 0, '华灯初上秀禾服', 0, '1');
INSERT INTO `product` VALUES ('17', '《紫霞之光》长款豆沙粉显瘦闺蜜伴娘服', 218, 'img/product/product-33.jpg', 'img/product/product-34.jpg', 148, '2020-10-03', 0, '《紫霞之光》长款豆沙粉显瘦闺蜜伴娘服 端庄柔和，温婉气质彰显女性魅力', 0, '1');
INSERT INTO `product` VALUES ('18', '中式复古刺绣流苏红盖头', 59, 'img/product/product-35.jpg', 'img/product/product-36.jpg', 39, '2020-10-03', 0, '采用锦缎面料，盖头中央有龙凤绕着喜字盘旋的刺绣，四角带有铜钱流苏吊坠，有垂坠感', 0, '1');
INSERT INTO `product` VALUES ('19', '婚房布置新中式古典对联门帘', 58, 'img/product/product-37.jpg', 'img/product/product-38.jpg', 22.8, '2020-10-03', 0, '婚房布置新中式古典对联门帘 对联喜字一套兼有', 0, '2');
INSERT INTO `product` VALUES ('2', '结婚立体挂件婚礼婚房卧室走廊', 28, 'img/product/product-3.jpg', NULL, 19, '2020-09-30', 1, '结婚立体挂件婚礼婚房卧室走廊', 0, '2');
INSERT INTO `product` VALUES ('20', '婚房创意欧式时尚羽毛落地台灯', 98, 'img/product/product-39.jpg', 'img/product/product-40.jpg', 72, '2020-10-03', 0, '婚房创意欧式时尚羽毛落地台灯', 0, '2');
INSERT INTO `product` VALUES ('21', '金童玉女屏风摆件', 198, 'img/product/product-41.jpg', 'img/product/product-42.jpg', 168, '2020-10-03', 0, '一扇屏风演绎甜蜜新婚生活', 0, '2');
INSERT INTO `product` VALUES ('22', '复古风仿藤伴手礼盒喜糖盒中式', 199, 'img/product/product-43.jpg', 'img/product/product-44.jpg', 38.5, '2020-10-03', 0, '复古风仿藤伴手礼盒喜糖盒中式,环保仿藤纯手工编织篮', 0, '3');
INSERT INTO `product` VALUES ('23', '欧式刺绣晨袍伴娘伴手礼', 158, 'img/product/product-45.jpg', 'img/product/product-46.jpg', 116.6, '2020-10-03', 0, '欧式刺绣晨袍伴娘伴手礼', 0, '3');
INSERT INTO `product` VALUES ('24', '中式红颜结婚伴手礼', 38, 'img/product/product-47.jpg', 'img/product/product-48.jpg', 23.9, '2020-10-03', 0, '中式红颜结婚伴手礼 金色双喜寓意成双成对，让中式伴手礼韵味十足', 0, '3');
INSERT INTO `product` VALUES ('25', '纯臻心意少女心伴娘伴手礼', 82, 'img/product/product-49.jpg', 'img/product/product-50.jpg', 28, '2020-10-03', 0, '纯臻心意少女心伴娘伴手礼,透明包装，心意一览无余', 0, '3');
INSERT INTO `product` VALUES ('26', '屿夏系列创意花茶礼盒', 108, 'img/product/product-51.jpg', 'img/product/product-52.jpg', 43, '2020-10-03', 0, '屿夏系列创意花茶礼盒', 0, '3');
INSERT INTO `product` VALUES ('27', '欧式成品糖果伴手礼', 24.8, 'img/product/product-53.jpg', 'img/product/product-54.jpg', 11.2, '2020-10-03', 0, '欧式成品糖果伴手礼,礼盒尺寸：16*16*6cm', 0, '3');
INSERT INTO `product` VALUES ('28', '欧式梦幻短绒喜糖袋', 6.4, 'img/product/product-55.jpg', 'img/product/product-56.jpg', 3.2, '2020-10-03', 0, '梦幻仙女风，复古中式荷包喜糖袋', 0, '3');
INSERT INTO `product` VALUES ('29', '绅士盛典男士高端伴手礼', 192, 'img/product/product-57.jpg', 'img/product/product-58.jpg', 96, '2020-10-03', 0, '商品尺寸：手提袋 (26*25*10)cm', 0, '3');
INSERT INTO `product` VALUES ('3', '【10个装】无纺布爱心双喜拉花挂帘', 45.9, 'img/product/product-5.jpg', NULL, 15, '2020-09-30', 1, '无纺布爱心双喜拉花挂帘', 0, '2');
INSERT INTO `product` VALUES ('30', 'CODEX牛乳风味冻干草莓巧克力', 58, 'img/product/product-59.jpg', 'img/product/product-60.jpg', 31.8, '2020-10-03', 0, '白色是放肆的甜蜜，红色是克制的羞涩，加在一起，便是属于你的怦然心动', 0, '3');
INSERT INTO `product` VALUES ('31', '汇福园情书果仁酥糖 500g约31颗', 16.8, 'img/product/product-61.jpg', 'img/product/product62.jpg', 13.8, '2020-10-03', 0, '甜蜜不多余，每天一句小情话，一款自带情话的果仁酥糖', 0, '3');
INSERT INTO `product` VALUES ('32', '迎亲接亲玫瑰之约礼炮', 54, 'img/product/product-63.jpg', 'img/product/product-64.jpg', 21.6, '2020-10-03', 0, '一片片花瓣撒向新人，浪漫逼真盛满祝福', 0, '4');
INSERT INTO `product` VALUES ('33', '鸳鸯剪纸婚宴一次性抽纸100抽', 5.2, 'img/product/product-65.jpg', 'img/product/product-66.jpg', 2.9, '2020-10-03', 0, '鸳鸯剪纸婚宴一次性抽纸100抽', 0, '4');
INSERT INTO `product` VALUES ('34', '牡丹富贵缎布果盘盒', 19, 'img/product/product-67.jpg', 'img/product/product-68.jpg', 7.6, '2020-10-03', 0, '经典婚宴果盘造型，多用途盛放糖，干果，硬币等。', 0, '4');
INSERT INTO `product` VALUES ('35', '恶搞兄弟团粉红豹堵门道具', 28, 'img/product/product-69.jpg', 'img/product/product-70.jpg', 14.5, '2020-10-03', 0, '爆笑独门游戏，模仿粉红豹。', 0, '4');
INSERT INTO `product` VALUES ('36', '【10枚装】创意有钱任性堵门拦门红包', 9.9, 'img/product/product-71.jpg', 'img/product/product-72.jpg', 2.5, '2020-10-03', 0, '将新婚的祝福，美满的希愿，以创意祖父与融入红包之中，祈愿更显心意。', 0, '4');
INSERT INTO `product` VALUES ('37', '【一对】中式敬茶专用绸缎跪垫', 48, 'img/product/product-73.jpg', 'img/product/product-74.jpg', 18.8, '2020-10-03', 0, '跪垫外衬选用绸缎面料，采用色织染色工艺，色彩均匀鲜亮，触感丝滑细腻', 0, '4');
INSERT INTO `product` VALUES ('38', '中式凤凰花开新娘团扇', 78, 'img/product/product-75.jpg', 'img/product/product-76.jpg', 34, '2020-10-03', 0, '团扇源于中国又称合欢善，取美好团圆美满之意，是近年中式婚礼上的新宠', 0, '4');
INSERT INTO `product` VALUES ('39', '北欧风情婚礼签到本 送签到笔', 80, 'img/product/product-77.jpg', 'img/product/product-78.jpg', 39, '2020-10-03', 0, '每当翻开这本礼簿，那天的感动便涌上心头', 0, '4');
INSERT INTO `product` VALUES ('4', '百年好合无纺布对联套装', 28.9, 'img/product/product-7.jpg', NULL, 14, '2020-09-30', 1, '百年好合无纺布对联套装', 0, '2');
INSERT INTO `product` VALUES ('41', '【预售3天内发货】【送床旗】凤冠霞帔床品多件套', 788, 'img/product/product-81.jpg', 'img/product/product-82.jpg', 688, '2020-10-03', 0, '新婚最大的幸福，便会死夜深拥你入眠。', 0, '5');
INSERT INTO `product` VALUES ('42', '【下单送枕芯一对】全棉大红婚庆四件套刺绣结婚多件套', 528, 'img/product/product-83.jpg', 'img/product/product-84.jpg', 328, '2020-10-03', 0, '纯棉面料。以棉花为原材料，经纺织工艺生产的面料，具有吸湿，保湿，耐热，耐碱，卫生等特点。', 0, '5');
INSERT INTO `product` VALUES ('43', '星月LOVE全棉四件套', 528, 'img/product/product-85.jpg', 'img/product/product-86.jpg', 298, '2020-10-03', 0, '为你摘星挂月，造一场绝美的梦', 0, '5');
INSERT INTO `product` VALUES ('44', '60支长绒棉纯色四件套简约宜家风', 450, 'img/product/product-87.jpg', 'img/product/product-88.jpg', 469, '2020-10-03', 0, '甄选新疆长绒棉为原料，长日照，大棉朵。经过精梳，烧毛，丝光等工艺处理。', 0, '5');
INSERT INTO `product` VALUES ('45', '全棉大红结婚简约四件套床品多件套', 588, 'img/product/product-89.jpg', 'img/product/product-90.jpg', 288, '2020-10-03', 0, '优美流畅的刺绣线条，流露出爱的亲昵，许一声承诺，只为一生的相守。', 0, '5');
INSERT INTO `product` VALUES ('46', '瑞凤豪华型桑蚕丝被', 1598, 'img/product/product-91.jpg', 'img/product/product-92.jpg', 328, '2020-10-03', 0, '蚕丝是自然界中集轻、柔、细为一体的天然纤维', 0, '5');
INSERT INTO `product` VALUES ('47', '【辑里】100%双宫茧桑蚕丝绣花贡缎蚕丝被子母被', 1000, 'img/product/product-93.jpg', 'img/product/product-94.jpg', 899, '2020-10-03', 0, '100%双宫茧桑蚕丝被，择一床好被，睡一个好眠。', 0, '5');
INSERT INTO `product` VALUES ('48', '网红早安兔宝宝绒冬天四件套珊瑚绒', 399, 'img/product/product-95.jpg', 'img/product/product-96.jpg', 198, '2020-10-03', 0, '水晶宝宝绒面料制作，满足你对睡眠的渴望', 0, '5');
INSERT INTO `product` VALUES ('49', '冬季水晶绒床上四件套双面绒蕾丝边', 408, 'img/product/product-97.jpg', 'img/product/product-98.jpg', 188, '2020-10-03', 0, '被套及枕套采用蕾丝刺绣设计，如同公主的裙摆', 0, '5');
INSERT INTO `product` VALUES ('5', '【一对】中式传统压床娃娃', 118, 'img/product/product-9.jpg', NULL, 13, '2020-09-30', 1, '中式传统压床娃娃', 0, '2');
INSERT INTO `product` VALUES ('50', '罗莱家纺LOVO蕾奇丝磨毛四件套', 800, 'img/product/product-99.jpg', 'img/product/product-100.jpg', 228, '2020-10-03', 0, '采用天蓝色的A版搭配银灰色的肌理B版，时尚清新。', 0, '5');
INSERT INTO `product` VALUES ('51', '女方结婚陪嫁嫁妆套装自由组合搭配', 8, 'img/product/product-101.jpg', 'img/product/product-102.jpg', 2.3, '2020-10-03', 0, '既有柴米油盐，也有喜悦甜蜜，这才是婚姻幸福的样子', 0, '6');
INSERT INTO `product` VALUES ('52', '陪嫁子孙桶结婚庆用品仿红实木', 58, 'img/product/product-103.jpg', 'img/product/product-104.jpg', 16, '2020-10-03', 0, '子孙宝通又称子孙桶，传统中式陪嫁必备之物，是保佑子孙多福多喜的喜庆吉祥物', 0, '6');
INSERT INTO `product` VALUES ('53', '顺心如意喜床刷', 18, 'img/product/product-105.jpg', 'img/product/product-106.jpg', 4.5, '2020-10-03', 0, '刷出幸福，扫除晦气', 0, '6');
INSERT INTO `product` VALUES ('54', '轻奢复古新娘陪嫁箱手提皮箱', 588, 'img/product/product-107.jpg', 'img/product/product-108.jpg', 298, '2020-10-03', 0, '锁住你的安全和幸福', 0, '6');
INSERT INTO `product` VALUES ('55', '双喜龙凤刺绣喜字结婚拖鞋', 26, 'img/product/product-109.jpg', 'img/product/product-110.jpg', 9, '2020-10-03', 0, '穿出舒适，穿出信服', 0, '6');
INSERT INTO `product` VALUES ('56', '免费刻字金丝檀木对梳礼盒包装', 125, 'img/product/product-111.jpg', 'img/product/product-112.jpg', 25, '2020-10-03', 0, '梳的安心，养神宁心', 0, '6');
INSERT INTO `product` VALUES ('57', '结婚鸡毛掸子家用清洁除尘女方嫁妆', 68, 'img/product/product-113.jpg', 'img/product/product-114.jpg', 32, '2020-10-03', 0, '扫除灰尘，你需要他', 0, '6');
INSERT INTO `product` VALUES ('58', '德龙（Delonghi）时尚早餐多士炉 真我白', 399, 'img/product/product-115.jpg', 'img/product/product-116.jpg', 299, '2020-10-03', 0, '每个早上你都有一份温暖的早餐', 0, '6');
INSERT INTO `product` VALUES ('59', '德龙（Delonghi）复古泵压式不锈钢意式咖啡机 海洋蓝', 1159, 'img/product/product-117.jpg', 'img/product/product-118.jpg', 999, '2020-10-03', 0, '每个早上都有一份暖心的咖啡为你准备', 0, '6');
INSERT INTO `product` VALUES ('6', '结婚整蛊恶搞伴郎团堵门游戏', 29, 'img/product/product-11.jpg', NULL, 15, '2020-09-30', 1, '结婚整蛊恶搞伴郎团堵门游戏', 0, '4');
INSERT INTO `product` VALUES ('60', '多款婚嫁陪嫁新娘雨伞', 36, 'img/product/product-119.jpg', 'img/product/product-120.jpg', 12, '2020-10-03', 0, '守护你和你的家人', 0, '6');
INSERT INTO `product` VALUES ('61', '【免费上门量体】经典系列全羊毛米色定制西服套装', 5000, 'img/product/product-121.jpg', 'img/product/product-122.jpg', 3999, '2020-10-03', 0, '春夏休闲单排扣西装', 0, '7');
INSERT INTO `product` VALUES ('62', '【免费上门量体】尊享系列意大利进口100%羊毛130\'S西服', 8299, 'img/product/product-123.jpg', 'img/product/product-124.jpg', 7000, '2020-10-03', 0, '礼服款黑色双排扣西服套装', 0, '7');
INSERT INTO `product` VALUES ('63', '【免费上门量体】经典系列全羊毛香芋色定制西服套装', 5000, 'img/product/product-125.jpg', 'img/product/product-126.jpg', 3299, '2020-10-03', 0, '春夏款香芋色西服套装', 0, '7');
INSERT INTO `product` VALUES ('64', '【免费上门量体】奢华系列意大利进口100%羊毛130\'S西服', 10000, 'img/product/product-127.jpg', 'img/product/product-128.jpg', 8000, '2020-10-03', 0, '新中式经典灰浅灰西服套装', 0, '7');
INSERT INTO `product` VALUES ('65', '【送衬衫领结领带】新款男士新郎韩版休闲修身西装三件套', 688, 'img/product/product-129.jpg', 'img/product/product-130.jpg', 500, '2020-10-03', 0, '高档西服套装', 0, '7');
INSERT INTO `product` VALUES ('66', '【免费上门量体】尊享系列意大利进口100%羊毛120\'S西服', 8000, 'img/product/product-131.jpg', 'img/product/product-132.jpg', 6000, '2020-10-03', 0, '经典款灰色条纹西服套装', 0, '7');
INSERT INTO `product` VALUES ('67', '【免费上门量体】轻奢系列国产100%羊毛桃红色定制西服套装', 7999, 'img/product/product-133.jpg', 'img/product/product-134.jpg', 5499, '2020-10-03', 0, '经典款粉色单排扣西服套装', 0, '7');
INSERT INTO `product` VALUES ('68', '【免费上门量体】轻奢系列国产70%羊毛绀碧色定制西服套装', 7000, 'img/product/product-135.jpg', 'img/product/product-136.jpg', 4899, '2020-10-03', 0, '春夏款天蓝色西服套装', 0, '7');
INSERT INTO `product` VALUES ('69', '【免费上门量体】经典系列全羊毛浅灰格纹定制西服套装', 7999, 'img/product/product-137.jpg', 'img/product/product-138.jpg', 6000, '2020-10-03', 0, '经典款灰色条纹西服套装', 0, '7');
INSERT INTO `product` VALUES ('7', '【全屋搭配】新中式婚房全屋套餐', 47.8, 'img/product/product-13.jpg', NULL, 21, '2020-09-30', 1, '新中式婚房全屋套餐', 0, '2');
INSERT INTO `product` VALUES ('70', '【免费上门量体】经典系列全羊毛浅蓝色定制西服套装', 4999, 'img/product/product-139.jpg', 'img/product/product-140.jpg', 2999, '2020-10-03', 0, '春夏季新款天蓝色西服套装', 0, '7');
INSERT INTO `product` VALUES ('71', '五粮液东方娇子佳品52度500ml', 90, 'img/product/product-141.jpg', 'img/product/product-142.jpg', 89, '2020-10-03', 0, '大牌酒水 宴请宾客超有面子', 0, '8');
INSERT INTO `product` VALUES ('72', '五粮液股份出品 喜结缘精品浓香型白酒500ml', 299, 'img/product/product-143.jpg', 'img/product/product-144.jpg', 208, '2020-10-03', 0, '大牌酒水 宴请宾客超有面子', 0, '8');
INSERT INTO `product` VALUES ('73', '【到手价140元】52°洋河海之蓝520ml', 239, 'img/product/product-145.jpg', 'img/product/product-146.jpg', 190, '2020-10-03', 0, '大牌酒水 宴请宾客超有面子', 0, '8');
INSERT INTO `product` VALUES ('74', '【到手价280元】天之蓝 42度480ml', 399, 'img/product/product-147.jpg', 'img/product/product-148.jpg', 330, '2020-10-03', 0, '大牌酒水 宴请宾客超有面子', 0, '8');
INSERT INTO `product` VALUES ('75', '【到手价298元】52°洋河天之蓝520ML', 396, 'img/product/product-149.jpg', 'img/product/product-150.jpg', 599, '2020-10-03', 0, '大牌酒水 宴请宾客超有面子', 0, '8');
INSERT INTO `product` VALUES ('76', '【2014年老酒】52度茅台贵州特曲双喜酒浓香型500ml', 299, 'img/product/product-151.jpg', 'img/product/product-152.jpg', 189, '2020-10-03', 0, '大牌酒水 宴请宾客超有面子', 0, '8');
INSERT INTO `product` VALUES ('77', '【B3套餐】52度茅台贵州特曲双喜酒500ml+红酒', 299, 'img/product/product-153.jpg', 'img/product/product-154.jpg', 208, '2020-10-03', 0, '大牌酒水 宴请宾客超有面子', 0, '8');
INSERT INTO `product` VALUES ('78', '【到手价289元】洋河蓝色经典 梦之蓝M1 45度500ml', 399, 'img/product/product-155.jpg', 'img/product/product-156.jpg', 369, '2020-10-03', 0, '大牌酒水 宴请宾客超有面子', 0, '8');
INSERT INTO `product` VALUES ('8', '喜字情侣拉花婚房装饰', 29, 'img/product/product-15.jpg', NULL, 10, '2020-09-30', 1, '喜字情侣拉花婚房装饰', 0, '2');
INSERT INTO `product` VALUES ('9', '囍嫁系列•比翼双飞孕妇可穿秀禾服', 448, 'img/product/product-17.jpg', NULL, 228, '2020-09-30', 0, '结婚立体挂件婚礼婚房卧室走廊', 0, '1');
INSERT INTO `product` VALUES ('99', '娘家女方、婆家男方婚房客厅全套', 56, 'img/product/product-1.jpg', 'img/product/product-2.jpg', 48, '2020-09-30', 1, '娘家女方、婆家男方婚房客厅全套', 0, '2');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `adminName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adminPwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('admin', '123456');
INSERT INTO `t_admin` VALUES ('admind2', '123456');
INSERT INTO `t_admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(0) NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('58665a464f134fa78026015264206e70', 'wu', 'e10adc3949ba59abbe56e057f20f883e', '吴亦凡', '1937003575@qq.com', '17364456666', '2020-10-02', '男', 1, 'bd11485585774dc29b2fd2bce80f3942', '淮北');
INSERT INTO `user` VALUES ('b5bc465f29ad4c3f90f383266d0f9a47', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '吴祥', '1937003575@qq.com', '1234565', '2020-09-30', '男', 1, 'fd60e987314d4885919b732631e5195a', '安徽淮北');
INSERT INTO `user` VALUES ('bc1810aa16134f7e95bc60a073780cae', 'lwb', 'e10adc3949ba59abbe56e057f20f883e', '鹿王斌', '1937003575@qq.com', '17364456666', '2020-10-02', '男', 1, 'c832831839674dc4ba25b76e535480b1', '安徽淮北');
INSERT INTO `user` VALUES ('fbf9b687d1484a9fabd4569bc7d67bac', 'jacksonwu', 'e10adc3949ba59abbe56e057f20f883e', '吴祥', '1937003575@qq.com', '17364456666', '2020-10-02', '男', 1, 'c773cb14964e49fc993120336dc5a544', '淮北师范大学滨湖校区');

SET FOREIGN_KEY_CHECKS = 1;
