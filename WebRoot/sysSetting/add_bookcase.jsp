<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html >

<head>
   <base href="${applicationScope.basePath }">
<title>图书馆管理系统</title>
<link href="css/style.css" rel="stylesheet">
</head>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script language="javascript">
   function checkshelf(){
	   $("#shelfSpan").empty();
	
       if($.trim($("#shelfname").val()).length==0){
           $("#shelfSpan").append("&nbsp;<img src='img/tip.png' /><font color='red'>不能为空</font>"); 
       }else{
           $.post("shelf.action",{"m":"checkShelf","shelfname":($("#shelfname").val()+"架")},function(data){
               if(data=="fail"){
                   $("#shelfSpan").append("&nbsp;<img src='img/ok.png'/>")
               }else{
                   $("#shelfSpan").append("&nbsp;<img src='img/tip.png' /><font color='red'>已存在，请重新输入</font>");
               }
           })
       }
   }
   function addshelf(){
	   if(($("#shelfSpan").html()).indexOf("tip")>0){
           checkshelf();
       }else{
    	   var flag=window.confirm("确定要添加吗？");
    	   if(flag){
               $.post("shelf.action",{"m":"addShelf","shelfname":($("#shelfname").val()+"架")},function(data){
            	   if(data=="success"){
            		   window.location="shelf.action?m=queryAllShelf&page=1";
            	   }else{
            		   alert("添加失败，请重新添加");
                       window.location="sysSetting/add_bookcase.jsp";
            	   }
               })
    	   }
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
        <td height="22" valign="top" class="word_orange">当前位置：新增书架 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>
</table>  <form name="form1" method="post" action="manager.do?action=modifypwd">
  <table width="40%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="27%" align="left" style="padding:5px;">书架名称：</td>
    <td width="73%" align="left">
      <input name="shelfname" type="text" id="shelfname" value=""  size="35" onblur="checkshelf()">  
      <span id="shelfSpan"></span> 
        </td>
    </tr>
    
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><input id="btn" type="button" name="Submit" value="保存" class="button" onclick="addshelf();" />
        &nbsp;
		<input type="reset" name="Submit" value="取消" class="button" /></td>
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

