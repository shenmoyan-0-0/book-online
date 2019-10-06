<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/10/5
  Time: 11:01 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bo.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bo.entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>主页</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css" type="text/css">
  <style type="text/css">
    h2, h3 {
      color: rgb(73, 73, 73);
    }
    #search {
      height: 80px;
      background-color: rgb(246, 246, 241);
      display: flex;
      align-items: center;
      padding-left: 8%;
      margin-bottom: 10px;
    }
    .search-input {
      flex: 0 0 40%;
      height: 35px;
      background-color: #fff;
      border: none;
      border-radius: 3px;
      margin-left: 50px;
    }
    .search-btn {
      width: 35px;
      height: 35px;
      background-color: rgb(155, 154, 143);
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .search-btn img {
      width: 100%;
      height: 100%;
    }
    .card {
      height: 180px;
      margin: 20px 5px 20px 5px;
    }
    .card img {
      width: 90%;
      height: 90%;
    ;
    }
    .card p {
      font-size: 13px;
      color: #9b9b9b;
    }
    .col-4 img {
      margin: 10px 5px 20px 5px;
      width: 30%;
    }
    hr {
      width: 90%;
      color: #eee;
      margin-top: 10px;
    }
  </style>
</head>
<body>
<%
  List<Book> bookList = (List<Book>) request.getAttribute("bookList");
%>
<%--使用jsp的include动作，将top.jsp页面包含进来顶部导航可以给各个共享--%>
<div id="top">
  <jsp:include page="top.jsp"/>
</div>
<%--搜索区--%>
<div id="search">
  <h2>音乐欣赏🎵</h2>
  <input type="text" placeholder="歌名、歌手" class="search-input">
  <div class="search-btn">
    <img src="img/4.jpg" alt="">
  </div>
</div>

<div class="container">
  <div class="row">
    <%--左2/3部分--%>
    <div class="col-8">
      <h3>音乐分类</h3>
      <hr>
      <div class="row">
        <%--遍历数组数据集合，将每个图书对象放入页面对象--%>
        <%
          for (Book book : bookList) {
            pageContext.setAttribute("book", book);
        %>
        <%--引用col-2表示每行显示5本，最追加card细节样式--%>
        <div class="col-2 card">
          <%--点击每本图书封面图，地址栏跳转为detail/id,进入图书详情Servlet--%>
          <a href="${pageContext.request.contextPath}/detail/${book.id}">
            <img src="img/${book.cover}" alt="">
          </a>
          <p style="color: rgb(51, 119, 178)">${book.name}</p>

        </div>
        <%
          }
        %>
      </div>
    </div>
    <div class="col-4">
      <h3>更多在线音乐</h3>
      <hr>
      <img src="img/3.jpg" alt="">
    </div>
  </div>

  <footer>

    <ul>
      <li>联系我们</li>
      <li>帮助中心</li>
      <li>法律声明</li>
      <li>移动合作</li>
    </ul>
  </footer>
</div>
</body>
</html>
