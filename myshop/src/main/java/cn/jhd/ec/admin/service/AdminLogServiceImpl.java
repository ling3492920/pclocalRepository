package cn.jhd.ec.admin.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.jhd.ec.dao.admin.AdminLogDao;
import cn.jhd.ec.entity.admin.CustomAdminLog;
import cn.jhd.ec.util.JsonResult;
@Service
public class AdminLogServiceImpl implements AdminLogService {
	@Resource
	private AdminLogDao ald;
	public JsonResult findById(Integer user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	public JsonResult findByIp(String ip) {
		// TODO Auto-generated method stub
		return null;
	}

	public JsonResult delByDate(Integer yesdate,Integer id) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("log_time", yesdate);
		if(yesdate!=null){
			map.put("user_id", id);
		}
		Integer num= ald.delAuto(map);
		if(num!=null){
			return new JsonResult(0,"成功删除记录！",num);
		}
		return new JsonResult(1);
	}

	public JsonResult delById(int[] ids) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		Integer num=0;
		for (int id : ids) {
			map.put("log_id", id);
			num+=ald.delAuto(map);
		}
		if(num!=0){
			return new JsonResult(0,"删除成功",num);
		}
		
		return new JsonResult(1);
	}

	public JsonResult findAuto(CustomAdminLog cal) {
		List<CustomAdminLog> cals = ald.findAuto(cal);
		Map<String,Object> m = new HashMap<String,Object>();
		if(cals!=null){
			int num=ald.count(cal);
			m.put("count", num);
			m.put("cals", cals);
			return new JsonResult(0,"查询成功",m);
		}
		return new JsonResult(1);
	}

	public JsonResult findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public JsonResult count(CustomAdminLog cal) {
		Integer num=ald.count(cal);
		if(num!=null){
			return new JsonResult(0,"查询日志条数成功",num);
		}
		return new JsonResult(1);
	}

	public JsonResult findGroupByIp() {
		List<String> ips=ald.findIP();
		if(ips!=null){
			return new JsonResult(0,"查询ip成功",ips);
		}
		return new JsonResult(1);
	}

}
