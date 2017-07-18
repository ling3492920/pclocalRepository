package cn.jhd.ec.admin.web;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jhd.ec.admin.service.AdminLogService;
import cn.jhd.ec.entity.admin.CustomAdminLog;
import cn.jhd.ec.util.JsonResult;

@Controller
@RequestMapping("/log")
public class AdminLogController {
	@Resource
	private AdminLogService als;
	
	@RequestMapping("/auto")
	@ResponseBody
	public JsonResult findAuto(@RequestBody CustomAdminLog cal){
		 
		return als.findAuto(cal);
	}
	
	@RequestMapping("/findIp")
	@ResponseBody
	public JsonResult findIp(){
		return als.findGroupByIp();
	}
	
	@RequestMapping("/delByDate.do")
	@ResponseBody
	public JsonResult delByDate(Integer yesdate,Integer id){
		return null;
	}
	
	@RequestMapping("/delById.do")
	public String delById(int[] subBox, HttpServletRequest req,Model model){
//		String[] subBox=req.getParameterValues("subBox");
		System.out.println(subBox.length);
		JsonResult jr=als.delById(subBox);
		if(jr.getState()==0){
			return "auser/toLog.do";
		}
		model.addAttribute("errors", "批量删除失败！");
		return "error";
	}
}
