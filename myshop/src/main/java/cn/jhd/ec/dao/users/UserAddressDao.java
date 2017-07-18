package cn.jhd.ec.dao.users;

import cn.jhd.ec.entity.users.UserAddress;

public interface UserAddressDao {
	public int edit(UserAddress ua);
	public int save(UserAddress ua);
	public int delById(Integer id);
	
//	public UserAddress findByDefault(Integer id);
}
