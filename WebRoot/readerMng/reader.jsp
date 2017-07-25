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
			location = "reader.action?m=getReaderList&page=" + page;
		}
		
		
		 function del(rid, rname) {

			var result = window.confirm("确定要删除[ " + rname + " ]吗?");
			if(result) {
				$.get("reader.action", {"m":"deleteReaderByID", "rid":rid}, function(data) {
					if(data == "success") {
						queryAgain();
					} else {
						alert("删除失败");
					}
				});
			}
		} 

		
		function queryAgain() {
			location = "reader.action?m=getReaderList&page=${pu.page}";
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
                                <td height="22" valign="top" class="word_orange">当前位置：读者管理 &gt; 读者档案管理 &gt;&gt;&gt;</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="87%">&nbsp;      </td>
                                            <td width="13%">
                                                <a href="readerMng/add_reader.jsp">添加读者信息</a></td>
                                        </tr>
                                    </table>
                                    <table width="95%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                                           bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                        <tr align="center" bgcolor="#e3F4F7">
                                            <td width="13%" bgcolor="#F9D16B">条形码</td>
                                            <td width="10%" bgcolor="#F9D16B">姓名</td>
                                            <td width="8%" bgcolor="#F9D16B">读者类型</td>
                                            <td width="12%" bgcolor="#F9D16B">证件类型</td>
                                            <td width="20%" bgcolor="#F9D16B">证件号码</td>
                                            <td width="12%" bgcolor="#F9D16B">电话</td>
                                            <td width="15%" bgcolor="#F9D16B">Email</td>
                                            <td width="5%" bgcolor="#F9D16B">修改</td>
                                            <td width="5%" bgcolor="#F9D16B">删除</td>
                                        </tr>
								
									<c:forEach items="${pu.list }" var="reader"> 
									  <tr>
									    <td style="padding:5px;">&nbsp;${reader.rid }</td>
									    <td style="padding:5px;">&nbsp;${reader.rname }</td>
									    <td style="padding:5px;">&nbsp;${reader.rtypename }</td>
									    <td style="padding:5px;">&nbsp;${reader.papertype }</td>
									    <td style="padding:5px;">&nbsp;${reader.paperno }</td>
									    <td style="padding:5px;">&nbsp;${reader.tel }</td>
									    <td style="padding:5px;">&nbsp;${reader.email }</td>
									
									    <td align="center" bgcolor="#FFFFFF"><a href="javascript:void(0)" onclick="window.open('update_reader.jsp?rid=${reader.rid }&rname=${reader.rname}&rtypename=${reader.rtypename }&papertype=${reader.papertype }&paperno=${reader.paperno }&tel=${reader.tel }&email=${reader.email }', 'Reader', 'width=550, height=350, top=100, left=350')">修改</a></td>
									    <td align="center" bgcolor="#FFFFFF"><a href="javascript:void(0)" onclick="del(${reader.rid},'${reader.rname}');">删除</a></td>
									    
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
						<a href="reader.action?m=getReaderList&page=${pu.first }" class="right-font08">首页</a> |
						<c:choose>
							<c:when test="${pu.hasPrevious }">
								<a href="reader.action?m=getReaderList&page=${pu.prevPage }" class="right-font08">上一页</a> |
							</c:when>
							<c:otherwise>
								<font color="gray">上一页</font> |
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pu.hasNext }">
								<a href="reader.action?m=getReaderList&page=${pu.nextPage }" class="right-font08">下一页</a> |
							</c:when>
							<c:otherwise>
								<font color="gray">下一页</font> |
							</c:otherwise>
						</c:choose>
						<a href="reader.action?m=getReaderList&page=${pu.last }" class="right-font08">末页</a>
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
