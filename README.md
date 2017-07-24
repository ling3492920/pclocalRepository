# pclocalRepository
pc端提交的java项目
1.项目下载后，部署到tomcat7.0版本服务器上。
2.启动服务器，输入地址http://localhost:8088/myshop/auser/index.do 系统检测到未登陆自动跳转到login.do请求页面
3.输入管理员账号密码 admin/admin123 回车/点击登陆 登陆成功进入上一次访问的地址http://localhost:8088/myshop/auser/index.do 这是首页
4.这里账号密码错误会报500 如果没有启动数据库也会导致提示账号不存在。-->在下一版本中，将会对这一问题进行处理
5.正常登陆成功后，进入首页，可以查看部分实现了的模块。
6.项目已经在最近一次提交分支gh-pages内对非正常登陆下进行了正确的页面显示。
