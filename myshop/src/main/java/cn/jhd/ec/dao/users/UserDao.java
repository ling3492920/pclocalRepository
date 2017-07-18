package cn.jhd.ec.dao.users;

import java.util.List;

import cn.jhd.ec.entity.users.User;

public interface UserDao {
	
	public List<User> findAll();
	
	public int save(User user);
	
	public int edit(User user);
	
	public User findByUserName(String userName);
	//根据user_id关联查询UserAddress 和orderinfo
	public User findByUserId(Integer userId);
	
}
