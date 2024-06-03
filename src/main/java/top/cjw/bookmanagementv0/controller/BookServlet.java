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
import top.cjw.bookmanagementv0.service.RecordService;
import top.cjw.bookmanagementv0.service.UserService;
import top.cjw.bookmanagementv0.service.impl.BookServiceImpl;
import top.cjw.bookmanagementv0.service.impl.RecordServiceImpl;
import top.cjw.bookmanagementv0.service.impl.UserServiceImpl;
import top.cjw.bookmanagementv0.utils.StringUtil;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/book/*")
@Slf4j
public class BookServlet extends HttpServlet {
    private BookService bookService;
    private RecordService recordService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        bookService = new BookServiceImpl();
        recordService = new RecordServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String uri = req.getRequestURI();
        String method = StringUtil.subUri(uri);
        switch (method) {
            case "selectAll" -> {
                showBook(req, resp);
            }
            case "search" -> {
                searchBook(req, resp);
            }
            case "type" -> {
                searchByTypeId(req, resp);
            }
            case "borrow" -> {
                borrowBook(req, resp);
            }
            case "adminAllBook" -> {
                adminAllBook(req, resp);
            }
        }
    }

    private void adminAllBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> list = bookService.findAll();
        list.forEach(System.out::println);
        req.setAttribute("bookList", list);
        req.getRequestDispatcher("/admin_BookList.jsp").forward(req, resp);
    }

    private void borrowBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        int bookId = Integer.parseInt(req.getParameter("bId"));
        System.out.println("username:" + username + " bookId:" + bookId);
        int borrowTime = recordService.findBorrowTimesByUsernameAndBookIdSpecific(username, bookId);
        System.out.println(borrowTime);
        if (borrowTime == 0){
            if (!bookService.borrow(Integer.parseInt(req.getParameter("bId")))) {
                req.setAttribute("msg3", "库存不足,借书失败！");
                req.getRequestDispatcher("/book/selectAll").forward(req, resp);
            } else {
//            req.setAttribute("msg3", "借书成功");
                req.getRequestDispatcher("/record/borrow").forward(req, resp);
            }
        }else {
            req.setAttribute("msg3", "您已借过此书，不可重复借书！");
            req.getRequestDispatcher("/book/selectAll").forward(req, resp);
        }

    }

    private void searchByTypeId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String typeId = req.getParameter("typeId");
        List<Book> list = bookService.findByTypeId(Integer.parseInt(typeId));
        System.out.println(list);
        req.setAttribute("bookList", list);
        req.getRequestDispatcher("/user_BookList.jsp").forward(req, resp);
    }

    private void searchBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        if (StringUtils.isEmpty(name)) {
            showBook(req, resp);
        } else {
//            resp.getWriter().write(bookService.findByName(name).toString());
            List<Book> list = bookService.findByName(name);
            System.out.println(list);
            req.setAttribute("bookList", list);
            req.getRequestDispatcher("/user_BookList.jsp").forward(req, resp);
        }
    }

    private void showBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> list = bookService.findAll();
        list.forEach(System.out::println);
        req.setAttribute("bookList", list);
        req.getRequestDispatcher("/user_BookList.jsp").forward(req, resp);
    }


    @Override
    public void destroy() {
        System.out.println("destroy");
    }
}
