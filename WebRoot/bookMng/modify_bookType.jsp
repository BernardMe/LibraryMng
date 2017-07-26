<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>图书馆管理系统</title>
<base href="${applicationScope.basePath}">
<link href="css/style.css" rel="stylesheet">
<style>
   .greenSpan{
      color : green;
   }
   .redSpan{
      color : red;
   }
</style>
<script src= "js/jquery.min.js"></script>
</head>
<script language="javascript">
   
    	function bindClick(){
    		 if(checkAll()){
	    		 var result = window.confirm("确认修改吗？");
	    		 if(result){
	    			 var param = {"m":"updateBookType","typeid":${param.typeid},"typename":$("#typename").val(),"days":$("#days").val()};
	    			 $.post("book.action",param,function(data){
	    				 if(data=="success"){
	    					 window.opener.location="book.action?m=queryAllBookType";
	    					 window.close();
	    				 }else{
	    					 alert("修改失败");
	    				 }
	    			 });
	    		 }
    	  }
    	}
     

   //验证图书类型名
 	function checkName(){
 		var name = $("#typename").val();
 		if(name == null || name.trim().length == 0){
 			$("#nameSpan").html("图书类型不能为空");
 			$("#nameSpan").attr("class","redSpan");
 			return false;
 		}else{
 			$("#nameSpan").html("ok");
 			$("#nameSpan").attr("class","greenSpan");
 			return true;
 		}
 	}
 	//验证天数
 	function checkDays(){
 		var days = $("#days").val();
 		var regex = /^\d{1,2}$/;
 		if(days == null || days.trim().length == 0){
 			$("#daySpan").html("可借天数不能为空");
 			$("#daySpan").attr("class","redSpan");
 			return false;
 		}else if(regex.test(days)){
 			$("#daySpan").html("ok");
 			$("#daySpan").attr("class","greenSpan");
 			return true;
 		}else{
 			$("#daySpan").html("可借天数必须为两位数字");
 			$("#daySpan").attr("class","redSpan");
 			return false;
 		}
 	}
 	//检查所有
 	function checkAll(){
 		alert(123);
 		if(checkName()&checkDays()){
 			return true;
 		}else{
 			return false;
 		}
 	}

</script>
<body onLoad="clockon(bgclock)">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>
</table> 
 <form name="form1" method="post" action="book.action">
  <table width="47%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
    <tr align="center">
    
    <td width="27%" align="left" style="padding:5px;">书籍类型名称：</td>
   
    <td width="73%" align="left" height="60px">
    	<input name="typename" type="text" id="typename" size="20" value = "${param.typename}" onblur = "checkName();">&nbsp;<span id = "nameSpan"></span>
    </tr>
    <br />
    <br />
    <br />
    <br />
    <tr>
    <td align="left" style="padding:5px;">可借天数：</td><br />
    <td align="left">
    	<input name="days" type="text" id="days" size="20" value = "${param.days}" onblur = "checkDays();">&nbsp;<span id = "daySpan"></span>
    </tr>
    
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
   <td align = "center"><input type="button" name="Submit" value="保存" class="button" id = "btn" onclick="bindClick();"/>
      
       </td>
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
