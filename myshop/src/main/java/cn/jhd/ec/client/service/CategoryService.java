package cn.jhd.ec.client.service;

import cn.jhd.ec.util.JsonResult;

public interface CategoryService {
	//2.查询所有顶级分类//关联查询到所属子级分类
	public JsonResult findParentsCate();
	
	//3.根据一个顶级分类cat_id，下的所有子集分类
	public JsonResult findBabyByParent_id(Integer Parent_id);
	
	//4.通过一个子集分类，关联查询到该子集分类对应商品列表
	public JsonResult findBabyGoods(Integer cat_id);
}
