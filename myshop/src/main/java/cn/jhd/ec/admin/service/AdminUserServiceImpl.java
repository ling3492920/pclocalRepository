package cn.jhd.ec.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.jhd.ec.dao.admin.AdminLogDao;
import cn.jhd.ec.dao.admin.AdminUserDao;
import cn.jhd.ec.entity.admin.AdminUser;
import cn.jhd.ec.entity.admin.CustomAdminLog;
import cn.jhd.ec.util.JsonResult;
@Service
public class AdminUserServiceImpl implements AdminUserService {
	@Resource
	private AdminUserDao adminUserDao;	
	
	@Resource 
	private AdminLogDao adminLogDao;
	public AdminUser findByUser_name(String userName) {
		AdminUser au = adminUserDao.findByUserName(userName);
		if(au!=null){
			return adminUserDao.findById(au.getUser_id());
		}
		return au;
	}
	public JsonResult<List<AdminUser>> findAll() {
		List<AdminUser> aus = adminUserDao.findAll();
		if(aus!=null){
			return new JsonResult<List<AdminUser>>(0,"查询成功",aus);
		}
		return new JsonResult(1);
	}
	public JsonResult delById(Integer id) {
		int num = adminUserDao.delById(id);
		if(num==1){
			return new JsonResult(0,"删除成功",null);
		}
		return new JsonResult(1);
	}
	/**
	 * #{last_login},#{last_ip},
		 #{action_list},#{nav_list},0,#{role_id}
	 */
	public Integer save(AdminUser adminUser) {
		adminUser.setAdd_time(Integer.valueOf((System.currentTimeMillis()+"").substring(0, 10)));
		if(adminUser.getLast_login()==null){
			adminUser.setLast_login(0);
		}
		if(adminUser.getLast_ip()==null){
			adminUser.setLast_ip("");
		}
		if(adminUser.getAction_list()==null){
			adminUser.setAction_list("");
		}
		if(adminUser.getNav_list()==null){
			adminUser.setNav_list("");
		}
		if(adminUser.getRole_id()==null){
			adminUser.setRole_id(0);
		}
		return adminUserDao.save(adminUser);
	}
	public Integer edit(AdminUser adminUser) {
		
		return adminUserDao.edit(adminUser);
	}
	public AdminUser findById(Integer id) {
		
		return adminUserDao.findById(id);
	}
	//动态条件查询
	public List<CustomAdminLog> findAuto(CustomAdminLog cal) {
		
		return adminLogDao.findAuto(cal);
	}
	public JsonResult getCount(Integer id) {
		CustomAdminLog cal = new CustomAdminLog();
		cal.setUser_id(id);
		int num = adminLogDao.count(cal);
		if(num!=0){
			return new JsonResult(0,"查询总记录数成功！",num);
		}
		return new JsonResult(1);
	}

}
