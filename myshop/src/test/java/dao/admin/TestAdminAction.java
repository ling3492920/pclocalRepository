package dao.admin;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.dao.admin.AdminActionDao;
import cn.jhd.ec.entity.admin.AdminAction;

public class TestAdminAction {
	ApplicationContext ctx;
	AdminActionDao aad ;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		aad = ctx.getBean("adminActionDao",AdminActionDao.class);
	}
	@Test
	public void testFindByUserId(){
		List<AdminAction> aas = aad.findByUserId(1);
		for (AdminAction aa : aas) {
			System.out.println(aa.getAction_code());	
		}
	}
}
