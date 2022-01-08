# xiaoji-cloud
小济智能家居后台管理系统 -- 微服务架构

# 启动
先启动xiaoji-gateway和xiaoji-auth,然后再启动其它模块。后端统一接口是网关的端口，即http://localhost:8080, 部分服务如果无法通过网关，则可以选择直接绕过网关独立请求，如http://localhost:9140.


# 功能
## 万物互联
- 设备分组：根据空间将设备分组，比如不同房间中的智能灯等。
- 设备分类：根据智能设备的类型进行分类管理，比如智能灯、智能门锁、智能水阀等。
- 设备列表：智能设备的详细列表，包括版本、信号、状态等。
- 状态日志：智能设备的状态日志，比如设备温度、信号等。
- 配置日志：智能设备的配置日志，比如配网信息、连接方式等。
- EMQ管理: 通过MQTT协议连接智能设备的EMQ服务器管理信息。

## 公司系统管理

- 用户管理：用户是系统操作者，该功能主要完成系统用户配置。
- 角色管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
- 菜单管理：配置系统用户所属担任职务。
- 部门管理：配置系统菜单，操作权限，按钮权限标识等。
- 岗位管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
- 字典管理：对系统中经常使用的一些较为固定的数据进行维护。
- 参数设置：对系统动态配置常用参数。
- 通知公告：系统通知公告信息发布维护。

## 系统监控
- 在线用户：当前系统中活跃用户状态监控。
- 定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。
- 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
- 缓存监控：对Redis缓存服务器进行监控的数据信息。

## 系统工具
- 代码生成：前后端代码的生成（java、html、xml、sql)支持CRUD下载 。
- 系统接口：通过Swagger生成的业务代码接口文档，辅助内部人员开发与外部系统接入。

## 小济官网
跳转到官网页面

# 部署
- DevOps
- K8s
- Docker
- Jenkins
- KubeSphere
- Nacos
- Sentinel
- MySQL5.7
- Admin Monitor


