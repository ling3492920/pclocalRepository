package cn.jhd.ec.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.jhd.ec.entity.goods.Good;

@Controller
@RequestMapping
public class TestController {
	@RequestMapping("/test.do")
	public String fileUpload(Good good,@RequestParam("goodsa") MultipartFile goodsa ,Model model){
		
		System.out.println(good.getGoods_id()+":"+good.getGoods_name()+":"+goodsa.getOriginalFilename());
		model.addAttribute("good", good);
		return "success";
	}
}
