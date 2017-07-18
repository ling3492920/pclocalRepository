package cn.jhd.ec.dao.admin;

import java.util.List;

import cn.jhd.ec.entity.admin.AdminUserAction;

public interface AdminUserActionDao {
	public List<AdminUserAction> findFirst(Integer userid);//查询用户的1级菜单
	
	public List<AdminUserAction> findSecond(Integer action_id);
}
