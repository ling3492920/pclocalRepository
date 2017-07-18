package dao.users;

import java.sql.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.dao.users.UserDao;
import cn.jhd.ec.entity.order.OrderInfo;
import cn.jhd.ec.entity.users.User;
import cn.jhd.ec.entity.users.UserAddress;

public class TestUser {
	ApplicationContext ctx;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
	}
	@Test
	public void testFindAll(){
		
//		System.out.println(ctx);
		UserDao ud = ctx.getBean("userDao",UserDao.class);
		List<User> users = ud.findAll();
		for(User u:users){
			System.out.println(u.getUser_id()+","+u.getUser_name()+","+u.getPassword());
		}
	}
	@Test
	public void testSave(){
		UserDao ud = ctx.getBean("userDao",UserDao.class);
		User user = new User();
		user.setCredit_line(1);
		user.setAlias("xdsa");
		user.setEmail("sasa@qq.com");
		user.setHome_phone("123456");
		user.setMobile_phone("1454545");
		user.setMsn("dasda");
		user.setOffice_phone("4848848");
		user.setPassword("123456");
		user.setQq("12121212");
		user.setUser_name("小gui");
		user.setVisit_count(2);
		int num = ud.save(user);
		System.out.println(num);
	}
	
	@Test
	public void testEdit(){
		UserDao ud = ctx.getBean("userDao",UserDao.class);
		User user = new User();
		user.setBirthday(new Date(System.currentTimeMillis()));
		user.setUser_id(9);
		user.setEmail("setemail@qq.com");
		user.setSex(1);
		user.setPassword("abcd");
		user.setHome_phone("3591983");
		user.setOffice_phone("335114");
		user.setMobile_phone("10086");
		user.setMsn("sasa@msn.cn");
		user.setQq("2634243151");
		user.setPasswd_answer("你好");
		user.setPasswd_question("中文打招呼？");
		int num = ud.edit(user);
		System.out.println(num);
	}
	@Test
	public void testFindByUserName(){
		UserDao ud = ctx.getBean("userDao",UserDao.class);
		User user = ud.findByUserName("小gui");
		System.out.println(user.getUser_id()+":"+user.getUser_name());
	}
	//根据userid关联查询userAddress和Orders
	@Test
	public void testFindById(){
		UserDao ud = ctx.getBean("userDao",UserDao.class);
		User user = ud.findByUserId(1);
		List<UserAddress> userAs = user.getUserAddres();
		for(UserAddress ua:userAs){
			System.out.println(ua.getAddress_id()+":"+ua.getUser_id()+":"+ua.getConsignee());
		}
		List<OrderInfo> orders = user.getOrders();
		for(OrderInfo order:orders){
			System.out.println(order.getOrder_id()+":"+order.getOrder_sn()+":"+order.getConsignee());
		}
	}
	
	@Test
	public void testDate(){
		System.out.println(new Date(System.currentTimeMillis()));
	}
	
	
}
