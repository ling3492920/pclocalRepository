package cn.jhd.ec.client.service;

import java.util.List;

import cn.jhd.ec.entity.goods.CustomGood;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.util.JsonResult;

/**
 * 商品业务接口
 * @author Administrator
 *
 */
public interface GoodsService {
	//1.查询商品
	//1.1动态查询
	public JsonResult<List<Good>> findAuto(CustomGood customgood);
	
	//2.查询单个商品
	public JsonResult<Good> findById(Integer goods_id);

	public JsonResult findByIdAboutBrand(Integer goods_id);
}
