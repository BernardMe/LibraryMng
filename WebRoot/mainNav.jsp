<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <base href="${applicationScope.basePath }">
    <title>TEST_下拉菜单</title>

    <link type="text/css" href="css/nav_style.css" rel="stylesheet"/>

    <script language="javascript">
        function quit(){
            if(confirm("真的要退出系统吗?")){
                window.location="login.action?m=exit";
            }
        }
    </script>

    <!--[if lt IE 9]><script src="js/html5.js"></script><![endif]-->

    <style type="text/css">
        .gg{
            width:100%;
            height: 500px;
        }
        .topPic{
            height: 118px;
            valign: top;
            background: url(Images/top_bg.gif);
            bgcolor: #EEEEEE;
        }
    </style>
</head>

<body>
<header>

    <nav>
        <ul>
            <li><a href="main.html" target="navFrame" class="icon home"><span>网页特效</span></a></li>
         <c:if test="${pur.sysset eq '1' }">   
                <li class="dropdown">
                    <a >系统设置</a>
                    <ul>
                        <li><a href="library.action?m=showLibrary" target="navFrame">图书馆信息</a></li>
                        <c:if test="${user.mname eq 'gz' }">
                            <li><a href="purview.action?m=showAllHasPur&page=1" target="navFrame">管理员设置</a></li>
                         </c:if>
                        <li><a href="parameter.action?m=showParameter&page=1" target="navFrame">书卡设置</a></li>
                        <li><a href="shelf.action?m=queryAllShelf&page=1" target="navFrame">书架设置</a></li>
                    </ul>
                </li>
            </c:if>
             <c:if test="${pur.readerset eq '1' }">
                <li class="dropdown">
                    <a >读者管理</a>
                    <ul class="large">
                        <li><a href="reader.action?m=getReaderTypeList&page=1" target="navFrame">读者类型管理</a></li>
                        <li><a href="reader.action?m=getReaderList&page=1" target="navFrame">读者档案管理</a></li>
                    </ul>
                </li>
            </c:if> 
             <c:if test="${pur.bookset eq '1' }">
                <li class="dropdown">
                    <a >图书管理</a>
                    <ul class="large">
                        <li><a href="book.action?m=queryAllBookType" target="navFrame">图书类型管理</a></li>
                        <li><a href="book.action?m=queryAllBook" target="navFrame">图书档案管理</a></li>
                    </ul>
                </li>
            </c:if> 
             <c:if test="${pur.borrowback eq '1' }"> 
                <li class="dropdown">
                    <a >图书借还</a>
                    <ul class="large">
                        <li><a href="borrowReturn/bookBorrow.jsp" target="navFrame">图书借阅</a></li>
                        <li><a href="borrowReturn/bookRenew.html" target="navFrame">图书续借</a></li>
                        <li><a href="borrowReturn/bookBack.html" target="navFrame">图书归还</a></li>
                    </ul>
                </li>
            </c:if>
             <c:if test="${pur.sysquery eq '1' }"> 
                <li class="dropdown">
                    <a >系统查询</a>
                    <ul class="large">
                        <li><a href="book.action?m=queryAll4sys&page=1" target="navFrame">图书档案查询</a></li>
                        <li><a href="sysQuery/borrowQuery.html" target="navFrame">图书借阅查询</a></li>
                        <li><a href="sysQuery/bremind.html" target="navFrame">借阅到期提醒</a></li>
                    </ul>
                </li>
            </c:if>
            <li class="dropdown">
                <a href="sysSetting/pwd_Modify.jsp" target="navFrame">更改口令</a>
            </li>
            <li class="dropdown">
                <a href="javascript:void(0);" onClick="quit()">退出系统</a>
            </li>
        </ul>
        <span align="right">当前用户：${user.mname }</span>
    </nav>
</header>
<br>
<div data-role="main">
    <iframe class="gg" name="navFrame" src="main.html" frameborder="0">
        <!--如果浏览器不支持iframe,则显示该图片-->
        <span><img src="img/ThereNoIframe.jpg" alt="ThereNoIframe"></span>
    </iframe>

</div>
</body>
<%  
 response.setHeader("Pragma","No-cache");  
 response.setHeader("Cache-Control","No-cache");  
 response.setDateHeader("Expires", -1);  
 response.setHeader("Cache-Control", "No-store");  
%>
</html>
