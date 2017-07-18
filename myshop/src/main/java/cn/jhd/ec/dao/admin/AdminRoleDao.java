package cn.jhd.ec.dao.admin;

import java.util.List;

import cn.jhd.ec.entity.admin.AdminRole;
import cn.jhd.ec.entity.admin.CustomAdminRole;

public interface AdminRoleDao {
	//查看角色列表
	public List<AdminRole> findAll();
	//编辑某角色
	public Integer edit(AdminRole adminRole);
	//添加角色
	public Integer save(AdminRole adminRole);
	//根据id查询某角色
	public CustomAdminRole findById(Integer id);
	//根据id删除某角色
	public Integer delById(Integer id);
	
}
