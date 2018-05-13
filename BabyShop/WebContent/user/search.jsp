<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>搜索</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
    name="viewport" content="width=device-width, initial-scale=1.0">
<link
    href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"
    rel="stylesheet" media="screen">
<Link href="${pageContext.request.contextPath }/css/unit.css"
    rel="stylesheet" type="text/css">
<Link href="${pageContext.request.contextPath }/css/search.css"
    rel="stylesheet" type="text/css">

</head>
<body>
    <script
        src="${pageContext.request.contextPath }/jquery/jquery.min.js"></script>
    <script
        src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>

    <jsp:include page="util.jsp" />
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <div class="navbar">
                    <div class="navbar-inner">
                        <div class="container-fluid">
                            <a data-target=".navbar-responsive-collapse"
                                data-toggle="collapse"
                                class="btn btn-navbar"><span
                                class="icon-bar"></span><span
                                class="icon-bar"></span><span
                                class="icon-bar"></span></a> <a
                                href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=index"
                                class="brand">母婴购物网站</a>
                            <div
                                class="nav-collapse collapse navbar-responsive-collapse">
                                <ul class="nav">
                                    <li class="active"><a
                                        href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=index">首页</a></li>
                                    <li><a
                                        href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=login">${uname }${userInfo.userName }</a></li>
                                    <li><a
                                        href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=register">${unameNext }</a></li>
                                    <li class="dropdown"><a
                                        data-toggle="dropdown"
                                        class="dropdown-toggle" href="#">更多<strong
                                            class="caret"></strong></a>
                                        <ul class="dropdown-menu">
                                            <li><a
                                                href="${pageContext.request.contextPath}/cart/seeCart.action"
                                                target=_blank>查看购物车</a></li>
                                        </ul></li>
                                </ul>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span4"></div>
            <div class="span4">
                <form class="form-search"
                    action="${pageContext.request.contextPath}/cmty/searchByName.action">
                    <input class="input-medium search-query" type="text"
                        name="commodityName" />
                    <button type="submit" class="btn">查找</button>
                </form>
            </div>
            <div class="span4"></div>
        </div>
        <div class="row-fluid">
            <div class="span2">
                <ul>
                    <li><a
                        href="${pageContext.request.contextPath}/cmty/changeCategory.action?category=自营">自营</a></li>
                    <li><a
                        href="${pageContext.request.contextPath}/cmty/changeCategory.action?category=奶粉">奶粉</a></li>
                    <li><a
                        href="${pageContext.request.contextPath}/cmty/changeCategory.action?category=奶瓶">奶瓶</a></li>
                    <li><a
                        href="${pageContext.request.contextPath}/cmty/changeCategory.action?category=纸尿裤">纸尿裤</a></li>
                    <li><a
                        href="${pageContext.request.contextPath}/cmty/changeCategory.action?category=衣服">衣服</a></li>
                </ul>
            </div>
            <div class="span6">
                <div id="forSearch">
                    <div style="clear: both"></div>
                    <c:forEach var="cmty" items="${cmties }"
                        varStatus="sta">
                        <c:if test="${category==null}">
                            <div class="imgdiv">
                                <div>
                                    <a
                                        href="${pageContext.request.contextPath }/cmty/cmtyInfo.action?cmtyId=${cmty.id } "
                                        target=_blank> <img
                                        alt="Error"
                                        src="../${cmty.imageSrc }"></a>
                                </div>
                                <div>
                                    <p>${cmty.name }</p>
                                </div>
                            </div>
                        </c:if>

                        <c:if
                            test="${(category!=null) && (category==cmty.category)}">
                            <div class="imgdiv">
                                <div>
                                    <a
                                        href="${pageContext.request.contextPath }/cmty/cmtyInfo.action?cmtyId=${cmty.id } "
                                        target=_blank> <img
                                        alt="Error"
                                        src="../${cmty.imageSrc }"></a>
                                </div>
                                <div>
                                    <p>${cmty.name }</p>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="span4"></div>
        </div>
    </div>

</body>
</html>