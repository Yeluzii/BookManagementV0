package top.cjw.bookmanagementv0.controller;

import com.alibaba.druid.util.StringUtils;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import top.cjw.bookmanagementv0.entity.Book;
import top.cjw.bookmanagementv0.entity.User;
import top.cjw.bookmanagementv0.service.BookService;
import top.cjw.bookmanagementv0.service.UserService;
import top.cjw.bookmanagementv0.service.impl.BookServiceImpl;
import top.cjw.bookmanagementv0.service.impl.UserServiceImpl;
import top.cjw.bookmanagementv0.utils.StringUtil;

import java.io.IOException;
import java.util.List;

@WebServlet("/book/*")
@Slf4j
public class BookServlet extends HttpServlet {
    private BookService bookService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        bookService = new BookServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        String method = StringUtil.subUri(uri);
        switch (method) {
            case "selectAll" -> {
                showBook(req, resp);
            }
            case "search" -> {
                searchBook(req, resp);
            }
        }
    }

    private void searchBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        if (StringUtils.isEmpty(name)) {
            showBook(req, resp);
        } else {
            resp.setContentType("text/html;charset=utf-8");
//            resp.getWriter().write(bookService.findByName(name).toString());
            List<Book> list = bookService.findByName(name);
            System.out.println(list);
            req.setAttribute("book-list", list);
            req.getRequestDispatcher("/BookList.jsp").forward(req, resp);
        }
    }

    private void showBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
//        resp.getWriter().write(bookService.findAll().toString());
        List<Book> list = bookService.findAll();
        System.out.println(list);
        req.setAttribute("book-list", list);
        req.getRequestDispatcher("/BookList.jsp").forward(req, resp);
    }


    @Override
    public void destroy() {
        System.out.println("destroy");
    }
}
