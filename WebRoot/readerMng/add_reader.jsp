<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<base href="${applicationScope.basePath}">

<title>图书馆管理系统</title>
<link href="css/style.css" rel="stylesheet">



<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">

		$(function() {
			$.getJSON("reader.action", {
				"m" : "queryReaderType4Ajax"
			}, function(json) {
				for (var i = 0; i < json.length; i++) {
					$("#rtypeid").append(new Option(json[i].rtypename, json[i].rtypeid));
				}
			});
		});
</script>
	
</head>

<body>

<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：新增读者 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>

</table>  
	<form name="form1" method="post" action="reader.action">
	<input type="hidden" name="m" value="addReader" />

  <table align="center" width="50%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="27%" align="left" style="padding:5px;">读者姓名：</td>
    <td width="73%" align="left">
      <input name="rname" type="text" id="rname" value=""  size="30">    </td>
    </tr>  
    <tr>
    <td align="left" style="padding:10px;">性别：</td>
    <td align="left">
      	男<input type="radio" name="gender" id="gender" value="1" checked="checked"/> 
                          女 <input type="radio" name="gender" id="gender" value="0" /> </td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">职业：</td>
      <td align="left"><input name="vocation" type="text" id="vocation" size="30"></td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">生日：</td>
      <td align="left"><input name="birthday" type="date" id="birthday" size="30"></td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">证件类型：</td>
      <td align="left">
      	<select name="paperType" id="paperType">

      		<option value="1" selected="selected">身份证</option>
      		<option value="2" >签证</option>
      		<option value="3" >护照</option>
      		<option value="4" >港澳通行证</option>
      	</select>
      </td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">证件号码：</td>
      <td align="left"><input name="paperno" type="text" id="paperno" size="30"></td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">电话：</td>
      <td align="left"><input name="tel" type="text" id="tel" size="30"></td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">email：</td>
      <td align="left"><input name="email" type="text" id="email" size="30"></td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">办卡日期：</td>
      <td align="left"><input name="createdate" type="date" id="createdate" size="30"></td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">读者类型：</td>
      <td align="left">
      	<select name="rtypeid" >
      		<option value="-1" selected="selected">请选择</option>
      	</select>
      </td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">备注：</td>
      <td align="left"><textarea name="remark" id="remark" cols="30" rows="8"></textarea></td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td>		
	  <input type="submit" name="Submit" value="保存" class="button" />&nbsp;
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
