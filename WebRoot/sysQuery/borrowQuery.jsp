<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <base href="${applicationScope.basePath}">
    <title>图书借阅查询</title>

    <link href="css/style.css" rel="stylesheet">
    <script src="js/function.js"></script>
    <script language="javascript">
        function check(myform) {
            if (myform.flag[0].checked == false && myform.flag[1].checked == false) {
                alert("请选择查询方式!");
                return false;
            }
            if (myform.flag[1].checked) {
                if (myform.sdate.value == "") {
                    alert("请输入开始日期");
                    myform.sdate.focus();
                    return false;
                }
                if (CheckDate(myform.sdate.value)) {
                    alert("您输入的开始日期不正确（如：2006-07-05）\n 请注意闰年!");
                    myform.sDate.focus();
                    return false;
                }
                if (myform.edate.value == "") {
                    alert("请输入结束日期");
                    myform.edate.focus();
                    return false;
                }
                if (CheckDate(myform.edate.value)) {
                    alert("您输入的结束日期不正确（如：2006-07-05）\n 请注意闰年!");
                    myform.edate.focus();
                    return false;
                }
            }
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
                                <td height="22" valign="top" class="word_orange">当前位置：系统查询 &gt; 图书借阅查询 &gt;&gt;&gt;</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <form name="myform" method="post" action="sysQuery.action">
                                        <input type="hidden" name="m" value="borrowQuery">
                                        <table width="98%" height="67" border="0" cellpadding="0" cellspacing="0"
                                               bgcolor="#E3F4F7" class="tableBorder_gray">
                                            <tr>
                                                <td rowspan="2" align="center" bgcolor="#F9D16B">&nbsp;<img
                                                        src="Images/search.gif" width="45" height="28"></td>
                                                <td height="29" bgcolor="#F9D16B"><input name="flag" type="checkbox"
                                                                                         class="noborder" value="a"
                                                                                         checked>
                                                    请选择查询依据：
                                                    <select name="f" class="wenbenkuang" id="f">
                                                        <option value="barcode">图书条形码</option>
                                                        <option value="bookname">图书名称</option>
                                                        <option value="readerbarcode">读者条形码</option>
                                                        <option value="readername">读者名称</option>
                                                    </select>
                                                    <input name="bookname" type="text" id="bookname" size="50">
                                                    <input name="submit" type="submit" class="right-button02"
                                                           value="查 询"/></td>
                                            </tr>
                                            <tr>
                                                <td height="26" bgcolor="#F9D16B">
                                                    <input name="flag" type="checkbox" class="noborder" value="b">
                                                    借阅时间： 从
                                                    <input name="sdate" type="text" id="sdate">
                                                    到
                                                    <input name="edate" type="text" id="edate">
                                                    (日期格式为：2006-07-05)
                                                </td>
                                            </tr>
                                        </table>
                                    </form>

                                    <table width="98%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                                           bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                        <tr align="center" bgcolor="#e3F4F7">
                                            <td width="11%" bgcolor="#F9D16B">图书条形码</td>
                                            <td width="29%" bgcolor="#F9D16B">图书名称</td>
                                            <td width="15%" bgcolor="#F9D16B">读者条形码</td>
                                            <td width="13%" bgcolor="#F9D16B">读者名称</td>
                                            <td width="12%" bgcolor="#F9D16B">借阅时间</td>
                                            <td width="12%" bgcolor="#F9D16B">应还时间</td>
                                            <td width="8%" bgcolor="#F9D16B">是否归还</td>
                                        </tr>

                                        <c:forEach items="${bqList}" var="bq">
                                        <tr>
                                            <td style="padding:5px;">${bq.bookid}</td>
                                            <td style="padding:5px;">${bq.bookname}</td>
                                            <td style="padding:5px;">${bq.rid}</td>
                                            <td style="padding:5px;">${bq.rname}</td>
                                            <td style="padding:5px;">${bq.borrowtime}</td>
                                            <td style="padding:5px;">${bq.limitbacktime}</td>
                                            <td align="center" style="padding:5px;">${bq.ifback == 0 ? "未归还": "已归还"}</td>
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
                                <td width="50%">共 <span class="right-text09">5</span> 页 | 第 <span
                                        class="right-text09">1</span> 页
                                </td>
                                <td width="49%" align="right">[<a href="#" class="right-font08">首页</a> | <a href="#"
                                                                                                            class="right-font08">上一页</a>
                                    | <a href="#" class="right-font08">下一页</a> | <a href="#" class="right-font08">末页</a>]
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
                                                <input name="Submit23222" type="button" class="right-button06"
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
