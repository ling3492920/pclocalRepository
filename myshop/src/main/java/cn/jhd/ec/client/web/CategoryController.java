package cn.jhd.ec.client.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jhd.ec.client.service.CategoryService;
import cn.jhd.ec.util.JsonResult;

@Controller
@RequestMapping("/cat")
public class CategoryController {
	@Resource
	private CategoryService cs;
	
	@RequestMapping("/findall.do")
	@ResponseBody
	public JsonResult findall(){
		return cs.findParentsCate();
	}
	
	@RequestMapping("/findbabys.do")
	@ResponseBody
	public JsonResult findbabys(Integer cat_id){
		//说明：页面传来的顶级分类id将作为查询其子类的父类id被使用
		int parent_id=cat_id;
		return cs.findBabyByParent_id(parent_id);
	}
	
	@RequestMapping("/findGoodsByCat_id.do")
	@ResponseBody
	public JsonResult findGoodsByCat_id(Integer cat_id){
		return cs.findBabyGoods(cat_id);
	}
}
