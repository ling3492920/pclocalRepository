package dao.order;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.dao.order.OrderInfoDao;
import cn.jhd.ec.entity.order.CustomOrderInfo;
import cn.jhd.ec.entity.order.OrderInfo;
import cn.jhd.ec.entity.relation.OrderGoods;

public class TestOrderInfo {
	ApplicationContext ctx;
	OrderInfoDao oid;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		oid = ctx.getBean("orderInfoDao",OrderInfoDao.class);
	}
	@Test
	public void testEdit(){
		OrderInfo oi = new OrderInfo();
		oi.setConsignee("小李子");
		oi.setAddress("英国伦敦");
		oi.setEmail("xiaolizi@qq.com");
		oi.setTel("3591983");
		oi.setMobile("18321658364");
		oi.setZipcode("33511");
		oi.setBest_time("晚上8点后");
		oi.setSign_building("大本钟");
		oi.setOrder_id(6);//根据主键修改
		int num = oid.edit(oi);
		System.out.println(num);
		
	}
	@Test
	public void testSave(){
		OrderInfo oi = new OrderInfo();
		
		oi.setUser_id(3);
		/*必要元素_收货人信息*/
		oi.setOrder_sn("2017042510719");
		oi.setConsignee("测试从java插入");
		oi.setCountry(1);
		oi.setProvince(2);
		oi.setCity(52);
		oi.setDistrict(510);
		oi.setAddress("详细地址");
		oi.setZipcode("335114");
		oi.setTel("3591983");
		oi.setMobile("18721658364");
		oi.setEmail("test@qq.com");
		
		/*刚开始生成订单，订单状态默认值为0*/
		oi.setOrder_status(0);
		oi.setPay_status(0);
		oi.setShipping_status(0);
		
		/*可以不填写，但需要给默认值*/
		oi.setBest_time("");
		oi.setSign_building("");
		oi.setShipping_id(0);
		oi.setShipping_name("");
		oi.setPay_id(0);
		oi.setPay_name("");
		oi.setHow_oos("");
		oi.setAdd_time(0l);//10位数
		
		/*业务处理时算法完成对应价格的计算*/
		oi.setGoods_amount(new BigDecimal(0));
		oi.setShipping_fee(new BigDecimal(0));
		oi.setOrder_amount(new BigDecimal(0));
		
		int num = oid.save(oi);
		System.out.println(num);
	}
	@Test
	public void testDelById(){
		int num = oid.delById(24);
		System.out.println(num);
	}
	
	@Test
	public void testFindById(){
		OrderInfo oi = oid.findById(14);
		List<OrderGoods> ogs = oi.getOgs();
		for(OrderGoods og:ogs){
			//主要用以关联查询商品名称，价格，属性，数量，小计，商品id
			System.out.println(og.getGoods_name()+":"+og.getGoods_number()+":"+
					og.getGoods_id()+":"+og.getOrder_id()
					);
		}
	}
	//根据订单状态查看商品成交量并排序
	@Test
	public void testFindByStatus(){
		List<OrderInfo> orders = oid.findByStatus(4);
		Map<String,Integer> m = new HashMap<String,Integer>();
		
		for (OrderInfo orderInfo : orders) {
			List<OrderGoods> ogs = orderInfo.getOgs();
//			System.out.println(orderInfo.getOrder_id());
			for (OrderGoods og : ogs) {
//				System.out.println(og.getGoods_id()+":"+og.getGoods_sn()+","+og.getGoods_name()+","+og.getGoods_number());
				//填充进map
				if(m.get(og.getGoods_sn())==null){//等于null时直接设置key,volue
					m.put(og.getGoods_sn(),og.getGoods_number());
				}
				if(m.get(og.getGoods_sn())!=null){//不为null时，在原来基础上上累加
					m.put(og.getGoods_sn(), m.get(og.getGoods_sn())+og.getGoods_number());
//					System.out.println("!");
				}
				
			}
		}
		//遍历key,volue
//		System.out.println(m);
		
		Set<Entry<String, Integer>> ss = m.entrySet();
		for (Entry<String, Integer> entry : ss) {
//			System.out.println("______");
			System.out.println(entry.getKey()+":"+entry.getValue());
		}
		
		
		System.out.println("排序后----------------");
		List<Map.Entry<String, Integer>> infoIds =
			    new ArrayList<Map.Entry<String, Integer>>(m.entrySet());
		
		Collections.sort(infoIds, new Comparator<Map.Entry<String, Integer>>() {   
		    public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {      
		        return (o2.getValue() - o1.getValue()); //根据value排序
//		        return (o1.getKey()).toString().compareTo(o2.getKey());//根据key排序
		    }
		}); 

		//排序后
		for (int i = 0; i < infoIds.size(); i++) {
		    String id = infoIds.get(i).toString();
		    System.out.println(id);
		}
	}
	
	@Test
	public void testFindAuto(){
		CustomOrderInfo coi = new CustomOrderInfo();
		coi.setPageSize(15);
		coi.setStartLine(0);
//		coi.setOrderbycolum("add_time ASC");
//		coi.setOrderbycolum("consignee desc");
//		coi.setOrderbycolum("order_sn desc");
//		coi.setOrderbycolum("order_amount desc");
		coi.setOrderbycolum("order_id desc");
//		coi.setOrder_sn("2009061909851");
//		coi.setConsignee("刘先生");
//		coi.setOrder_status(1);//0，未确认 1,已确认，2，取消 3，无效 4，退货
//		coi.setShipping_status(0);//0，未发货1,已发货，2，收货确认3，配货中 4，已发货(部分商品)
//		Integer[] it ={0,3,4};//
//		coi.setShip_statu(it);//查询使用coi的ship_statu Integer[]
//		coi.setPay_status(2);//0，未付款 1，付款中 2.已付款
		// order_status pay_status shipping_status
		//待确认：0 0 in (0)
		//待发货：1 2 in (0,3,4) 
		//待付款: 1 0 in (1,0)
		//已完成：1 2 in (1,2)
		//取消：  2 0 0
		//无效：  3 0 0
		//退货    4 0 0
		List<OrderInfo> ods = oid.findByAuto(coi);
		for (OrderInfo od : ods) {
			System.out.println("id:"+od.getOrder_id()+"订单编号:"+od.getOrder_sn()+",收货人:"+od.getConsignee()+",spp_status:"+od.getShipping_status()+
					"add_time:"+od.getAdd_time()+",order_amount:"+od.getOrder_amount());
//			List<OrderGoods> ogs = od.getOgs();
//			for (OrderGoods og : ogs) {
//				System.out.println("商品编号:"+og.getGoods_sn()+",商品名称:"+og.getGoods_name());
//			}
		}
	}
	@Test
	public void findCountByAuto(){
		CustomOrderInfo coi = new CustomOrderInfo();
		coi.setPageSize(15);
		coi.setStartLine(15);
		Integer num=oid.findCountByAuto(coi);
		System.out.println(num);
	}
}
