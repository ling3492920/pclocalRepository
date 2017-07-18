package dao.users;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.dao.users.UserAddressDao;
import cn.jhd.ec.entity.users.UserAddress;
/**
 * 测试收货人的添加与修改
 * @author Administrator
 *
 */
public class TestUserAddress {
	ApplicationContext ctx;
	UserAddressDao uad;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		uad = ctx.getBean("userAddressDao",UserAddressDao.class);
	}
	@Test
	public void testSave(){
		UserAddress ua = new UserAddress();
		ua.setUser_id(6);
		ua.setAddress("巴拉巴拉地址");//必要属性
		ua.setZipcode("12345");//必要属性
		ua.setTel("3591983");
		ua.setMobile("1215545");
		ua.setSign_building("");//字符串类型不给可以给""
		ua.setBest_time("");
		ua.setConsignee("巴拉魔仙");
		ua.setEmail("dasda@qq.com");
		
		int num = uad.save(ua);
		System.out.println(num);
	}
	@Test
	public void testEdit(){
		UserAddress ua = new UserAddress();
		ua.setAddress_id(4);
		ua.setUser_id(6);
		ua.setAddress("哔哩哔哩地址");//必要属性
		ua.setZipcode("12345");//必要属性
		ua.setTel("");
		ua.setMobile("1215545");
		ua.setSign_building("");//字符串类型不给可以给""
		ua.setBest_time("");
		ua.setConsignee("哔哩魔仙");
		ua.setEmail("bili@qq.com");
		int num = uad.edit(ua);
		System.out.println(num);
	}
}
