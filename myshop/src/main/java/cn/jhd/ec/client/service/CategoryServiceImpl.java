package cn.jhd.ec.client.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.jhd.ec.dao.goods.CategoryDao;
import cn.jhd.ec.entity.goods.Category;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.util.JsonResult;
@Service
public class CategoryServiceImpl implements CategoryService {
	@Resource
	private CategoryDao cd;
	
	public JsonResult findParentsCate() {
		List<Category> cats = cd.findParentsCate();
		if(cats.size()>0){
			return new JsonResult(cats);
		}
		return new JsonResult(1);
	}

	public JsonResult findBabyByParent_id(Integer parent_id) {
		if(parent_id!=null|parent_id!=0){
			//如果没有查到对应内容，可能会报空指针
			try{
				List<Category> babys = cd.findBabyByParent_id(parent_id);
				if(babys.size()>0){
					return new JsonResult(babys);
				}
			}catch (Exception e){
				return new JsonResult(new Throwable("对不起！某些类型不存在商品，暂时没有添加任何商品！"));
			}
		}
		return new JsonResult(1);
	}

	public JsonResult findBabyGoods(Integer cat_id) {
		if(cat_id!=null|cat_id!=0){
			//如果没有查到对应内容，可能会报空指针
			try{
				Category cat = cd.findBabyGoods(cat_id);
				List<Good> goods = cat.getGoods();
				if(goods.size()>0){
					return new JsonResult(goods);	
				}
			}catch (Exception e){
				return new JsonResult(new Throwable("对不起！该类型，暂时没有添加任何商品！"));
			}
		}
		return new JsonResult(1);
	}

}
