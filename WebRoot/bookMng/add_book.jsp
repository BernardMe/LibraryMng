<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<base href="${applicationScope.basePath}">
<title>图书馆管理系统</title>
<link href="css/style.css" rel="stylesheet">
<style>
   .greenSpan{
      color : green;
   }
   .redSpan{
      color : red;
   }
</style>
</head>
<script src = "js/jquery.min.js"></script>
<script language="javascript">
//获取书的类型
$(function(){
	$.getJSON("book.action",{"m":"queryAllType"},function(data){
		for(var i = 0; i < data.length;i++){
			$("#typeid").append(new Option(data[i].typename, data[i].typeid));
		}
	});
	
	//获取国际图书编号
	$.getJSON("book.action",{"m":"queryAllIsbn"},function(data){
		for(var i = 0; i < data.length;i++){
			$("#isbn").append(new Option(data[i].pubname, data[i].isbn));
		}
	});
	//获取书架
	$.getJSON("shelf.action",{"m":"query4shelf"},function(data){
		for(var i = 0; i < data.length;i++){
			$("#bookcaseid").append(new Option(data[i].shelfname, data[i].shelfid));
		}
	});
});
//校验图书名
	function checkName(){
		var bookname =$("#bookname").val();
		if(bookname==null||bookname.trim().length==0){
			$("#nameSpan").html("图书名称不能为空");
			$("#nameSpan").attr("class","redSpan");
			return false;
		}else{
			$("#nameSpan").html("ok");
			$("#nameSpan").attr("class","greenSpan");
			return true;
		}
	}
	//校验作者
	function checkAuthor(){
		var author =$("#author").val();
		if(author==null||author.trim().length==0){
			$("#AuthorSpan").html("作者不能为空");
			$("#AuthorSpan").attr("class","redSpan");
			return false;
		}else{
			$("#AuthorSpan").html("ok");
			$("#AuthorSpan").attr("class","greenSpan");
			return true;
		}
	}
	//校验翻译者
	function checkTr(){
		var translator =$("#translator").val();
		if(translator==null||translator.trim().length==0){
			$("#TrSpan").html("翻译者不能为空");
			$("#TrSpan").attr("class","redSpan");
			return false;
		}else{
			$("#TrSpan").html("ok");
			$("#TrSpan").attr("class","greenSpan");
			return true;
		}
	}
	//校验价格
	 function checkPrice(){
		var price = $("#price").val();
		var regex = /^\d{1,6}$/;
		if(price == null || price.trim().length == 0){
			$("#priceSpan").html("价格不能为空");
			$("#priceSpan").attr("class","redSpan");
			return false;
		}else if(regex.test(price)){
			$("#priceSpan").html("ok");
			$("#priceSpan").attr("class","greenSpan");
			return true;
		}else{
			$("#priceSpan").html("价格必须为数字");
			$("#priceSpan").attr("class","redSpan");
			return false;
		}
	}
	//校验页数
	 function checkPage(){
		var page = $("#page").val();
		var regex = /^\d+$/;
		if(page == null || page.trim().length == 0){
			$("#pageSpan").html("页数不能为空");
			$("#pageSpan").attr("class","redSpan");
			return false;
		}else if(regex.test(page)){
			$("#pageSpan").html("ok");
			$("#pageSpan").attr("class","greenSpan");
			return true;
		}else{
			$("#pageSpan").html("页数必须为数字");
			$("#pageSpan").attr("class","redSpan");
			return false;
		}
	}
	//校验typeid
	function checkTp(){
		var typeid= $("#typeid").val();
		if(typeid == -1){
			$("#tpSpan").html("必须选择一项");
			$("#tpSpan").attr("class","redSpan");
			return false;
		}else{
			$("#tpSpan").html("ok");
			$("#tpSpan").attr("class","greenSpan");
			return true;
		}
	}
	//校验isbn
	function checkIsbn(){
		var isbn= $("#isbn").val();
		if(isbn == -1){
			$("#isbnSpan").html("必须选择一项");
			$("#isbnSpan").attr("class","redSpan");
			return false;
		}else{
			$("#isbnSpan").html("ok");
			$("#isbnSpan").attr("class","greenSpan");
			return true;
		}
	}
	//校验书架
	function checkCase(){
		var bookcaseid= $("#bookcaseid").val();
		if(bookcaseid == -1){
			$("#caseSpan").html("必须选择一项");
			$("#caseSpan").attr("class","redSpan");
			return false;
		}else{
			$("#caseSpan").html("ok");
			$("#caseSpan").attr("class","greenSpan");
			return true;
		}
	}
	function checkAll(){
		var  flag1 = checkName()&checkCase()&checkIsbn();
		var flag2 = checkTp()&checkPage()&checkTr()&checkAuthor();
		if(flag1&flag2){
			return true;
		}else{
			return false;
		}
	}
	

