/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : edu-api-admin

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 27/03/2022 11:51:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限/菜单名称',
  `access_id` int NOT NULL DEFAULT 0 COMMENT '上级权限/菜单id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限/菜单内容',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'GET' COMMENT '请求方式 GET/POST/PUT/DELETE',
  `ismenu` int NULL DEFAULT 0 COMMENT '是否为菜单，0否1是',
  `hidden` int NOT NULL DEFAULT 0 COMMENT '是否隐藏 0否1是',
  `status` int NULL DEFAULT 1 COMMENT '状态',
  `orderby` int NULL DEFAULT 10 COMMENT '排序',
  `created_time` datetime NULL DEFAULT NULL,
  `updated_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of access
-- ----------------------------
INSERT INTO `access` VALUES ('课程', 0, 'Course', 'GET', 1, 0, 1, 10, '2021-02-27 19:59:34', '2021-02-27 19:59:34');
INSERT INTO `access` VALUES ('工具', 0, 'Tool', 'GET', 1, 0, 1, 10, '2021-02-27 20:00:23', '2021-02-27 20:00:23');
INSERT INTO `access` VALUES ('用户', 0, 'User', 'GET', 1, 0, 1, 10, '2021-02-27 20:00:48', '2021-02-27 20:00:48');
INSERT INTO `access` VALUES ('交易', 0, 'Pay', 'GET', 1, 0, 1, 10, '2021-02-27 20:01:49', '2021-02-27 20:01:49');
INSERT INTO `access` VALUES ('营销', 0, 'Marketing', 'GET', 1, 0, 1, 10, '2021-02-27 20:02:17', '2021-02-27 20:02:17');
INSERT INTO `access` VALUES ('设置', 0, 'Setting', 'GET', 1, 0, 1, 10, '2021-02-27 20:02:40', '2021-02-27 20:02:40');
INSERT INTO `access` VALUES ('可视化', 0, 'Renovation', 'GET', 1, 0, 1, 10, '2021-02-27 20:02:55', '2021-02-27 20:02:55');
INSERT INTO `access` VALUES ('课程', 2, 'Lesson', 'GET', 1, 0, 1, 10, '2022-03-23 11:54:13', '2022-03-23 11:54:16');
INSERT INTO `access` VALUES ('课程详情', 2, 'LessonDetail', 'GET', 1, 1, 1, 10, '2022-03-23 11:54:56', '2022-03-23 11:54:57');
INSERT INTO `access` VALUES ('专栏', 2, 'Column', 'GET', 1, 0, 1, 10, '2021-02-27 20:34:38', '2021-02-27 20:34:38');
INSERT INTO `access` VALUES ('专栏详情', 2, 'ColumnDetail', 'GET', 1, 1, 1, 10, '2021-02-27 20:38:41', '2021-02-27 20:38:41');
INSERT INTO `access` VALUES ('小社群', 3, 'Bbs', 'GET', 1, 0, 1, 10, '2021-02-27 20:39:49', '2021-02-27 20:39:49');
INSERT INTO `access` VALUES ('题库', 3, 'Question', 'GET', 1, 0, 1, 10, '2021-02-27 20:40:21', '2021-02-27 20:40:21');
INSERT INTO `access` VALUES ('试卷', 3, 'Testpaper', 'GET', 1, 0, 1, 10, '2021-02-27 20:40:31', '2021-02-27 20:40:31');
INSERT INTO `access` VALUES ('组卷', 3, 'TestpaperForm', 'GET', 1, 1, 1, 10, '2021-02-27 20:40:48', '2021-02-27 20:40:48');
INSERT INTO `access` VALUES ('考试管理', 3, 'TestpaperTest', 'GET', 1, 1, 1, 10, '2021-02-27 20:41:01', '2021-02-27 20:41:01');
INSERT INTO `access` VALUES ('订单管理', 5, 'Order', 'GET', 1, 0, 1, 10, '2021-02-27 20:42:57', '2021-02-27 20:42:57');
INSERT INTO `access` VALUES ('资产管理', 5, 'Assets', 'GET', 1, 0, 1, 10, '2021-02-27 20:43:07', '2021-02-27 20:43:07');
INSERT INTO `access` VALUES ('支付设置', 5, 'Payment', 'GET', 1, 0, 1, 10, '2021-02-27 20:43:17', '2021-02-27 20:43:17');
INSERT INTO `access` VALUES ('拼团', 6, 'Group', 'GET', 1, 0, 1, 10, '2021-02-27 20:43:59', '2021-02-27 20:43:59');
INSERT INTO `access` VALUES ('秒杀', 6, 'Flashsale', 'GET', 1, 0, 1, 10, '2021-02-27 20:44:09', '2021-02-27 20:44:09');
INSERT INTO `access` VALUES ('优惠券', 6, 'Coupon', 'GET', 1, 0, 1, 10, '2021-02-27 20:44:20', '2021-02-27 20:44:20');
INSERT INTO `access` VALUES ('店铺设置', 7, 'SettingIndex', 'GET', 1, 0, 1, 10, '2021-02-27 20:45:30', '2021-02-27 20:45:30');
INSERT INTO `access` VALUES ('员工管理', 7, 'Staffs', 'GET', 1, 0, 1, 10, '2021-02-27 20:45:42', '2021-02-27 20:45:42');
INSERT INTO `access` VALUES ('角色管理', 7, 'Role', 'GET', 1, 0, 1, 10, '2021-02-27 20:45:54', '2021-02-27 20:45:54');
INSERT INTO `access` VALUES ('移动端', 8, 'MobileIndex', 'GET', 1, 0, 1, 10, '2021-02-27 20:46:26', '2021-02-27 20:46:26');
INSERT INTO `access` VALUES ('移动端装修', 8, 'MobileEdit', 'GET', 1, 1, 1, 10, '2021-02-27 20:46:40', '2021-02-27 20:46:40');
INSERT INTO `access` VALUES ('PC端', 8, 'PcIndex', 'GET', 1, 0, 1, 10, '2021-02-27 20:46:56', '2021-02-27 20:46:56');
INSERT INTO `access` VALUES ('PC端装修', 8, 'PcEdit', 'GET', 1, 1, 1, 10, '2021-02-27 20:47:10', '2021-02-27 20:47:10');
INSERT INTO `access` VALUES ('课程模块', 0, 'Course', 'GET', 0, 0, 1, 10, '2021-02-27 21:25:31', '2021-02-27 21:25:31');
INSERT INTO `access` VALUES ('工具模块', 0, 'Tool', 'GET', 0, 0, 1, 10, '2021-02-27 21:26:03', '2021-02-27 21:26:03');
INSERT INTO `access` VALUES ('用户模块', 0, 'User', 'GET', 0, 0, 1, 10, '2021-02-27 21:26:17', '2021-02-27 21:26:17');
INSERT INTO `access` VALUES ('交易模块', 0, 'Pay', 'GET', 0, 0, 1, 10, '2021-02-27 21:26:42', '2021-02-27 21:26:42');
INSERT INTO `access` VALUES ('营销模块', 0, 'Marketing', 'GET', 0, 0, 1, 10, '2021-02-27 21:27:05', '2021-02-27 21:27:05');
INSERT INTO `access` VALUES ('设置模块', 0, 'Setting', 'GET', 0, 0, 1, 10, '2021-02-27 21:27:29', '2021-02-27 21:27:29');
INSERT INTO `access` VALUES ('可视化模块', 0, 'Renovation', 'GET', 0, 0, 1, 10, '2021-02-27 21:27:53', '2021-02-27 21:27:53');
INSERT INTO `access` VALUES ('角色列表', 37, '/admin/role', 'GET', 0, 0, 1, 10, '2021-02-27 21:34:35', '2021-02-27 21:35:43');
INSERT INTO `access` VALUES ('员工列表', 37, '/admin/s/schoolstaff', 'GET', 0, 0, 1, 10, '2021-02-28 17:17:47', '2021-02-28 17:19:22');
INSERT INTO `access` VALUES ('添加员工', 37, '/admin/s/schoolstaff/save', 'POST', 0, 0, 1, 10, '2021-02-28 17:42:52', '2021-02-28 17:42:52');
INSERT INTO `access` VALUES ('给员工分配角色', 37, '/admin/s/schoolstaff/setroles', 'POST', 0, 0, 1, 10, '2021-02-28 17:43:16', '2021-02-28 17:43:16');
INSERT INTO `access` VALUES ('删除员工', 37, '/admin/s/schoolstaff/delete', 'POST', 0, 0, 1, 10, '2021-02-28 17:43:35', '2021-02-28 17:43:35');
INSERT INTO `access` VALUES ('查看网校详细信息', 37, '/admin/s/school/read', 'GET', 0, 0, 1, 10, '2021-02-28 19:06:26', '2021-02-28 19:07:02');
INSERT INTO `access` VALUES ('修改网校名称', 37, '/admin/s/school/update', 'POST', 0, 0, 1, 10, '2021-02-28 19:37:00', '2021-02-28 19:37:00');

INSERT INTO `access` VALUES ('新增课程', 32, '/admin/s/lesson/save', 'POST', 0, 0, 1, 10, '2021-02-28 20:17:22', '2021-02-28 20:17:22');
INSERT INTO `access` VALUES ('修改课程', 32, '/admin/s/lesson/update', 'POST', 0, 0, 1, 10, '2021-02-28 20:34:34', '2021-02-28 20:34:34');
INSERT INTO `access` VALUES ('课程列表', 32, '/admin/s/lesson', 'GET', 0, 0, 1, 10, '2021-02-28 22:32:38', '2021-02-28 22:32:38');
INSERT INTO `access` VALUES ('删除课程', 32, '/admin/s/lesson/delete', 'POST', 0, 0, 1, 10, '2021-02-28 22:43:47', '2021-02-28 22:43:47');
INSERT INTO `access` VALUES ('上架/下架课程', 32, '/admin/s/lesson/updatestatus', 'POST', 0, 0, 1, 10, '2021-02-28 22:50:12', '2021-02-28 22:50:12');
INSERT INTO `access` VALUES ('查看课程', 32, '/admin/s/lesson/read', 'GET', 0, 0, 1, 10, '2021-02-28 22:43:47', '2021-02-28 22:43:47');
INSERT INTO `access` VALUES ('修改课程更新状态', 32, '/admin/s/lesson/updateend', 'POST', 0, 0, 1, 10, '2021-02-28 22:50:12', '2021-02-28 22:50:12');
INSERT INTO `access` VALUES ('新增专栏目录', 32, '/admin/s/column_lesson/save', 'POST', 0, 0, 1, 10, '2021-03-01 00:55:39', '2021-03-01 00:55:39');
INSERT INTO `access` VALUES ('查看专栏目录', 32, '/admin/s/column_lesson', 'GET', 0, 0, 1, 10, '2021-03-01 01:11:39', '2021-03-01 01:11:39');
INSERT INTO `access` VALUES ('专栏目录排序', 32, '/admin/s/column_lesson/sort', 'POST', 0, 0, 1, 10, '2021-03-01 01:32:53', '2021-03-01 01:32:53');
INSERT INTO `access` VALUES ('删除专栏目录', 32, '/admin/s/column_lesson/delete', 'POST', 0, 0, 1, 10, '2021-03-01 02:58:08', '2021-03-01 02:58:08');
INSERT INTO `access` VALUES ('新增专栏', 32, '/admin/s/column/save', 'POST', 0, 0, 1, 10, '2021-02-28 20:17:22', '2021-02-28 20:17:22');
INSERT INTO `access` VALUES ('修改专栏', 32, '/admin/s/column/update', 'POST', 0, 0, 1, 10, '2021-02-28 20:34:34', '2021-02-28 20:34:34');
INSERT INTO `access` VALUES ('专栏列表', 32, '/admin/s/column', 'GET', 0, 0, 1, 10, '2021-02-28 22:32:38', '2021-02-28 22:32:38');
INSERT INTO `access` VALUES ('删除专栏', 32, '/admin/s/column/delete', 'POST', 0, 0, 1, 10, '2021-02-28 22:43:47', '2021-02-28 22:43:47');
INSERT INTO `access` VALUES ('上架/下架专栏', 32, '/admin/s/column/updatestatus', 'POST', 0, 0, 1, 10, '2021-02-28 22:50:12', '2021-02-28 22:50:12');
INSERT INTO `access` VALUES ('修改专栏更新状态', 32, '/admin/s/column/updateend', 'POST', 0, 0, 1, 10, '2021-02-28 23:46:00', '2021-02-28 23:46:00');
INSERT INTO `access` VALUES ('查看专栏详情', 32, '/admin/s/column/read', 'GET', 0, 0, 1, 10, '2021-03-01 00:47:12', '2021-03-01 00:47:12');
INSERT INTO `access` VALUES ('新增章', 32, '/admin/s/chapter/save', 'POST', 0, 0, 1, 10, '2021-02-28 20:17:22', '2021-02-28 20:17:22');
INSERT INTO `access` VALUES ('新增节', 32, '/admin/s/section/save', 'POST', 0, 0, 1, 10, '2021-02-28 20:17:22', '2021-02-28 20:17:22');
INSERT INTO `access` VALUES ('删除章', 32, '/admin/s/chapter/delete', 'POST', 0, 0, 1, 10, '2021-02-28 20:17:22', '2021-02-28 20:17:22');
INSERT INTO `access` VALUES ('删除节', 32, '/admin/s/section/delete', 'POST', 0, 0, 1, 10, '2021-02-28 20:17:22', '2021-02-28 20:17:22');
INSERT INTO `access` VALUES ('查看网校用户列表', 34, '/admin/s/school_user', 'GET', 0, 0, 1, 10, '2021-03-01 14:47:25', '2021-03-01 14:47:25');
INSERT INTO `access` VALUES ('查询网校用户详细信息', 34, '/admin/s/school_user/read', 'GET', 0, 0, 1, 10, '2021-03-01 14:54:52', '2021-03-01 14:54:52');
INSERT INTO `access` VALUES ('查看网校用户订阅列表', 34, '/admin/s/order_item', 'GET', 0, 0, 1, 10, '2021-03-01 15:50:01', '2021-03-01 15:50:01');
INSERT INTO `access` VALUES ('查看网校用户订单列表', 34, '/admin/s/order', 'GET', 0, 0, 1, 10, '2021-03-01 16:13:30', '2021-03-01 16:13:30');
INSERT INTO `access` VALUES ('查看网校用户观看历史', 34, '/admin/s/user_history', 'GET', 0, 0, 1, 10, '2021-03-01 21:27:57', '2021-03-01 21:27:57');
INSERT INTO `access` VALUES ('开启/禁止访问', 34, '/admin/s/school_user/updateaccess', 'POST', 0, 0, 1, 10, '2021-03-02 01:15:35', '2021-03-02 01:15:35');
INSERT INTO `access` VALUES ('开启/禁止评论', 34, '/admin/s/school_user/updatecomment', 'POST', 0, 0, 1, 10, '2021-03-02 01:15:54', '2021-03-02 01:15:54');
INSERT INTO `access` VALUES ('删除订单', 35, '/admin/s/order/delete', 'POST', 0, 0, 1, 10, '2021-03-02 02:41:53', '2021-03-02 02:41:53');
INSERT INTO `access` VALUES ('新增收款账户', 35, '/admin/s/cash/save', 'POST', 0, 0, 1, 10, '2021-02-28 20:17:22', '2021-02-28 20:17:22');
INSERT INTO `access` VALUES ('修改收款账户', 35, '/admin/s/cash/update', 'POST', 0, 0, 1, 10, '2021-02-28 20:34:34', '2021-02-28 20:34:34');
INSERT INTO `access` VALUES ('收款账户列表', 35, '/admin/s/cash', 'GET', 0, 0, 1, 10, '2021-02-28 22:32:38', '2021-02-28 22:32:38');
INSERT INTO `access` VALUES ('删除收款账户', 35, '/admin/s/cash/delete', 'POST', 0, 0, 1, 10, '2021-02-28 22:43:47', '2021-02-28 22:43:47');
INSERT INTO `access` VALUES ('申请提现列表', 35, '/admin/s/cashconfirm', 'GET', 0, 0, 1, 10, '2021-03-02 14:45:41', '2021-03-02 14:45:41');
INSERT INTO `access` VALUES ('申请提现', 35, '/admin/s/cashconfirm/save', 'POST', 0, 0, 1, 10, '2021-03-02 14:45:53', '2021-03-02 14:45:53');
INSERT INTO `access` VALUES ('添加拼团', 36, '/admin/s/group/save', 'POST', 0, 0, 1, 10, '2021-03-02 16:22:03', '2021-03-02 16:22:03');
INSERT INTO `access` VALUES ('更新拼团', 36, '/admin/s/group/update', 'POST', 0, 0, 1, 10, '2021-03-02 16:22:17', '2021-03-02 16:22:17');
INSERT INTO `access` VALUES ('上架/下架拼团', 36, '/admin/s/group/updatestatus', 'POST', 0, 0, 1, 10, '2021-03-02 16:22:34', '2021-03-02 16:22:34');
INSERT INTO `access` VALUES ('拼团列表', 36, '/admin/s/group', 'GET', 0, 0, 1, 10, '2021-03-02 16:22:50', '2021-03-02 16:22:50');
INSERT INTO `access` VALUES ('添加秒杀', 36, '/admin/s/flashsale/save', 'POST', 0, 0, 1, 10, '2021-03-02 16:23:25', '2021-03-02 16:23:25');
INSERT INTO `access` VALUES ('更新秒杀', 36, '/admin/s/flashsale/update', 'POST', 0, 0, 1, 10, '2021-03-02 16:24:07', '2021-03-02 16:24:07');
INSERT INTO `access` VALUES ('上架/下架秒杀', 36, '/admin/s/flashsale/updatestatus', 'POST', 0, 0, 1, 10, '2021-03-02 16:24:18', '2021-03-02 16:24:18');
INSERT INTO `access` VALUES ('秒杀列表', 36, '/admin/s/flashsale', 'GET', 0, 0, 1, 10, '2021-03-02 16:24:30', '2021-03-02 16:24:30');
INSERT INTO `access` VALUES ('添加优惠券', 36, '/admin/s/coupon/save', 'POST', 0, 0, 1, 10, '2021-03-02 16:24:56', '2021-03-02 16:24:56');
INSERT INTO `access` VALUES ('更新优惠券', 36, '/admin/s/coupon/update', 'POST', 0, 0, 1, 10, '2021-03-02 16:25:05', '2021-03-02 16:25:05');
INSERT INTO `access` VALUES ('上架/下架优惠券', 36, '/admin/s/coupon/updatestatus', 'POST', 0, 0, 1, 10, '2021-03-02 16:25:25', '2021-03-02 16:25:25');
INSERT INTO `access` VALUES ('优惠券列表', 36, '/admin/s/coupon', 'GET', 0, 0, 1, 10, '2021-03-02 16:25:41', '2021-03-02 16:25:41');
INSERT INTO `access` VALUES ('添加社区', 33, '/admin/s/bbs/save', 'POST', 0, 0, 1, 10, '2021-03-02 20:13:52', '2021-03-02 20:13:52');
INSERT INTO `access` VALUES ('更新社区', 33, '/admin/s/bbs/update', 'POST', 0, 0, 1, 10, '2021-03-02 20:14:05', '2021-03-02 20:14:05');
INSERT INTO `access` VALUES ('显示/隐藏社区', 33, '/admin/s/bbs/updatestatus', 'POST', 0, 0, 1, 10, '2021-03-02 20:14:19', '2021-03-02 20:14:19');
INSERT INTO `access` VALUES ('删除社区', 33, '/admin/s/bbs/delete', 'POST', 0, 0, 1, 10, '2021-03-02 20:14:30', '2021-03-02 20:14:30');
INSERT INTO `access` VALUES ('社区列表', 33, '/admin/s/bbs', 'GET', 0, 0, 1, 10, '2021-03-02 20:14:41', '2021-03-02 20:14:41');
INSERT INTO `access` VALUES ('给社区分配管理员', 33, '/admin/s/bbs/setmanagers', 'POST', 0, 0, 1, 10, '2021-03-02 21:35:54', '2021-03-02 21:35:54');
INSERT INTO `access` VALUES ('帖子列表', 33, '/admin/s/post', 'GET', 0, 0, 1, 10, '2021-03-02 22:12:07', '2021-03-02 22:12:07');
INSERT INTO `access` VALUES ('取消/置顶帖子', 33, '/admin/s/post/updateistop', 'POST', 0, 0, 1, 10, '2021-03-02 22:34:05', '2021-03-02 22:34:05');
INSERT INTO `access` VALUES ('删除帖子', 33, '/admin/s/post/delete', 'POST', 0, 0, 1, 10, '2021-03-02 23:33:45', '2021-03-02 23:33:45');
INSERT INTO `access` VALUES ('帖子评论列表', 33, '/admin/s/post_comment', 'GET', 0, 0, 1, 10, '2021-03-02 23:57:30', '2021-03-02 23:57:30');
INSERT INTO `access` VALUES ('删除帖子评论', 33, '/admin/s/post_comment/delete', 'POST', 0, 0, 1, 10, '2021-03-02 23:57:47', '2021-03-02 23:57:47');
INSERT INTO `access` VALUES ('添加题目', 33, '/admin/s/question/save', 'POST', 0, 0, 1, 10, '2021-03-03 01:40:41', '2021-03-03 01:40:41');
INSERT INTO `access` VALUES ('更新题目', 33, '/admin/s/question/update', 'POST', 0, 0, 1, 10, '2021-03-03 01:40:51', '2021-03-03 01:40:51');
INSERT INTO `access` VALUES ('删除题目', 33, '/admin/s/question/delete', 'POST', 0, 0, 1, 10, '2021-03-03 01:41:04', '2021-03-03 01:41:04');
INSERT INTO `access` VALUES ('题目列表', 33, '/admin/s/question', 'GET', 0, 0, 1, 10, '2021-03-03 01:41:16', '2021-03-03 01:41:16');
INSERT INTO `access` VALUES ('添加试卷', 33, '/admin/s/testpaper/save', 'POST', 0, 0, 1, 10, '2021-03-03 02:00:38', '2021-03-03 02:00:38');
INSERT INTO `access` VALUES ('更新试卷', 33, '/admin/s/testpaper/update', 'POST', 0, 0, 1, 10, '2021-03-03 02:00:48', '2021-03-03 02:00:48');
INSERT INTO `access` VALUES ('删除试卷', 33, '/admin/s/testpaper/delete', 'POST', 0, 0, 1, 10, '2021-03-03 02:00:57', '2021-03-03 02:00:57');
INSERT INTO `access` VALUES ('试卷列表', 33, '/admin/s/testpaper', 'GET', 0, 0, 1, 10, '2021-03-03 02:01:08', '2021-03-03 02:01:08');
INSERT INTO `access` VALUES ('考试列表', 33, '/admin/s/user_test', 'GET', 0, 0, 1, 10, '2021-03-04 02:17:35', '2021-03-04 02:17:35');
INSERT INTO `access` VALUES ('删除考试', 33, '/admin/s/user_test/delete', 'POST', 0, 0, 1, 10, '2021-03-04 02:20:40', '2021-03-04 02:20:40');
INSERT INTO `access` VALUES ('查看考试详情', 33, '/admin/s/user_test/read', 'GET', 0, 0, 1, 10, '2021-03-04 02:34:51', '2021-03-04 02:34:51');
INSERT INTO `access` VALUES ('查看试卷详情', 33, '/admin/s/testpaper/read', 'GET', 0, 0, 1, 10, '2021-03-04 18:13:04', '2021-03-04 18:13:04');
INSERT INTO `access` VALUES ('考试阅卷', 33, '/admin/s/user_test/update_readstatus', 'POST', 0, 0, 1, 10, '2021-03-04 19:43:35', '2021-03-04 19:43:35');
INSERT INTO `access` VALUES ('添加电子书', 33, '/admin/s/book/save', 'POST', 0, 0, 1, 10, '2021-03-04 20:13:17', '2021-03-04 20:13:17');
INSERT INTO `access` VALUES ('更新电子书', 33, '/admin/s/book/update', 'POST', 0, 0, 1, 10, '2021-03-04 20:13:25', '2021-03-04 20:13:25');
INSERT INTO `access` VALUES ('电子书列表', 33, '/admin/s/book', 'GET', 0, 0, 1, 10, '2021-03-04 20:13:39', '2021-03-04 20:13:39');
INSERT INTO `access` VALUES ('删除电子书', 33, '/admin/s/book/delete', 'POST', 0, 0, 1, 10, '2021-03-04 20:13:56', '2021-03-04 20:13:56');
INSERT INTO `access` VALUES ('上架/下架电子书', 33, '/admin/s/book/updatestatus', 'POST', 0, 0, 1, 10, '2021-03-04 20:14:10', '2021-03-04 20:14:10');
INSERT INTO `access` VALUES ('添加电子书章节', 33, '/admin/s/book_detail/save', 'POST', 0, 0, 1, 10, '2021-03-04 20:49:29', '2021-03-04 20:49:29');
INSERT INTO `access` VALUES ('更新电子书章节', 33, '/admin/s/book_detail/update', 'POST', 0, 0, 1, 10, '2021-03-04 20:49:39', '2021-03-04 20:49:39');
INSERT INTO `access` VALUES ('删除电子书章节', 33, '/admin/s/book_detail/delete', 'POST', 0, 0, 1, 10, '2021-03-04 20:49:50', '2021-03-04 20:49:50');
INSERT INTO `access` VALUES ('查看电子书章节列表', 33, '/admin/s/book_detail', 'GET', 0, 0, 1, 10, '2021-03-04 20:50:05', '2021-03-04 20:50:05');
INSERT INTO `access` VALUES ('电子书章节排序', 33, '/admin/s/book_detail/sort', 'POST', 0, 0, 1, 10, '2021-03-04 20:52:29', '2021-03-04 20:52:29');
INSERT INTO `access` VALUES ('添加页面', 38, '/admin/s/renovation/save', 'POST', 0, 0, 1, 10, '2021-03-05 01:54:15', '2021-03-05 01:54:15');
INSERT INTO `access` VALUES ('更新页面', 38, '/admin/s/renovation/update', 'POST', 0, 0, 1, 10, '2021-03-05 01:54:27', '2021-03-05 01:54:27');
INSERT INTO `access` VALUES ('删除页面', 38, '/admin/s/renovation/delete', 'POST', 0, 0, 1, 10, '2021-03-05 01:54:40', '2021-03-05 01:54:40');
INSERT INTO `access` VALUES ('页面列表', 38, '/admin/s/renovation', 'GET', 0, 0, 1, 10, '2021-03-05 01:54:54', '2021-03-05 01:54:54');
INSERT INTO `access` VALUES ('公共模块', 0, 'Common', 'GET', 0, 0, 1, 10, '2021-02-27 21:27:53', '2021-02-27 21:27:53');
INSERT INTO `access` VALUES ('上传文件', 126, '/admin/s/upload', 'POST', 0, 0, 1, 10, '2021-03-05 01:54:40', '2021-03-05 01:54:40');
INSERT INTO `access` VALUES ('小社群帖子列表', 3, 'BbsPost', 'GET', 1, 1, 1, 10, '2021-02-27 20:39:49', '2021-02-27 20:39:49');
INSERT INTO `access` VALUES ('电子书', 3, 'Book', 'GET', 1, 0, 1, 10, '2021-03-05 01:54:40', '2021-03-05 01:54:40');
INSERT INTO `access` VALUES ('电子书章节管理', 3, 'BookDetail', 'GET', 1, 1, 1, 10, '2021-03-05 01:54:40', '2021-03-05 01:54:40');
INSERT INTO `access` VALUES ('导入excel', 126, '/admin/s/importexcel', 'POST', 0, 0, 1, 10, '2021-03-05 01:54:40', '2021-03-05 01:54:40');
INSERT INTO `access` VALUES ('查看页面模板数据', 38, '/admin/s/renovation/read', 'GET', 0, 0, 1, 10, '2021-03-05 01:54:54', '2021-03-05 01:54:54');
INSERT INTO `access` VALUES ('后台首页数据统计', 126, '/admin/s/statistics', 'GET', 0, 0, 1, 10, '2021-03-05 01:54:54', '2021-03-05 01:54:54');

SET FOREIGN_KEY_CHECKS = 1;
