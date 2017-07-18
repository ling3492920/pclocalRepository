package cn.jhd.ec.admin.service;

import java.util.List;

import cn.jhd.ec.entity.admin.AdminUser;
import cn.jhd.ec.entity.admin.CustomAdminLog;
import cn.jhd.ec.util.JsonResult;

public interface AdminUserService {
	public AdminUser findByUser_name(String userName);
	
	public JsonResult<List<AdminUser>> findAll();
	
	public JsonResult delById(Integer id);
	
	public Integer save(AdminUser adminUser);
	
	public Integer edit(AdminUser adminUser);
	
	public AdminUser findById(Integer id);
	
	public List<CustomAdminLog> findAuto(CustomAdminLog cal);
	
	public JsonResult getCount(Integer id);
}
