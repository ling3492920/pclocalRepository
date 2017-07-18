package dao.admin;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jhd.ec.dao.admin.AdminRoleDao;
import cn.jhd.ec.entity.admin.AdminRole;

public class AdminRoleDaoTest {
	
	ApplicationContext ctx;
	AdminRoleDao ard ;
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		ard = ctx.getBean("adminRoleDao",AdminRoleDao.class);
	}

	@Test
	public void testFindAll() {
		List<AdminRole> ars = ard.findAll();
		System.out.println(ars.size());
		for (AdminRole ar : ars) {
			System.out.println(ar.getRole_id());
		}
	}

	@Test
	public void testEdit() {
		AdminRole ar = new AdminRole();
		ar.setPermissions("goods:add:eidt");
		ar.setAction_list("goodsmanage");
		ar.setRole_describe("已经不是神仙了");
		ar.setRole_name("凡人");
		ar.setRole_id(3);
		int num=ard.edit(ar);
		System.out.println(num);
	}

	@Test
	public void testSave() {
		AdminRole ar = new AdminRole();
		ar.setRole_name("神仙");
		ar.setRole_describe("神仙角色");
		ar.setAction_list("");
		ar.setPermissions("飞天");
		int num = ard.save(ar);
		System.out.println(num);
	}

	@Test
	public void testFindById() {
		AdminRole ar = ard.findById(3);
		System.out.println(ar.getRole_id()+":"+ar.getRole_name()+":"+ar.getRole_describe());
	}

	@Test
	public void testDelById() {
		Integer num = ard.delById(5);
		if(num!=null){
			System.out.println(num);
		}
	}

}
