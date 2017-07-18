package cn.jhd.ec.client.service;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jhd.ec.dao.users.UserDao;
import cn.jhd.ec.entity.users.User;
import cn.jhd.ec.util.JsonResult;
import cn.jhd.ec.util.Utils;
@Service
public class UserServiceImpl implements Serializable, UserService {
	@Autowired
	private UserDao userDao;
	
	public JsonResult<User> login(String userName, String password) {
		
		User user = userDao.findByUserName(userName);
		if(user!=null){
			//1.用户名存在
			//2.进一步验证密码
			String pwd = Utils.md5salt(password.trim());
			if(user.getPassword().equals(pwd)){
				//密码正确
				//每次登陆都把登陆时间覆盖之前登陆时间
				Long last_login = System.currentTimeMillis();
				user.setLast_login(last_login);
				int num = userDao.edit(user);
				
				return new JsonResult<User>(0,"登陆成功",user);
			}
			return new JsonResult<User>("密码错误！请从新输入");
		}
		
		return new JsonResult<User>("用户名不存在！");
	}
	
	
	/**
	 * 业务上：应该先做注册
	 */
	public JsonResult<User> register(User user) {
		//注册之前，有些验证需要通过服务器完成

		//3.出于安全考虑，密码需要md5加密
		user.setPassword(Utils.md5salt(user.getPasswd_answer()));
		int num = userDao.save(user);
		if(num==1){
			return new JsonResult<User>(0,"注册成功",user);
		}
		return new JsonResult<User>("对不起，服务器异常，稍后再试！");
	}

	public JsonResult<User> editUser(User user) {
		int num = userDao.edit(user);
		if(num==1){
			return new JsonResult<User>(0,"修改成功！",user);
		}
		return new JsonResult<User>("更新失败！请稍后重试！");
	}


	public JsonResult<User> checkUserName(String userName) {
		User user = userDao.findByUserName(userName);
		if(user!=null){
			//用户名已经存在
			return new JsonResult<User>("用户名已经存在!");
		}
		return new JsonResult<User>(0);//可以注册
	}


	public JsonResult<User> checkEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}


	public JsonResult<User> updatePwd(Integer user_id,String oldpwd, String newpwd) {
		User user = userDao.findByUserId(user_id);
		if(user!=null){
			if(oldpwd.equals(user.getPassword())){
				user.setPassword(newpwd);
				int num=userDao.edit(user);
				if(num==1){
					return new JsonResult<User>(0);//修改成功
				}
				return new JsonResult<User>(1);//修改数据库时失败
			}
			return new JsonResult<User>(2,"旧密码输入有误！",null);
		}
		return new JsonResult<User>(3,"当前用户一下线！",null);
	}


}
