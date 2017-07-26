
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>图书馆管理系统</title>
    <base href="${applicationScope.basePath}">
    <link href="css/style.css" rel="stylesheet">
    <script src = "js/jquery.min.js"></script>
    <script>
        //点击删除操作
        function del(typeid){
        	if(window.confirm("确认删除吗？")){
        		$.get("book.action",{"m":"deleteBookType","typeid":typeid},function(data){
        			if(data == "success"){
        				alert("删除成功");
        			}else{
        				alert("删除失败");
        			}
        		});
        	}
        }
        //分页
        function changePage(){
        	var page = $("#btn").val();
        	location = "book.action?m=queryAllBookType&page="+page;
        }
    </script>
</head>
<body onLoad="clockon(bgclock)">


<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td valign="top" bgcolor="#FFFFFF">
            <table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="510" valign="top" style="padding:5px;">
                        <table width="98%" height="487" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="22" valign="top" class="word_orange">当前位置：图书管理 &gt; 图书类型设置 &gt;&gt;&gt;</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <table width="91%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="82%">&nbsp;      </td>
                                            <td width="18%" align="right">
                                                <a href="bookMng/add_bookType.jsp">添加图书类型信息</a></td>
                                        </tr>
                                    </table>
                                    <table width="91%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                                           bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                        <tr align="center" bgcolor="#e3F4F7">
                                            <td width="35%" bgcolor="#F9D16B">图书类型名称</td>
                                            <td width="35%" bgcolor="#F9D16B">可借天数</td>
                                            <td width="16%" bgcolor="#F9D16B">修改</td>
                                            <td width="14%" bgcolor="#F9D16B">删除</td>
                                        </tr>
                                        <c:forEach items="${pu.list}" var = "list">
      
                                        <tr>
                                            <td style="padding:5px;">${list.typename }</td>
                                            <td style="padding:5px;">${list.days}</td>
                                            <td align="center" <a href="javascript:void(0);" onclick = "window.open('bookMng/modify_bookType.jsp?typeid=${list.typeid}&typename=${list.typename}&days=${list.days}','booktype','width=550, height=400, top=100, left=350');">修改</a>
                                            </td>
                                            <td align="center"><a href="javascript:void(0);" onclick = "del('${list.typeid}');">删除</a></td>
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
                    <td height="6"></td>
                </tr>
                <tr>
                    <td height="33">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                               class="right-font08">
                            <tr>
                                <td width="50%">共 <span class="right-text09">${pu.totalPage}</span> 页 | 第 <span
                                        class="right-text09">${pu.page}</span> 页
                                </td>
                                <td width="49%" align="right">[<a href="book.action?m=queryAllBookType&page=1" class="right-font08">首页</a> | 
                                <c:choose>
                                <c:when test="${pu.hasPrevious}">
                                     <a href="book.action?m=queryAllBookType&page=${pu.prevPage}" class="right-font08">上一页</a>|
                                </c:when>
                                <c:otherwise>
                                    <font color = "gray">上一页</font>
                                </c:otherwise>
                                </c:choose>
                                 <c:choose>
                                <c:when test="${pu.hasNext}">
                                     <a href="book.action?m=queryAllBookType&page=${pu.nextPage}" class="right-font08">下一页</a>|
                                </c:when>
                                <c:otherwise>
                                    <font color = "gray">下一页</font>
                                </c:otherwise>
                                </c:choose>
                                  <a href="book.action?m=queryAllBookType&page=${pu.last}" class="right-font08">末页</a>]
                                    转至：
                                </td>
                                <td width="1%">
                                    <table width="20" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="1%">
                                                <input name="textfield3" id = "btn" type="text" class="right-textfield03"
                                                       size="1"/>
                                            </td>
                                            <td width="87%">
                                                <input name="Submit23222" type="button" id = "change" class="right-button06"
                                                       value=" " onclick = "changePage();"/>
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
