package cn.jhd.ec.dao.relation;

import cn.jhd.ec.entity.relation.GoodsCat;

public interface GoodsCatDao {
	public GoodsCat findByCatId(Integer id);
	public GoodsCat findByGoodsId(Integer id);
	
	
}
