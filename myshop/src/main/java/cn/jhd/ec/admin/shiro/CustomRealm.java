package cn.jhd.ec.admin.shiro;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import cn.jhd.ec.admin.service.AdminUserService;
import cn.jhd.ec.entity.admin.ActiveUser;
import cn.jhd.ec.entity.admin.AdminAction;
import cn.jhd.ec.entity.admin.AdminUser;
import cn.jhd.ec.entity.admin.AdminUserAction;
import cn.jhd.ec.util.Utils;

//import cn.itcast.ssm.po.ActiveUser;
//import cn.itcast.ssm.po.SysPermission;
//import cn.itcast.ssm.po.SysUser;
//import cn.itcast.ssm.service.SysService;

/**
 * 
 * <p>
 * Title: CustomRealm
 * </p>
 * <p>
 * Description:自定义realm
 * </p>
 * <p>
 * Company: www.itcast.com
 * </p>
 * 
 * 
 */
public class CustomRealm extends AuthorizingRealm {
	
	//注入service
	@Autowired
	private AdminUserService adminUserService;

	// 设置realm的名称
	@Override
	public void setName(String name) {
		super.setName("customRealm");
	}

	
	//realm的认证方法，从数据库查询用户信息
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		System.out.println("自定义Realm认证方法执行开始……");
		// token是用户输入的用户名和密码 
		// 第一步从token中取出用户名
		String userCode = (String) token.getPrincipal();
		System.out.println("Realm……token:用户名："+userCode);
		
		// 第二步：根据用户输入的userCode从数据库查询
		AdminUser adminUser = null;
		try {
			adminUser = adminUserService.findByUser_name(userCode);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		// 如果查询不到返回null
		if(adminUser==null){
			return null;
		}
		// 从数据库查询到密码
		String password = adminUser.getPassword();
		
		//盐
//		String salt = sysUser.getSalt();
//
//		// 如果查询到返回认证信息AuthenticationInfo
//		
//		//activeUser就是用户身份信息
		ActiveUser activeUser = new ActiveUser();
		
		activeUser.setUserId(adminUser.getUser_id());
		activeUser.setUserCode(adminUser.getUser_name());
		activeUser.setUserName(adminUser.getUser_name());
		//..
		
		//根据用户id取出菜单
		List<AdminUserAction> menus  = null;
		try {
			
			 menus = adminUser.getActions();
			
			//通过service取出菜单 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//将用户菜单 设置到activeUser
		activeUser.setMenus(menus);
		
		//将activeUser设置simpleAuthenticationInfo
//		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(
//				activeUser, password,ByteSource.Util.bytes(salt), this.getName());
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(
				activeUser, password, this.getName());
		
		return simpleAuthenticationInfo;

	}
	
	

	// 用于授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		
		//从 principals获取主身份信息
		//将getPrimaryPrincipal方法返回值转为真实身份类型（在上边的doGetAuthenticationInfo认证通过填充到SimpleAuthenticationInfo中身份类型），
		ActiveUser activeUser =  (ActiveUser) principals.getPrimaryPrincipal();
		
		//根据身份信息获取权限信息
		//从数据库获取到权限数据
		List<String> permissionList = null;
		try {
			String actionStr = adminUserService.findByUser_name(activeUser.getUserName()).getPerssions();
			permissionList = Utils.strToList(actionStr, ",");
		} catch (Exception e) {

			e.printStackTrace();
		}
		//单独定一个集合对象 
		List<String> permissions = new ArrayList<String>();
		if(permissionList!=null){
			for(String sysPermission:permissionList){
				//将数据库中的权限标签 符放入集合
				permissions.add(sysPermission);
			}
		}
		
		
	/*	List<String> permissions = new ArrayList<String>();
		permissions.add("user:create");//用户的创建
		permissions.add("item:query");//商品查询权限
		permissions.add("item:add");//商品添加权限
		permissions.add("item:edit");//商品修改权限
*/		//....
		
		//查到权限数据，返回授权信息(要包括 上边的permissions)
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		//将上边查询到授权信息填充到simpleAuthorizationInfo对象中
		simpleAuthorizationInfo.addStringPermissions(permissions);
		System.out.println("自定义Realm授权方法执行。");
		return simpleAuthorizationInfo;
	}
	
	//清除缓存
	public void clearCached() {
		PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
		super.clearCache(principals);
		System.out.println("自定义清除缓存执行");
	}


}
