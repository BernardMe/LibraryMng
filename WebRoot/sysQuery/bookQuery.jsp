<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>图书馆管理系统</title>
    <base href="${applicationScope.basePath}">
    <link href="css/style.css" rel="stylesheet">
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
                                <td height="22" valign="top" class="word_orange">当前位置：系统查询 &gt; 图书档案查询 &gt;&gt;&gt;</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <form action="book.action"  name="form1" >
                                    <input type="hidden" name= "page" value= "1" />
                                    <input type="hidden" name = "m" value = "queryAll4sys" />
                                        <table width="98%" height="38" border="0" cellpadding="0" cellspacing="0"
                                               bgcolor="#E3F4F7" class="tableBorder_gray">
                                            <tr>
                                                <td align="center" bgcolor="#F9D16B">

                                                    &nbsp;<img src="Images/search.gif" width="45" height="28"></td>
                                                <td bgcolor="#F9D16B">查询依据：
                                                    <span>书名</span>
                                                    <input name="bookname" type="text" id="key" size="50">
                                                    <input name="Submit232" type="submit" class="right-button02"
                                                           value="查询"/></td>
                                            </tr>
                                        </table>

                                        <table width="98%" border="1" cellpadding="0" cellspacing="0"
                                               bordercolor="#FFFFFF" bordercolordark="#F6B83B">
                                            <tr align="center" bgcolor="#e3F4F7">
                                                <td width="17%" bgcolor="#F9D16B">条形码</td>
                                                <td width="31%" bgcolor="#F9D16B">图书名称</td>
                                                <td width="18%" bgcolor="#F9D16B">图书类型</td>
                                                <td width="19%" bgcolor="#F9D16B">出版社</td>
                                                <td width="15%" bgcolor="#F9D16B">书架</td>
                                            </tr>
                                            <c:forEach items="${pu.list}" var = "list">
                                            <tr>
                                                <td style="padding:5px;">&nbsp;${list.bookid}</td>
                                                <td style="padding:5px;">${list.bookname}
                                                </td>
                                                <td style="padding:5px;">&nbsp;${list.typename}</td>
                                                <td style="padding:5px;">&nbsp;${list.pubname}</td>
                                                <td style="padding:5px;">&nbsp;${list.shelfname}</td>
                                            </tr>
                                            </c:forEach>
                                        </table>
                                    </form>
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
                                <td width="49%" align="right">[<a href="book.action?m=queryAll4sys&page=1" class="right-font08">首页</a> | 
                                
                                 <c:choose>
                                <c:when test="${pu.hasPrevious}">
                                     <a href="book.action?m=queryAll4sys&page=${pu.prevPage}" class="right-font08">上一页</a>|
                                </c:when>
                                <c:otherwise>
                                    <font color = "gray">上一页</font>
                                </c:otherwise>
                                </c:choose>
                                    | 
                                     <c:choose>
                                <c:when test="${pu.hasNext}">
                                     <a href="book.action?m=queryAll4sys&page=${pu.nextPage}" class="right-font08">下一页</a>|
                                </c:when>
                                <c:otherwise>
                                    <font color = "gray">下一页</font>
                                </c:otherwise>
                                </c:choose> 
                                    <a href="book.action?m=queryAll4sys&page=${pu.last}" class="right-font08">末页</a>]
                                    转至：
                                </td>
                                <td width="1%">
                                    <table width="20" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="1%">
                                                <input name="textfield3" type="text" class="right-textfield03"
                                                       size="1"/>
                                            </td>
                                            <td width="87%">
                                                <input name="Submit23222" type="submit" class="right-button06"
                                                       value=" "/>
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
