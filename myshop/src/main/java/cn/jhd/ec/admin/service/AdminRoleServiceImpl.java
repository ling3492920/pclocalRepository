package cn.jhd.ec.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.jhd.ec.dao.admin.AdminRoleDao;
import cn.jhd.ec.entity.admin.AdminRole;
import cn.jhd.ec.entity.admin.CustomAdminRole;
import cn.jhd.ec.util.JsonResult;
@Service
public class AdminRoleServiceImpl implements AdminRoleService {
	@Resource
	private AdminRoleDao adminRoleDao;
	public JsonResult load() {
		List<AdminRole> ars = adminRoleDao.findAll();
		if(ars!=null){
			return new JsonResult(0,"查询所有角色成功",ars);
		}
		return new JsonResult(1);
	}

	public JsonResult save(AdminRole adminRole) {
		int num=adminRoleDao.save(adminRole);
		if(num==1){
			return new JsonResult(0,"保存角色成功！",null);
		}
		return new JsonResult(1);
	}

	public JsonResult edit(AdminRole adminRole) {
		if(adminRole.getRole_id()==null){
			return new JsonResult(1);
		}
		int num=adminRoleDao.edit(adminRole);
		if(num==1){
			return new JsonResult(0,"修改角色成功！",null);
		}
		return new JsonResult(2,"服务器异常",null);
	}

	public JsonResult findById(Integer id) {
		CustomAdminRole car = adminRoleDao.findById(id);//这里返回的是子类对象，让父类引用指向之后
		if(car!=null){
			return new JsonResult(0,"查询成功",car);
		}
		return new JsonResult(1);
	}

	public JsonResult delById(Integer id) {
		if(id!=null){
			int num=adminRoleDao.delById(id);
			if(num==1){
				return new JsonResult(0);
			}
			return new JsonResult(1);//服务器执行异常
		}
		return new JsonResult(2);//提交数据检测异常
	}

}
