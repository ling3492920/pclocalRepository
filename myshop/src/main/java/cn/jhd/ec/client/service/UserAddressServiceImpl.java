package cn.jhd.ec.client.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jhd.ec.dao.users.UserAddressDao;
import cn.jhd.ec.dao.users.UserDao;
import cn.jhd.ec.entity.users.User;
import cn.jhd.ec.entity.users.UserAddress;
import cn.jhd.ec.util.JsonResult;
@Service
public class UserAddressServiceImpl implements Serializable, UserAddressService {
	@Autowired
	private UserAddressDao userAddressDao;
	
	@Resource
	private UserDao userDao;
	//1.查询对应用户下，所有收货人
	public JsonResult findAll(Integer user_id) {
		User user = userDao.findByUserId(user_id);
		if(user!=null){
			return new JsonResult<List<UserAddress>>(0,"查询成功！",user.getUserAddres());
		}
		return new JsonResult(1);
	}
	//2.添加一条用户信息
	public JsonResult<UserAddress> save(UserAddress userAddress) {//user_id会在提交添加前，通过seession获得
		int num = userAddressDao.save(userAddress);
		if(num==1){//添加成功
			return new JsonResult<UserAddress>(0,"添加成功！",userAddress);
		}
		return new JsonResult<UserAddress>(new Throwable("添加异常！稍后重试"));
	}
	//3.修改一条用户信息
	public JsonResult<UserAddress> edit(UserAddress userAddress) {
		int num = userAddressDao.edit(userAddress);
		if(num==1){
			return new JsonResult<UserAddress>(userAddress);
		}
		return new JsonResult<UserAddress>(1);
	}
	//4.通过id删除对应收货信息
	public JsonResult delById(Integer address_id) {
		int num = userAddressDao.delById(address_id);
		if(num==1){
			return new JsonResult(0);
		}
		return new JsonResult(1);
	}
	/**
	 * 默认使用第一个遍历到的收货人信息作为收货地址
	 */
	public JsonResult findByDefault(Integer user_id) {
		User user = userDao.findByUserId(user_id);
		if(user!=null){
			List<UserAddress> uas = user.getUserAddres();
			for (UserAddress ua : uas) {
				return new JsonResult(0,"查询成功！",ua);
			}
			
		}
		return new JsonResult(1);
	}

}
