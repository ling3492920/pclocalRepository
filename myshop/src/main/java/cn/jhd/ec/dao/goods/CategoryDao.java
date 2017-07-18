package cn.jhd.ec.dao.goods;

import java.util.List;

import cn.jhd.ec.entity.goods.Category;

/**
 * 商品1,2级分类表
 * @author Administrator
 *
 */
public interface CategoryDao {
	//1.查询所有分类//按类型级别分组//作用被2取代
//	public List<Category> findAll();
	
	//2.查询所有顶级分类//关联查询到所属子级分类
	public List<Category> findParentsCate();
	
	//3.根据一个顶级分类cat_id，下的所有子集分类
	public List<Category> findBabyByParent_id(Integer parent_id);
	
	//4.通过一个子集分类，关联查询到该子集分类对应商品列表
	public Category findBabyGoods(Integer cat_id);
}
