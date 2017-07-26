<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<html>

<head>
   <base href="${applicationScope.basePath }">
    <title>图书馆管理系统</title>
    <link href="css/style.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
       function queryAgain(){
        	window.location="purview.action?m=showAllHasPur&page=${pu.page}";
        } 
        function del(mname){
        	var flag=window.confirm("确定要删除吗？");
        	if(flag){
            	$.post("manager.action",{"m":"deleteManager","mname":mname},function(data){
            		if(data=="success"){
            			queryAgain();
            		}else{
            			alert("删除失败");
            			queryAgain();
            		}
            	})
        	}
        }
       function submit(mname){
    	    var s=document.getElementsByName(mname);
    	   for (var i = 0; i < s.length; i++) {
			alert(s[i].value);
			} 
		
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
                                <td height="22" valign="top" class="word_orange">当前位置：系统设置 &gt; 管理员设置 &gt;&gt;&gt;</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="84%">&nbsp;      </td>
                                            <td width="16%">
                                                <a href="sysSetting/add_manager.jsp">添加管理员信息</a></td>
                                        </tr>
                                    </table>
                                    <table width="91%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                                           bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                        <tr align="center" bgcolor="#e3F4F7">
                                            <td width="26%" bgcolor="#F9D16B">管理员名称</td>
                                            <td width="12%" bgcolor="#F9D16B">系统设置</td>
                                            <td width="12%" bgcolor="#F9D16B">读者管理</td>
                                            <td width="12%" bgcolor="#F9D16B">图书管理</td>
                                            <td width="11%" bgcolor="#F9D16B">图书借还</td>
                                            <td width="10%" bgcolor="#F9D16B">系统查询</td>
                                            <td width="9%" bgcolor="#F9D16B">权限设置</td>
                                            <td width="8%" bgcolor="#F9D16B">删除</td>
                                        </tr>
                                    <c:forEach items="${pu.list }" var="pur">
                                       
                                        <tr>
                                            <td style="padding:5px;">${pur.mname }</td>
                                            <td align="center">
                                            <input name="${pur.mname }" type="checkbox" class="noborder"
                                                      id="${pur.mname }"   value="1" ${pur.sysset==1?'checked':'' }></td>
                                            <td align="center">
                                            <input name="${pur.mname }" type="checkbox" class="noborder"
                                                       id="${pur.mname }"  value="2" ${pur.readerset==1?'checked':'' }></td>
                                            <td align="center">
                                            <input name="${pur.mname }" type="checkbox" class="noborder"
                                                      id="${pur.mname }"   value="3" ${pur.bookset==1?'checked':'' }></td>
                                            <td align="center">
                                            <input name="${pur.mname }" type="checkbox" class="noborder"
                                                      id="${pur.mname }"    value="4" ${pur.borrowback==1?'checked':'' }></td>
                                            <td align="center">
                                            <input name="${pur.mname }" type="checkbox" class="noborder"
                                                       id="${pur.mname }"  value="5" ${pur.sysquery==1?'checked':'' }></td>
                                            <td align="center">
                                            
                                            <a href="sysSetting/purview_modify.jsp?mname=${pur.mname }&sysset=${pur.sysset}&readerset=${pur.readerset}&bookset=${pur.bookset}&borrowback=${pur.borrowback}&sysquery=${pur.sysquery}" >权限设置</a>
                                            </td>
                                            <td align="center">
                                                <a href="javascript:void(0)" onclick="del('${pur.mname }')">删除</a></td>
                                        </tr>
                                     
                                      </c:forEach> 

                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                            <td width="50%">共 <span class="right-text09">${pu.totalPage }</span> 页 | 第 <span class="right-text09">${pu.page }</span> 页</td>
                            <td width="49%" align="right">
                            [<a href="purview.action?m=showAllHasPur&page=${pu.first }" class="right-font08">首页</a> | 
                            <c:choose>
                                <c:when test="${hasPrevious}">
                                    <a href="purview.action?m=showAllHasPur&page=${pu.prevPage }" class="right-font08">上一页</a> | 
                                </c:when>
                                <c:otherwise>
                                    <font color="gray">上一页</font> |
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${pu.hasNext }">
                                    <a href="purview.action?m=showAllHasPur&page=${pu.nextPage }" class="right-font08">下一页</a> | 
                                </c:when>
                                <c:otherwise>
                                    <font color="gray">下一页</font> |
                                </c:otherwise>
                            </c:choose>
                            <a href="purview.action?m=showAllHasPur&page=${pu.last }" class="right-font08">末页</a>]
                                                                                                                                     转至：</td>
                            <td width="1%">
                                <table width="20" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="1%">
                                            <input id="page" name="page" type="text" class="right-textfield03" size="1" />
                                        </td>
                                        <td width="87%">
                                            <input name="Submit23222" type="button" class="right-button06" value="" onclick="checkPage();"/>
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