</script>
<body onLoad="clockon(bgclock)">

<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：图书管理 &gt;图书信息添加&gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>
</table>  <form name="form1" method="post" action="book.action">
<input type="hidden" name="m" value = "addBook" />
  <table width="47%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <tr>
    <td align="left" style="padding:5px;">图书名称：</td>
    <td align="left">
    	<input name="bookname" type="text" id="bookname" size="20" onblur = "checkName();">&nbsp;<span id = "nameSpan"></span>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">图书类型：</td>
    <td align="left">
    	<select name="typeid" id="typeid" onblur = "checkTp();">
    	  <option value="-1">请选择图书类型</option>
    	</select><span id = "tpSpan"></span>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">图书作者：</td>
    <td align="left">
    	<input name="author" type="text" id="author" size="20" onblur = "checkAuthor();">&nbsp;<span id = "AuthorSpan"></span>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">翻译者：</td>
    <td align="left">
    	<input name="translator" type="text" id="translator" size="20" onblur = "checkTr();">&nbsp;<span id = "TrSpan"></span>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">国际图书编号：</td>
    <td align="left">
    	<select name="isbn" id="isbn" onblur = "checkIsbn();">
    	  <option value="-1">请选择出版社</option>
    	</select><span id = "isbnSpan"></span>
    </tr>
    
    <tr>
    <td align="left" style="padding:5px;">图书价格：</td>
    <td align="left">
    	<input name="price" type="text" id="price" size="20" onblur = "checkPrice();">&nbsp;<span id = "priceSpan"></span>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">总页数：</td>
    <td align="left">
    	<input name="page" type="text" id="page" size="20" onblur = "checkPage();">&nbsp;<span id = "pageSpan"></span>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">所属书架：</td>
    <td align="left">
    	<select name="bookcaseid" id="bookcaseid" onblur = "checkCase();">
    	   <option value="-1">请选择书架</option>
    	</select><span id= "caseSpan"></span>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">上架时间：</td>
    <td align="left">
    	<input name="inTime" type="date" id="inTime" size="20">&nbsp;<span id = "timeSpan"></span>
    </tr>
    
    <tr>
    <td align="left" style="padding:5px;">是否删除：</td>
    <td align="left">
    	<input name="del" type="radio" id="del" value="1"/>是
    	<input name="del" type="radio" id="del" value="0" checked/>否
    	
	</td>
    </tr>
    
    <tr>
    <td align="left" style="padding:5px;">操作员：</td>
    <td align="left">
    	<input name="operator" type="text" id="operator" size="20" value = "${ user.mname}" disabled>
    </tr>
    
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><input type="submit" name="Submit" value="保存" class="button" onclick = " return checkAll();" />
        &nbsp;
        <input type="reset" name="Submit" value="取消" class="button"/></td>
    </tr>
</table>
</form></td>
      </tr>
    </table>
</td>
  </tr>
</table>
<table width="778" height="66"  border="0" align="center" cellpadding="-2" cellspacing="-2" bgcolor="#FFFFFF">
      <tr>
        <td height="11" colspan="4" background="Images/copyright_t.gif"></td>
  </tr>
      <tr>
        <td width="124" height="23">&nbsp;</td>
        <td valign="bottom" align="center"> CopyRight &copy; 2008 www.**********.com 长春市*****有限公司</td>
        <td width="141">&nbsp;</td>
      </tr>
      <tr>
        <td height="23">&nbsp;</td>
        <td align="center">本站请使用IE6.0或以上版本 1024*768为最佳显示效果</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="8"></td>
        <td height="8"></td>
        <td height="8"></td>
      </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>