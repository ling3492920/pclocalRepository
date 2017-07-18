package cn.jhd.ec.dao.admin;

import java.util.List;
import java.util.Map;

import cn.jhd.ec.entity.admin.AdminLog;
import cn.jhd.ec.entity.admin.CustomAdminLog;

public interface AdminLogDao {
	//动态查询
	public List<CustomAdminLog> findAuto(CustomAdminLog customAdminLog);
	
	public int count(CustomAdminLog customAdminLog);
	
	//添加日志
	public int save(AdminLog adminLog);
	
	public List<String> findIP();
	
	public int delAuto(Map map);
}
