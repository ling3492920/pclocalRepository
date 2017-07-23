package cn.jhd.ec.admin.web;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jhd.ec.admin.exception.CustomException;
import cn.jhd.ec.admin.service.AOrderService;
import cn.jhd.ec.client.service.OrderInfoService;
import cn.jhd.ec.entity.order.CustomOrderInfo;
import cn.jhd.ec.util.JsonResult;

@Controller
@RequestMapping("/aorder")
public class AOrderController {
	
	@Resource
	private AOrderService aos;
	
	@RequestMapping("/lst")
	@ResponseBody
	public JsonResult load(@RequestBody CustomOrderInfo coi){
		
		return aos.findAuto(coi);
		
	}
}
