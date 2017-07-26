<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>

<head>
   <base href="${applicationScope.basePath }">
    <title>图书馆管理系统</title>
    <link href="css/style.css" rel="stylesheet">
</head>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script language="javascript">
   function check(){
	   if(checkAll()){
		   var flag=window.confirm("确定要更改吗？");
		   if(flag){
        	   $.post("manager.action",{"m":"checkManager","mname":$("#mname").val(),"mpwd":$("#mpwd").val()},function(data){
        		   if(data=="success"){
        			   $.post("manager.action",{"m":"updateMpwd","mname":$("#mname").val(),"mpwd":$("#npwd").val()},function(data){
        				   if(data=="success"){
        					   alert("更改成功");
        					   window.location="login.action?m=exit";
        				   }else{
        					   alert("更改失败,请重新修改");
        					   window.location="sysSetting/pwd_Modify.jsp";
        				   }
        			   })
        		   }else{
        			   alert("原密码不正确，请重新修改");
        			   window.location="sysSetting/pwd_Modify.jsp";
        		   }
        	   })
		   }
		   
	   }
   }
   function checknpwd(){
       $("#npwdSpan").empty();
       if($.trim($("#npwd").val()).length==0){
           $("#npwdSpan").append("&nbsp;<img src='img/tip.png'/><font color='red'>不能为空</font>");
           return false;
       } else{
           return true;
       }
   }
   function  ensurenpwd(){ 
       $("#npwd1Span").empty();
       checknpwd();
       if($("#npwd").val()==$("#npwd1").val()){
           $("#npwd1Span").append("&nbsp;<img src='img/ok.png'/>");
           return true;
       }else{
           $("#npwd1Span").append("&nbsp;<img src='img/tip.png'/><font color='red'>两次输入密码不一致，请重新输入</font>");
           return false;
       }
   }
   function checkAll(){
	   var flag=checknpwd()&ensurenpwd();
	   if(flag){
		   return true;
	   }else{
		   return false;
	   }
   }
</script>
<body >


<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td valign="top" bgcolor="#FFFFFF">
            <table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="510" valign="top" style="padding:5px;">
                        <table width="98%" height="487" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="22" valign="top" class="word_orange">当前位置：更改口令 &gt;&gt;&gt;</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="84%">&nbsp;      </td>
                                        </tr>
                                    </table>
                                    
                                        <table width="47%" border="0" cellpadding="0" cellspacing="0"
                                               bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
                                               bordercolorlight="#FFFFFF">
                                            <tr align="center">
                                                <td width="35%" align="left" style="padding:5px;">管理员名称：</td>
                                                <td width="65%" align="left">
                                                    <input name="mname" type="text" id="mname" value="${user.mname }"
                                                      disabled="disabled"     readonly="yes" size="35"></td>
                                            <tr>
                                                <td align="left" style="padding:5px;">原密码：</td>
                                                <td align="left"><input name="mpwd" type="password" id="mpwd" size="35">
                                                    <span id="mpwdSpan"></span></td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="padding:5px;">新密码：</td>
                                                <td align="left"><input name="npwd" type="password" id="npwd" size="35" onblur="checknpwd()">
                                                <span id="npwdSpan"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="padding:5px;">确认新密码：</td>
                                                <td align="left"><input name="npwd1" type="password" id="npwd1" size="35" onblur="ensurenpwd();"> 
                                                <span id="npwd1Span"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="65" align="left" style="padding:5px;">&nbsp;</td>
                                                <td><input id="btn" type="button" name="Submit" value="保存" class="button" onclick="check();" />
                                                 &nbsp;
                                                 <input type="reset" name="Submit" value="取消" class="button" /></td>
                                            </tr>
                                        </table>
                                    
                                </td>
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
