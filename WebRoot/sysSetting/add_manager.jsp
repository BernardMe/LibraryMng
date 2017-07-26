<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <base href="${applicationScope.basePath }">
<title>图书馆管理系统</title>
<link href="css/style.css" rel="stylesheet">
</head>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script language="javascript" type="text/javascript">
       function checkmname(){
    	   $("#mnameSpan").empty();
    	   if($.trim($("#mname").val()).length==0){
    		   $("#mnameSpan").append("&nbsp;<img src='img/tip.png'/><font color='red'>不能为空</font>");
    	   }else{
        	   $.post("manager.action",{"m":"queryByMname","mname":$("#mname").val()},function(data){
        		   if(data=="success"){
        			   $("#mnameSpan").append("&nbsp;<img src='img/tip.png'/><font color='red'>该用户名已存在，请重新输入</font>");
        		   }else{
        			   $("#mnameSpan").append("&nbsp;<img src='img/ok.png'/>");
        		   }
        	   })
    	   }    
       }
       function checkmpwd(){
    	   $("#mpwdSpan").empty();
    	   if($.trim($("#mpwd").val()).length==0){
               $("#mpwdSpan").append("&nbsp;<img src='img/tip.png'/><font color='red'>不能为空</font>");
               return false;
           } else{
        	   return true;
           }
       }
       function  ensurempwd(){
    	   $("#mpwd1Span").empty();
    	   if($("#mpwd").val()==$("#mpwd1").val()){
    		   $("#mpwd1Span").append("&nbsp;<img src='img/ok.png'/>");
    		   return true;
    	   }else{
    		   $("#mpwd1Span").append("&nbsp;<img src='img/tip.png'/><font color='red'>两次输入密码不一致，请重新输入</font>");
    		   return false;
    	   }
       }
       function checkAll(){
    	   var flag;
    	   checkmname();
    	   if(($("#mnameSpan").html()).indexOf("tip")>0){
    		   flag = false;
    	   }else{
    		   flag = true;
    	   }
    	   
    	   var v=flag&checkmpwd()&ensurempwd();
    	   if(v){
    		   return true;
    	   }else{
    		   return false;
    	   }
       }
       function add(){
    	   if(checkAll()){
    		   $.post("manager.action",{"m":"addManager","mname":$("#mname").val(),"mpwd":$("#mpwd").val()},function(data){
    			   if(data=="success"){
    				   window.location="purview.action?m=showAllHasPur&page=1";
    			   }else{
    				   alert("添加失败，请重新添加");
    				   window.location="sysSetting/add_manager.jsp";
    			   }
    		   })
    	   }
       }
       
</script>
<body >

<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：新增管理员 &gt;&gt;&gt;</td>
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
        <td width="30%"  height="65"  align="left" style="padding:5px;">管理员名称：</td>
        <td width="70%" align="left">
            <input name="mname" type="text" id="mname" value="" size="36" onblur="checkmname();">
            <span id="mnameSpan"></span>
        </td>
    <tr>
    <tr>
        <td height="65"  align="left" style="padding:5px;">密码：</td>
        <td align="left"><input name="mpwd" type="password" id="mpwd" size="36" onblur="checkmpwd()"> <span id="mpwdSpan"></span>
          </td>
    </tr>
    <tr>
      <td  height="65" align="left" style="padding:5px;">确认密码：</td>
      <td align="left"><input name="mpwd1" type="password" id="mpwd1" size="36" onblur="ensurempwd()"><span id="mpwd1Span"></span>
      </td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><input type="button" name="Submit" value="保存" class="button" onclick="add();" />
        &nbsp;
		<input type="reset" name="Submit" value="取消" class="button"  /></td>
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
