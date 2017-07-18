package cn.jhd.ec.client.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.jhd.ec.dao.goods.GoodDao;
import cn.jhd.ec.dao.order.OrderInfoDao;
import cn.jhd.ec.dao.users.UserDao;
import cn.jhd.ec.entity.goods.CustomGood;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.entity.order.OrderInfo;
import cn.jhd.ec.entity.relation.OrderGoods;
import cn.jhd.ec.entity.users.User;
import cn.jhd.ec.util.JsonResult;
import cn.jhd.ec.util.Utils;
@Service
public class OrderInfoServiceImpl implements OrderInfoService, Serializable {
	@Resource
	private OrderInfoDao orderInfoDao;
	@Resource
	private UserDao userDao;
	
	@Resource
	private GoodDao gd;
	
	public JsonResult<List<OrderInfo>> findByUser_id(Integer user_id) {
		User user = userDao.findByUserId(user_id);
		List<OrderInfo> orders = user.getOrders();
		if(orders!=null){
			return new JsonResult<List<OrderInfo>>(orders);
		}
		return new JsonResult(1);
	}

	public JsonResult<OrderInfo> findById(Integer order_id) {
		OrderInfo orderInfo = orderInfoDao.findById(order_id);
		if(orderInfo!=null){
			return new JsonResult<OrderInfo>(orderInfo);
		}
		return new JsonResult(1);
	}

	public JsonResult<OrderInfo> saveByUser(OrderInfo orderInfo) {
		if(orderInfo.getUser_id()!=null){
			String order_sn=Utils.creat_sn();
			orderInfo.setOrder_sn(order_sn);
			int num = orderInfoDao.save(orderInfo);
			if(num==1){
				return new JsonResult<OrderInfo>(order_sn); 
			}
			return new JsonResult<OrderInfo>(1,"提交订单失败！稍后再试",orderInfo); 
		}
		//不包含user_id被认为是临时订单，在controller加入到session中
		//临时订单也要存入数据库，要求用户记住订单编号等信息。方便未来查询订单后续状态信息
		int num1 = orderInfoDao.save(orderInfo);
		if(num1==1){
			return new JsonResult<OrderInfo>(2,"成功添加一条临时订单！",orderInfo); 
		}
		return new JsonResult<OrderInfo>(0);
	}

	public JsonResult<OrderInfo> edit(OrderInfo orderInfo) {
		int num=orderInfoDao.edit(orderInfo);
		if(num==1){
			return new JsonResult<OrderInfo>(0);
		}
		return new JsonResult<OrderInfo>(1);
	}

	public JsonResult<OrderInfo> delById(Integer order_id) {
		int num = orderInfoDao.delById(order_id);
		if(num==1){
			return new JsonResult<OrderInfo>(0);
		}
		return new JsonResult<OrderInfo>(1);
	}

	public JsonResult findByStatus(Integer order_status) {
		List<OrderInfo> orders = orderInfoDao.findByStatus(order_status);
		if(order_status==4){//只对成交订单进行查询并排序
			orders = orderInfoDao.findByStatus(4);
			Map<String,Integer> m = new HashMap<String,Integer>();
			
			for (OrderInfo orderInfo : orders) {
				List<OrderGoods> ogs = orderInfo.getOgs();
//				System.out.println(orderInfo.getOrder_id());
				for (OrderGoods og : ogs) {
//					System.out.println(og.getGoods_id()+":"+og.getGoods_sn()+","+og.getGoods_name()+","+og.getGoods_number());
					//填充进map
					if(m.get(og.getGoods_sn())==null){//等于null时直接设置key,volue
						m.put(og.getGoods_sn(),og.getGoods_number());
					}
					if(m.get(og.getGoods_sn())!=null){//不为null时，在原来基础上上累加
						m.put(og.getGoods_sn(), m.get(og.getGoods_sn())+og.getGoods_number());
//						System.out.println("!");
					}
					
				}
			}
					
//			System.out.println("排序后----------------");
			//排序
			List<Map.Entry<String, Integer>> infoIds = new ArrayList<Map.Entry<String, Integer>>(m.entrySet());
			
			Collections.sort(infoIds, new Comparator<Map.Entry<String, Integer>>() {   
			    public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {      
			        return (o2.getValue() - o1.getValue()); //根据value排序
//			        return (o1.getKey()).toString().compareTo(o2.getKey());//根据key排序
			    }
			}); 
			List<Good> aa = new ArrayList<Good>(); 
			//把设置好排序规则的结果返回
			//排序后
			CustomGood good = new CustomGood();
			String goods_sn;
			for (int i = 0; i < infoIds.size(); i++) {
			    String id = infoIds.get(i).toString();
			    if(i<3){
			    	//前3需要缩略图
			    	goods_sn = id.substring(0, id.indexOf("="));			    	
			    	Good goods = gd.findByGoods_sn(goods_sn.trim());
					aa.add(goods);
					System.out.println("!!!");
			    	continue;
			    }
			    
			    
			    //添加商品名称和售价goods_name&Shop_price
			    goods_sn = id.substring(0, id.indexOf("="));
		    	Good goods = gd.findByGoods_sn(goods_sn.trim());
				aa.add(goods);
				
			}
			return new JsonResult(aa);
		}
		if(order_status!=4&orders!=null){
			return new JsonResult(orders);
		}
		return new JsonResult(1);//意为没有结果
	}

	

}
