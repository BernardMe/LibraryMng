<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <base href="${applicationScope.basePath }">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书借阅</title>
    <link href="css/style.css" rel="stylesheet">

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
        function checkreader(form) {
            if (form.barcode.value == "") {
                alert("请输入读者条形码!");
                form.barcode.focus();
                return;
            }
            form.submit();
        }
        function checkbook(form) {
            if (form.barcode.value == "") {
                alert("请输入读者条形码!");
                form.barcode.focus();
                return;
            }
            if (form.inputkey.value == "") {
                alert("请输入查询关键字!");
                form.inputkey.focus();
                return;
            }

            if (form.number.value - form.borrowNumber.value <= 0) {
                alert("您不能再借阅其他图书了!");
                return;
            }
            form.submit();
        }

        /**
         * 读者借阅检查
         */
        function getReaderInfo4Borrow() {
            var rid = $("#rid").val();
            $.get("borrow.action", {"m": "getReaderInfo4Borrow", "rid": rid}, function (data) {
                data = JSON.parse(data);
                console.info(data[0]);

                $("#rname").val(data[0].rname);
                $("#gender").val(data[0].gender);
                $("#rtypename").val(data[0].rtypename);
                $("#papertype").val(data[0].papertype);
                $("#paperno").val(data[0].paperno);
                $("#count").val(data[0].count);
            });
        }
    </script>
</head>
<body onLoad="clockon(bgclock)">


<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td valign="top" bgcolor="#FFFFFF">
            <table width="100%" height="509" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="27" valign="top" style="padding:5px;" class="word_orange">当前位置：图书借还 &gt; 图书借阅 &gt;&gt;&gt;</td>
                </tr>
                <tr>
                    <td align="center" valign="top" style="padding:5px;">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <form name="form1" method="post" action="borrow.do?action=bookborrow">
                                <tr>
                                    <td height="47" background="Images/borrowBackRenew.gif">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td height="72" align="center" valign="top" background="Images/main_booksort_1.gif"
                                        bgcolor="#F8BF73">
                                        <table width="96%" border="0" cellpadding="1" cellspacing="0"
                                               bordercolor="#FFFFFF" bgcolor="#F8BF73">
                                            <tr>
                                                <td valign="top" bgcolor="#F8BF73">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0"
                                                           bgcolor="#FFFFFF">


                                                        <tr>
                                                            <td>
                                                                <table width="90%" height="21" border="0"
                                                                       cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td width="24%" height="18"
                                                                            style="padding-left:7px;padding-top:7px;">
                                                                            <img src="Images/reader_checkbg.jpg"
                                                                                 width="142" height="18"></td>
                                                                        <td width="76%" style="padding-top:7px;">读者条形码：
                                                                            <input name="barcode" type="text"
                                                                                   id="rid" value="" size="24">
                                                                            &nbsp;
                                                                            <input type="button" name="Submit"
                                                                                   value="确定" class="button"
                                                                                   onclick="getReaderInfo4Borrow()"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="13" align="left" style="padding-left:7px;">
                                                                <hr width="90%" size="1">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <table width="96%" border="0" cellpadding="0"
                                                                       cellspacing="0">
                                                                    <tr>
                                                                        <td height="27">姓&nbsp;&nbsp;&nbsp;&nbsp;名：
                                                                            <input name="rname" type="text"
                                                                                   id="rname" value=""></td>
                                                                        <td>性&nbsp;&nbsp;&nbsp;&nbsp;别：
                                                                            <input name="gender" type="text" id="gender"
                                                                                   value=""></td>
                                                                        <td>读者类型：
                                                                            <input name="rtypename" type="text"
                                                                                   id="rtypename" value=""></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="27">证件类型：
                                                                            <input name="papertype" type="text"
                                                                                   id="papertype" value=""></td>
                                                                        <td>证件号码：
                                                                            <input name="paperno" type="text"
                                                                                   id="paperno" value=""></td>
                                                                        <td>可借数量：
                                                                            <input name="count" type="text" id="count"
                                                                                   value="0" size="17">
                                                                            册
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" background="Images/borrow_if.gif">&nbsp;添加的依据：
                                                    <input name="f" type="radio" class="noborder" value="barcode"
                                                           checked>
                                                    图书条形码 &nbsp;&nbsp;
                                                    <input name="f" type="radio" class="noborder" value="bookname">
                                                    图书名称&nbsp;&nbsp;
                                                    <input name="inputkey" type="text" id="inputkey" size="50">
                                                    <input type="button" name="Submit" value="查询" class="button"
                                                           onclick="window.location.href = 'success.html'"/>

                                                    <input name="operator" type="hidden" id="operator" value="java1234">


                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" bgcolor="#FCEC9A" style="padding:5px">
                                                    <table width="99%" border="1" cellpadding="0" cellspacing="0"
                                                           bordercolor="#FFFFFF" bordercolorlight="#FFFFFF"
                                                           bordercolordark="#F6B83B" bgcolor="#FFFFFF">
                                                        <tr align="center" bgcolor="#F9D16B">
                                                            <td width="24%" height="25">图书名称</td>
                                                            <td width="14%">借阅时间</td>
                                                            <td width="14%">应还时间</td>
                                                            <td width="13%">出版社</td>
                                                            <td width="12%">书架</td>
                                                            <td colspan="2">定价(元)</td>
                                                            <td width="10%" align="center">选择</td>
                                                        </tr>
                                                        <!--<td bgcolor="#FFFFFF"><input id="course" type="checkbox"   name="${sc.courseid}" value="${sc.tid }#${sc.courseid}" onclick="check(${sc.tid },${sc.courseid});"/></td>-->
                                                        <input name="borrowNumber" type="hidden" id="borrowNumber"
                                                               value="0">
                                                    </table>
                                                </td>
                                            </tr>

                                        </table>
                                    </td>

                                </tr>
                                <tr>
                                    <td align="center" height="40px">
                                        <input type="button" name="Submit" value="确定借阅" class="button"
                                               onclick="alert('提交成功！');"/>　
                                    </td>

                                    <td height="19" background="Images/main_booksort_2.gif">&nbsp;</td>
                                </tr>
                            </form>
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