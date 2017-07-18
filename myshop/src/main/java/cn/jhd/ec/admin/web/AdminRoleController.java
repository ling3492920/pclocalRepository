package cn.jhd.ec.admin.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.jhd.ec.admin.service.AdminRoleService;
import cn.jhd.ec.entity.admin.AdminRole;
import cn.jhd.ec.entity.admin.CustomAdminRole;
import cn.jhd.ec.util.JsonResult;
@RequestMapping("/role")
@Controller
public class AdminRoleController {
	@Resource
	private AdminRoleService ars;
	@RequestMapping("/lst")
	public String load(Model model,String mgs){
		JsonResult jr = ars.load();
		if(jr.getState()==0){
			model.addAttribute("ars", jr.getData());
			model.addAttribute("mgs", mgs);//移除成功或失败的信息
			return "powerMng/roleMng";
		}
		model.addAttribute("errors", "请求角色管理列表失败！");
		return "error";
	}
	
	@RequestMapping("/toedit")
	public String toedit(Integer id,Model model){
		JsonResult jr = ars.findById(id);
		if(jr.getState()==0){
			model.addAttribute("car", jr.getData());
			model.addAttribute("pers", ((CustomAdminRole)jr.getData()).getMap());
			return "powerMng/editRole";
		}
		model.addAttribute("errors", "请求编辑角色失败！请稍后再试");
		return "error";
	}
	@RequestMapping("/edit")
	public String edit(CustomAdminRole car,Model model){
		//把pers数组设计到permissions里面去
		car.setPermissions("");
		JsonResult jr = ars.edit((AdminRole)car);
		if(jr.getState()==0){
			model.addAttribute("uri", "role/lst.do");
			model.addAttribute("success", "修改角色成功");
			return "success";
		}
		model.addAttribute("errors","修改失败！" );
		return "error";
	}
	@RequestMapping("/remove")
	public String remove(Integer id,Model model,RedirectAttributes attr){
		JsonResult jr = ars.delById(id);
		if(jr.getState()==0){
			attr.addAttribute("mgs", "success");
			return "redirect:/role/lst.do";
		}
		model.addAttribute("mgs", "error");
		return "redirect:/role/lst.do";
	}
	@RequestMapping("/save")
	public String save(CustomAdminRole car,Model model){
		if(car.getPermissions()==null|car.getPermissions()==""){
			car.setPermissions("");
			car.setAction_list("");
			JsonResult jr = ars.save((AdminRole)car);
			if(jr.getState()==0){
				model.addAttribute("uri", "role/lst.do");
				model.addAttribute("success", "保存成功");
				return "success";
			}
		}
//		model.addAttribute("car", car);//回退的话，这个对象就没用了
		model.addAttribute("errors","保存失败！" );
		return "error";
	}
}
