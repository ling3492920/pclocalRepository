package dao.admin;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.dao.admin.AdminUserDao;
import cn.jhd.ec.entity.admin.AdminAction;
import cn.jhd.ec.entity.admin.AdminUser;
import cn.jhd.ec.entity.admin.AdminUserAction;

public class TestAdminUserDao {
	ApplicationContext ctx;
	AdminUserDao aud ;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		aud = ctx.getBean("adminUserDao",AdminUserDao.class);
	}
	@Test
	public void testfindById(){
		AdminUser au = aud.findById(1);
		System.out.println(au.getUser_name()+":"+au.getEmail()+":"+au.getPassword());
		System.out.println("nav_list:"+au.getNav_list());
		System.out.println("action_list:"+au.getAction_list());
		
	}
	@Test
	public void testSave(){
		AdminUser au = new AdminUser();
		au.setUser_name("xiaowang");
		au.setEmail("123456@qq.com");
		au.setPassword("123456");
		au.setAction_list("all");
		au.setNav_list("商品列表|goods.php?act=list,订单列表"
				+ "|order.php?act=list,用户评论|comment_manage.php?act=list,会员列表"
				+ "|users.php?act=list,商店设置|shop_config.php?act=list_edit");
		au.setAdd_time((int)System.currentTimeMillis());
		au.setLast_login((int)System.currentTimeMillis());
//		au.setLast_ip(last_ip);
		int num = aud.save(au);
		System.out.println(num);
	}
	@Test
	public void testEdit(){
		AdminUser au = new AdminUser();
		au.setUser_id(6);
		au.setUser_name("xiaowang");
		au.setEmail("123456@qq.com");
		au.setPassword("123456");
		au.setAction_list("all");
		au.setNav_list("商品列表|goods.php?act=list,订单列表"
				+ "|order.php?act=list,用户评论|comment_manage.php?act=list,会员列表"
				+ "|users.php?act=list,商店设置|shop_config.php?act=list_edit");
		au.setLast_login(Integer.parseInt((System.currentTimeMillis()+"").substring(0, 10)));
		int num = aud.edit(au);
		System.out.println(num);
	}
	
//	@Test
//	public void testSys(){
//		System.out.println(Integer.parseInt((System.currentTimeMillis()+"").substring(0, 10)));
//	}
	
	@Test
	public void testDelById(){
		int num=aud.delById(6);
		System.out.println(num);
	}
	
	@Test
	public void testFindAll(){
		List<AdminUser> aus = aud.findAll();
		for (AdminUser au : aus) {
			System.out.println(au.getUser_name()+":"+au.getEmail()+":"+au.getPassword());
//			System.out.println("nav_list:"+au.getNav_list());
			System.out.println("action_list:"+au.getAction_list());
			System.out.println("______________");
		}
	}
	
	@Test
	public void testFinbByUserId(){
		AdminUser au=aud.findById(1);
		List<AdminUserAction> aas = au.getActions();
		System.out.println(au.getUser_id());
		for (AdminUserAction aa : aas) {
			System.out.println(aa.getAction_name());//查询到用户的1级菜单
			List<AdminUserAction> aus = aa.getAus();
			for (AdminUserAction aua : aus) {
				System.out.println(aua.getAction_name());//1级关联查询到的2级菜单
			}
		}
	}
	
}
