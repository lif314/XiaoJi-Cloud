# -- ----------------------------
# -- 初始化-菜单信息表数据
# -- ----------------------------
# -- 一级菜单
# insert into sys_menu values('5', '万物互联', '0', '0', 'iot', null,'', 1, 0, 'M', '0', '0', '', 'iot', 'admin', sysdate(), 'admin',null, '万物互联目录');
#
#
# -- 二级菜单
# insert into sys_menu values('117', '设备分类', '5', '1', 'category', 'device/category/index','', 1, 0, 'C', '0', '0','device:category:list', 'category', 'admin', sysdate(), 'admin', null, '设备分类菜单');
# INSERT INTO sys_menu VALUES('118', '设备列表', '5', '2', 'device', 'device/device/index','', 1, 0, 'C', '0', '0', 'device:device:list','device', 'admin', sysdate(), 'admin', null, '设备菜单');
# INSERT INTO sys_menu VALUES('121', '设备分组', '5', '3', 'group', 'device/group/index','', 1, 0, 'C', '0', '0', 'device:group:list','group', 'admin', sysdate(), 'admin', null, '分组菜单');
# INSERT INTO sys_menu VALUES('119', '配置日志', '5', '4', 'set', 'device/set/index', '', 1, 0, 'C', '0', '0', 'device:set:list', 'config','admin', sysdate(), 'admin', null, '设备配置菜单');
# INSERT INTO sys_menu VALUES('120', '状态日志', '5', '5', 'status', 'device/status/index', '', 1, 0, 'C', '0', '0', 'device:status:list', 'status', 'admin', sysdate(), 'admin', null, '设备状态菜单');
# INSERT INTO `sys_menu`
# VALUES ('122', 'EMQ管理', '5', '6', 'http://121.36.229.15:18083/#/', null, '', 0, 0, 'C', '0', '0', '', 'mqtt', 'admin',  sysdate(), 'admin', null, '');
#
#
# -- 设备分类按钮
# INSERT INTO sys_menu VALUES('1061', '设备分类查询', '117', '1', '', '', '', 1, 0, 'F', '0', '0', 'device:category:query', '#', 'admin', sysdate(), '', null, '');
# INSERT INTO sys_menu VALUES('1062', '设备分类新增', '117', '2', '', '','', 1, 0, 'F', '0', '0', 'device:category:add', '#', 'admin',sysdate(), '', null, '');
# INSERT INTO sys_menu VALUES('1063', '设备分类修改', '117', '3', '', '', '', 1, 0, 'F', '0', '0', 'device:category:edit', '#', 'admin', sysdate(), '', null, '');
# INSERT INTO sys_menu VALUES('1064', '设备分类删除', '117', '4', '','',  '', 1, 0, 'F', '0', '0', 'device:category:remove', '#', 'admin', sysdate(), '', null, '');
# INSERT INTO sys_menu VALUES('1065', '设备分类导出', '117', '5', '', '', '', 1, 0, 'F', '0', '0', 'device:category:export', '#', 'admin', sysdate(), '', null, '');
#
# -- 设备列表按钮
# INSERT INTO `sys_menu`
# VALUES ('1066', '设备查询', '118', '1', '', '', '', 1, 0, 'F', '0', '0', 'device:device:query', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1067', '设备新增', '118', '2', '', '', '', 1, 0, 'F', '0', '0', 'device:device:add', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1068', '设备修改', '118', '3',  '', '', '', 1, 0, 'F', '0', '0', 'device:device:edit', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1069', '设备删除', '118', '4',  '', '', '', 1, 0, 'F', '0', '0', 'device:device:remove', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1070', '设备导出', '118', '5', '', '', '', 1, 0, 'F', '0', '0', 'device:device:export', '#', 'admin',
#         sysdate(), '', null, '');
#
#
# -- 设备配置日志
# INSERT INTO `sys_menu`
# VALUES ('1071', '设备配置查询', '119', '1', '', '', '', 1, 0, 'F', '0', '0', 'device:set:query', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1072', '设备配置新增', '119', '2', '', '', '', 1, 0, 'F', '0', '0', 'device:set:add', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1073', '设备配置修改', '119', '3', '', '', '', 1, 0, 'F', '0', '0', 'device:set:edit', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1074', '设备配置删除', '119', '4', '', '', '', 1, 0,'F', '0', '0', 'device:set:remove', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1075', '设备配置导出', '119', '5','', '', '', 1, 0, 'F', '0', '0', 'device:set:export', '#', 'admin',
#         sysdate(), '', null, '');
#
#
#
# -- 设备状态日志
# INSERT INTO `sys_menu`
# VALUES ('1076', '设备状态查询', '120', '1', '', '', '', 1, 0, 'F', '0', '0', 'device:status:query', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1077', '设备状态新增', '120', '2', '', '', '', 1, 0, 'F', '0', '0', 'device:status:add', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1078', '设备状态修改', '120', '3', '', '', '', 1, 0, 'F', '0', '0', 'device:status:edit', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1079', '设备状态删除', '120', '4','', '', '', 1, 0, 'F', '0', '0', 'device:status:remove', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1080', '设备状态导出', '120', '5', '', '', '', 1, 0, 'F', '0', '0', 'device:status:export', '#', 'admin',
#         sysdate(), '', null, '');
#
#
# -- 设备分组
# INSERT INTO `sys_menu`
# VALUES ('1081', '分组查询', '121', '1', '', '', '', 1, 0, 'F', '0', '0', 'device:group:query', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1082', '分组新增', '121', '2', '', '', '', 1, 0, 'F', '0', '0', 'device:group:add', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1083', '分组修改', '121', '3', '', '', '', 1, 0,'F', '0', '0', 'device:group:edit', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1084', '分组删除', '121', '4','', '', '', 1, 0, 'F', '0', '0', 'device:group:remove', '#', 'admin',
#         sysdate(), '', null, '');
# INSERT INTO `sys_menu`
# VALUES ('1085', '分组导出', '121', '5', '', '', '', 1, 0, 'F', '0', '0', 'device:group:export', '#', 'admin',
#         sysdate(), '', null, '');


