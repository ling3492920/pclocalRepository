package dao.goods;

import java.util.Iterator;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.dao.goods.GoodsTypeDao;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.entity.goods.GoodsType;
import cn.jhd.ec.entity.relation.GoodsCat;

public class TestGoodsTypeDao {
	ApplicationContext ctx;
	GoodsTypeDao gtd;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		gtd = ctx.getBean("goodsTypeDao",GoodsTypeDao.class);
	}
	
	@Test
	public void testFindById(){
		GoodsType gt = gtd.findById(5);//商品类型
	
		List<GoodsCat> gcs = gt.getGcs(); //关联中间表
		for (GoodsCat goodsCat : gcs) {
			for (Good g : goodsCat.getGs()) {//关联商品
				System.out.println(gt.getCat_id()+":"+gt.getCat_name()+":"+gt.getEnabled()+":"+
						goodsCat.getGoods_id()+":"+g.getGoods_name());
			}
		}
	}
	@Test
	public void testFindAll(){
		List<GoodsType> gts = gtd.findAll();
		for (GoodsType gt : gts) {
			System.out.println(gt.getCat_id()+":"+gt.getCat_name()+":"+gt.getEnabled());
		}
	}
	
	@Test
	public void testFindById1(){
		GoodsType gt = gtd.findById1(4);
		List<Good> gs = gt.getGs();
		for (Good g : gs) {
			System.out.println(gt.getCat_id()+":"+gt.getCat_name()+":"+gt.getEnabled()+":"+g.getCat_id()+":"+g.getGoods_name());
		}
	}
	
	@Test
	public void testFindAll1(){
		List<GoodsType> gts = gtd.findAll1();
		for (GoodsType gt : gts) {
			for (Good g : gt.getGs()) {
				System.out.println(gt.getCat_id()+":"+gt.getCat_name()+":"+gt.getEnabled()+":"+g.getCat_id()+":"+g.getGoods_name());
			}
		}
	}
	
	@Test
	public void testEdit(){
		GoodsType gt = new GoodsType();
		gt.setCat_id(1);
		gt.setCat_name("水果王");
		gt.setEnabled(1);
		int num = gtd.edit(gt);
		System.out.println(num);
	}
	
	@Test
	public void testSave(){
		GoodsType gt = new GoodsType();

		gt.setCat_name("水果");
		gt.setEnabled(1);
		
		int num = gtd.edit(gt);
		System.out.println(num);
	}
	
	@Test
	public void testdelById(){
		int num = gtd.delById(10);
		System.out.println(num);
	}
}
