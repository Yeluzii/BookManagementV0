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
import top.cjw.bookmanagementv0.entity.Record;
import top.cjw.bookmanagementv0.service.BookService;
import top.cjw.bookmanagementv0.service.RecordService;
import top.cjw.bookmanagementv0.service.impl.BookServiceImpl;
import top.cjw.bookmanagementv0.service.impl.RecordServiceImpl;
import top.cjw.bookmanagementv0.utils.StringUtil;

import java.io.IOException;
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
            case "userSelectAll" -> {
                // 用户查看所有书籍
                userShowBook(req, resp);
            }
            case "adminSelectAll" -> {
                // 管理员查看所有书籍
                adminShowBook(req, resp);
            }
            case "search" -> {
                // 用户搜索书籍
                searchBook(req, resp);
            }
            case "adminSearch" -> {
                // 管理员搜索书籍
                adminSearchBook(req, resp);
            }
            case "type" -> {
                // 用户根据类型，点击各种类别显示书籍
                searchByTypeId(req, resp);
            }
            case "adminType" -> {
                // 管理员根据类型，点击各种类别显示书籍
                adminSearchByTypeId(req, resp);
            }
            case "borrow" -> {
                // 用户借书
                borrowBook(req, resp);
            }
            case "adminBorrow" -> {
                // 管理员借书
                adminBorrow(req, resp);
            }
            case "returnBook" -> {
                // 用户还书
                returnBook(req, resp);
            }
            case "aReturnBook" -> {
                // 管理员还书
                aReturnBook(req, resp);
            }
            case "adminAllBook" -> {
                // 独立出来，请求转发至管理员管理图书页面
                adminAllBook(req, resp);
            }
            case "adminUpdateBook" -> {
                // 管理员更新书籍信息
                adminUpdateBook(req, resp);
            }
            case "adminReturnBook" -> {
                // 请求转发至借阅管理页，管理员帮还书
                adminReturnBook(req, resp);
            }
            case "addBook" -> {
                // 请求转发至图书管理页，管理员添加书籍
                addBook(req, resp);
            }
            case "deleteBook" -> {
                // 请求转发至图书管理页，管理员删除书籍
                deleteBook(req, resp);
            }
        }
    }

    private void aReturnBook(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Integer bId = Integer.valueOf(req.getParameter("bId"));
        String username = (String) req.getSession().getAttribute("username");
        boolean flag = bookService.returnBook(username,bId);
        if (flag) {
            System.out.println("success");
            req.getRequestDispatcher("/record/aReturnBook").forward(req, resp);
        } else {
            System.out.println("fail");
            req.getSession().setAttribute("msg4", "还书失败！库存数量未正常添加！");
            req.getRequestDispatcher("/record/adminFindByUsername").forward(req, resp);
        }
    }

    private void adminBorrow(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        int bookId = Integer.parseInt(req.getParameter("bId"));
        System.out.println("username:" + username + " bookId:" + bookId);
        List<Record> records = recordService.findReturnTimeByUsernameAndBookIdSpecific(username, bookId);
        boolean hasUnreturned = records.stream().anyMatch(record -> record.getReturnDatetime() == null);
        if (hasUnreturned) {
            req.getSession().setAttribute("msg3", "您已借过此书仍未还，不可重复借书！");
            req.getRequestDispatcher("/book/adminSelectAll").forward(req, resp);
        } else {
            if (!bookService.borrow(bookId)) {
                req.getSession().setAttribute("msg3", "库存不足,借书失败！");
                req.getRequestDispatcher("/book/adminSelectAll").forward(req, resp);
            } else {
                req.getRequestDispatcher("/record/adminBorrow").forward(req, resp);
            }
        }

    }

    private void adminSearchByTypeId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String typeId = req.getParameter("typeId");
        List<Book> list = bookService.findByTypeId(Integer.parseInt(typeId));
        System.out.println(list);
        req.setAttribute("bookList", list);
        req.getRequestDispatcher("/admin_BookList.jsp").forward(req, resp);
    }

    private void adminSearchBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        List<Book> list = bookService.findByName(name);
        if (StringUtils.isEmpty(name)) {
            adminShowBook(req, resp);
        } else if (list.isEmpty()) {
            req.getSession().setAttribute("searchBook", "未找到您要查询的名为： " + name + " 的书籍！");
            adminShowBook(req, resp);
        } else {
            System.out.println(list);
            req.setAttribute("bookList", list);
            req.getRequestDispatcher("/admin_BookList.jsp").forward(req, resp);
        }
    }

    private void adminShowBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> list = bookService.findAll();
        list.forEach(System.out::println);
        req.setAttribute("bookList", list);
        req.getRequestDispatcher("/admin_BookList.jsp").forward(req, resp);
    }

    private void deleteBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer bookId = Integer.valueOf(req.getParameter("bId"));
        System.out.println("管理员正在删除" + "书号为：" + req.getParameter("bId") + " 的图书！");
        if (bookService.adminDeleteBook(bookId)) {
            System.out.println("管理员已删除" + "书号为：" + req.getParameter("bId") + " 的图书成功！");
            req.getSession().setAttribute("msg9", "管理员删除图书成功！");
        } else {
            req.getSession().setAttribute("msg9", "管理员删除图书失败！");
        }
        req.getRequestDispatcher("/book/adminAllBook").forward(req, resp);
    }

    private void addBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookName = req.getParameter("bookName");
        Integer typeId = Integer.valueOf(req.getParameter("typeId"));
        Integer count = Integer.valueOf(req.getParameter("count"));
        String cover = req.getParameter("cover");
        Book book = new Book(null,bookName, typeId, cover, count);
        if (bookService.adminAddBook(book)) {
            System.out.println("管理员添加图书成功！");
            req.getSession().setAttribute("msg8", "管理员添加图书成功！");
        } else {
            req.getSession().setAttribute("msg8", "管理员添加图书失败！");
        }
        req.getRequestDispatcher("/book/adminAllBook").forward(req, resp);
    }

    private void adminReturnBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer bId = Integer.valueOf(req.getParameter("bId"));
        String username = req.getParameter("userName");
        System.out.println("管理员帮归还 " + username + " 的 " + bId + " 号书籍");
        if (bookService.returnBook(username, bId)) {
            System.out.println("管理员帮归还成功！");
            req.getSession().setAttribute("msg7", "管理员帮归还成功！");
            req.getRequestDispatcher("/record/adminReturnBook").forward(req, resp);
        } else {
            req.getSession().setAttribute("msg7", "管理员帮归还失败！库存数量未正常添加！");
            req.getRequestDispatcher("/record/findAll").forward(req, resp);
        }
    }

    private void adminUpdateBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer bId = Integer.parseInt(req.getParameter("bId"));
        String bookName = req.getParameter("bookName");
        Integer typeId = Integer.valueOf(req.getParameter("typeId"));
        Integer count = Integer.valueOf(req.getParameter("count"));
        String cover = req.getParameter("cover");
        Book book = new Book(bId, bookName, typeId, cover, count);
        if (bookService.adminUpdateBook(book)) {
            System.out.println("修改图书信息成功！");
            req.getSession().setAttribute("msg6", "修改图书信息成功！");
        } else {
            req.getSession().setAttribute("msg6", "修改图书信息失败！");
       }
        req.getRequestDispatcher("/book/adminAllBook").forward(req, resp);
    }

    private void returnBook(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Integer bId = Integer.valueOf(req.getParameter("bId"));
        String username = (String) req.getSession().getAttribute("username");
        boolean flag = bookService.returnBook(username,bId);
        if (flag) {
            System.out.println("success");
            req.getRequestDispatcher("/record/returnBook").forward(req, resp);
        } else {
            System.out.println("fail");
            req.getSession().setAttribute("msg4", "还书失败！库存数量未正常添加！");
            req.getRequestDispatcher("/record/findByUsername").forward(req, resp);
        }
    }

    private void adminAllBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> list = bookService.findAll();
        list.forEach(System.out::println);
        req.setAttribute("bookList", list);
        req.getRequestDispatcher("/admin_findBookList.jsp").forward(req, resp);
    }

    private void borrowBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        int bookId = Integer.parseInt(req.getParameter("bId"));
        System.out.println("username:" + username + " bookId:" + bookId);
        List<Record> records = recordService.findReturnTimeByUsernameAndBookIdSpecific(username, bookId);
        boolean hasUnreturned = records.stream().anyMatch(record -> record.getReturnDatetime() == null);
        if (hasUnreturned) {
            req.getSession().setAttribute("msg3", "您已借过此书仍未还，不可重复借书！");
            req.getRequestDispatcher("/book/userSelectAll").forward(req, resp);
        } else {
            if (!bookService.borrow(bookId)) {
                req.getSession().setAttribute("msg3", "库存不足,借书失败！");
                req.getRequestDispatcher("/book/userSelectAll").forward(req, resp);
            } else {
                req.getRequestDispatcher("/record/borrow").forward(req, resp);
            }
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
        List<Book> list = bookService.findByName(name);
        if (StringUtils.isEmpty(name)) {
            userShowBook(req, resp);
        } else if (list.isEmpty()) {
            req.getSession().setAttribute("searchBook","未找到您要查询的名为： " + name + " 的书籍！");
            userShowBook(req, resp);
        } else {
            System.out.println(list);
            req.setAttribute("bookList", list);
            req.getRequestDispatcher("/user_BookList.jsp").forward(req, resp);
        }
    }

    private void userShowBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
