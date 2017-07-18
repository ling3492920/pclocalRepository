package cn.jhd.ec.admin.service;

import java.util.Date;

import cn.jhd.ec.entity.admin.CustomAdminLog;
import cn.jhd.ec.util.JsonResult;

public interface AdminLogService {
	public JsonResult findById(Integer user_id);
	public JsonResult findByIp(String ip);
	/**
	 * 按日期清除日志
	 * @param date
	 * @return 返回成功清除掉的记录数
	 */
	public JsonResult delByDate(Integer yesdate,Integer id);
	/**
	 * 
	 * @param ids 是一个id数组
	 * @return 返回成功删除的记录数
	 */
	public JsonResult delById(int[] ids);
	/**
	 * 
	 * @param cal 该对象接收startLine,pageSize，user_id,ip_address,等
	 * @return 返回符合条件的所有cal对象
	 */
	public JsonResult findAuto(CustomAdminLog cal);
	/**
	 * 
	 * @param cal
	 * @return 返回包含符合条件的总记录数
	 */
	public JsonResult count(CustomAdminLog cal);
	
	public JsonResult findAll();
	/**
	 * 
	 * @return 返回包含ip类型的数据
	 */
	public JsonResult findGroupByIp();
	
}
