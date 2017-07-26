<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<html>

<head>
   <base href="${applicationScope.basePath }">
    <title>图书馆管理系统</title>
    <link href="css/style.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
       function sub(mname){
    	   var purview="";
           $("input:checkbox:checked").each(function() {  
        	   purview=purview+($(this).val()); 
           });
           alert(purview);
           $.post("purview.action",{"m":"updatePurview","purview":purview,"mname":mname},function(data){
        	   if(data=="success"){
        		   alert("更新成功")
        		   window.location="purview.action?m=showAllHasPur&page=1";
        	   }else{
        		   alert("更新失败，请重新操作");
        		   window.location="purview.action?m=showAllHasPur&page=1";
        	   }
           })
       }
    </script>
</head>


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
                                <td height="22" valign="top" class="word_orange">当前位置：系统设置 &gt; 权限设置 &gt;&gt;&gt;</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="84%">&nbsp;      </td>
                                            <td width="16%">
                                        </tr>
                                    </table>
                               <%--  <form action="?m=" method="post">
                                    <input type="hidden" name="mname" value="${param.mname }"> --%>
                                    <table width="91%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                                           bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                        <tr align="center" bgcolor="#e3F4F7">
                                            <td width="26%" bgcolor="#F9D16B">管理员名称</td>
                                            <td width="12%" bgcolor="#F9D16B">系统设置</td>
                                            <td width="12%" bgcolor="#F9D16B">读者管理</td>
                                            <td width="12%" bgcolor="#F9D16B">图书管理</td>
                                            <td width="11%" bgcolor="#F9D16B">图书借还</td>
                                            <td width="10%" bgcolor="#F9D16B">系统查询</td>
                                            
                                        </tr>
                                       
                                        <tr>
                                            <td style="padding:5px;" >${param.mname }</td>
                                            <td align="center">
                                            <input name="purview" type="checkbox" class="noborder"
                                                      id="${pur.mname }"   value="1" ${param.sysset==1?'checked':'' }></td>
                                            <td align="center">
                                            <input name="purview" type="checkbox" class="noborder"
                                                       id="${pur.mname }"  value="2" ${param.readerset==1?'checked':'' }></td>
                                            <td align="center">
                                            <input name="purview" type="checkbox" class="noborder"
                                                      id="${pur.mname }"   value="3" ${param.bookset==1?'checked':'' }></td>
                                            <td align="center">
                                            <input name="purview" type="checkbox" class="noborder"
                                                      id="${pur.mname }"    value="4" ${param.borrowback==1?'checked':'' }></td>
                                            <td align="center">
                                            <input name="purview" type="checkbox" class="noborder"
                                                       id="${pur.mname }"  value="5" ${param.sysquery==1?'checked':'' }></td>
                                            
                                        </tr>
                                        
                                        <tr align="center">
                                        
                                          <td height="65"  style="padding:5px;">&nbsp;</td>
                                           <td>&nbsp;</td>
                                          <td><input type="button" name="Submit" value="保存" class="button" onclick="sub('${param.mname }');" />
                                            &nbsp;
                                            <input type="reset" name="Submit" value="取消" class="button"  /></td>
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