-- ----------------------------
-- Records of gen_table
-- ----------------------------
# INSERT INTO `gen_table` VALUES (12, 'iot_category', '设备分类', '', '', 'IotCategory', 'crud', 'com.xiaoji.device', 'device', 'category', '设备分类', 'kerwincui', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2021-05-06 13:31:29', '', '2021-05-07 08:22:58', NULL);
# INSERT INTO `gen_table` VALUES (14, 'iot_device_set', '设备配置', NULL, NULL, 'IotDeviceSet', 'crud', 'com.xiaoji.device', 'device', 'set', '设备配置', 'kerwincui', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2021-05-06 13:31:32', '', '2021-05-06 15:14:45', NULL);
# INSERT INTO `gen_table` VALUES (15, 'iot_device_status', '设备状态', NULL, NULL, 'IotDeviceStatus', 'crud', 'com.xiaoji.device', 'device', 'status', '设备状态', 'kerwincui', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2021-05-06 13:31:35', '', '2021-05-06 15:15:04', NULL);
# INSERT INTO `gen_table` VALUES (17, 'iot_group', '设备分组', NULL, NULL, 'IotGroup', 'crud', 'com.xiaoji.device', 'device', 'group', '分组', 'kerwincui', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2021-05-18 08:04:15', '', '2021-05-18 08:13:40', NULL);
# INSERT INTO `gen_table` VALUES (18, 't_user_account_info', '小程序用户表', NULL, NULL, 'TUserAccountInfo', 'crud', 'com.xiaoji.device', 'device', 'info', '小程序用户', 'wxy', '0', '/', NULL, 'admin', '2021-08-26 14:45:28', '', NULL, NULL);
# INSERT INTO `gen_table` VALUES (19, 't_user_login_log', '', NULL, NULL, 'TUserLoginLog', 'crud', 'com.xiaoji.device', 'device', 'log', NULL, 'wxy', '0', '/', NULL, 'admin', '2021-08-26 14:45:29', '', NULL, NULL);
# INSERT INTO `gen_table` VALUES (20, 'sys_user', '用户信息表', NULL, NULL, 'SysUser', 'crud', 'com.xiaoji.device', 'device', 'sysUser', '用户信息', 'wxy', '0', '/', NULL, 'admin', '2021-08-26 17:07:44', '', NULL, NULL);
# INSERT INTO `gen_table` VALUES (21, 'iot_device_user_relation', '', NULL, NULL, 'IotDeviceUserRelation', 'crud', 'com.xiaoji.device', 'device', 'relation', NULL, 'wxy', '0', '/', NULL, 'admin', '2021-08-27 11:55:05', '', NULL, NULL);
# INSERT INTO `gen_table` VALUES (22, 'iot_device', '', NULL, NULL, 'IotDevice', 'crud', 'com.xiaoji.device', 'device', 'device', NULL, 'wxy', '0', '/', NULL, 'admin', '2021-08-27 13:45:40', '', NULL, NULL);


