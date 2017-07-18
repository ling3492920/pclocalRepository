package cn.jhd.ec.dao.goods;

import java.util.List;
import java.util.Map;

import cn.jhd.ec.entity.goods.CustomGood;
import cn.jhd.ec.entity.goods.CustomGoods;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.entity.goods.GoodsAboutBrand;
import cn.jhd.ec.entity.relation.CusTomGoodsCat;

public interface GoodDao {
	public List<Good> findAll(Map<String,Integer> map);
	
	public Good findById(Integer goods_id);
	
	public List<Good> findByCatId(Integer cat_id);
	
	public CusTomGoodsCat findById2(Integer id);
	
	public GoodsAboutBrand findByIdAboutBrand(Integer id);
	//动态修改商品信息
	public int edit(Good good);
	
	public int save(Good good);
	
	public int delById(Integer id);
	
	//动态查询商品信息
	public List<Good> findAuto(CustomGood customgood);
	public List<Good> findAuto2(CustomGoods customGoods);
	
	public Good findByGoods_sn(String goods_sn);
	
	//统计所有未被回收的商品数量
	public int count();
}
