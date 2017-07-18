package cn.jhd.ec.dao.admin;

import java.util.List;

import cn.jhd.ec.entity.admin.AdminAction;

public interface AdminActionDao {
	public List<AdminAction> findAll();
	public List<AdminAction> findByUserId(Integer user_id);
}
