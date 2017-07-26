<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>

<head>
   <base href="${applicationScope.basePath }">
    <title>图书馆管理系统</title>
    <link href="css/style.css" rel="stylesheet">
</head>
<body >
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
   
   function checkcost(){
	   var regex=/^\d+$/;
	   if($.trim($("#cost").val()).length==0){
           $("#costSpan").append("&nbsp;<img src='img/tip.png' /><font color='red'>不能为空</font>");
          
       }else if(!regex.test($.trim($("#cost").val()))){
           $("#costSpan").append("&nbsp;<img src='img/tip.png' /><font color='red'>输入格式不正确，请输入数字</font>");
       }else{
    	   $.post("parameter.action",{"m":"checkCost","cost":$("#cost").val()},function(data){
        	   if(data=="fail"){
    			   $("#costSpan").append("&nbsp;<img src='img/ok.png'/>")
    		   }else{
    			   $("#costSpan").append("&nbsp;<img src='img/tip.png' /><font color='red'>已存在，请重新输入</font>");
    		   }
    	   })
       }
   }
   function checkvalidity(){
	   var regex=/^\d+$/;
	   $("#validitySpan").empty();
	   if($.trim($("#validity").val()).length==0){
           $("#validitySpan").append("&nbsp;<img src='img/tip.png' /><font color='red'>不能为空</font>"); 
           return false;
       }else if(!regex.test($.trim($("#validity").val()))){
    	   $("#validitySpan").append("&nbsp;<img src='img/tip.png' /><font color='red'>输入格式不正确，请输入数字</font>");
    	   return false;
       }else{
    	   return true;
       }
   }
   function checkAll(){
	   var flag;
	   if(($("#costSpan").html()).indexOf("tip")>0){
		   checkcost();
		   flag=false;
	   }else{
		   flag=true;
	   }
	   var v=flag&checkvalidity();
	   if(v){
		   return true;
	   }else{
		   return false;
	   }
   }
   
   function add(){
	   if(checkAll()){
		   var flag=window.confirm("确定要保存吗？");
		   if(flag){
               $.post("parameter.action",{"m":"addParameter","cost":$("#cost").val(),"validity":$("#validity").val()},function(data){
                   if(data=="success"){
                       window.location="parameter.action?m=showParameter&page=${pu.page}"
                   }else{
                      alert("添加失败，请重新添加");
                      window.location="sysSetting/add_parameter.jsp";
                   }
               })
		   }
	   }
   }
</script>


<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td valign="top" bgcolor="#FFFFFF">
            <table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="510" valign="top" style="padding:5px;">
                        <table width="98%" height="487" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="22" valign="top" class="word_orange">当前位置：系统设置 &gt; 添加书卡类型 &gt;&gt;&gt;</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="84%">&nbsp;      </td>
                                        </tr>
                                    </table>
                                    <form name="form1" method="post" action="parameter.do?action=parameterModify">

                                        <table width="43%" border="0" cellpadding="0" cellspacing="0"
                                               bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
                                               bordercolorlight="#FFFFFF">
                                            <tr align="center">
                                                <td width="24%" align="left" style="padding:5px;">办证费：</td>
                                                <td width="76%" align="left">
                                                    <input name="cost" type="text" id="cost" value="" size="33" onblur="checkcost();">
                                                    (元)<span id="costSpan"></span>
                                                </td>
                                            <tr>
                                                <td align="left" style="padding:5px;">有效期限：</td>
                                                <td align="left"><input name="validity" type="text" id="validity"  size="33" value="" onblur="checkvalidity();"> (月)
                                                <span id="validitySpan"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="65" align="left" style="padding:5px;">&nbsp;</td>
                                                <td><input id="btn" type="button" name="Submit" value="保存" class="button"
                                                           onclick="add();"/>
                                                    &nbsp;
                                                    <input  type="reset" name="Submit" value="取消" class="button"
                                                          /></td>
                                            </tr>
                                        </table>
                                    </form>
                                </td>
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
