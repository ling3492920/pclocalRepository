package cn.jhd.ec.admin.web;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.jhd.ec.admin.service.AdminUserService;
import cn.jhd.ec.entity.admin.ActiveUser;
import cn.jhd.ec.entity.admin.AdminUser;
import cn.jhd.ec.entity.admin.CustomAdminLog;
import cn.jhd.ec.util.JsonResult;
import cn.jhd.ec.util.Utils;

@Controller
@RequestMapping("/auser")
public class AdminUserController {
	@Resource
	private AdminUserService adminUserService;
	
	@RequestMapping("/index.do")
	public String toIndex(Model model){
		Subject subject = SecurityUtils.getSubject();
		ActiveUser activeUser =(ActiveUser) subject.getPrincipal();
		model.addAttribute("activeUser", activeUser);
		return "index";
	}
	
	@RequestMapping("/load.do")
	@RequiresPermissions("per_addAdmin_edit")
	@ResponseBody
	public JsonResult<List<AdminUser>> load(){
		return adminUserService.findAll();
	}
	
	@RequestMapping("/del.do")
	@RequiresPermissions("per_delAdmin")
	@ResponseBody
	public JsonResult del(Integer id){
		return adminUserService.delById(id);
	}
	
	@RequestMapping("/add.do")
	@RequiresPermissions("per_addAdmin_edit")
	public String save(AdminUser adminUser,Model model){
		int num = adminUserService.save(adminUser);
		if(num==1){
			return "powerMng/admin_lst";
		}
		model.addAttribute("adminUser", adminUser);
		model.addAttribute("errors", "添加管理员失败！");
		return "powerMng/addAdmin";
	}
	@RequestMapping("/toedit.do")
	@RequiresPermissions("per_addAdmin_edit")
	public String edit(Integer id,Model model){
		AdminUser au = adminUserService.findById(id);
		if(au!=null){
			model.addAttribute("adminUser", au);
			return "powerMng/editAdmin";
		}
		model.addAttribute("errors", "服务器异常，稍后访问");
		return "error";
	}
	
	//这个方法主要处理修改一般信息的业务
	@RequestMapping("/edit.do")
	@RequiresPermissions("per_addAdmin_edit")
	public String edit(AdminUser adminUser,Model model){
		//System.out.println(adminUser.getUser_id()+"_"+adminUser.getEmail());
		if(adminUser.getPassword().trim()==""){
			adminUser.setPassword(null);
		}
		int num=adminUserService.edit(adminUser);
		if(num==1){
			return "powerMng/admin_lst";
		}
		model.addAttribute("adminUser", adminUser);
		model.addAttribute("errors", "修改管理员失败！");
		return "powerMng/editAdmin";
	}
	//验证就密码
	@RequestMapping("/validataPwd")
	@ResponseBody
	public JsonResult valiPwd(Integer id,String pwd){
		AdminUser au = adminUserService.findById(id);
		if(au!=null){
			if(au.getPassword().equals(DigestUtils.md5Hex(pwd).trim())){
				return new JsonResult(0);
			}
			return new JsonResult(1,"验证旧密码失败！",null);
		}
		return new JsonResult(2,"服务器异常",null);
	}
	@RequestMapping("/topower")
	@RequiresPermissions("per_addAdmin_edit")
	public String topower(Integer id,String success,Model model){
		if(success!=""|success!=null){
			model.addAttribute("success", success);
		}
		AdminUser au = adminUserService.findById(id);
		String perssion = au.getPerssions();
		if(au!=null){
			if(perssion!=null){
				String[] pers = perssion.split(",");
				Map<String,String> m = new HashMap<String,String>();
				for (String per : pers) {
					m.put(per, per);
				}
				model.addAttribute("pers", m);
			}
			
			model.addAttribute("adminUser", au);
			return "powerMng/topower";
		}
		model.addAttribute("errors", "请求失败！");
		return "error";
	}
	
	@RequestMapping("/savePower")
	@RequiresPermissions("per_give")
	public String savePower(String[] action_code,Integer user_id,Model model,RedirectAttributes attr){
		System.out.println(action_code.length+":"+user_id);
		//1.把权限数组用,号分隔转成字符串。保存在对应用户的permissions字段里
		AdminUser au = new AdminUser();
		au.setUser_id(user_id);
		String pers=action_code[0];
		for (int i=1;i<action_code.length;i++) {
			pers+=","+action_code[i];
		}
		//System.out.println(pers);
		au.setPerssions(pers);
		Integer num=adminUserService.edit(au);
		//这边id可能没有重定向过去那边的topower.do
		if(num==1){
			attr.addAttribute("id", user_id);
			attr.addAttribute("success", "保存成功！");
			return "redirect:/auser/topower.do";
		}
		model.addAttribute("errors", "保存权限失败,请稍后重试！");
		return "error";
	}
	
	@RequestMapping("/tolog")
	@RequiresPermissions("per_adminlog")
	public String tolog(Integer id,Model model){
		CustomAdminLog cal = new CustomAdminLog();
		cal.setUser_id(id);
		cal.setStartLine(0);
		cal.setPageSize(15);
		List<CustomAdminLog> cals = adminUserService.findAuto(cal);
		int num=0;
		if(cals!=null&cals.size()>0){//如果有日志
			num=(Integer)adminUserService.getCount(id).getData();
			model.addAttribute("user_id", id);
			model.addAttribute("cals", cals);
			model.addAttribute("count", num);
			return "powerMng/admin_log";
		}
		model.addAttribute("errors", "对不起该管理尚未生成任何日志！");
		return "error";
	}
	
	
	//基于用户的动态查询日志
	@RequestMapping("/auto")
	@ResponseBody
	public JsonResult findAuto(@RequestBody CustomAdminLog cal){
		List<CustomAdminLog> cals = adminUserService.findAuto(cal);
		
		if(cals!=null){
			return new JsonResult(0,"查询该管理员日志成功",cals);
		}
		return new JsonResult(1);
	}
	
}
