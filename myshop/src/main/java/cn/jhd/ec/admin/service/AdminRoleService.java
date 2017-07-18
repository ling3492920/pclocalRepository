package cn.jhd.ec.admin.service;

import cn.jhd.ec.entity.admin.AdminRole;
import cn.jhd.ec.util.JsonResult;

public interface AdminRoleService {
	public JsonResult load();
	
	public JsonResult save(AdminRole adminRole);
	
	public JsonResult edit(AdminRole adminRole);
	
	public JsonResult findById(Integer id);
	
	public JsonResult delById(Integer id);
}
