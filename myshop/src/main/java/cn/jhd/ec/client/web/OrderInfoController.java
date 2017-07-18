package cn.jhd.ec.client.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jhd.ec.client.service.OrderInfoService;
import cn.jhd.ec.entity.goods.GoodForCart;
import cn.jhd.ec.entity.goods.ShopingCart;
import cn.jhd.ec.entity.order.OrderInfo;
import cn.jhd.ec.entity.relation.OrderGoods;
import cn.jhd.ec.util.JsonResult;

@Controller
@RequestMapping("/order")
public class OrderInfoController {
	@Resource
	private OrderInfoService ois;
	
	@RequestMapping("/findByUser_id.do")
	@ResponseBody
	public JsonResult findByUser_id(Integer user_id){
		return ois.findByUser_id(user_id);
	}
	
	@RequestMapping("/findById.do")
	@ResponseBody
	public JsonResult findById(Integer order_id){
		return ois.findById(order_id);
	}
	
	@RequestMapping("/saveByUser")
	@ResponseBody
	public JsonResult saveByUser(OrderInfo orderInfo,HttpServletRequest req){
		HttpSession session = req.getSession();
		ShopingCart sc = (ShopingCart)session.getAttribute("shopingCart");
		List<GoodForCart> goods = sc.getGoods();
		List<OrderGoods> ogs = new ArrayList<OrderGoods>();
		for (GoodForCart gfc : goods) {
			OrderGoods og = new OrderGoods();
			og.setGoods_id(gfc.getGoods_id());
			og.setGoods_name(gfc.getGoods_name());
			og.setGoods_sn(gfc.getGoods_sn());
			og.setGoods_price(gfc.getShop_price());
			og.setMarket_price(gfc.getMarket_price());
//			og.setOrder_id(gfc.get);
			
			ogs.add(og);
		}
		orderInfo.setOgs(ogs);
		return ois.saveByUser(orderInfo);
	}
	
	@RequestMapping("/edit.do")
	@ResponseBody
	public JsonResult edit(OrderInfo orderInfo){
		return ois.edit(orderInfo);
	}
	
	@RequestMapping("/delById.do")
	@ResponseBody
	public JsonResult delById(Integer order_id){
		return ois.delById(order_id);
	}
	
}
