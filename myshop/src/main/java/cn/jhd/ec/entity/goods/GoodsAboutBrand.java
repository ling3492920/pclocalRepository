package cn.jhd.ec.entity.goods;

import java.io.Serializable;

public class GoodsAboutBrand extends Good implements Serializable {
	private String brand_name;

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	
}
