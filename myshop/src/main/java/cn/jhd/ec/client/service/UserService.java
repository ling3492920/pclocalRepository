package cn.jhd.ec.client.service;

import cn.jhd.ec.entity.users.User;
import cn.jhd.ec.util.JsonResult;

/**
 * 用户的业务
 * @author Administrator
 *
 */

public interface UserService {
	
	//1.登陆
	//1.1登陆的用户名，密码验证
	//1.2登陆成功，返回用户的信息到页面（//用户的id等基本信息存储到session中）
	//1.3返回结果封装为一个json对象
	public JsonResult<User> login(String userName,String password);
	
	//验证用户名是否已经存在
	public JsonResult<User> checkUserName(String userName);
	
	//验证邮箱是否已经存在
	public JsonResult<User> checkEmail(String email);
	//2.注册
	public JsonResult<User> register(User user);
	
	//3.修改用户信息
	public JsonResult<User> editUser(User user);
	
	
	//4.修改用户密码
	public JsonResult<User> updatePwd(Integer user_id,String oldpwd,String newpwd);
}
