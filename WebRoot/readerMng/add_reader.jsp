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


			function checkRname() {
				$("#rnameSpan").empty();
				
				if($.trim($("#rname").val()).length == 0) {
					$("#rnameSpan").append("&nbsp;<img src='img/no.png' />");
					return false;
				} else {
					$("#rnameSpan").append("&nbsp;<img src='img/ok.png' />");
					return true;
				}
			} 
			
			
/* 			function checkGender() {
				$("#genderSpan").empty();
				
				if($.trim($("#gender").val()).length == 0) {
					$("#genderSpan").append("&nbsp;<img src='img/no.png' />");
					return false;
				} else {
					$("#genderSpan").append("&nbsp;<img src='img/ok.png' />");
					return true;
				}
			} */
			
			function checkVocation() {
				$("#vocationSpan").empty();
				
				if($.trim($("#vocation").val()).length == 0) {
					$("#vocationSpan").append("&nbsp;<img src='img/no.png' />");
					return false;
				} else {
					$("#vocationSpan").append("&nbsp;<img src='img/ok.png' />");
					return true;
				}
			}
			
			
			function checkBirthday() {
				$("#birthdaySpan").empty();
				
				if($.trim($("#birthday").val()).length == 0) {
					$("#birthdaySpan").append("&nbsp;<img src='img/no.png' />");
					return false;
				} else {
					$("#birthdaySpan").append("&nbsp;<img src='img/ok.png' />");
					return true;
				}
			} 
			
			
/* 			function checkPapertype() {
				$("#papertypeSpan").empty();
				
				if($.trim($("#papertype").val()).length == 0) {
					$("#papertypeSpan").append("&nbsp;<img src='img/no.png' />");
					return false;
				} else {
					$("#papertypeSpan").append("&nbsp;<img src='img/ok.png' />");
					return true;
				}
			} */
			
			function checkPaperno() {
				$("#papernoSpan").empty();
				
				if($.trim($("#paperno").val()).length == 0) {
					$("#papernoSpan").append("&nbsp;<img src='img/no.png' />");
					return false;
				} else {
					$("#papernoSpan").append("&nbsp;<img src='img/ok.png' />");
					return true;
				}
			}
			
			function checkTel() {
				$("#telSpan").empty();
				
				if($.trim($("#tel").val()).length == 0) {
					$("#telSpan").append("&nbsp;<img src='img/no.png' />");
					return false;
				} else {
					$("#telSpan").append("&nbsp;<img src='img/ok.png' />");
					return true;
				}
			} 
			
			
			function checkEmail() {
				$("#emailSpan").empty();
				
				if($.trim($("#email").val()).length == 0) {
					$("#emailSpan").append("&nbsp;<img src='img/no.png' />");
					return false;
				} else {
					$("#emailSpan").append("&nbsp;<img src='img/ok.png' />");
					return true;
				}
			} 
			
			
			function checkCreatedate() {
				$("#createdateSpan").empty();
				
				if($.trim($("#createdate").val()).length == 0) {
					$("#createdateSpan").append("&nbsp;<img src='img/no.png' />");
					return false;
				} else {
					$("#createdateSpan").append("&nbsp;<img src='img/ok.png' />");
					return true;
				}
			} 
			
			
			function checkRtypeid() {
				$("#rtypeidSpan").empty();
				
				if(($.trim($("#rtypeid").val()).length == 0)||($("#rtypeid").val()==(-1))) {
					$("#rtypeidSpan").append("&nbsp;<img src='img/no.png' />");
					return false;
				} else {
					$("#rtypeidSpan").append("&nbsp;<img src='img/ok.png' />");
					return true;
				}
			} 
			
			
			function checkRemark() {
				$("#remarkSpan").empty();
				
				if($.trim($("#remark").val()).length == 0) {
					$("#remarkSpan").append("&nbsp;<img src='img/no.png' />");
					return false;
				} else {
					$("#remarkSpan").append("&nbsp;<img src='img/ok.png' />");
					return true;
				}
			} 
			
			function checkAll() {
				return checkRname() && checkVocation()&& checkBirthday()&& checkPaperno()&&checkTel()&&checkEmail()&&checkCreatedate()&&checkRtypeid()&&checkRemark();
			} 
			

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
		<input type="hidden" name="operator" value="${user.mname}" />

  <table align="center" width="50%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="27%" align="left" style="padding:5px;">读者姓名：</td>
    <td width="73%" align="left">
      <input name="rname" type="text" id="rname" value=""  size="30" onblur="checkRname();"><span id="rnameSpan"></span> </td>
    </tr>  
    <tr>
    <td align="left" style="padding:10px;">性别：</td>
    <td align="left">
      	男<input type="radio" name="gender" id="gender" value="1" checked="checked" />
                          女 <input type="radio" name="gender" id="gender" value="0" /> </td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">职业：</td>
      <td align="left"><input name="vocation" type="text" id="vocation" size="30" onblur="checkVocation();"><span id="vocationSpan"></span> </td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">生日：</td>
      <td align="left"><input name="birthday" type="date" id="birthday" size="30" onblur="checkBirthday();"><span id="birthdaySpan"></span></td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">证件类型：</td>
      <td align="left">
        <input name="papertype" id="papertype" type="text" value="身份证" size="30" readonly >
      </td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">证件号码：</td>
      <td align="left"><input name="paperno" type="text" id="paperno" size="30" onblur="checkPaperno();"><span id="papernoSpan"></span></td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">电话：</td>
      <td align="left"><input name="tel" type="text" id="tel" size="30" onblur="checkTel();"><span id="telSpan"></span></td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">email：</td>
      <td align="left"><input name="email" type="text" id="email" size="30" onblur="checkEmail();"><span id="emailSpan"></span></td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">办卡日期：</td>
      <td align="left"><input name="createdate" type="date" id="createdate" size="30" onblur="checkCreatedate();"><span id="createdateSpan"></span></td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">读者类型：</td>
      <td align="left">
      	<select id="rtypeid" name="rtypeid" onblur="checkRtypeid();"><span id="rtypeidSpan"></span>
      		<option value="-1" selected="selected">请选择</option>
      	</select>
      </td>
    </tr>
    <tr>
      <td align="left" style="padding:10px;">备注：</td>
      <td align="left"><textarea name="remark" id="remark" cols="30" rows="8" onblur="checkRemark();"></textarea><span id="remarkSpan"></span></td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td>		
	  <input type="submit" name="Submit" value="保存" class="button" onclick="return checkAll();"/>&nbsp;
	  <input type="reset" name="reset" value="重置" class="button" /></td>
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
