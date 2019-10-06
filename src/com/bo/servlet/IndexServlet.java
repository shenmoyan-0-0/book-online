package com.bo.servlet;

import com.bo.entity.Book;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/index")
public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
        //获得各个seevlet共享的对象
        ServletContext sc = this.getServletContext();
        //取得全局应用对象的变量
        List<Book>bookList = (List<Book>) sc.getAttribute("bookList");
        req.setAttribute("bookList",bookList);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}

