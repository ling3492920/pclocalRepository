package cn.jhd.ec.client.service;

import cn.jhd.ec.entity.users.UserAddress;
import cn.jhd.ec.util.JsonResult;

/**
 * 关于收货人信息的业务
 * 
 */
public interface UserAddressService {
		//1.关联查询用户下的所有收货人信息
	public JsonResult findAll(Integer user_id);
	
		//2.添加用户下的单个收货人信息
	public 	JsonResult<UserAddress> save(UserAddress userAddress);
		//3.修改用户下的单个收货人信息
	public JsonResult<UserAddress> edit(UserAddress userAddress);	
		//4.删除用户下的单个收货人信息
	public JsonResult delById(Integer address_id);
	//5.查询默认的收货人信息
	public JsonResult findByDefault(Integer user_id);
}
