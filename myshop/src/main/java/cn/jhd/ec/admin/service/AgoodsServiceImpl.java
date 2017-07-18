package cn.jhd.ec.admin.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.jhd.ec.dao.goods.GoodDao;
import cn.jhd.ec.entity.goods.CustomGood;
import cn.jhd.ec.entity.goods.CustomGoods;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.util.JsonResult;
/**
 * 由于client对商品业务不同，所以后台重建一个service是有必要的
 * @author Administrator
 *
 */
@Service
public class AgoodsServiceImpl implements AGoodsService {
	@Resource
	private GoodDao goodDao;
	
	public List<Good> findAll(Integer startLine,Integer pageSize) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("startline",startLine );
		map.put("pageSize", pageSize);
		return goodDao.findAll(map);
	}
	
	public JsonResult findAll2(Integer startLine,Integer pageSize){
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("startline",startLine );
		map.put("pageSize", pageSize);
		List<Good> goods = goodDao.findAll(map);
		return new JsonResult(0,"success",goods);
	}
	
	public JsonResult save(Good good) {
		int num = goodDao.save(good);
		if(num==1){
			return new JsonResult(0);
		}
		return new JsonResult(1,"添加商品失败！",null);
	}
	
	public JsonResult delById(Integer id) {
		Good good = new Good();
		good.setGoods_id(id);
		good.setIs_delete(1);//将is_delete值设置为1即代表被回收商品
		int num=goodDao.edit(good);
		if(num==1){
			return new JsonResult(0,"已将商品放入回收站！",null);
		}
		return new JsonResult(1,"放入回收站失败！请重试",null);
	}

	public Good findById(Integer id) {
		
		return goodDao.findById(id);
	}

	public JsonResult editById(Good good) {
		int num = goodDao.edit(good);
		if(num==1){
			return new JsonResult(0,"",num);
		}
		return new JsonResult("(ಥ_ಥ)修改商品信息失败！");
	}

	public int delGoods(List<Integer> ids) {
		int num=0;
		for (Integer id : ids) {
			num+=goodDao.delById(id);
		}	
		return num;
	}
	//总记录数
	public JsonResult count() {
		int num=goodDao.count();
		if(num>0){
			return new JsonResult(0,"查询总记录数成功",num);
		}
		return new JsonResult(1,"没有查到所需记录",null);
	}

	@SuppressWarnings("rawtypes")
	public JsonResult editBase(Integer id,String columName,String val) {
		Good good = new Good();
		good.setGoods_id(id);
		if("goods_name".equals(columName)){
			good.setGoods_name(val);
		}
		if("goods_sn".equals(columName)){
			good.setGoods_sn(val);
		}
		if("shop_price".equals(columName)){
			good.setShop_price(new BigDecimal(val));
		}
		if("goods_number".equals(columName)){
			good.setGoods_number(Integer.parseInt(val));
		}
		if("sort_order".equals(columName)){
			good.setSort_order(Integer.parseInt(val));
		}
		int num = goodDao.edit(good);
		if(num==1){
			return new JsonResult(0,"修改成功",null);
		}
		return new JsonResult(1);
	}

	public JsonResult findauto(CustomGoods cg) {	
		List<Good> gs = goodDao.findAuto2(cg);
		if(gs!=null){
			return new JsonResult(0,"查询成功",gs);
		}
		return new JsonResult(1);
	}

}
