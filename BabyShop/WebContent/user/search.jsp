<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>search</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
    name="viewport" content="width=device-width, initial-scale=1.0">
<link
    href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css"
    rel="stylesheet" media="screen">

</head>
<body>
    <script src="${pageContext.request.contextPath }/easyUI/jquery.min.js"></script>
    <script
        src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
    
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=index">首页</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a
                            href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=login">${uname }${userInfo.userName }</a>
                        </li>
                        <li><a
                            href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=register">${unameNext }</a>
                        </li>
                        <li><a
                            href="${pageContext.request.contextPath }/user/more.jsp">更多</a></li>
                        <li><a
                            href="${pageContext.request.contextPath }/user/aboutUs.jsp">关于我们</a>
                        </li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle"
                            data-toggle="dropdown">更多<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li><a
                                    href="${pageContext.request.contextPath}/cart/seeCart.action"
                                    target=_blank>查看购物车</a></li>
                            </ul></li>
                    </ul>
					<form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/search/byName.action" method="post">
						<div class="form-group">
							<input class="form-control" type="text" maxlenght=100 name="bookName" />
						</div> <button type="submit" class="btn btn-default">搜索</button>
					</form>
				</div>
			</nav>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div id="forSearch">
				<div style="clear: both"></div>
				<c:forEach var="book" items="${books }" varStatus="sta">
					<div class="imgdiv" >
						<div>
							<a href="${pageContext.request.contextPath }/search/bookInfo.action?bookId=${book.bookId } "  target=_blank>
								<img alt="Error" src="../${book.imageSrc }" ></a>
						</div>
						<div>
							<p>${book.bookName }</p><p>${book.press }</p><p>${book.author }</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-4 column">
		</div>
		<div class="col-md-4 column">
			<ul class="pagination">
				<li>
					 <a href="${pageContext.request.contextPath }/search/changePage.action?page=1">首页</a>
				</li>
				<li>
					 <a href="${pageContext.request.contextPath }/search/changePage.action?page=${pageBean.currentPage-1 }">上一页</a>
				</li>
				<li>
					<a href="#">当前${pageBean.currentPage }页</a>
				</li>
				<li>
					 <a href="${pageContext.request.contextPath }/search/changePage.action?page=${pageBean.currentPage+1 }">下一页</a>
				</li>
				<li>
					 <a href="${pageContext.request.contextPath }/search/changePage.action?page=${pageBean.getTotalPage() }">尾页</a>
				</li>
			</ul>
		</div>
		<div class="col-md-4 column">
		</div>
	</div>
</div>
</body>
</html>