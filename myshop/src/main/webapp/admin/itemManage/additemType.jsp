<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECSHOP 管理中心 - 添加分类 </title>

<link href="../styles/general.css" rel="stylesheet" type="text/css">
<link href="../styles/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/transport.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script language="JavaScript">
<!--
// 这里把JS用到的所有语言都赋值到这里
var process_request = "正在处理您的请求...";
var todolist_caption = "记事本";
var todolist_autosave = "自动保存";
var todolist_save = "保存";
var todolist_clear = "清除";
var todolist_confirm_save = "是否将更改保存到记事本？";
var todolist_confirm_clear = "是否清空内容？";
var catname_empty = "分类名称不能为空!";
var unit_empyt = "数量单位不能为空!";
var is_leafcat = "您选定的分类是一个末级分类。\r\n新分类的上级分类不能是一个末级分类";
var not_leafcat = "您选定的分类不是一个末级分类。\r\n商品的分类转移只能在末级分类之间才可以操作。";
var filter_attr_not_repeated = "筛选属性不可重复";
var filter_attr_not_selected = "请选择筛选属性";
//-->
</script>
</head>
<body>

<h1>
<span class="action-span"><a href="category.php?act=list">商品分类</a></span>
<span class="action-span1"><a href="index.php?act=main">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 添加分类 </span>
<div style="clear:both"></div>
</h1>
<!-- start add new category form -->
<div class="main-div">
  <form action="category.php" method="post" name="theForm" enctype="multipart/form-data" onsubmit="return validate()">
  <table width="100%" id="general-table">
      <tbody><tr>
        <td class="label">分类名称:</td>
        <td>
          <input type="text" name="cat_name" maxlength="20" value="" size="27"> <font color="red">*</font>
        </td>
      </tr>
      <tr>
        <td class="label">上级分类:</td>
        <td>
          <select name="parent_id">
            <option value="0">顶级分类</option>
            <option value="16">书籍</option><option value="17">&nbsp;&nbsp;&nbsp;&nbsp;一千零一夜</option><option value="1">手机类型</option><option value="5">&nbsp;&nbsp;&nbsp;&nbsp;双模手机</option><option value="4">&nbsp;&nbsp;&nbsp;&nbsp;3G手机</option><option value="3">&nbsp;&nbsp;&nbsp;&nbsp;GSM手机</option><option value="2">&nbsp;&nbsp;&nbsp;&nbsp;CDMA手机</option><option value="12">充值卡</option><option value="15">&nbsp;&nbsp;&nbsp;&nbsp;联通手机充值卡</option><option value="14">&nbsp;&nbsp;&nbsp;&nbsp;移动手机充值卡</option><option value="13">&nbsp;&nbsp;&nbsp;&nbsp;小灵通/固话充值卡</option><option value="18">黑科技</option><option value="6">手机配件</option><option value="11">&nbsp;&nbsp;&nbsp;&nbsp;读卡器和内存卡</option><option value="9">&nbsp;&nbsp;&nbsp;&nbsp;电池</option><option value="8">&nbsp;&nbsp;&nbsp;&nbsp;耳机</option><option value="7">&nbsp;&nbsp;&nbsp;&nbsp;充电器</option>          </select>
        </td>
      </tr>

      <tr id="measure_unit">
        <td class="label">数量单位:</td>
        <td>
          <input type="text" name="measure_unit" value="" size="12">
        </td>
      </tr>
      <tr>
        <td class="label">排序:</td>
        <td>
          <input type="text" name="sort_order" value="50" size="15">
        </td>
      </tr>

      <tr>
        <td class="label">是否显示:</td>
        <td>
          <input type="radio" name="is_show" value="1" checked="true"> 是          <input type="radio" name="is_show" value="0"> 否        </td>
      </tr>
      <tr>
        <td class="label">是否显示在导航栏:</td>
        <td>
          <input type="radio" name="show_in_nav" value="1"> 是          <input type="radio" name="show_in_nav" value="0" checked="true"> 否        </td>
      </tr>
      <tr>
        <td class="label">设置为首页推荐:</td>
        <td>
          <input type="checkbox" name="cat_recommend[]" value="1"> 精品          <input type="checkbox" name="cat_recommend[]" value="2"> 最新          <input type="checkbox" name="cat_recommend[]" value="3"> 热门        </td>
      </tr>
      <tr>
        <td class="label"><a href="javascript:showNotice('noticeFilterAttr');" title="点击此处查看提示信息"><img src="../images/notice.gif" width="16" height="16" border="0" alt="您可以为每一个商品分类指定一个样式表文件。例如文件存放在 themes 目录下则输入：themes/style.css"></a>筛选属性:</td>
        <td>
          <script type="text/javascript">
          var arr = new Array();
          var sel_filter_attr = "请选择筛选属性";
                      arr[1] = new Array();
                                          arr[1][0] = ["出版社", 2];
                                                        arr[1][1] = ["出版日期", 4];
                                                        arr[1][2] = ["图书页数", 6];
                                                        arr[1][3] = ["图书规格", 8];
                                                        arr[1][4] = ["印张", 10];
                                                        arr[1][5] = ["所属分类", 12];
                                                        arr[1][6] = ["作者", 1];
                                                        arr[1][7] = ["图书书号/ISBN", 3];
                                                        arr[1][8] = ["开本", 5];
                                                        arr[1][9] = ["图书装订", 7];
                                                        arr[1][10] = ["版次", 9];
                                                        arr[1][11] = ["字数", 11];
                                                arr[2] = new Array();
                                          arr[2][0] = ["英文片名", 14];
                                                        arr[2][1] = ["介质/格式", 16];
                                                        arr[2][2] = ["国家地区", 18];
                                                        arr[2][3] = ["导演/指挥", 20];
                                                        arr[2][4] = ["所属类别", 22];
                                                        arr[2][5] = ["歌词", 24];
                                                        arr[2][6] = ["ISRC码", 26];
                                                        arr[2][7] = ["出版", 28];
                                                        arr[2][8] = ["引进号", 30];
                                                        arr[2][9] = ["中文片名", 13];
                                                        arr[2][10] = ["商品别名", 15];
                                                        arr[2][11] = ["片装数", 17];
                                                        arr[2][12] = ["语种", 19];
                                                        arr[2][13] = ["主唱", 21];
                                                        arr[2][14] = ["长度", 23];
                                                        arr[2][15] = ["碟片代码", 25];
                                                        arr[2][16] = ["发行公司", 27];
                                                        arr[2][17] = ["出版号", 29];
                                                        arr[2][18] = ["版权号", 31];
                                                arr[3] = new Array();
                                          arr[3][0] = ["中文片名", 32];
                                                        arr[3][1] = ["商品别名", 34];
                                                        arr[3][2] = ["碟片类型", 36];
                                                        arr[3][3] = ["国家地区", 38];
                                                        arr[3][4] = ["字幕", 40];
                                                        arr[3][5] = ["中文字幕", 42];
                                                        arr[3][6] = ["表演者", 44];
                                                        arr[3][7] = ["年份", 46];
                                                        arr[3][8] = ["区码", 48];
                                                        arr[3][9] = ["ISRC码", 50];
                                                        arr[3][10] = ["出版 ", 52];
                                                        arr[3][11] = ["引进号", 54];
                                                        arr[3][12] = ["英文片名", 33];
                                                        arr[3][13] = ["介质/格式", 35];
                                                        arr[3][14] = ["片装数", 37];
                                                        arr[3][15] = ["语种/配音", 39];
                                                        arr[3][16] = ["色彩", 41];
                                                        arr[3][17] = ["导演", 43];
                                                        arr[3][18] = ["所属类别", 45];
                                                        arr[3][19] = ["音频格式", 47];
                                                        arr[3][20] = ["碟片代码", 49];
                                                        arr[3][21] = ["发行公司", 51];
                                                        arr[3][22] = ["出版号", 53];
                                                        arr[3][23] = ["版权号", 55];
                                                arr[4] = new Array();
                                          arr[4][0] = ["网络制式", 56];
                                                        arr[4][1] = ["尺寸体积", 58];
                                                        arr[4][2] = ["主屏参数/内屏参数", 60];
                                                        arr[4][3] = ["清晰度", 62];
                                                        arr[4][4] = ["长度", 64];
                                                        arr[4][5] = ["厚度", 66];
                                                        arr[4][6] = ["内存容量", 68];
                                                        arr[4][7] = ["通话时间", 70];
                                                        arr[4][8] = ["标准配置", 72];
                                                        arr[4][9] = ["数据业务", 74];
                                                        arr[4][10] = ["随机配件", 76];
                                                        arr[4][11] = ["摄像头", 78];
                                                        arr[4][12] = ["红外/蓝牙", 80];
                                                        arr[4][13] = ["支持频率/网络频率", 57];
                                                        arr[4][14] = ["外观样式/手机类型", 59];
                                                        arr[4][15] = ["副屏参数/外屏参数", 61];
                                                        arr[4][16] = ["色数/灰度", 63];
                                                        arr[4][17] = ["宽度", 65];
                                                        arr[4][18] = ["屏幕材质", 67];
                                                        arr[4][19] = ["操作系统", 69];
                                                        arr[4][20] = ["待机时间", 71];
                                                        arr[4][21] = ["WAP上网", 73];
                                                        arr[4][22] = ["天线位置", 75];
                                                        arr[4][23] = ["铃声", 77];
                                                        arr[4][24] = ["彩信/彩e", 79];
                                                        arr[4][25] = ["价格等级", 81];
                                                arr[5] = new Array();
                                          arr[5][0] = ["型号", 82];
                                                        arr[5][1] = ["笔记本尺寸", 84];
                                                        arr[5][2] = ["处理器最高主频", 86];
                                                        arr[5][3] = ["系统总线", 88];
                                                        arr[5][4] = ["内存容量", 90];
                                                        arr[5][5] = ["硬盘", 92];
                                                        arr[5][6] = ["显示芯片", 94];
                                                        arr[5][7] = ["显卡显存", 96];
                                                        arr[5][8] = ["光驱类型", 98];
                                                        arr[5][9] = ["其他配置", 100];
                                                        arr[5][10] = ["详细规格", 83];
                                                        arr[5][11] = ["处理器类型", 85];
                                                        arr[5][12] = ["二级缓存", 87];
                                                        arr[5][13] = ["主板芯片组", 89];
                                                        arr[5][14] = ["内存类型", 91];
                                                        arr[5][15] = ["屏幕尺寸", 93];
                                                        arr[5][16] = ["标称频率", 95];
                                                        arr[5][17] = ["显卡类型", 97];
                                                        arr[5][18] = ["电池容量", 99];
                                                arr[6] = new Array();
                                          arr[6][0] = ["最大像素/总像素  ", 102];
                                                        arr[6][1] = ["光学变焦倍数", 104];
                                                        arr[6][2] = ["操作模式", 106];
                                                        arr[6][3] = ["显示屏尺寸", 108];
                                                        arr[6][4] = ["感光器件尺寸", 110];
                                                        arr[6][5] = ["图像分辨率", 112];
                                                        arr[6][6] = ["传感器尺寸", 114];
                                                        arr[6][7] = ["光圈", 116];
                                                        arr[6][8] = ["旋转液晶屏", 118];
                                                        arr[6][9] = ["存储卡", 120];
                                                        arr[6][10] = ["曝光控制", 122];
                                                        arr[6][11] = ["曝光补偿", 124];
                                                        arr[6][12] = ["连拍", 126];
                                                        arr[6][13] = ["闪光灯", 128];
                                                        arr[6][14] = ["自拍定时器", 130];
                                                        arr[6][15] = ["测光模式", 132];
                                                        arr[6][16] = ["短片拍摄", 134];
                                                        arr[6][17] = ["电源", 136];
                                                        arr[6][18] = ["外形尺寸", 138];
                                                        arr[6][19] = ["标准配件", 140];
                                                        arr[6][20] = ["类型", 101];
                                                        arr[6][21] = ["有效像素", 103];
                                                        arr[6][22] = ["数字变焦倍数", 105];
                                                        arr[6][23] = ["显示屏类型", 107];
                                                        arr[6][24] = ["感光器件", 109];
                                                        arr[6][25] = ["最高分辨率", 111];
                                                        arr[6][26] = ["传感器类型", 113];
                                                        arr[6][27] = ["镜头", 115];
                                                        arr[6][28] = ["焦距", 117];
                                                        arr[6][29] = ["存储介质", 119];
                                                        arr[6][30] = ["影像格式", 121];
                                                        arr[6][31] = ["曝光模式", 123];
                                                        arr[6][32] = ["白平衡", 125];
                                                        arr[6][33] = ["快门速度", 127];
                                                        arr[6][34] = ["拍摄范围", 129];
                                                        arr[6][35] = ["ISO感光度", 131];
                                                        arr[6][36] = ["场景模式", 133];
                                                        arr[6][37] = ["外接接口", 135];
                                                        arr[6][38] = ["电池使用时间", 137];
                                                        arr[6][39] = ["标配软件", 139];
                                                        arr[6][40] = ["兼容操作系统", 141];
                                                arr[7] = new Array();
                                          arr[7][0] = ["编号", 142];
                                                        arr[7][1] = ["外型尺寸", 144];
                                                        arr[7][2] = ["光学变焦倍数", 146];
                                                        arr[7][3] = ["显示屏尺寸及类型", 148];
                                                        arr[7][4] = ["感光器件尺寸", 150];
                                                        arr[7][5] = ["像素范围", 152];
                                                        arr[7][6] = ["传感器尺寸", 154];
                                                        arr[7][7] = ["取景器", 156];
                                                        arr[7][8] = ["镜头性能", 158];
                                                        arr[7][9] = ["曝光控制", 160];
                                                        arr[7][10] = ["随机存储", 162];
                                                        arr[7][11] = ["电池供电时间", 164];
                                                        arr[7][12] = ["类型", 143];
                                                        arr[7][13] = ["最大像素数", 145];
                                                        arr[7][14] = ["数字变焦倍数", 147];
                                                        arr[7][15] = ["感光器件", 149];
                                                        arr[7][16] = ["感光器件数量", 151];
                                                        arr[7][17] = ["传感器数量", 153];
                                                        arr[7][18] = ["水平清晰度", 155];
                                                        arr[7][19] = ["数码效果", 157];
                                                        arr[7][20] = ["对焦方式", 159];
                                                        arr[7][21] = ["其他接口", 161];
                                                        arr[7][22] = ["电池类型", 163];
                                                arr[8] = new Array();
                                          arr[8][0] = ["产品规格/容量", 166];
                                                        arr[8][1] = ["所属类别", 168];
                                                        arr[8][2] = ["适合肤质", 170];
                                                        arr[8][3] = ["产地", 165];
                                                        arr[8][4] = ["主要原料", 167];
                                                        arr[8][5] = ["使用部位", 169];
                                                        arr[8][6] = ["适用人群", 171];
                                                arr[9] = new Array();
                                          arr[9][0] = ["上市日期", 172];
                                                        arr[9][1] = ["存储卡格式", 180];
                                                        arr[9][2] = ["操作系统", 182];
                                                        arr[9][3] = ["尺寸体积", 184];
                                                        arr[9][4] = ["屏幕颜色", 186];
                                                        arr[9][5] = ["屏幕分辨率", 188];
                                                        arr[9][6] = ["中文输入法", 190];
                                                        arr[9][7] = ["网络链接", 192];
                                                        arr[9][8] = ["数据线接口", 194];
                                                        arr[9][9] = ["数码相机", 198];
                                                        arr[9][10] = ["传感器", 200];
                                                        arr[9][11] = ["视频拍摄", 202];
                                                        arr[9][12] = ["视频播放", 204];
                                                        arr[9][13] = ["收音机", 206];
                                                        arr[9][14] = ["闪光灯", 208];
                                                        arr[9][15] = ["配件", 210];
                                                        arr[9][16] = ["内存容量", 181];
                                                        arr[9][17] = ["K-JAVA", 183];
                                                        arr[9][18] = ["颜色", 185];
                                                        arr[9][19] = ["屏幕材质", 187];
                                                        arr[9][20] = ["屏幕大小", 189];
                                                        arr[9][21] = ["情景模式", 191];
                                                        arr[9][22] = ["蓝牙接口", 193];
                                                        arr[9][23] = ["电子邮件", 195];
                                                        arr[9][24] = ["办公功能", 197];
                                                        arr[9][25] = ["像素", 199];
                                                        arr[9][26] = ["变焦模式", 201];
                                                        arr[9][27] = ["MP3播放器", 203];
                                                        arr[9][28] = ["CPU频率", 205];
                                                        arr[9][29] = ["耳机接口", 207];
                                                        arr[9][30] = ["浏览器", 209];
                                                        arr[9][31] = ["手机制式", 173];
                                                        arr[9][32] = ["理论通话时间", 174];
                                                        arr[9][33] = ["理论待机时间", 175];
                                                        arr[9][34] = ["铃声", 176];
                                                        arr[9][35] = ["铃声格式", 177];
                                                        arr[9][36] = ["外观样式", 178];
                                                        arr[9][37] = ["中文短消息", 179];
                                                        arr[9][38] = ["闹钟", 196];
                                    
          function changeCat(obj)
          {
            var key = obj.value;
            var sel = window.ActiveXObject ? obj.parentNode.childNodes[4] : obj.parentNode.childNodes[5];
            sel.length = 0;
            sel.options[0] = new Option(sel_filter_attr, 0);
            if (arr[key] == undefined)
            {
              return;
            }
            for (var i= 0; i < arr[key].length ;i++ )
            {
              sel.options[i+1] = new Option(arr[key][i][0], arr[key][i][1]);
            }

          }

          </script>

         
          <table width="100%" id="tbody-attr" align="center">
                        <tbody><tr>
              <td>   
                   <a href="javascript:;" onclick="addFilterAttr(this)">[+]</a> 
                   <select onchange="changeCat(this)"><option value="0">请选择商品类型</option><option value="1">书</option><option value="2">音乐</option><option value="3">电影</option><option value="4">手机</option><option value="5">笔记本电脑</option><option value="6">数码相机</option><option value="7">数码摄像机</option><option value="8">化妆品</option><option value="9">精品手机</option></select>&nbsp;&nbsp;
                   <select name="filter_attr[]"><option value="0">请选择筛选属性</option></select><br>                   
              </td>
            </tr> 
                       
                      </tbody></table>

          <span class="notice-span" style="display:block" id="noticeFilterAttr">筛选属性可在前分类页面筛选商品</span>
        </td>
      </tr>
      <tr>
        <td class="label"><a href="javascript:showNotice('noticeGrade');" title="点击此处查看提示信息"><img src="../images/notice.gif" width="16" height="16" border="0" alt="您可以为每一个商品分类指定一个样式表文件。例如文件存放在 themes 目录下则输入：themes/style.css"></a>价格区间个数:</td>
        <td>
          <input type="text" name="grade" value="0" size="40"> <br>
          <span class="notice-span" style="display:block" id="noticeGrade">该选项表示该分类下商品最低价与最高价之间的划分的等级个数，填0表示不做分级，最多不能超过10个。</span>
        </td>
      </tr>
      <tr>
        <td class="label"><a href="javascript:showNotice('noticeGoodsSN');" title="点击此处查看提示信息"><img src="../images/notice.gif" width="16" height="16" border="0" alt="您可以为每一个商品分类指定一个样式表文件。例如文件存放在 themes 目录下则输入：themes/style.css"></a>分类的样式表文件:</td>
        <td>
          <input type="text" name="style" value="" size="40"> <br>
          <span class="notice-span" style="display:block" id="noticeGoodsSN">您可以为每一个商品分类指定一个样式表文件。例如文件存放在 themes 目录下则输入：themes/style.css</span>
        </td>
      </tr>
      <tr>
        <td class="label">关键字:</td>
        <td><input type="text" name="keywords" value="" size="50">
        </td>
      </tr>

      <tr>
        <td class="label">分类描述:</td>
        <td>
          <textarea name="cat_desc" rows="6" cols="48"></textarea>
        </td>
      </tr>
      </tbody></table>
      <div class="button-div">
        <input type="submit" value=" 确定 ">
        <input type="reset" value=" 重置 ">
      </div>
    <input type="hidden" name="act" value="insert">
    <input type="hidden" name="old_cat_name" value="">
    <input type="hidden" name="cat_id" value="">
  </form>
