package service.order;

import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.client.service.OrderInfoService;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.entity.order.OrderInfo;
import cn.jhd.ec.util.JsonResult;

public class TestOrderInfoService {
	ApplicationContext ctx;
	OrderInfoService ois;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml","spring-service.xml");
//		System.out.println(ctx);
		ois = ctx.getBean("orderInfoServiceImpl",OrderInfoService.class);
		
	}
	
	@Test
	public void findByStatus(){
		JsonResult jr = ois.findByStatus(4);
		List<Good> gs =(List<Good>) jr.getData();
		for (Good g : gs) {
			System.out.println(g.getGoods_thumb()+":"+g.getGoods_name()+":"+g.getShop_price()+":"+g.getGoods_sn());
		}
	}
}
