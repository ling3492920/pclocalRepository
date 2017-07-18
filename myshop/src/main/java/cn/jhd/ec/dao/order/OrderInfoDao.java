package cn.jhd.ec.dao.order;

import java.util.List;

import cn.jhd.ec.entity.order.CustomOrderInfo;
import cn.jhd.ec.entity.order.OrderInfo;

public interface OrderInfoDao {
	public int edit(OrderInfo orderInfo);
	public int save(OrderInfo orderInfo);
	public int delById(Integer id);
	
	public OrderInfo findById(Integer id);
	
	public List<OrderInfo> findByStatus(Integer order_status);
	
	public List<OrderInfo> findByAuto(CustomOrderInfo customOrderInfo);
	
	public int findCountByAuto(CustomOrderInfo customOrderInfo);
}
