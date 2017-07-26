<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
	<base href="${applicationScope.basePath}">
    <title>图书馆管理系统</title>
    <link href="css/style.css" rel="stylesheet">
    
    <script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
	
		function changePage() {
			var page = $("#page").val();
			location = "borrow.action?m=borrowTimeRemindList&page=" + page;
		}
		
	</script>
	
</head>

<body>


<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td valign="top" bgcolor="#FFFFFF">
            <table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="510" valign="top" style="padding:5px;">
                        <table width="98%" height="487" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="22" valign="top" class="word_orange">当前位置：系统查询 &gt; 借阅到期提醒 &gt;&gt;&gt;</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <table width="98%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                                           bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                        <tr align="center" bgcolor="#e3F4F7">
                                            <td width="15%" bgcolor="#F9D16B">图书条形码</td>
                                            <td width="28%" bgcolor="#F9D16B">图书名称</td>
                                            <td width="17%" bgcolor="#F9D16B">读者条形码</td>
                                            <td width="9%" bgcolor="#F9D16B">读者名称</td>
                                            <td width="15%" bgcolor="#F9D16B">借阅时间</td>
                                            <td width="16%" bgcolor="#F9D16B">应还时间</td>
                                        </tr>
            
										<c:forEach items="${pu.list }" var="borrowRemind"> 
										  <tr>
										    <td style="padding:5px;">&nbsp;${borrowRemind.bookid }</td>
										    <td style="padding:5px;">&nbsp;${borrowRemind.bookname }</td>
										    <td style="padding:5px;">&nbsp;${borrowRemind.rid }</td>
										    <td style="padding:5px;">&nbsp;${borrowRemind.rname }</td>
										    <td style="padding:5px;">&nbsp;${borrowRemind.borrowtime }</td>
										    <td style="padding:5px;">&nbsp;${borrowRemind.limitbacktime }</td>
																			    
										  </tr>
										</c:forEach>
 
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="6"><img src="images/spacer.gif" width="1" height="1" /></td>
	</tr>
	<tr>
		<td height="33">
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
				<tr>
					<td width="50%">共 <span class="right-text09">${pu.totalPage }</span> 页 | 第 <span class="right-text09">${pu.page }</span> 页
					</td>
					<td width="49%" align="right">[
						<a href="borrow.action?m=borrowTimeRemindList&page=${pu.first }" class="right-font08">首页</a> |
						<c:choose>
							<c:when test="${pu.hasPrevious }">
								<a href="borrow.action?m=borrowTimeRemindList&page=${pu.prevPage }" class="right-font08">上一页</a> |
							</c:when>
							<c:otherwise>
								<font color="gray">上一页</font> |
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pu.hasNext }">
								<a href="borrow.action?m=borrowTimeRemindList&page=${pu.nextPage }" class="right-font08">下一页</a> |
							</c:when>
							<c:otherwise>
								<font color="gray">下一页</font> |
							</c:otherwise>
						</c:choose>
						<a href="borrow.action?m=borrowTimeRemindList&page=${pu.last }" class="right-font08">末页</a>
						] 转至：
					</td>
					<td width="1%">
						<table width="20" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="1%"><input id="page" type="text" class="right-textfield03" size="1" /></td>
								<td width="87%"><input name="Submit23222" type="button" class="right-button06" value="GO" onclick="changePage();" /></td>
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
