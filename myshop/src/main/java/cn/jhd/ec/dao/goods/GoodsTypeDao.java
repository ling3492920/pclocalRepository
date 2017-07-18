package cn.jhd.ec.dao.goods;

import java.util.List;

import cn.jhd.ec.entity.goods.GoodsType;

public interface GoodsTypeDao {
	/*关联中间表的查询*/
	public List<GoodsType> findAll();
	
	public GoodsType findById(Integer id);
	
	/*关联商品表的查询*/
	
	public List<GoodsType> findAll1();
	
	public GoodsType findById1(Integer id);
	
	public int save(GoodsType gt);
	
	public int edit(GoodsType gt);
	
	public int delById(Integer id);
}
