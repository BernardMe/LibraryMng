<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
    <base href="${applicationScope.basePath }">
    <title>图书馆管理系统</title>
    <link href="css/style.css" rel="stylesheet">
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }

        -->
        #code {
            cursor: pointer;
        }

    </style>
</head>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
    function changecode() {
        $("#code").attr("src", "code.jpg?s=" + Math.random() + new Date());
    }
    function checkcode() {
        $("#codeSpan").load("checkcode.action?m=checkcode&vcode=" + $("#vcode").val());
    }
    function checkmname() {
        $("#mnameSpan").empty();
        if ($.trim($("#mname").val()).length == 0) {
            $("#mnameSpan").append("&nbsp;<img src='img/no.png' />");
            return false;
        } else {
            $("#mnameSpan").append("&nbsp;<img src='img/ok.png' />");

            return true;
        }
    }
    function checkmpwd() {
        $("#mpwdSpan").empty();
        if ($.trim($("#mpwd").val()).length == 0) {
            $("#mpwdSpan").html("&nbsp;<img src='img/no.png' />");
            return false;
        } else {
            return true;

        }
    }

    function checkAll() {
        var flag;
        var c = $("#codeSpan").html();
        if (c == "" || c.indexOf("no") > 0) {
            checkcode();
            flag = false;

        } else {
            flag = true;

        }

        var action = flag & checkmname() & checkmpwd();

        if (action) {
            return true;
        } else {
            return false;
        }
    }

</script>


<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F9D16B" class="tableBorder">
    <tr>
        <td>
            <table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="110">
                        <center><h2 style="color: red">${error}</h2></center>
                        <c:remove var="error" scope="session"/>
                    </td>
                </tr>


            </table>


        </td>
    </tr>
    <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">

            <tr>
                <td>
                    <table width="100%" height="525" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="523" align="center" valign="top">
                                <table width="100%" height="271" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="271" align="right" valign="top" class="word_orange">
                                            <table width="100%" height="255" border="0" cellpadding="0" cellspacing="0"
                                                   background="Images/login.jpg">
                                                <tr>
                                                    <td height="17">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td height="179">
                                                        <table width="100%" height="63" border="0" cellpadding="0"
                                                               cellspacing="0">
                                                            <tr>
                                                                <td width="2%">&nbsp;</td>
                                                                <td width="97%" align="center" valign="top">
                                                                    <form name="form1" method="post"
                                                                          action="login.action">
                                                                        <input type="hidden" name="m" value="login"/>
                                                                        <table width="100%" border="0" cellpadding="0"
                                                                               cellspacing="0"
                                                                               bordercolorlight="#FFFFFF"
                                                                               bordercolordark="#D2E3E6">

                                                                            <tr>
                                                                                <td width="11%" height="37">&nbsp;</td>
                                                                                <td width="12%">管理员名称：</td>
                                                                                <td width="68%">
                                                                                    <input name="mname" type="text"
                                                                                           class="logininput" id="mname"
                                                                                           size="27"
                                                                                           onblur="checkmname();"><span
                                                                                        id="mnameSpan"></span></td>
                                                                                <td width="9%">&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td height="37">&nbsp;</td>
                                                                                <td>管理员密码：</td>
                                                                                <td><input name="mpwd" type="password"
                                                                                           class="logininput" id="mpwd"
                                                                                           size="27"
                                                                                           onblur="checkmpwd();"><span
                                                                                        id="mpwdSpan"></span></td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td height="35">&nbsp;</td>
                                                                                <td height="35" class="login-text02">
                                                                                    验证图片：
                                                                                    <br/>
                                                                                </td>
                                                                                <td><img id="code" src="code.jpg"
                                                                                         width="109" height="40"
                                                                                         onclick="changecode();"/> <a
                                                                                        href="javascript:void(0)"
                                                                                        class="login-text03"
                                                                                        onclick="changecode();">看不清楚，换张图片</a>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td height="37">&nbsp;</td>
                                                                                <td>请输入验证码：</td>
                                                                                <td>
                                                                                    <input id="vcode" name="textfield3"
                                                                                           type="text" size="27"
                                                                                           onblur="checkcode();"/><span
                                                                                        id="codeSpan"></span>
                                                                                </td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>

                                                                            <tr>
                                                                                <td height="30">&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td align="LEFT">
                                                                                    <input name="Submit2" type="submit"
                                                                                           class="right-button01"
                                                                                           value="确认登陆"
                                                                                           onclick="return checkAll();"/>
                                                                                    <input name="Submit232" type="reset"
                                                                                           class="right-button02"
                                                                                           value="重 置"/></td>

                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </form>
                                                                </td>
                                                                <td width="1%">&nbsp;</td>
                                                                <center><h2 style="color: red">${error}</h2></center>
                                                                <c:remove var="error" scope="session"/>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>

                                            </table>
                                        </td>
                                    </tr>

                                </table>
                                <table width="100%" height="27" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center" class="word_login">CopyRight &copy; 2008 www.**********.com
                                            长春市*****有限公司<br>
                                            本站请使用IE6.0或以上版本 1024*768为最佳显示效果
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
