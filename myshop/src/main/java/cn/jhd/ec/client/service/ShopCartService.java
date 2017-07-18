package cn.jhd.ec.client.service;

import cn.jhd.ec.util.JsonResult;

public interface ShopCartService {
	
	/**
	 * 处理临时添加进购物车的业务
	 */
	public JsonResult save(Integer goods_id,Integer num,Double goods_amount);
	
	/**
	 * 处理查看购物车的业务
	 * 由于一个用户一个session的情况，查询不需要任何条件
	 */
	public JsonResult find();
	
	/**
	 * 删除一个购物车商品列表的业务
	 */
	public JsonResult delByGoodsId(Integer goods_id);
}
