package cn.jhd.ec.client.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jhd.ec.client.service.UserAddressService;
import cn.jhd.ec.entity.users.UserAddress;
import cn.jhd.ec.util.JsonResult;

@Controller
@RequestMapping("/userAddress")
public class UserAddressController {
	@Resource
	private UserAddressService userAddressService;
	
	@RequestMapping("/findAll.do")
	@ResponseBody
	public JsonResult findAll(Integer user_id){
		JsonResult jr = userAddressService.findAll(user_id);
		return jr;
	}
	
	@RequestMapping("/save.do")
	@ResponseBody
	public JsonResult save(UserAddress userAddress,HttpServletRequest req){
		JsonResult jr = userAddressService.save(userAddress);
		return jr;
	}
	
	@RequestMapping("/edit.do")
	@ResponseBody
	public JsonResult edit(UserAddress userAddress,HttpServletRequest req){
		JsonResult jr = userAddressService.edit(userAddress);
		return jr;
	}
	//请求一个默认的收货人信息
	//业务要求，如果用户有多个收货人信息表。默认选择第一次添加的收货人信息作为默认收货人信息加载到订单页面
	@RequestMapping("/reqDefault.do")
	@ResponseBody
	public JsonResult reqDefault(Integer user_id){
		JsonResult jr =userAddressService.findByDefault(user_id);
		
		return jr;
	}
}
