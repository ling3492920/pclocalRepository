package dao.goods;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.dao.goods.CategoryDao;
import cn.jhd.ec.entity.goods.Category;
import cn.jhd.ec.entity.goods.Good;

public class CategoryDaoTest {
	ApplicationContext ctx;
	CategoryDao cd;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		cd = ctx.getBean("categoryDao",CategoryDao.class);
	}
	
	/**
	 * 实现查询所有1级分类关联查询2级分类
	 * 
	 */
	@Test
	public void testFindParentsCate(){
		List<Category> cgs = cd.findParentsCate();
		for (Category cg : cgs) {
			List<Category> cats = cg.getCats();
			System.out.println(cg.getCat_id()+","+cg.getCat_name()+":");
			for (Category cat : cats) {
				System.out.println(cat.getCat_id()+","
						+cat.getCat_name()+","+cat.getParent_id());
			}
		}
	}
	
	/**
	 * 实现一个2级分类关联查询对应商品
	 */
	@Test
	public void testfindBabyGoods(){
		Category cg = cd.findBabyGoods(2);//如果不是2级分类的cat_id将会爆空指针
		List<Good> goods = cg.getGoods();
		for (Good g : goods) {
			System.out.println(cg.getCat_name()+":"+g.getGoods_id()+","+g.getGoods_name());
		}
		
	}
	/**
	 * 实现一个1级分类关联的所有二级分类的查询
	 * (二级分类会关联上诉2及分类关联商品)为了降低业务的复杂度，暂时不实现该业务
	 */
	@Test
	public void testfindBabyByParent_id(){
		List<Category> cts = cd.findBabyByParent_id(1);
		for (Category ct : cts) {
			System.out.println(ct.getCat_id()+","+ct.getCat_name());
			List<Good> goods = ct.getGoods();
			for (Good g : goods) {
				System.out.println(g.getGoods_name()+":"+g.getGoods_id());
			}
		}
	}
}
