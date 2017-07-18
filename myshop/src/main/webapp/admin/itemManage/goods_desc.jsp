<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="tabbody-div">
      <form enctype="multipart/form-data" action="" method="post" name="theForm" onsubmit="return validate();">
        <!-- 最大文件限制 -->
        <input type="hidden" name="MAX_FILE_SIZE" value="2097152">
        <!-- 通用信息 -->
        <table width="90%" id="general-table" align="center" style="display: none;">
          <tbody><tr>
            <td class="label">商品名称：</td>
            <td><input type="text" name="goods_name" value="" style="float:left;color:;" size="30"><div style="background-color:;float:left;margin-left:2px;" id="font_color" onclick="ColorSelecter.Show(this);"><img src="../images/color_selecter.gif" style="margin-top:-1px;"></div><input type="hidden" id="goods_name_color" name="goods_name_color" value="">&nbsp;
            <select name="goods_name_style">
              <option value="">字体样式</option>
              <option value="strong">加粗</option><option value="em">斜体</option><option value="u">下划线</option><option value="strike">删除线</option>            </select>
            <span class="require-field">*</span></td>
          </tr>
          <tr>
            <td class="label">
            <a href="javascript:showNotice('noticeGoodsSN');" title="点击此处查看提示信息"><img src="../images/notice.gif" width="16" height="16" border="0" alt="点击此处查看提示信息"></a> 商品货号： </td>
            <td><input type="text" name="goods_sn" value="" size="20" onblur="checkGoodsSn(this.value,'0')"><span id="goods_sn_notice"></span><br>
            <span class="notice-span" style="display:block" id="noticeGoodsSN">如果您不输入商品货号，系统将自动生成一个唯一的货号。</span></td>
          </tr>
          <tr>
            <td class="label">商品分类：</td>
            <td><select name="cat_id" onchange="hideCatDiv()"><option value="0">请选择...</option><option value="16">书籍</option><option value="17">&nbsp;&nbsp;&nbsp;&nbsp;一千零一夜</option><option value="1">手机类型</option><option value="5">&nbsp;&nbsp;&nbsp;&nbsp;双模手机</option><option value="4">&nbsp;&nbsp;&nbsp;&nbsp;3G手机</option><option value="3">&nbsp;&nbsp;&nbsp;&nbsp;GSM手机</option><option value="2">&nbsp;&nbsp;&nbsp;&nbsp;CDMA手机</option><option value="12">充值卡</option><option value="15">&nbsp;&nbsp;&nbsp;&nbsp;联通手机充值卡</option><option value="14">&nbsp;&nbsp;&nbsp;&nbsp;移动手机充值卡</option><option value="13">&nbsp;&nbsp;&nbsp;&nbsp;小灵通/固话充值卡</option><option value="18">黑科技</option><option value="6">手机配件</option><option value="11">&nbsp;&nbsp;&nbsp;&nbsp;读卡器和内存卡</option><option value="9">&nbsp;&nbsp;&nbsp;&nbsp;电池</option><option value="8">&nbsp;&nbsp;&nbsp;&nbsp;耳机</option><option value="7">&nbsp;&nbsp;&nbsp;&nbsp;充电器</option></select>
                            <a href="javascript:void(0)" onclick="rapidCatAdd()" title="添加分类" class="special">添加分类</a>
              <span id="category_add" style="display:none;">
              <input class="text" size="10" name="addedCategoryName">
               <a href="javascript:void(0)" onclick="addCategory()" title=" 确定 " class="special"> 确定 </a>
               <a href="javascript:void(0)" onclick="return goCatPage()" title="分类管理" class="special">分类管理</a>
               <a href="javascript:void(0)" onclick="hideCatDiv()" title="隐藏" class="special">&lt;&lt;</a>
               </span>
                              <span class="require-field">*</span>            </td>
          </tr>
          <tr>
            <td class="label">扩展分类：</td>
            <td>
              <input type="button" value="添加" onclick="addOtherCat(this.parentNode)" class="button">
                          </td>
          </tr>
          <tr>
            <td class="label">商品品牌：</td>
            <td><select name="brand_id" onchange="hideBrandDiv()"><option value="0">请选择...</option><option value="1">诺基亚</option><option value="11">  恒基伟业</option><option value="10">金立</option><option value="9">联想</option><option value="8">LG</option><option value="7">索爱</option><option value="6">三星</option><option value="5">夏新</option><option value="4">飞利浦</option><option value="3">多普达</option><option value="2">摩托罗拉</option><option value="12">min</option></select>
                            <a href="javascript:void(0)" title="添加品牌" onclick="rapidBrandAdd()" class="special">添加品牌</a>
              <span id="brand_add" style="display:none;">
              <input class="text" size="15" name="addedBrandName">
               <a href="javascript:void(0)" onclick="addBrand()" class="special"> 确定 </a>
               <a href="javascript:void(0)" onclick="return goBrandPage()" title="品牌管理" class="special">品牌管理</a>
               <a href="javascript:void(0)" onclick="hideBrandDiv()" title="隐藏" class="special">&lt;&lt;</a>
               </span>
                           </td>
          </tr>
                   <tr>
            <td class="label">选择供货商：</td>
            <td><select name="suppliers_id" id="suppliers_id">
        <option value="0">不指定供货商属于本店商品</option>
        <option value="1">北京供货商</option><option value="2">上海供货商</option>      </select></td>
          </tr>
                   <tr>
            <td class="label">本店售价：</td>
            <td><input type="text" name="shop_price" value="0" size="20" onblur="priceSetted()">
            <input type="button" value="按市场价计算" onclick="marketPriceSetted()">
            <span class="require-field">*</span></td>
          </tr>
                    <tr>
            <td class="label"><a href="javascript:showNotice('noticeUserPrice');" title="点击此处查看提示信息"><img src="../images/notice.gif" width="16" height="16" border="0" alt="点击此处查看提示信息"></a>会员价格：</td>
            <td>
                            注册用户<span id="nrank_1"></span><input type="text" id="rank_1" name="user_price[]" value="-1" onkeyup="if(parseInt(this.value)<-1){this.value='-1';};set_price_note(1)" size="8">
              <input type="hidden" name="user_rank[]" value="1">
                            代销用户<span id="nrank_3"></span><input type="text" id="rank_3" name="user_price[]" value="-1" onkeyup="if(parseInt(this.value)<-1){this.value='-1';};set_price_note(3)" size="8">
              <input type="hidden" name="user_rank[]" value="3">
                            vip<span id="nrank_2"></span><input type="text" id="rank_2" name="user_price[]" value="-1" onkeyup="if(parseInt(this.value)<-1){this.value='-1';};set_price_note(2)" size="8">
              <input type="hidden" name="user_rank[]" value="2">
                            <br>
              <span class="notice-span" style="display:block" id="noticeUserPrice">会员价格为-1时表示会员价格按会员等级折扣率计算。你也可以为每个等级指定一个固定价格</span>
            </td>
          </tr>
          
          <!--商品优惠价格-->
          <tr>
            <td class="label"><a href="javascript:showNotice('volumePrice');" title="点击此处查看提示信息"><img src="../images/notice.gif" width="16" height="16" border="0" alt="点击此处查看提示信息"></a>商品优惠价格：</td>
            <td>
              <table width="100%" id="tbody-volume" align="center">
                                <tbody><tr>
                  <td>
                                            <a href="javascript:;" onclick="addVolumePrice(this)">[+]</a>
                                          优惠数量 <input type="text" name="volume_number[]" size="8" value="">
                     优惠价格 <input type="text" name="volume_price[]" size="8" value="">
                  </td>
                </tr>
                              </tbody></table>
              <span class="notice-span" style="display:block" id="volumePrice">购买数量达到优惠数量时享受的优惠价格</span>
            </td>
          </tr>
          <!--商品优惠价格 end -->

          <tr>
            <td class="label">市场售价：</td>
            <td><input type="text" name="market_price" value="0" size="20">
              <input type="button" value="取整数" onclick="integral_market_price()">
            </td>
          </tr>
          <tr>
            <td class="label"><a href="javascript:showNotice('giveIntegral');" title="点击此处查看提示信息"><img src="../images/notice.gif" width="16" height="16" border="0" alt="点击此处查看提示信息"></a> 赠送消费积分数：</td>
            <td><input type="text" name="give_integral" value="-1" size="20">
            <br><span class="notice-span" style="display:block" id="giveIntegral">购买该商品时赠送消费积分数,-1表示按商品价格赠送</span></td>
          </tr>
          <tr>
            <td class="label"><a href="javascript:showNotice('rankIntegral');" title="点击此处查看提示信息"><img src="../images/notice.gif" width="16" height="16" border="0" alt="点击此处查看提示信息"></a> 赠送等级积分数：</td>
            <td><input type="text" name="rank_integral" value="-1" size="20">
            <br><span class="notice-span" style="display:block" id="rankIntegral">购买该商品时赠送等级积分数,-1表示按商品价格赠送</span></td>
          </tr>
          <tr>
            <td class="label"><a href="javascript:showNotice('noticPoints');" title="点击此处查看提示信息"><img src="../images/notice.gif" width="16" height="16" border="0" alt="点击此处查看提示信息"></a> 积分购买金额：</td>
            <td><input type="text" name="integral" value="0" size="20" onblur="parseint_integral()" ;="">
              <br><span class="notice-span" style="display:block" id="noticPoints">(此处需填写金额)购买该商品时最多可以使用积分的金额</span>
            </td>
          </tr>
          <tr>
            <td class="label"><label for="is_promote"><input type="checkbox" id="is_promote" name="is_promote" value="1" onclick="handlePromote(this.checked);"> 促销价：</label></td>
            <td id="promote_3"><input type="text" id="promote_1" name="promote_price" value="0" size="20" disabled=""></td>
          </tr>
          <tr id="promote_4">
            <td class="label" id="promote_5">促销日期：</td>
            <td id="promote_6">
              <input name="promote_start_date" type="text" id="promote_start_date" size="12" value="2017-06-17" readonly="readonly"><input name="selbtn1" type="button" id="selbtn1" onclick="return showCalendar('promote_start_date', '%Y-%m-%d', false, false, 'selbtn1');" value="选择" class="button" disabled=""> - <input name="promote_end_date" type="text" id="promote_end_date" size="12" value="2017-07-17" readonly="readonly"><input name="selbtn2" type="button" id="selbtn2" onclick="return showCalendar('promote_end_date', '%Y-%m-%d', false, false, 'selbtn2');" value="选择" class="button" disabled="">
            </td>
          </tr>
          <tr>
            <td class="label">上传商品图片：</td>
            <td>
              <input type="file" name="goods_img" size="35">
                              <img src="../images/no.gif">
                            <br><input type="text" size="40" value="商品图片外部URL" style="color:#aaa;" onfocus="if (this.value == '商品图片外部URL'){this.value='http://';this.style.color='#000';}" name="goods_img_url">
            </td>
          </tr>
          <tr id="auto_thumb_1">
            <td class="label"> 上传商品缩略图：</td>
            <td id="auto_thumb_3">
              <input type="file" name="goods_thumb" size="35" disabled="">
                              <img src="../images/no.gif">
                            <br><input type="text" size="40" value="商品缩略图外部URL" style="color:#aaa;" onfocus="if (this.value == '商品缩略图外部URL'){this.value='http://';this.style.color='#000';}" name="goods_thumb_url" disabled="">
                            <br><label for="auto_thumb"><input type="checkbox" id="auto_thumb" name="auto_thumb" checked="true" value="1" onclick="handleAutoThumb(this.checked)">自动生成商品缩略图</label>            </td>
          </tr>
        </tbody></table>

        <!-- 详细描述 -->
        <table width="90%" id="detail-table" style="display: table;">
          <tbody><tr>
            <td><input type="hidden" id="goods_desc" name="goods_desc" value="" style="display:none"><input type="hidden" id="goods_desc___Config" value="" style="display:none"><iframe id="goods_desc___Frame" src="../includes/fckeditor/editor/fckeditor.html?InstanceName=goods_desc&amp;Toolbar=Normal" width="100%" height="320" frameborder="0" scrolling="no" style="margin: 0px; padding: 0px; border: 0px; width: 100%; height: 320px; background-image: none; background-color: transparent;"></iframe></td>
          </tr>
        </tbody></table>

        <!-- 其他信息 -->
        <table width="90%" id="mix-table" style="display:none" align="center">
                    <tbody><tr>
            <td class="label">商品重量：</td>
            <td><input type="text" name="goods_weight" value="" size="20"> <select name="weight_unit"><option value="1" selected="">千克</option><option value="0.001">克</option></select></td>
          </tr>
                              <tr>
            <td class="label">商品库存数量：</td>
            <td><input type="text" name="goods_number" value="1" size="20"></td>
          </tr>
          <tr>
            <td class="label">库存警告数量：</td>
            <td><input type="text" name="warn_number" value="1" size="20"></td>
          </tr>
                    <tr>
            <td class="label">加入推荐：</td>
            <td><input type="checkbox" name="is_best" value="1">精品 <input type="checkbox" name="is_new" value="1">新品 <input type="checkbox" name="is_hot" value="1">热销</td>
          </tr>
          <tr id="alone_sale_1">
            <td class="label" id="alone_sale_2">上架：</td>
            <td id="alone_sale_3"><input type="checkbox" name="is_on_sale" value="1" checked="checked"> 打勾表示允许销售，否则不允许销售。</td>
          </tr>
          <tr>
            <td class="label">能作为普通商品销售：</td>
            <td><input type="checkbox" name="is_alone_sale" value="1" checked="checked"> 打勾表示能作为普通商品销售，否则只能作为配件或赠品销售。</td>
          </tr>
          <tr>
            <td class="label">是否为免运费商品</td>
            <td><input type="checkbox" name="is_shipping" value="1"> 打勾表示此商品不会产生运费花销，否则按照正常运费计算。</td>
          </tr>
          <tr>
            <td class="label">商品关键词：</td>
            <td><input type="text" name="keywords" value="" size="40"> 用空格分隔</td>
          </tr>
          <tr>
            <td class="label">商品简单描述：</td>
            <td><textarea name="goods_brief" cols="40" rows="3"></textarea></td>
          </tr>
          <tr>
            <td class="label">
            <a href="javascript:showNotice('noticeSellerNote');" title="点击此处查看提示信息"><img src="../images/notice.gif" width="16" height="16" border="0" alt="点击此处查看提示信息"></a> 商家备注： </td>
            <td><textarea name="seller_note" cols="40" rows="3"></textarea><br>
            <span class="notice-span" style="display:block" id="noticeSellerNote">仅供商家自己看的信息</span></td>
          </tr>
        </tbody></table>

        <!-- 属性与规格 -->
                <table width="90%" id="properties-table" style="display:none" align="center">
          <tbody><tr>
              <td class="label"><a href="javascript:showNotice('noticeGoodsType');" title="点击此处查看提示信息"><img src="../images/notice.gif" width="16" height="16" border="0" alt="点击此处查看提示信息"></a>商品类型：</td>
              <td>
                <select name="goods_type" onchange="getAttrList(0)">
                  <option value="0">请选择商品类型</option>
                  <option value="1">书</option><option value="2">音乐</option><option value="3">电影</option><option value="4">手机</option><option value="5">笔记本电脑</option><option value="6">数码相机</option><option value="7">数码摄像机</option><option value="8">化妆品</option><option value="9">精品手机</option>                </select><br>
              <span class="notice-span" style="display:block" id="noticeGoodsType">请选择商品的所属类型，进而完善此商品的属性</span></td>
          </tr>
          <tr>
            <td id="tbody-goodsAttr" colspan="2" style="padding:0"><table width="100%" id="attrTable"></table></td>
          </tr>
        </tbody></table>
        
        <!-- 商品相册 -->
        <table width="90%" id="gallery-table" style="display:none" align="center">
          <!-- 图片列表 -->
          <tbody><tr>
            <td>
                          </td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <!-- 上传图片 -->
          <tr>
            <td>
              <a href="javascript:;" onclick="addImg(this)">[+]</a>
              图片描述 <input type="text" name="img_desc[]" size="20">
              上传文件 <input type="file" name="img_url[]">
            </td>
          </tr>
        </tbody></table>

        <!-- 关联商品 -->
        <table width="90%" id="linkgoods-table" style="display:none" align="center">
          <!-- 商品搜索 -->
          <tbody><tr>
            <td colspan="3">
              <img src="../images/icon_search.gif" width="26" height="22" border="0" alt="SEARCH">
              <select name="cat_id1"><option value="0">所有分类</option><option value="16">书籍</option><option value="17">&nbsp;&nbsp;&nbsp;&nbsp;一千零一夜</option><option value="1">手机类型</option><option value="5">&nbsp;&nbsp;&nbsp;&nbsp;双模手机</option><option value="4">&nbsp;&nbsp;&nbsp;&nbsp;3G手机</option><option value="3">&nbsp;&nbsp;&nbsp;&nbsp;GSM手机</option><option value="2">&nbsp;&nbsp;&nbsp;&nbsp;CDMA手机</option><option value="12">充值卡</option><option value="15">&nbsp;&nbsp;&nbsp;&nbsp;联通手机充值卡</option><option value="14">&nbsp;&nbsp;&nbsp;&nbsp;移动手机充值卡</option><option value="13">&nbsp;&nbsp;&nbsp;&nbsp;小灵通/固话充值卡</option><option value="18">黑科技</option><option value="6">手机配件</option><option value="11">&nbsp;&nbsp;&nbsp;&nbsp;读卡器和内存卡</option><option value="9">&nbsp;&nbsp;&nbsp;&nbsp;电池</option><option value="8">&nbsp;&nbsp;&nbsp;&nbsp;耳机</option><option value="7">&nbsp;&nbsp;&nbsp;&nbsp;充电器</option></select>
              <select name="brand_id1"><option value="0">所有品牌</option><option value="1">诺基亚</option><option value="11">  恒基伟业</option><option value="10">金立</option><option value="9">联想</option><option value="8">LG</option><option value="7">索爱</option><option value="6">三星</option><option value="5">夏新</option><option value="4">飞利浦</option><option value="3">多普达</option><option value="2">摩托罗拉</option><option value="12">min</option></select>
              <input type="text" name="keyword1">
              <input type="button" value=" 搜索 " class="button" onclick="searchGoods(sz1, 'cat_id1','brand_id1','keyword1')">
            </td>
          </tr>
          <!-- 商品列表 -->
          <tr>
            <th>可选商品</th>
            <th>操作</th>
            <th>跟该商品关联的商品</th>
          </tr>
          <tr>
            <td width="42%">
              <select name="source_select1" size="20" style="width:100%" ondblclick="sz1.addItem(false, 'add_link_goods', goodsId, this.form.elements['is_single'][0].checked)" multiple="true">
              </select>
            </td>
            <td align="center">
              <p><input name="is_single" type="radio" value="1" checked="checked">单向关联<br><input name="is_single" type="radio" value="0">双向关联</p>
              <p><input type="button" value=">>" onclick="sz1.addItem(true, 'add_link_goods', goodsId, this.form.elements['is_single'][0].checked)" class="button"></p>
              <p><input type="button" value=">" onclick="sz1.addItem(false, 'add_link_goods', goodsId, this.form.elements['is_single'][0].checked)" class="button"></p>
              <p><input type="button" value="<" onclick="sz1.dropItem(false, 'drop_link_goods', goodsId, elements['is_single'][0].checked)" class="button"></p>
              <p><input type="button" value="<<" onclick="sz1.dropItem(true, 'drop_link_goods', goodsId, elements['is_single'][0].checked)" class="button"></p>
            </td>
            <td width="42%">
              <select name="target_select1" size="20" style="width:100%" multiple="" ondblclick="sz1.dropItem(false, 'drop_link_goods', goodsId, elements['is_single'][0].checked)">
                              </select>
            </td>
          </tr>
        </tbody></table>

        <!-- 配件 -->
        <table width="90%" id="groupgoods-table" style="display:none" align="center">
          <!-- 商品搜索 -->
          <tbody><tr>
            <td colspan="3">
              <img src="../images/icon_search.gif" width="26" height="22" border="0" alt="SEARCH">
              <select name="cat_id2"><option value="0">所有分类</option><option value="16">书籍</option><option value="17">&nbsp;&nbsp;&nbsp;&nbsp;一千零一夜</option><option value="1">手机类型</option><option value="5">&nbsp;&nbsp;&nbsp;&nbsp;双模手机</option><option value="4">&nbsp;&nbsp;&nbsp;&nbsp;3G手机</option><option value="3">&nbsp;&nbsp;&nbsp;&nbsp;GSM手机</option><option value="2">&nbsp;&nbsp;&nbsp;&nbsp;CDMA手机</option><option value="12">充值卡</option><option value="15">&nbsp;&nbsp;&nbsp;&nbsp;联通手机充值卡</option><option value="14">&nbsp;&nbsp;&nbsp;&nbsp;移动手机充值卡</option><option value="13">&nbsp;&nbsp;&nbsp;&nbsp;小灵通/固话充值卡</option><option value="18">黑科技</option><option value="6">手机配件</option><option value="11">&nbsp;&nbsp;&nbsp;&nbsp;读卡器和内存卡</option><option value="9">&nbsp;&nbsp;&nbsp;&nbsp;电池</option><option value="8">&nbsp;&nbsp;&nbsp;&nbsp;耳机</option><option value="7">&nbsp;&nbsp;&nbsp;&nbsp;充电器</option></select>
              <select name="brand_id2"><option value="0">所有品牌</option><option value="1">诺基亚</option><option value="11">  恒基伟业</option><option value="10">金立</option><option value="9">联想</option><option value="8">LG</option><option value="7">索爱</option><option value="6">三星</option><option value="5">夏新</option><option value="4">飞利浦</option><option value="3">多普达</option><option value="2">摩托罗拉</option><option value="12">min</option></select>
              <input type="text" name="keyword2">
              <input type="button" value=" 搜索 " onclick="searchGoods(sz2, 'cat_id2', 'brand_id2', 'keyword2')" class="button">
            </td>
          </tr>
          <!-- 商品列表 -->
          <tr>
            <th>可选商品</th>
            <th>操作</th>
            <th>该商品的配件</th>
          </tr>
          <tr>
            <td width="42%">
              <select name="source_select2" size="20" style="width:100%" onchange="sz2.priceObj.value = this.options[this.selectedIndex].id" ondblclick="sz2.addItem(false, 'add_group_goods', goodsId, this.form.elements['price2'].value)">
              </select>
            </td>
            <td align="center">
              <p>价格<br><input name="price2" type="text" size="6"></p>
              <p><input type="button" value=">" onclick="sz2.addItem(false, 'add_group_goods', goodsId, this.form.elements['price2'].value)" class="button"></p>
              <p><input type="button" value="<" onclick="sz2.dropItem(false, 'drop_group_goods', goodsId, elements['is_single'][0].checked)" class="button"></p>
              <p><input type="button" value="<<" onclick="sz2.dropItem(true, 'drop_group_goods', goodsId, elements['is_single'][0].checked)" class="button"></p>
            </td>
            <td width="42%">
              <select name="target_select2" size="20" style="width:100%" multiple="" ondblclick="sz2.dropItem(false, 'drop_group_goods', goodsId, elements['is_single'][0].checked)">
                              </select>
            </td>
          </tr>
        </tbody></table>

        <!-- 关联文章 -->
        <table width="90%" id="article-table" style="display:none" align="center">
          <!-- 文章搜索 -->
          <tbody><tr>
            <td colspan="3">
              <img src="../images/icon_search.gif" width="26" height="22" border="0" alt="SEARCH">
              文章标题 <input type="text" name="article_title">
              <input type="button" value=" 搜索 " onclick="searchArticle()" class="button">
            </td>
          </tr>
          <!-- 文章列表 -->
          <tr>
            <th>可选文章</th>
            <th>操作</th>
            <th>跟该商品关联的文章</th>
          </tr>
          <tr>
            <td width="45%">
              <select name="source_select3" size="20" style="width:100%" multiple="" ondblclick="sz3.addItem(false, 'add_goods_article', goodsId, this.form.elements['price2'].value)">
              </select>
            </td>
            <td align="center">
              <p><input type="button" value=">>" onclick="sz3.addItem(true, 'add_goods_article', goodsId, this.form.elements['price2'].value)" class="button"></p>
              <p><input type="button" value=">" onclick="sz3.addItem(false, 'add_goods_article', goodsId, this.form.elements['price2'].value)" class="button"></p>
              <p><input type="button" value="<" onclick="sz3.dropItem(false, 'drop_goods_article', goodsId, elements['is_single'][0].checked)" class="button"></p>
              <p><input type="button" value="<<" onclick="sz3.dropItem(true, 'drop_goods_article', goodsId, elements['is_single'][0].checked)" class="button"></p>
            </td>
            <td width="45%">
              <select name="target_select3" size="20" style="width:100%" multiple="" ondblclick="sz3.dropItem(false, 'drop_goods_article', goodsId, elements['is_single'][0].checked)">
                              </select>
            </td>
          </tr>
        </tbody></table>

        <div class="button-div">
          <input type="hidden" name="goods_id" value="0">
                    <input type="submit" value=" 确定 " class="button">
          <input type="reset" value=" 重置 " class="button">
        </div>
        <input type="hidden" name="act" value="insert">
      </form>
    </div>
</body>
</html>