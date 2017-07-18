package cn.jhd.ec.dao.admin;

import java.util.List;
import cn.jhd.ec.entity.admin.AdminUser;

public interface AdminUserDao {
	public AdminUser findById(Integer id);
	
	public int save(AdminUser adminUser);
	
	public int edit(AdminUser adminUser);
	
	public int delById(Integer id);
	
	public List<AdminUser> findAll();
	
	public AdminUser findByUserName(String userName);
	
	
}
