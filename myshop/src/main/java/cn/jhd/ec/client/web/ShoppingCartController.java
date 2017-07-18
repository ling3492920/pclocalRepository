package cn.jhd.ec.client.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jhd.ec.client.service.ShopCartService;
import cn.jhd.ec.entity.goods.GoodForCart;
import cn.jhd.ec.entity.goods.ShopingCart;
import cn.jhd.ec.util.JsonResult;

/**
 * 购物车
 * @author Administrator
 *
 */
@RequestMapping("/shoppingCart")
@Controller
public class ShoppingCartController {
	/**
	 * 购物车一次只能添加一个商品，数量只是该商品的一个字段
	 * 添加同以商品时，只能加数量。不增加列数
	 * @param good
	 * @return
	 */
	@Resource
	private ShopCartService scs;
	
	@RequestMapping("/save.do")
	@ResponseBody
	public JsonResult save(Integer goods_id,Integer num,Double goods_amount,HttpServletRequest req){
		JsonResult jr = scs.save(goods_id,num,goods_amount);
		if(jr.getState()==0){
			HttpSession session = req.getSession();
			session.setAttribute("shopingCart", jr.getData());
		}
		return new JsonResult(0);
	}
	/**
	 * 查看购物车
	 * @param req
	 * @return
	 */
	@RequestMapping("/find.do")
	@ResponseBody
	public JsonResult find(HttpServletRequest req){
		HttpSession session = req.getSession();
		ShopingCart sc =(ShopingCart) session.getAttribute("shopingCart");
		List<GoodForCart> goods = sc.getGoods();
		if(goods.size()>0){
			return new JsonResult(goods);			
		}
		return new JsonResult(1);
	}
	
	/**
	 * 删除一个购物车列表
	 */
	@RequestMapping("/del.do")
	@ResponseBody
	public JsonResult delById(Integer goods_id ,HttpServletRequest req){
		HttpSession session = req.getSession();
		ShopingCart sc =(ShopingCart) session.getAttribute("shopingCart");
		List<GoodForCart> goods = sc.getGoods();
		for (GoodForCart gfc : goods) {
			if(gfc.getGoods_id()==goods_id){
				goods.remove(gfc);
				return new JsonResult(0);
			}
		}
		return new JsonResult(1);
	}
}
