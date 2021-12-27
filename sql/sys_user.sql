drop table if exists sys_user;
create table sys_user (
                          user_id           bigint(20)      not null auto_increment    comment '用户ID',
                          dept_id           bigint(20)      default null               comment '部门ID',
                          user_name         varchar(30)     not null                   comment '用户账号',
                          nick_name         varchar(30)     not null                   comment '用户昵称',
                          user_type         varchar(2)      default '00'               comment '用户类型（00系统用户）',
                          email             varchar(50)     default ''                 comment '用户邮箱',
                          phonenumber       varchar(11)     default ''                 comment '手机号码',
                          sex               char(1)         default '0'                comment '用户性别（0男 1女 2未知）',
                          avatar            varchar(100)    default ''                 comment '头像地址',
                          password          varchar(100)    default ''                 comment '密码',
                          status            char(1)         default '0'                comment '帐号状态（0正常 1停用）',
                          del_flag          char(1)         default '0'                comment '删除标志（0代表存在 2代表删除）',
                          login_ip          varchar(128)    default ''                 comment '最后登录IP',
                          login_date        datetime                                   comment '最后登录时间',
                          create_by         varchar(64)     default ''                 comment '创建者',
                          create_time       datetime                                   comment '创建时间',
                          update_by         varchar(64)     default ''                 comment '更新者',
                          update_time       datetime                                   comment '更新时间',
                          remark            varchar(500)    default null               comment '备注',
                          primary key (user_id)
) engine=innodb auto_increment=100 comment = '用户信息表';

-- ----------------------------
-- 初始化-用户信息表数据
-- ----------------------------
insert into sys_user values(1,  103, 'admin', '小济智能', '00', 'xiaoji@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', sysdate(), 'admin', sysdate(), '', null, '管理员');
insert into sys_user values(2,  105, 'xiaoji',    '小济', '00', 'tongji@qq.com',  '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', sysdate(), 'admin', sysdate(), '', null, '测试员');


INSERT INTO `sys_user` VALUES (100, NULL, 'public', '访客', '00', '', '', '0', '', '$2a$10$E8d4gZ3.QQzDE7LBfY7XpuuGX.LvWFcA982AAdAzk24u91bQ1nete', '0', '0', '', NULL, 'admin', sysdate(), 'admin', sysdate(), NULL);
INSERT INTO `sys_user` VALUES (101, NULL, 'aaa', 'xxx', '00', '', '', '0', '', '$2a$10$f.KtWGpaUsdvl2E427/H4OnPi2dYx8HetxnBs1uasSNwCBBUDSwjO', '0', '0', '', NULL, 'admin', sysdate() , '', NULL, NULL);
INSERT INTO `sys_user` VALUES (114, NULL, 'EB5312FB4A26', '微信注册用户', '00', '', '', '0', '', '$2a$10$iWySi4cYQ.0DFSMFCzofbu1H13Dd03WW7h/0OZPzQcBd.7f1fWjV.', '0', '0', '', NULL, '微信小程序', sysdate(), '', NULL, NULL);
INSERT INTO `sys_user` VALUES (115, NULL,  'A1BB9722086A', '微信注册用户', '00', '', '', '0', '', '$2a$10$rAoFt5nuPw/2CXhRsa/uoOjExW0XH3xM009kcWWo12rzFiSgIK.n2', '0', '0', '', NULL, '微信小程序', sysdate(), '', NULL, NULL);
INSERT INTO `sys_user` VALUES (116, NULL,  '6F1B3F33DD38', '微信注册用户', '00', '', '', '0', '', '$2a$10$SUR7vd7YIiMkFBFSTKba7uTc5FdpAdwyMuzUsUpMjkgTC0NfiRpqK', '0', '0', '', NULL, '微信小程序', sysdate(), '', NULL, NULL);