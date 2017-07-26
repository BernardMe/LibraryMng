<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<base href="${applicationScope.basePath}">
	
	<title>图书馆管理系统</title>
	<link href="css/style.css" rel="stylesheet">


	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
	
	
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
		
		
	function checkAll() {
		return checkRname() && checkVocation()&& checkBirthday()&& checkPaperno()&&checkTel()&&checkEmail();
	} 
		
	
		$(function() {

			$("#save").bind("click", function() {
				var result = window.confirm("确定修改吗?");
				if(result) {
					
					var params = {
							"m" : "updateReader",
							"rid" : "${param.rid}",
							"rname" : $("#rname").val(),
							"gender" : $(":radio:checked").val(),
							"vocation" : $("#vocation").val(),
							"birthday" : $("#birthday").val(),
							"papertype" : $("#papertype").val(),
							"paperno" : $("#paperno").val(),
							"tel" : $("#tel").val(),
							"email" : $("#email").val()
					
					};
					
					$.post("reader.action", params, function(data) {
						if(data == "success") {
							// 刷新父窗口
							window.opener.queryAgain();
							// 关闭小窗口
							window.close();
						} else {
							alert("修改失败");
						}
					});
				}
			});
			
			$("#cancel").bind("click", function() {
				
				// 刷新父窗口
				window.opener.queryAgain();
				// 关闭小窗口
				window.close();
					
			});
		});
	</script>
	
	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/onclock.js" ></script>
<script src="js/menu.js" ></script>

</head>

<body>


<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：修改读者档案 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>
</table>  <form name="form1" method="post" action="">
  <table width="47%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="27%" align="left" style="padding:5px;">读者姓名：</td>
    <td width="73%" align="left">
      <input name="rname" type="text" id="rname" value="${param.rname}"  size="30" onblur="checkRname();"><span id="rnameSpan"></span> </td>   
  </tr>
   
   <tr>
    <td align="left" style="padding:5px;">性别：</td>
    <td align="left">
    	男<input type="radio" name="gender" id="gender" value="1" size="30" ${param.gender==1?"checked":"" } />
                          女 <input type="radio" name="gender" id="gender" value="0" size="30" ${param.gender==0?"checked":"" } /> </td>
    </td>
   </tr>
    
    <tr>
    <td align="left" style="padding:5px;">职业：</td>
    <td align="left"><input name="vocation" type="text" id="vocation" value="${param.vocation}" size="30" onblur="checkVocation();"><span id="vocationSpan"></span>
      </td>
    </tr>
    
    <tr>
    <td align="left" style="padding:5px;">生日：</td>
    <td align="left"><input name="birthday" type="date" id="birthday" value="${param.birthday}" size="30"  onblur="checkBirthday();"><span id="birthdaySpan"></span>
      </td>
    </tr>
    <tr>
    <td align="left" style="padding:5px;">证件类型：</td>
    <td align="left"><input name="papertype" type="text" id="papertype" value="${param.papertype}" size="30" readonly>
      </td>
    </tr>
    
    <tr>
    <td align="left" style="padding:5px;">证件号码：</td>
    <td align="left"><input name="paperno" type="text" id="paperno" value="${param.paperno}" size="30" onblur="checkPaperno();"><span id="papernoSpan"></span>
      </td>
    </tr>
    
    <tr>
    <td align="left" style="padding:5px;">电话：</td>
    <td align="left"><input name="tel" type="text" id="tel" value="${param.tel}" size="30" onblur="checkTel();"><span id="telSpan"></span>
      </td>
    </tr>
    
    
    <tr>
    <td align="left" style="padding:5px;">email：</td>
    <td align="left"><input name="email" type="text" id="email" value="${param.email}" size="30" onblur="checkEmail();"><span id="emailSpan"></span>
      </td>
    </tr>
    
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><input type="button" id="save" value="保存" class="button" onclick="return checkAll();"/>&nbsp;
		<input type="button" id="cancel" value="取消" class="button" /></td>
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