</div>
<script type="text/javascript" src="../js/utils.js"></script>
<script type="text/javascript" src="../js/validator.js"></script>
<script language="JavaScript">
<!--
document.forms['theForm'].elements['cat_name'].focus();
/**
 * 检查表单输入的数据
 */
function validate()
{
  validator = new Validator("theForm");
  validator.required("cat_name",      catname_empty);
  if (parseInt(document.forms['theForm'].elements['grade'].value) >10 || parseInt(document.forms['theForm'].elements['grade'].value) < 0)
  {
    validator.addErrorMsg('价格分级数量只能是0-10之内的整数');
  }
  return validator.passed();
}
onload = function()
{
  // 开始检查订单
  startCheckOrder();
}

/**
 * 新增一个筛选属性
 */
function addFilterAttr(obj)
{
  var src = obj.parentNode.parentNode;
  var tbl = document.getElementById('tbody-attr');

  var validator  = new Validator('theForm');
  var filterAttr = document.getElementsByName("filter_attr[]");

  if (filterAttr[filterAttr.length-1].selectedIndex == 0)
  {
    validator.addErrorMsg(filter_attr_not_selected);
  }
  
  for (i = 0; i < filterAttr.length; i++)
  {
    for (j = i + 1; j <filterAttr.length; j++)
    {
      if (filterAttr.item(i).value == filterAttr.item(j).value)
      {
        validator.addErrorMsg(filter_attr_not_repeated);
      } 
    } 
  }

  if (!validator.passed())
  {
    return false;
  }

  var row  = tbl.insertRow(tbl.rows.length);
  var cell = row.insertCell(-1);
  cell.innerHTML = src.cells[0].innerHTML.replace(/(.*)(addFilterAttr)(.*)(\[)(\+)/i, "$1removeFilterAttr$3$4-");
  filterAttr[filterAttr.length-1].selectedIndex = 0;
}

/**
 * 删除一个筛选属性
 */
function removeFilterAttr(obj)
{
  var row = rowindex(obj.parentNode.parentNode);
  var tbl = document.getElementById('tbody-attr');

  tbl.deleteRow(row);
}
//-->
</script>

<div id="footer">
共执行 3 个查询，用时 0.018994 秒，Gzip 已禁用，内存占用 2.029 MB<br>
版权所有 © 2005-2009 上海商派网络科技有限公司，并保留所有权利。</div>
<!-- 新订单提示信息 -->
<div id="popMsg">
  <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#cfdef4" border="0">
  <tbody><tr>
    <td style="color: #0f2c8c" width="30" height="24"></td>
    <td style="font-weight: normal; color: #1f336b; padding-top: 4px;padding-left: 4px" valign="center" width="100%"> 新订单通知</td>
    <td style="padding-top: 2px;padding-right:2px" valign="center" align="right" width="19"><span title="关闭" style="cursor: hand;cursor:pointer;color:red;font-size:12px;font-weight:bold;margin-right:4px;" onclick="Message.close()">×</span><!-- <img title=关闭 style="cursor: hand" onclick=closediv() hspace=3 src="msgclose.jpg"> --></td>
  </tr>
  <tr>
    <td style="padding-right: 1px; padding-bottom: 1px" colspan="3" height="70">
    <div id="popMsgContent">
      <p>您有 <strong style="color:#ff0000" id="spanNewOrder">1</strong> 个新订单以及       <strong style="color:#ff0000" id="spanNewPaid">0</strong> 个新付款的订单</p>
      <p align="center" style="word-break:break-all"><a href="order.php?act=list"><span style="color:#ff0000">点击查看新订单</span></a></p>
    </div>
    </td>
  </tr>
  </tbody></table>
</div>

<!--
<embed src="../images/online.wav" width="0" height="0" autostart="false" name="msgBeep" id="msgBeep" enablejavascript="true"/>
-->
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0" id="msgBeep" width="1" height="1">
  <param name="movie" value="../images/online.swf">
  <param name="quality" value="high">
  <embed src="../images/online.swf" name="msgBeep" id="msgBeep" quality="high" width="0" height="0" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash">
  
</object>

<script language="JavaScript">
document.onmousemove=function(e)
{
  var obj = Utils.srcElement(e);
  if (typeof(obj.onclick) == 'function' && obj.onclick.toString().indexOf('listTable.edit') != -1)
  {
    obj.title = '点击修改内容';
    obj.style.cssText = 'background: #278296;';
    obj.onmouseout = function(e)
    {
      this.style.cssText = '';
    }
  }
  else if (typeof(obj.href) != 'undefined' && obj.href.indexOf('listTable.sort') != -1)
  {
    obj.title = '点击对列表排序';
  }
}
<!--


var MyTodolist;
function showTodoList(adminid)
{
  if(!MyTodolist)
  {
    var global = $import("../js/global.js","js");
    global.onload = global.onreadystatechange= function()
    {
      if(this.readyState && this.readyState=="loading")return;
      var md5 = $import("js/md5.js","js");
      md5.onload = md5.onreadystatechange= function()
      {
        if(this.readyState && this.readyState=="loading")return;
        var todolist = $import("js/todolist.js","js");
        todolist.onload = todolist.onreadystatechange = function()
        {
          if(this.readyState && this.readyState=="loading")return;
          MyTodolist = new Todolist();
          MyTodolist.show();
        }
      }
    }
  }
  else
  {
    if(MyTodolist.visibility)
    {
      MyTodolist.hide();
    }
    else
    {
      MyTodolist.show();
    }
  }
}

if (Browser.isIE)
{
  onscroll = function()
  {
    //document.getElementById('calculator').style.top = document.body.scrollTop;
    document.getElementById('popMsg').style.top = (document.body.scrollTop + document.body.clientHeight - document.getElementById('popMsg').offsetHeight) + "px";
  }
}

if (document.getElementById("listDiv"))
{
  document.getElementById("listDiv").onmouseover = function(e)
  {
    obj = Utils.srcElement(e);

    if (obj)
    {
      if (obj.parentNode.tagName.toLowerCase() == "tr") row = obj.parentNode;
      else if (obj.parentNode.parentNode.tagName.toLowerCase() == "tr") row = obj.parentNode.parentNode;
      else return;

      for (i = 0; i < row.cells.length; i++)
      {
        if (row.cells[i].tagName != "TH") row.cells[i].style.backgroundColor = '#F4FAFB';
      }
    }

  }

  document.getElementById("listDiv").onmouseout = function(e)
  {
    obj = Utils.srcElement(e);

    if (obj)
    {
      if (obj.parentNode.tagName.toLowerCase() == "tr") row = obj.parentNode;
      else if (obj.parentNode.parentNode.tagName.toLowerCase() == "tr") row = obj.parentNode.parentNode;
      else return;

      for (i = 0; i < row.cells.length; i++)
      {
          if (row.cells[i].tagName != "TH") row.cells[i].style.backgroundColor = '#FFF';
      }
    }
  }

  document.getElementById("listDiv").onclick = function(e)
  {
    var obj = Utils.srcElement(e);

    if (obj.tagName == "INPUT" && obj.type == "checkbox")
    {
      if (!document.forms['listForm'])
      {
        return;
      }
      var nodes = document.forms['listForm'].elements;
      var checked = false;

      for (i = 0; i < nodes.length; i++)
      {
        if (nodes[i].checked)
        {
           checked = true;
           break;
         }
      }

      if(document.getElementById("btnSubmit"))
      {
        document.getElementById("btnSubmit").disabled = !checked;
      }
      for (i = 1; i <= 10; i++)
      {
        if (document.getElementById("btnSubmit" + i))
        {
          document.getElementById("btnSubmit" + i).disabled = !checked;
        }
      }
    }
  }

}

//-->
</script>

</body></html>ody>
</html>