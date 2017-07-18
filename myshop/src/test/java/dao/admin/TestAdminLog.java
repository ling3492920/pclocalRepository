package dao.admin;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.dao.admin.AdminLogDao;
import cn.jhd.ec.entity.admin.AdminLog;
import cn.jhd.ec.entity.admin.CustomAdminLog;

public class TestAdminLog {
	ApplicationContext ctx;
	AdminLogDao ald ;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		ald = ctx.getBean("adminLogDao",AdminLogDao.class);
	}
	@Test
	public void testFindAuto(){
		CustomAdminLog cal = new CustomAdminLog();
		cal.setStartLine(0);
		cal.setPageSize(15);
		cal.setUser_id(1);
//		cal.setLog_id(1);
//		cal.setIp_address("0.0.0.0");
//		cal.setLog_info("%添加%");
//		
//		cal.setLog_time(Integer.parseInt((""+System.currentTimeMillis()).substring(0, 10)));
		List<CustomAdminLog> als = ald.findAuto(cal);
		for (CustomAdminLog al : als) {
			System.out.println(al.getLog_info()+":"+al.getLog_id()+":"+al.getUser_name());
		}
	}
	@Test
	public void testCount(){
		CustomAdminLog cal = new CustomAdminLog();
		cal.setStartLine(0);
		cal.setPageSize(15);
		cal.setUser_id(1);
		int num=ald.count(cal);
		System.out.println(num);
	}
	
	@Test
	public void testFindIP(){
		List<String> ips = ald.findIP();
		for (String ip : ips) {
			System.out.println(ip);
		}
	}
}
