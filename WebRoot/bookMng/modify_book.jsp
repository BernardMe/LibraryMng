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
			if(data[i].typeid == "${param.typeid}"){
			$("#typeid").append(new Option(data[i].typename, data[i].typeid,true,true));
			}else{
				$("#typeid").append(new Option(data[i].typename, data[i].typeid));
			}
		}
	});
	
	//获取国际图书编号
	$.getJSON("book.action",{"m":"queryAllIsbn"},function(data){
		for(var i = 0; i < data.length;i++){
			if(data[i].isbn == "${param.isbn}"){
			    $("#isbn").append(new Option(data[i].pubname, data[i].isbn,true,true));
			}else{
				$("#isbn").append(new Option(data[i].pubname, data[i].isbn));
			}
		}
	});
	//获取书架
	 $.getJSON("shelf.action",{"m":"query4shelf"},function(data){
		for(var i = 0; i < data.length;i++){
		if(data[i].shelfid == "${param.shelf}"){
			$("#bookcaseid").append(new Option(data[i].shelfname, data[i].shelfid,true,true));
		}else{
			$("#bookcaseid").append(new Option(data[i].shelfname, data[i].shelfid));
		  }
		}
	}); 
	
});
//给保存绑定事件
function bindClick(){
	if(checkAll()){
		var result = window.confirm("确定修改吗？");
		if(result){
			var param = {"m":"updateBookInfo","bookid":"${param.bookid}","typeid":$("#typeid").val(),"shelfid":$("#shelfid").val(),
						  "bookname":$("#bookname").val(),"isbn":$("#isbn").val()};
			$.get("book.action",param,function(data){
				if(data == "success"){
					alert("修改成功");
					window.opener.location = "book.action?m=queryAllBook";
					window.close();
				}else{
					alert("修改失败");
				}
			});
		}
	}
}
//校验图书名
function checkName(){
	var bookname =$("#bookname").val();
	if(bookname==null||bookname.trim().length==0){
		$("#nameSpan").html("图书名称不能为空");
		$("#nameSpan").attr("class","redSpan");
	}else{
		$("#nameSpan").html("ok");
		$("#nameSpan").attr("class","greenSpan");
	}
}
//校验typeid
function checkTp(){
	var typeid= $("#typeid").val();
	if(typeid == -1){
		$("#tpSpan").html("必须选择一项");
		$("#tpSpan").attr("class","redSpan");
	}else{
		$("#tpSpan").html("ok");
		$("#tpSpan").attr("class","greenSpan");
	}
}
//校验isbn
function checkIsbn(){
	var isbn= $("#isbn").val();
	if(isbn == -1){
		$("#isbnSpan").html("必须选择一项");
		$("#isbnSpan").attr("class","redSpan");
	}else{
		$("#isbnSpan").html("ok");
		$("#isbnSpan").attr("class","greenSpan");
	}
}
//校验书架
function checkCase(){
	var bookcaseid= $("#bookcaseid").val();
	if(bookcaseid == -1){
		$("#caseSpan").html("必须选择一项");
		$("#caseSpan").attr("class","redSpan");
	}else{
		$("#caseSpan").html("ok");
		$("#caseSpan").attr("class","greenSpan");
	}
}
function checkAll(){
	var flag = checkName()&checkCase()&checkIsbn()&checkTp();
	if(flag){
		return true;
	}else{
		return false;
	}
}

</script>
<body>

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
  <table width="47%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="27%" align="left" style="padding:5px;">条形码：</td>
    <td width="73%" align="left">
      <input name="barcode" type="text" id="barcode" size="30" value = "${param.bookid}" disabled>    
    </td>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">图书名称：</td>
    <td align="left">
    	<input name="bookname" type="text" id="bookname" size="20" value="${param.bookname}" onblur = "checkName();">&nbsp;<span id = "nameSpan"></span>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">图书类型：</td>
    <td align="left">
    	<select name="typeid" id="typeid" onblur= "checkTp();">
    	  <option value="-1">请选择图书类型</option>
    	</select><span id = "tpSpan"></span>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">国际图书编号：</td>
    <td align="left">
    	<select name="isbn" id="isbn" onblur = "checkIsbn();">
    	  <option value="-1">请选择出版社</option>
    	</select><span id = "isbnSpan"></span>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">所属书架：</td>
    <td align="left">
    	<select name="bookcaseid" id="bookcaseid" onblur = "checkCase();">
    	   <option value="-1">请选择书架</option>
    	</select><span id = "caseSpan"></span>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><input type="button" name="Submit" value="保存" class="button" id = "btn" onclick = "bindClick();"/>
        &nbsp;
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