

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<base href="${applicationScope.basePath}">
<title>图书馆管理系统</title>
<link href="css/style.css" rel="stylesheet">
</head>
<script language="javascript">


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
</table>  <form name="form1" method="post" action="manager.do?action=modifypwd">
  <table width="47%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="27%" align="left" style="padding:5px;">条形码：</td>
    <td width="73%" align="left">
      <input name="barcode" type="text" id="barcode" size="30">    
    </td>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">图书名称：</td>
    <td align="left">
    	<input name="bookname" type="text" id="bookname" size="30">
    </tr>
    <tr>
    <td align="left" style="padding:5px;">图书类型：</td>
    <td align="left">
    	<select name="typeid" id="typeid">
    	  <option value="-1">请选择图书类型</option>
    	</select>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">图书作者：</td>
    <td align="left">
    	<input name="author" type="text" id="author" size="30">
    </tr>
    <tr>
    <td align="left" style="padding:5px;">翻译者：</td>
    <td align="left">
    	<input name="translator" type="text" id="translator" size="30">
    </tr>
    <tr>
    <td align="left" style="padding:5px;">国际图书编号：</td>
    <td align="left">
    	<select name="isbn" id="isbn">
    	  <option value="-1">请选择出版社</option>
    	</select>
    </tr>
    
    <tr>
    <td align="left" style="padding:5px;">图书价格：</td>
    <td align="left">
    	<input name="price" type="text" id="price" size="30">
    </tr>
    <tr>
    <td align="left" style="padding:5px;">总页数：</td>
    <td align="left">
    	<input name="page" type="text" id="page" size="30">
    </tr>
    <tr>
    <td align="left" style="padding:5px;">所属书架：</td>
    <td align="left">
    	<select name="bookcaseid" id="bookcaseid">
    	   <option value="-1">请选择书架</option>
    	</select>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">上架时间：</td>
    <td align="left">
    	<input name="inTime" type="date" id="inTime" size="30">
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
    	<input name="operator" type="text" id="operator" size="30">
    </tr>
    
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><input type="button" name="Submit" value="保存" class="button" onclick="window.location.href = 'success.html'" />
        &nbsp;
        <input type="reset" name="Submit" value="取消" class="button" onclick="window.location.href = 'success.html'" /></td>
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