-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (217, '12', 'category_id', '序号', 'bigint(20)', 'Long', 'categoryId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-05-06 13:31:29', '', '2021-05-07 08:22:58');
INSERT INTO `gen_table_column` VALUES (218, '12', 'category_name', '分类名称', 'varchar(100)', 'String', 'categoryName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-05-06 13:31:29', '', '2021-05-07 08:22:58');
INSERT INTO `gen_table_column` VALUES (219, '12', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2021-05-06 13:31:29', '', '2021-05-07 08:22:58');
INSERT INTO `gen_table_column` VALUES (220, '12', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2021-05-06 13:31:29', '', '2021-05-07 08:22:58');
INSERT INTO `gen_table_column` VALUES (221, '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2021-05-06 13:31:29', '', '2021-05-07 08:22:58');
INSERT INTO `gen_table_column` VALUES (222, '12', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2021-05-06 13:31:29', '', '2021-05-07 08:22:58');
INSERT INTO `gen_table_column` VALUES (223, '12', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2021-05-06 13:31:30', '', '2021-05-07 08:22:59');
INSERT INTO `gen_table_column` VALUES (224, '12', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2021-05-06 13:31:30', '', '2021-05-07 08:22:59');
INSERT INTO `gen_table_column` VALUES (237, '14', 'device_config_id', '序号', 'bigint(20)', 'Long', 'deviceConfigId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-05-06 13:31:32', '', '2021-05-06 15:14:45');
INSERT INTO `gen_table_column` VALUES (238, '14', 'device_id', '设备', 'bigint(20)', 'Long', 'deviceId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-05-06 13:31:32', '', '2021-05-06 15:14:45');
INSERT INTO `gen_table_column` VALUES (239, '14', 'device_num', '设备编号', 'varchar(64)', 'String', 'deviceNum', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-05-06 13:31:32', '', '2021-05-06 15:14:45');
INSERT INTO `gen_table_column` VALUES (240, '14', 'is_alarm', '报警', 'tinyint(1)', 'Integer', 'isAlarm', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 4, 'admin', '2021-05-06 13:31:32', '', '2021-05-06 15:14:45');
INSERT INTO `gen_table_column` VALUES (241, '14', 'is_radar', '雷达感应', 'tinyint(1)', 'Integer', 'isRadar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 5, 'admin', '2021-05-06 13:31:32', '', '2021-05-06 15:14:45');
INSERT INTO `gen_table_column` VALUES (242, '14', 'is_host', '托管', 'tinyint(1)', 'Integer', 'isHost', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 6, 'admin', '2021-05-06 13:31:32', '', '2021-05-06 15:14:46');
INSERT INTO `gen_table_column` VALUES (243, '14', 'is_reset', '重启', 'tinyint(1)', 'Integer', 'isReset', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'radio', 'sys_yes_no', 7, 'admin', '2021-05-06 13:31:33', '', '2021-05-06 15:14:46');
INSERT INTO `gen_table_column` VALUES (244, '14', 'is_ap', '打开AP', 'tinyint(1)', 'Integer', 'isAp', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'radio', 'sys_yes_no', 8, 'admin', '2021-05-06 13:31:33', '', '2021-05-06 15:14:46');
INSERT INTO `gen_table_column` VALUES (245, '14', 'is_rf_control', '射频遥控', 'tinyint(1)', 'Integer', 'isRfControl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 9, 'admin', '2021-05-06 13:31:33', '', '2021-05-06 15:14:46');
INSERT INTO `gen_table_column` VALUES (246, '14', 'is_rf_learn', '遥控配对', 'tinyint(1)', 'Integer', 'isRfLearn', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'radio', 'sys_yes_no', 10, 'admin', '2021-05-06 13:31:33', '', '2021-05-06 15:14:46');
INSERT INTO `gen_table_column` VALUES (247, '14', 'is_rf_clear', '遥控清码', 'tinyint(1)', 'Integer', 'isRfClear', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'radio', 'sys_yes_no', 11, 'admin', '2021-05-06 13:31:33', '', '2021-05-06 15:14:46');
INSERT INTO `gen_table_column` VALUES (248, '14', 'rf_one_func', '按键一', 'tinyint(10)', 'Integer', 'rfOneFunc', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'select', 'rf_function', 12, 'admin', '2021-05-06 13:31:33', '', '2021-05-06 15:14:46');
INSERT INTO `gen_table_column` VALUES (249, '14', 'rf_two_func', '按键二', 'tinyint(10)', 'Integer', 'rfTwoFunc', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'select', 'rf_function', 13, 'admin', '2021-05-06 13:31:33', '', '2021-05-06 15:14:47');
INSERT INTO `gen_table_column` VALUES (250, '14', 'rf_three_func', '按键三', 'tinyint(10)', 'Integer', 'rfThreeFunc', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'select', 'rf_function', 14, 'admin', '2021-05-06 13:31:34', '', '2021-05-06 15:14:47');
INSERT INTO `gen_table_column` VALUES (251, '14', 'rf_four_func', '按键四', 'tinyint(10)', 'Integer', 'rfFourFunc', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'select', 'rf_function', 15, 'admin', '2021-05-06 13:31:34', '', '2021-05-06 15:14:47');
INSERT INTO `gen_table_column` VALUES (252, '14', 'owner_id', '用户', 'varchar(64)', 'String', 'ownerId', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 16, 'admin', '2021-05-06 13:31:34', '', '2021-05-06 15:14:47');
INSERT INTO `gen_table_column` VALUES (253, '14', 'network_address', '配网地址', 'varchar(255)', 'String', 'networkAddress', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 17, 'admin', '2021-05-06 13:31:34', '', '2021-05-06 15:14:47');
INSERT INTO `gen_table_column` VALUES (254, '14', 'network_ip', '配网IP', 'varchar(32)', 'String', 'networkIp', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 18, 'admin', '2021-05-06 13:31:34', '', '2021-05-06 15:14:47');
INSERT INTO `gen_table_column` VALUES (255, '14', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2021-05-06 13:31:34', '', '2021-05-06 15:14:47');
INSERT INTO `gen_table_column` VALUES (256, '14', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2021-05-06 13:31:34', '', '2021-05-06 15:14:47');
INSERT INTO `gen_table_column` VALUES (257, '14', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, '1', 'BETWEEN', 'datetime', '', 21, 'admin', '2021-05-06 13:31:34', '', '2021-05-06 15:14:47');
INSERT INTO `gen_table_column` VALUES (258, '14', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 22, 'admin', '2021-05-06 13:31:35', '', '2021-05-06 15:14:48');
INSERT INTO `gen_table_column` VALUES (259, '14', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 23, 'admin', '2021-05-06 13:31:35', '', '2021-05-06 15:14:48');
INSERT INTO `gen_table_column` VALUES (260, '14', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 24, 'admin', '2021-05-06 13:31:35', '', '2021-05-06 15:14:48');
INSERT INTO `gen_table_column` VALUES (261, '15', 'device_status_id', '序号', 'bigint(20)', 'Long', 'deviceStatusId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-05-06 13:31:35', '', '2021-05-06 15:15:04');
INSERT INTO `gen_table_column` VALUES (262, '15', 'device_id', '设备', 'bigint(20)', 'Long', 'deviceId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-05-06 13:31:35', '', '2021-05-06 15:15:04');
INSERT INTO `gen_table_column` VALUES (263, '15', 'device_num', '设备编号', 'varchar(64)', 'String', 'deviceNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-05-06 13:31:35', '', '2021-05-06 15:15:04');
INSERT INTO `gen_table_column` VALUES (264, '15', 'relay_status', '继电器', 'tinyint(1)', 'Integer', 'relayStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 4, 'admin', '2021-05-06 13:31:36', '', '2021-05-06 15:15:05');
INSERT INTO `gen_table_column` VALUES (265, '15', 'light_status', '灯状态', 'tinyint(1)', 'Integer', 'lightStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 5, 'admin', '2021-05-06 13:31:36', '', '2021-05-06 15:15:05');
INSERT INTO `gen_table_column` VALUES (266, '15', 'is_online', '在线', 'tinyint(1)', 'Integer', 'isOnline', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 6, 'admin', '2021-05-06 13:31:36', '', '2021-05-06 15:15:05');
INSERT INTO `gen_table_column` VALUES (267, '15', 'device_temperature', '设备温度', 'float(6,2)', 'BigDecimal', 'deviceTemperature', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-05-06 13:31:36', '', '2021-05-06 15:15:05');
INSERT INTO `gen_table_column` VALUES (268, '15', 'device_humidity', '设备湿度', 'float(6,2)', 'BigDecimal', 'deviceHumidity', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-05-06 13:31:36', '', '2021-05-06 15:15:05');
INSERT INTO `gen_table_column` VALUES (269, '15', 'air_temperature', '空气温度', 'float(6,2)', 'BigDecimal', 'airTemperature', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-05-06 13:31:36', '', '2021-05-06 15:15:05');
INSERT INTO `gen_table_column` VALUES (270, '15', 'air_humidity', '空气湿度', 'float(6,2)', 'BigDecimal', 'airHumidity', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-05-06 13:31:36', '', '2021-05-06 15:15:05');
INSERT INTO `gen_table_column` VALUES (271, '15', 'trigger_source', '触发源', 'tinyint(10)', 'Integer', 'triggerSource', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'iot_trigger_source', 11, 'admin', '2021-05-06 13:31:36', '', '2021-05-06 15:15:05');
INSERT INTO `gen_table_column` VALUES (272, '15', 'brightness', '彩灯亮度', 'tinyint(10) unsigned', 'Integer', 'brightness', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-05-06 13:31:37', '', '2021-05-06 15:15:05');
INSERT INTO `gen_table_column` VALUES (273, '15', 'light_interval', '渐变间隔', 'smallint(10)', 'Integer', 'lightInterval', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2021-05-06 13:31:37', '', '2021-05-06 15:15:06');
INSERT INTO `gen_table_column` VALUES (274, '15', 'light_mode', '彩灯模式', 'tinyint(10)', 'Integer', 'lightMode', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'select', 'light_mode', 14, 'admin', '2021-05-06 13:31:37', '', '2021-05-06 15:15:06');
INSERT INTO `gen_table_column` VALUES (275, '15', 'red', '红灯', 'tinyint(255) unsigned', 'Long', 'red', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2021-05-06 13:31:37', '', '2021-05-06 15:15:06');
INSERT INTO `gen_table_column` VALUES (276, '15', 'green', '绿灯', 'tinyint(255) unsigned', 'Long', 'green', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 16, 'admin', '2021-05-06 13:31:37', '', '2021-05-06 15:15:06');
INSERT INTO `gen_table_column` VALUES (277, '15', 'blue', '蓝灯', 'tinyint(255) unsigned', 'Long', 'blue', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 17, 'admin', '2021-05-06 13:31:37', '', '2021-05-06 15:15:06');
INSERT INTO `gen_table_column` VALUES (278, '15', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2021-05-06 13:31:37', '', '2021-05-06 15:15:06');
INSERT INTO `gen_table_column` VALUES (279, '15', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2021-05-06 13:31:38', '', '2021-05-06 15:15:06');
INSERT INTO `gen_table_column` VALUES (280, '15', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, '1', 'BETWEEN', 'datetime', '', 20, 'admin', '2021-05-06 13:31:38', '', '2021-05-06 15:15:06');
INSERT INTO `gen_table_column` VALUES (281, '15', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2021-05-06 13:31:38', '', '2021-05-06 15:15:07');
INSERT INTO `gen_table_column` VALUES (282, '15', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 22, 'admin', '2021-05-06 13:31:38', '', '2021-05-06 15:15:07');
INSERT INTO `gen_table_column` VALUES (283, '15', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 23, 'admin', '2021-05-06 13:31:38', '', '2021-05-06 15:15:07');
INSERT INTO `gen_table_column` VALUES (294, '17', 'group_id', '设备分组', 'bigint(20)', 'Long', 'groupId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-05-18 08:04:15', '', '2021-05-18 08:13:40');
INSERT INTO `gen_table_column` VALUES (295, '17', 'user_id', '用户', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-05-18 08:04:16', '', '2021-05-18 08:13:40');
INSERT INTO `gen_table_column` VALUES (296, '17', 'group_name', '分组名称', 'varchar(100)', 'String', 'groupName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-05-18 08:04:16', '', '2021-05-18 08:13:40');
INSERT INTO `gen_table_column` VALUES (297, '17', 'group_order', '排序', 'smallint(5) unsigned zerofill', 'Integer', 'groupOrder', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-05-18 08:04:16', '', '2021-05-18 08:13:41');
INSERT INTO `gen_table_column` VALUES (298, '17', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2021-05-18 08:04:16', '', '2021-05-18 08:13:41');
INSERT INTO `gen_table_column` VALUES (299, '17', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2021-05-18 08:04:16', '', '2021-05-18 08:13:41');
INSERT INTO `gen_table_column` VALUES (300, '17', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', '1', 'BETWEEN', 'datetime', '', 7, 'admin', '2021-05-18 08:04:17', '', '2021-05-18 08:13:41');
INSERT INTO `gen_table_column` VALUES (301, '17', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-05-18 08:04:17', '', '2021-05-18 08:13:41');
INSERT INTO `gen_table_column` VALUES (302, '17', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-05-18 08:04:17', '', '2021-05-18 08:13:41');
INSERT INTO `gen_table_column` VALUES (303, '17', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2021-05-18 08:04:17', '', '2021-05-18 08:13:42');
INSERT INTO `gen_table_column` VALUES (304, '18', 'id', NULL, 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-08-26 14:45:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (305, '18', 'sessionKey', 'sessionKey', 'varchar(255)', 'String', 'sessionkey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-08-26 14:45:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (306, '18', 'access_token', 'accessToken', 'varchar(255)', 'String', 'accessToken', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-08-26 14:45:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (307, '18', 'open_id', NULL, 'varchar(50)', 'String', 'openId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-08-26 14:45:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (308, '18', 'union_id', NULL, 'varchar(50)', 'String', 'unionId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-08-26 14:45:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (309, '18', 'nick_name', '昵称', 'varchar(255)', 'String', 'nickName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2021-08-26 14:45:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (310, '18', 'avatar', '头像', 'varchar(255)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-08-26 14:45:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (311, '18', 'phone', '手机号', 'varchar(255)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-08-26 14:45:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (312, '18', 'birthday', '生日', 'varchar(255)', 'String', 'birthday', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-08-26 14:45:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (313, '18', 'status', '用户状态：0-冻结，1-正常', 'int', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2021-08-26 14:45:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (314, '18', 'country', '国家', 'varchar(255)', 'String', 'country', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (315, '18', 'province', '省份', 'varchar(255)', 'String', 'province', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (316, '18', 'city', '城市', 'varchar(255)', 'String', 'city', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (317, '18', 'address', '地址', 'varchar(255)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (318, '18', 'user_type', '用户类型：0-未授权用户，1-消费者，2-商家', 'int', 'Long', 'userType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 15, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (319, '18', 'admin_id', '绑定的管理员编号', 'int', 'Long', 'adminId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (320, '18', 'last_login_time', NULL, 'timestamp', 'Date', 'lastLoginTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 17, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (321, '18', 'last_login_ip', NULL, 'varchar(255)', 'String', 'lastLoginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (322, '18', 'gmt_time', NULL, 'timestamp', 'Date', 'gmtTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 19, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (323, '18', 'gmt_update', NULL, 'timestamp', 'Date', 'gmtUpdate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 20, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (324, '19', 'id', NULL, 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (325, '19', 'user_type', '用户类型', 'varchar(255)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (326, '19', 'user_id', NULL, 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (327, '19', 'code', NULL, 'varchar(50)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (328, '19', 'open_id', NULL, 'varchar(50)', 'String', 'openId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (329, '19', 'ip', 'IP地址', 'varchar(30)', 'String', 'ip', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (330, '19', 'gmt_time', NULL, 'timestamp', 'Date', 'gmtTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (331, '19', 'gmt_update', NULL, 'timestamp', 'Date', 'gmtUpdate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2021-08-26 14:45:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (332, '20', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (333, '20', 'dept_id', '部门ID', 'bigint', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (334, '20', 'open_id', '用户OpenId', 'varchar(40)', 'String', 'openId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (335, '20', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (336, '20', 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (337, '20', 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (338, '20', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (339, '20', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (340, '20', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (341, '20', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (342, '20', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (343, '20', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 12, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (344, '20', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (345, '20', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (346, '20', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (347, '20', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (348, '20', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (349, '20', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (350, '20', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (351, '20', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 20, 'admin', '2021-08-26 17:07:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (352, '21', 'id', NULL, 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-08-27 11:55:05', '', NULL);
INSERT INTO `gen_table_column` VALUES (353, '21', 'user_id', NULL, 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-08-27 11:55:05', '', NULL);
INSERT INTO `gen_table_column` VALUES (354, '21', 'device_id', NULL, 'int', 'Long', 'deviceId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-08-27 11:55:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (355, '21', 'device_num', NULL, 'varchar(60)', 'String', 'deviceNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-08-27 11:55:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (356, '21', 'gmt_time', NULL, 'timestamp', 'Date', 'gmtTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2021-08-27 11:55:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (357, '21', 'gmt_update', NULL, 'timestamp', 'Date', 'gmtUpdate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2021-08-27 11:55:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (358, '22', 'device_id', '设备ID', 'bigint', 'Long', 'deviceId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-08-27 13:45:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (359, '22', 'device_num', '设备编号', 'varchar(64)', 'String', 'deviceNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-08-27 13:45:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (360, '22', 'category_id', '设备分类', 'bigint', 'Long', 'categoryId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-08-27 13:45:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (361, '22', 'device_name', '设备名称', 'varchar(64)', 'String', 'deviceName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-08-27 13:45:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (362, '22', 'firmware_version', '固件版本', 'varchar(32)', 'String', 'firmwareVersion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-08-27 13:45:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (363, '22', 'owner_id', '设备用户ID', 'varchar(64)', 'String', 'ownerId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-08-27 13:45:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (364, '22', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-08-27 13:45:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (365, '22', 'status', '设备状态：未激活，未绑定，已绑定', 'varchar(255)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2021-08-27 13:45:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (366, '22', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-08-27 13:45:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (367, '22', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-08-27 13:45:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (368, '22', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-08-27 13:45:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (369, '22', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-08-27 13:45:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (370, '22', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2021-08-27 13:45:40', '', NULL);




INSERT INTO `sys_dict_data` VALUES (100, 0, '按键', '1', 'iot_trigger_source', NULL, NULL, 'N', '0', 'admin', '2021-05-05 15:53:34', 'admin', '2021-05-05 15:54:17', '按键操作');
INSERT INTO `sys_dict_data` VALUES (101, 0, '手机', '2', 'iot_trigger_source', NULL, NULL, 'N', '0', 'admin', '2021-05-05 15:53:50', '', NULL, '手机操作');
INSERT INTO `sys_dict_data` VALUES (102, 0, '浏览器', '3', 'iot_trigger_source', NULL, NULL, 'N', '0', 'admin', '2021-05-05 15:54:09', '', NULL, '浏览器操作');
INSERT INTO `sys_dict_data` VALUES (103, 0, '射频遥控', '4', 'iot_trigger_source', NULL, NULL, 'N', '0', 'admin', '2021-05-05 15:54:44', '', NULL, '433M遥控操作');
INSERT INTO `sys_dict_data` VALUES (104, 0, '雷达', '5', 'iot_trigger_source', NULL, NULL, 'N', '0', 'admin', '2021-05-05 15:55:03', '', NULL, '雷达触发');
INSERT INTO `sys_dict_data` VALUES (105, 0, '报警', '6', 'iot_trigger_source', NULL, NULL, 'N', '0', 'admin', '2021-05-05 15:55:44', '', NULL, '报警触发');
INSERT INTO `sys_dict_data` VALUES (106, 0, '定时', '7', 'iot_trigger_source', NULL, NULL, 'N', '0', 'admin', '2021-05-05 15:56:03', '', NULL, '定时触发');
INSERT INTO `sys_dict_data` VALUES (107, 1, '继电器开关', '1', 'rf_function', NULL, NULL, 'N', '0', 'admin', '2021-05-05 15:58:36', 'admin', '2021-06-23 22:50:32', '继电器通断');
INSERT INTO `sys_dict_data` VALUES (108, 2, '七彩灯开关', '2', 'rf_function', NULL, NULL, 'N', '0', 'admin', '2021-05-05 15:58:57', 'admin', '2021-06-23 22:50:44', '开关灯');
INSERT INTO `sys_dict_data` VALUES (109, 3, '雷达开关', '3', 'rf_function', NULL, NULL, 'N', '0', 'admin', '2021-05-05 15:59:34', 'admin', '2021-06-23 22:50:21', '开关雷达');
INSERT INTO `sys_dict_data` VALUES (110, 4, '报警开关', '4', 'rf_function', NULL, NULL, 'N', '0', 'admin', '2021-05-05 16:00:01', 'admin', '2021-06-01 15:44:44', '报警开关');
INSERT INTO `sys_dict_data` VALUES (111, 5, '智能配网', '5', 'rf_function', NULL, NULL, 'N', '0', 'admin', '2021-05-05 16:00:16', 'admin', '2021-06-01 15:44:51', '智能配网');
INSERT INTO `sys_dict_data` VALUES (112, 0, '固定颜色', '0', 'light_mode', NULL, NULL, 'N', '0', 'admin', '2021-05-05 16:07:22', '', NULL, '固定颜色');
INSERT INTO `sys_dict_data` VALUES (113, 0, '七彩渐变', '1', 'light_mode', NULL, NULL, 'N', '0', 'admin', '2021-05-05 16:07:41', '', NULL, '七彩渐变');
INSERT INTO `sys_dict_data` VALUES (114, 0, '动感模式', '2', 'light_mode', NULL, NULL, 'N', '0', 'admin', '2021-05-05 16:08:44', '', NULL, '动感模式');
INSERT INTO `sys_dict_data` VALUES (115, 0, '单色渐变', '3', 'light_mode', NULL, NULL, 'N', '0', 'admin', '2021-05-05 16:09:12', '', NULL, '单色渐变');
INSERT INTO `sys_dict_data` VALUES (116, 0, '白光', '4', 'light_mode', NULL, NULL, 'N', '0', 'admin', '2021-05-05 16:09:46', '', NULL, '白光');
INSERT INTO `sys_dict_data` VALUES (117, 0, '暖光', '5', 'light_mode', NULL, NULL, 'N', '0', 'admin', '2021-05-05 16:10:07', '', NULL, '暖光');
INSERT INTO `sys_dict_data` VALUES (118, 0, '无', '0', 'rf_function', NULL, NULL, 'N', '0', 'admin', '2021-06-01 15:43:44', 'admin', '2021-06-01 15:44:21', '不进行任何操作');


INSERT INTO `sys_dict_type` VALUES (100, '设备触发源', 'iot_trigger_source', '0', 'admin', '2021-05-05 15:51:26', '', NULL, '设备操作的触发源');
INSERT INTO `sys_dict_type` VALUES (101, '射频遥控按键功能', 'rf_function', '0', 'admin', '2021-05-05 15:58:05', '', NULL, '射频遥控按键功能列表');
INSERT INTO `sys_dict_type` VALUES (102, '彩灯模式', 'light_mode', '0', 'admin', '2021-05-05 16:04:53', '', NULL, '彩灯模式，单色、七彩、渐变、动感');


INSERT INTO `sys_role` VALUES (101, '小程序用户', 'mp', 3, '1', 1, 1, '0', '0', 'admin', '2021-08-26 17:26:52', '', NULL, NULL);

