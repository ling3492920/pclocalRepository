package cn.jhd.ec.admin.service;

import java.util.List;

import cn.jhd.ec.entity.goods.CustomGoods;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.util.JsonResult;
/**
 * 为了区分client包下的GoodsService在前面加A
 * @author Administrator
 *
 */
public interface AGoodsService {
	public List<Good> findAll(Integer startLine,Integer pageSize);
	public JsonResult findAll2(Integer startLine,Integer pageSize);
	public JsonResult save(Good good);
	/**
	 * 放入回收站
	 * @param id
	 * @param is_del
	 * @return
	 */
	public JsonResult delById(Integer id);
	public Good findById(Integer id);
	public JsonResult editById(Good good);
	public int delGoods(List<Integer> ids);
	
	public JsonResult count();
	public JsonResult editBase(Integer id,String columName,String val);
	
	public JsonResult findauto(CustomGoods cg);
}
