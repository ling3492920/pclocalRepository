package service.goods;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.client.service.GoodsService;
import cn.jhd.ec.entity.goods.CustomGood;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.util.JsonResult;


public class TestGoodService {
	ApplicationContext ctx;
	GoodsService gs;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml","spring-service.xml");
		System.out.println(ctx);
		gs = ctx.getBean("goodsServiceImpl",GoodsService.class);
	}
	
	@Test
	public void testFindAuto(){
		CustomGood customgood = new CustomGood();
		customgood.setPage(1);
		customgood.setIs_new(1);
		JsonResult<List<Good>> jr= gs.findAuto(customgood);
		for (Good g : jr.getData()) {
			System.out.println(g.getGoods_name()+":"+g.getGoods_sn());
		}
	}
	
	
}
