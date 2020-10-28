# mydisk

#### 介绍
用jsp+servlet+jquery+bootstrap写的网盘，支持mysql数据库，实现了文件的上传、下载、重命名、回收站、新建文件夹、批量删除、批量恢复等功能。文件以原文件的形式存储在硬盘中，数据库中存储文件的相关信息。

#### 使用说明

1. c3p0-config.xml文件配置mysql数据库
2. myDiskConfig.properties中配置上传文件保存的位置
3. 在mysql数据库中导入myDiskSql.sql
4. 管理员账户：admin  密码：1
5. 使用管理员登陆后，添加普通用户
6. 管理员仅有系统管理权限，普通用户可进行文件的上传下载等。

