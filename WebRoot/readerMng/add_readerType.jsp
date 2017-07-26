<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<base href="${applicationScope.basePath}">
	
<title>图书馆管理系统</title>
<link href="css/style.css" rel="stylesheet">
</head>


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">

	function checkRtypename() {
		$("#rtypenameSpan").empty();
		
		if($.trim($("#rtypename").val()).length == 0) {
			$("#rtypenameSpan").append("&nbsp;<img src='img/no.png' />");
			return false;
		} else {
			$("#rtypenameSpan").append("&nbsp;<img src='img/ok.png' />");
			return true;
		}
	} 
	
	
		function checkCount() {
		$("#countSpan").empty();
		
		if($.trim($("#count").val()).length == 0) {
			$("#countSpan").append("&nbsp;<img src='img/no.png' />");
			return false;
		} else {
			$("#countSpan").append("&nbsp;<img src='img/ok.png' />");
			return true;
		}
	} 
	
	
		function checkAll() {
		return checkRtypename() && checkCount();
	} 
	

</script>

<body>

<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：添加读者类型 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>
</table>  
<form name="form1" method="post" action="reader.action">
	<input type="hidden" name="m" value="addReaderType" />

  <table width="47%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="27%" align="left" style="padding:5px;">读者类型名称：</td>
    <td width="73%" align="left">
      <input name="rtypename" type="text" id="rtypename" size="30" onblur="checkRtypename();"><span id="rtypenameSpan"></span></td>
    <tr>
    <td align="left" style="padding:5px;">可借阅数量：</td>
    <td align="left"><input name="count" type="text" id="count" size="30" onblur="checkCount();"><span id="countSpan"></span>
      </td>
    </tr>
    
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td>
   
      <input type="submit" name="Submit" value="保存" class="button" onclick = "return checkAll();"/>&nbsp;
	  <input type="reset" name="reset" value="取消" class="button" /></td>
    </tr>
</table>
</form></td>
      </tr>
    </table>
</td>
  </tr>
</table>

</td>
  </tr>
</table>
</body>
</html>

