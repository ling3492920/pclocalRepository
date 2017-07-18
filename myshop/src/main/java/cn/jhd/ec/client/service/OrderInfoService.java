package cn.jhd.ec.client.service;

import java.util.List;

import cn.jhd.ec.entity.order.OrderInfo;
import cn.jhd.ec.util.JsonResult;

/**
 * 订单的业务结构
 * @author Administrator
 *
 */
public interface OrderInfoService {
	//1.通过用户关联查询所有订单列表
	public JsonResult<List<OrderInfo>> findByUser_id(Integer user_id);
	
	//1.2查询单个订单
	public JsonResult<OrderInfo> findById(Integer order_id);
	
	//2.临时订单与用户无关，存在于session中
	//3.注册用户生成一条订单信息必须包含user_id字段,也可用于生成临时订单
	public JsonResult<OrderInfo> saveByUser(OrderInfo orderInfo);
	
	//4.修改一个订单
	public JsonResult<OrderInfo> edit(OrderInfo orderInfo);
	
	//5.删除一个订单
	public JsonResult<OrderInfo> delById(Integer order_id);
	
	//6.查询已成交订单，关联统计对应商品成交量并排行
	public JsonResult findByStatus(Integer order_status);
	
	
}
