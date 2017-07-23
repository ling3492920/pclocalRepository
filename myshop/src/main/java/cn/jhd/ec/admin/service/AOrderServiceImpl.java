package cn.jhd.ec.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.jhd.ec.admin.exception.CustomException;
import cn.jhd.ec.dao.order.OrderInfoDao;
import cn.jhd.ec.entity.order.CustomOrderInfo;
import cn.jhd.ec.entity.order.OrderInfo;
import cn.jhd.ec.util.JsonResult;
@Service
public class AOrderServiceImpl implements AOrderService {
	@Resource
	private OrderInfoDao oid;
	public JsonResult edit(OrderInfo orderInfo) {
		
		return null;
	}

	public JsonResult findAuto(CustomOrderInfo coi){
		//1.校验入参
		//2.执行查询
		List<OrderInfo> ois = oid.findByAuto(coi);
		//2.1查询符合条件的总记录数
		int num=oid.findCountByAuto(coi);
		Map<String,Object> m = new HashMap<String,Object>();
		//3.处理结果
		if(ois.size()>0&num>0){
			m.put("ois", ois);
			m.put("count", num);
			return new JsonResult(0,"查询订单成功",m);
		}
		return new JsonResult(1);//未查到结果或异常
	}

}
