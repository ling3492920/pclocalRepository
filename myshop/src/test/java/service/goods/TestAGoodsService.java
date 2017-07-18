package service.goods;

import java.math.BigDecimal;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.admin.service.AGoodsService;
import cn.jhd.ec.entity.goods.CustomGoods;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.util.JsonResult;

public class TestAGoodsService {
	ApplicationContext ctx;
	AGoodsService gs;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml","spring-service.xml");
		System.out.println(ctx);
		gs = ctx.getBean("agoodsServiceImpl",AGoodsService.class);
		
	}
	
	@Test
	public void findAll(){
		List<Good> goods=gs.findAll(10, 10);
		for (Good good : goods) {
			System.out.println(good.getGoods_id()+":"+good.getGoods_name());
		}
	}
	/**
	 * insert  ecs_goods SET cat_id=? 
		SET brand_id=? SET goods_sn=?SET goods_number=? SET goods_weight=?SET goods_name=? SET goods_name_style=? 
		SET market_price=? SET shop_price=? SET warn_number=?  SET keywords=?   SET goods_brief=?SET goods_desc=? 
		SET is_on_sale=? SET is_alone_sale=? SET is_new=?SET goods_type=? SET seller_note=?
	 */
	@Test
	public void save(){
		Good good = new Good();
		good.setBrand_id(5);
		good.setGoods_weight(new BigDecimal("0.12"));
		good.setGoods_name("dsad");
		good.setGoods_name_style("aaa");
		good.setMarket_price(new BigDecimal(888));
		good.setShop_price(new BigDecimal(777));
		good.setWarn_number(10);
		good.setKeywords("das sad");
		good.setGoods_brief("sdadas");
		
		good.setGoods_desc("暂无描述");
		good.setIs_on_sale(1);
		good.setIs_alone_sale(1);
		good.setIs_new(1);
		good.setGoods_type(1);
		good.setSeller_note("sad");
		good.setGoods_sn("ECS000067");
		good.setGoods_number(10);
		JsonResult jr = gs.save(good);
		System.out.println(jr.getState());
	}
	
	@Test
	public void testFindauto(){
		CustomGoods cg = new CustomGoods();
		cg.setPageSize(15);
		cg.setStartLine(0);
		cg.setIs_delete(0);
		JsonResult<Good> gd = gs.findauto(cg);
		System.out.println("size:"+((List<Good>)gd.getData()).size());
	}
}
