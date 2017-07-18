package controller.user;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.client.web.UserController;
import cn.jhd.ec.entity.users.User;
import cn.jhd.ec.util.JsonResult;

public class TestUserController {
	ApplicationContext ctx;
	UserController uc;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml","spring-service.xml"
					,"spring-web.xml"
				);
		System.out.println(ctx);
		uc = ctx.getBean("userController",UserController.class);
	}
	
	@Test
	public void testLogin(){
//		JsonResult jr = uc.login("小王", "123456", null);
//		jr.getState();
//		User user = (User)jr.getData();
//		System.out.println(user.getUser_name()+":"+user.getUser_id());
	}
}
