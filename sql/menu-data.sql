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
INSERT INTO `sys_menu`
VALUES ('122', 'EMQ管理', '5', '6', 'http://121.36.229.15:18083/#/', null, '', 0, 0, 'C', '0', '0', '', 'mqtt', 'admin',  sysdate(), 'admin', null, '');
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
#
#
#
#
#
#
