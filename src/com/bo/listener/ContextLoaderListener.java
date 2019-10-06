package com.bo.listener;

import com.bo.entity.Book;
import com.bo.entity.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;



@WebListener
public class ContextLoaderListener implements ServletContextListener {

    /**
     * @Description 容器初始化方法
     * @param sce
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("容器启动");
        //创建并生成用户数据列表
        List<User> userList = new ArrayList<>(3);
        User[] users = {
                new User( 1,"aaa@qq.com","698d51a19d8a121ce581499d7b701668","哈哈","4.jpg","南京",LocalDate.of(2018,6,11)),
                new User(2,"bbb@qq.com","698d51a19d8a121ce581499d7b701668","时代","1.jpg","北京",LocalDate.of(2019,6,11)),
                new User(3,"ccc@qq.com","698d51a19d8a121ce581499d7b701668","家电","2.jpg","东京",LocalDate.of(2018,6,11)),

        };


        //创建并生成图书数据列表
        List<Book> bookList = new ArrayList<>(5);
        Book[] books = {
                new Book(1, "中嘻合璧", "7.jpg", "[法] 塞巴斯蒂安"),
                new Book(2, "国语情歌精选", "8.jpg", "[英]戴伦•麦加维"),
                new Book(3, "粤语情歌精选", "9.jpg", "[美]理查德·耶茨"),
                new Book(4, "纯粹", "6.jpg", "[英]伊恩·布莱克"),
                new Book(5, "周末愉快", "5.jpg", "钟晓阳"),


        };
        userList = Arrays.asList(users);
        bookList = Arrays.asList(books);

        //获得全局变量
        ServletContext servletContext = sce.getServletContext();
        //设置全局变量属性，将用户和图书列表数据记入，整个应用可以共享
        servletContext.setAttribute("userList", userList);
        servletContext.setAttribute("bookList", bookList);
    }

    /**
     * 销毁方法
     *
     * @param sce
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("容器销毁");
    }
}
