package cn.jhd.ec.admin.service;

import cn.jhd.ec.entity.order.CustomOrderInfo;
import cn.jhd.ec.entity.order.OrderInfo;
import cn.jhd.ec.util.JsonResult;

/**
 * 服务端订单管理
 * @author Administrator
 *
 */
public interface AOrderService {
	//1.修改订单
	public JsonResult edit(OrderInfo orderInfo);
	//2.动态查询订单
	public JsonResult findAuto(CustomOrderInfo coi);
}
