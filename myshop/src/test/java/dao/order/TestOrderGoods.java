package dao.order;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.dao.relation.OrderGoodsDao;
import cn.jhd.ec.entity.relation.OrderGoods;

public class TestOrderGoods {
	ApplicationContext ctx;
	OrderGoodsDao ogd;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		ogd = ctx.getBean("orderGoodsDao",OrderGoodsDao.class);
	}
	@Test
	public void testFindByOrder_id(){
		List<OrderGoods> ogs = ogd.findByOrder_id(14);
		for (OrderGoods og : ogs) {
			System.out.println(og.getGoods_name()+":"+og.getGoods_price()+":"+og.getGoods_sn());
		}
	}
	//异常看dao借口方法的注释
	@Test
	public void testFindByGoods_sn(){
		OrderGoods og = ogd.findByGoods_sn("ECS000024");
		System.out.println(og.getGoods_name()+":"+og.getGoods_price()+":"+og.getGoods_sn());
	
	}
}
