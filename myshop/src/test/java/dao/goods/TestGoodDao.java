package dao.goods;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.dao.goods.GoodDao;
import cn.jhd.ec.entity.goods.CustomGood;
import cn.jhd.ec.entity.goods.CustomGoods;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.entity.goods.GoodsAboutBrand;
import cn.jhd.ec.entity.relation.CusTomGoodsCat;

public class TestGoodDao {
	ApplicationContext ctx;
	GoodDao gd;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		gd = ctx.getBean("goodDao",GoodDao.class);
	}
	
	@Test
	public void testFindAll(){
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startline", 0);
		map.put("pageSize", 10);
		List<Good> goods = gd.findAll(map);
		for(Good g:goods){
			System.out.println(g.getGoods_name()+":"+g.getGoods_sn()+":"+g.getGoods_number()+":"+
					g.getGoods_id()
					);
		}
	}
	
	@Test
	public void testFindById(){
		Good g = gd.findById(32);
		System.out.println(g.getGoods_name()+":"+g.getGoods_sn()+":"+g.getGoods_number()+":"+
					g.getGoods_id());
	}
	
	
	@Test
	public void testFindById2(){
		CusTomGoodsCat g = gd.findById2(32);
		System.out.println(g.getGoods_name()+":"+g.getGoods_sn()+":"+g.getGoods_number()+":"+
					g.getGoods_id()+":"+g.getCat_name()+":"+g.getCat_id()+":"+g.getEnabled());
	}
	
	@Test
	public void testFindByIdAboutBrand(){
		GoodsAboutBrand gab = gd.findByIdAboutBrand(7);
		System.out.println(gab.getBrand_name());
	}
	
	@Test
	public void testEdit(){
		Good g = new Good();
//		g.setCat_id(1);
//		g.setBrand_id(1);
//		g.setGoods_sn("");
//		g.setGoods_number(5);
//		g.setGoods_weight(new BigDecimal("10.5"));
//		g.setPromote_start_date(151515);
//		g.setPromote_end_date(5455);
//		g.setSort_order(15454);
//		g.setLast_update(45454);
//		
//		g.setGoods_name("小米7");
//		g.setGoods_name_style("strong");
//		g.setClick_count(5);
//		g.setMarket_price(new BigDecimal("2100"));
//		g.setShop_price(new BigDecimal("1999"));
//		g.setPromote_price(new BigDecimal("999"));
//		g.setWarn_number(100);
//		g.setKeywords("小米");
//		g.setGoods_brief("好");
//		g.setGoods_desc("很好");
//		g.setGoods_thumb("缩略图路径");
//		g.setGoods_img("img_path");//预览图路径
//		g.setOriginal_img("原图路径");
//		g.setIs_on_sale(1);
//		g.setIs_alone_sale(1);
//		g.setIntegral(100);//积分购买金额
//		g.setAdd_time(12155);//上架时间
		g.setIs_delete(1);
//		g.setIs_best(1);
//		g.setIs_new(1);
//		g.setIs_hot(1);
//		g.setIs_promote(1);
//		g.setGoods_type(5);
//		g.setSeller_note("商家备注");
		
		g.setGoods_id(46);
		
		int num = gd.edit(g);
		System.out.println(num);
	}
	
	@Test
	public void testSave(){
		Good g = new Good();
		g.setCat_id(1);
		g.setBrand_id(1);
		g.setGoods_sn("");
		g.setGoods_number(5);
		g.setGoods_weight(new BigDecimal("10.5"));
		g.setPromote_start_date(151515);
		g.setPromote_end_date(5455);
		g.setSort_order(15454);
		g.setLast_update(45454);
		
		g.setGoods_name("小米6");
		g.setGoods_name_style("strong");
		g.setClick_count(5);
		g.setMarket_price(new BigDecimal("2100"));
		g.setShop_price(new BigDecimal("1999"));
		g.setPromote_price(new BigDecimal("999"));
		g.setWarn_number(100);
		g.setKeywords("小米");
		g.setGoods_brief("好");
		g.setGoods_desc("很好");//必要字段
		g.setGoods_thumb("缩略图路径");
		g.setGoods_img("img_path");//预览图路径
		g.setOriginal_img("原图路径");
		g.setIs_on_sale(1);
		g.setIs_alone_sale(1);
		g.setIntegral(100);//积分购买金额
		g.setAdd_time(12155);//上架时间
		g.setIs_delete(0);
		g.setIs_best(1);
		g.setIs_new(1);
		g.setIs_hot(1);
		g.setIs_promote(1);
		g.setGoods_type(5);
		g.setSeller_note("商家备注");
		int num = gd.save(g);
		System.out.println(num);
	}
	
	@Test
	public void delById(){
		int num = gd.delById(35);
		System.out.println(num);
	}
	//测试动态查询
	@Test
	public void testFindAuto(){
		CustomGood g = new CustomGood();
		g.setPage(1);
		g.setPageSize(10);
		g.setStartPos();
		
//		g.setCat_id(3);
//		g.setBrand_id(7);
//		g.setGoods_sn("");
//		g.setGoods_number("5");
//		g.setGoods_weight(new BigDecimal("10.5"));
//		g.setPromote_start_date(151515);
//		g.setPromote_end_date(5455);
//		g.setSort_order(15454);
//		g.setLast_update(45454);
//		
//		g.setGoods_name("小米6");
//		g.setGoods_name_style("strong");
//		g.setClick_count(5);
//		g.setMarket_price(new BigDecimal("2100"));
//		g.setShop_price(new BigDecimal("1999"));
//		g.setPromote_price(new BigDecimal("999"));
//		g.setWarn_number(100);
//		g.setKeywords("小米");
//		g.setGoods_brief("好");
//		g.setGoods_desc("很好");
//		g.setGoods_thumb("缩略图路径");
//		g.setGoods_img("img_path");//预览图路径
//		g.setOriginal_img("原图路径");
//		g.setIs_on_sale(1);
//		g.setIs_alone_sale(1);
//		g.setIntegral(100);//积分购买金额
//		g.setAdd_time(12155);//上架时间
//		g.setIs_delete(0);
//		g.setIs_best(1);
		g.setIs_new(1);
//		g.setIs_hot(1);
//		g.setIs_promote(1);
//		g.setGoods_type(5);
		List<Good> gs = gd.findAuto(g);
		for (Good good : gs) {
			System.out.println(good.getGoods_name()+":"+good.getGoods_id());
		}
	}
	@Test
	public void testCount(){
		int num=gd.count();
		System.out.println(num);
	}
	
	@Test
	public void testFindAuto2(){
		CustomGoods cgs = new CustomGoods();
//		cgs.setCat_id(0);
//		cgs.setBrand_id(0);
//		cgs.setIs_best(1);
//		cgs.setIs_new(1);
//		cgs.setIs_hot(1);
//		cgs.setIs_promote(1);
//		cgs.setSuppliers_id(null);
//		cgs.setKeywords("%saa%");
//		cgs.setIs_on_sale(1);
		//额外必要字段
		cgs.setStartLine(0);
		cgs.setPageSize(15);
		cgs.setIs_delete(0);
		List<Good> gs = gd.findAuto2(cgs);
		for (Good gd : gs) {
			System.out.println(gd.getCat_id()+":"+gd.getGoods_name()+":"+gd.getIs_delete());
		}
	}
}
