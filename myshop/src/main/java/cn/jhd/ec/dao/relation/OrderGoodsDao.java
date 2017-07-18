package cn.jhd.ec.dao.relation;

import java.util.List;

import cn.jhd.ec.entity.relation.OrderGoods;

public interface OrderGoodsDao {
	public List<OrderGoods> findByOrder_id(Integer order_id);
	
	//中间表的订单与商品是多对多的关系，这个方法返回的可能是多条数据，因此不能参考这里得到的商品信息
	public OrderGoods findByGoods_sn(String goods_sn);
}
