<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
   <base href="${applicationScope.basePath }">
    <title>图书馆管理系统</title>
    <link href="css/style.css" rel="stylesheet">
</head>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
   function del(shelfid){
	   var flag=window.confirm("确定要删除吗？");
	   if(flag){
		   $.post("shelf.action",{"m":"deleteShelf","shelfid":shelfid},function(data){
			   if(data=="success"){
				   alert("删除成功");
                   window.location="shelf.action?m=queryAllShelf&page=${pu.page}";
			   }else if(data=="fail"){
				   alert("删除失败");
                   window.location="shelf.action?m=queryAllShelf&page=${pu.page}";
			   }else{
				   alert("该书架上有书，不能删除该书架");
				   window.location="shelf.action?m=queryAllShelf&page=${pu.page}";
			   }
		   })
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
                                <td height="22" valign="top" class="word_orange">当前位置：系统设置 &gt; 书架设置 &gt;&gt;&gt;</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <table width="91%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="84%">&nbsp;      </td>
                                            <td width="16%" align="right">
                                                <a href="sysSetting/add_bookcase.jsp">添加书架信息</a></td>
                                        </tr>
                                    </table>
                                    <table width="91%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                                           bordercolordark="#F6B83B" bordercolorlight="#FFFFFF" >
                                        <tr align="center" bgcolor="#e3F4F7">
                                            <td width="70%" bgcolor="#F9D16B">书架名称</td>
                                            <td width="16%" bgcolor="#F9D16B">修改</td>
                                            <td width="14%" bgcolor="#F9D16B">删除</td>
                                        </tr>
                                        <c:forEach items="${pu.list }" var="bs">
                                            <tr align="center">
                                                <td style="padding:5px;">${bs.shelfname }</td>
                                                <td align="center">
                                                <a href="sysSetting/bookcase_modify.jsp?shelfid=${bs.shelfid }&shelfname=${bs.shelfname }">修改</a>
                                                </td>
                                                <td align="center"><a href="javascript:void(0)" onclick="del('${bs.shelfid}')">删除</a></td>
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
                <td height="33">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
                        <tr>
                            <td width="50%">共 <span class="right-text09">${pu.totalPage }</span> 页 | 第 <span class="right-text09">${pu.page }</span> 页</td>
                            <td width="49%" align="right">
                            [<a href="shelf.action?m=queryAllShelf&page=${pu.first }" class="right-font08">首页</a> | 
                            <c:choose>
                                <c:when test="${hasPrevious}">
                                    <a href="shelf.action?m=queryAllShelf&page=${pu.prevPage }" class="right-font08">上一页</a> | 
                                </c:when>
                                <c:otherwise>
                                    <font color="gray">上一页</font> |
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${pu.hasNext }">
                                    <a href="shelf.action?m=queryAllShelf&page=${pu.nextPage }" class="right-font08">下一页</a> | 
                                </c:when>
                                <c:otherwise>
                                    <font color="gray">下一页</font> |
                                </c:otherwise>
                            </c:choose>
                            <a href="shelf.action?m=queryAllShelf&page=${pu.last }" class="right-font08">末页</a>]
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
        </td>
    </tr>
</table>
</body>
</html>
