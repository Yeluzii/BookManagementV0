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
import top.cjw.bookmanagementv0.entity.Record;
import top.cjw.bookmanagementv0.entity.User;
import top.cjw.bookmanagementv0.service.RecordService;
import top.cjw.bookmanagementv0.service.impl.RecordServiceImpl;
import top.cjw.bookmanagementv0.utils.StringUtil;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@WebServlet("/record/*")
@Slf4j
public class RecordServlet extends HttpServlet {
    private RecordService recordService;

    @Override
    public void init(ServletConfig config) throws ServletException {
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
            case "findAll" -> {
                findAll(req, resp);
            }
            case "findByUsername" -> {
                findByUsername(req, resp);
            }
//            case "adminFindByBookName" -> {
//                adminFindByBookName(req, resp);
//            }
            case "adminSearchByBookName" -> {
                adminSearchByBookName(req, resp);
            }
            case "borrow" -> {
                borrow(req, resp);
            }
            case "adminBorrow" -> {
                adminBorrow(req, resp);
            }
            case "returnBook" -> {
                returnBook(req, resp);
            }
            case "aReturnBook" -> {
                aReturnBook(req, resp);
            }
            case "adminReturnBook" -> {
                adminReturnBook(req, resp);
            }
            case "adminFindByUsername" -> {
                adminFindByUsername(req, resp);
            }
            case "adminSearchByUsername" -> {
                adminSearchByUsername(req, resp);
            }
        }

    }

    private void adminSearchByBookName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookName = req.getParameter("bookName");
        List<Record> records = recordService.findByBookName(bookName);
        System.out.println(records);
        if (StringUtils.isEmpty(bookName)) {
            findAll(req, resp);
        } else if (records.isEmpty()) {
            req.getSession().setAttribute("searchRecord", "没有找到书名为 " + bookName + " 的借阅记录！");
            findAll(req, resp);
        }else {
            req.setAttribute("recordList", records);
            req.getRequestDispatcher("/admin_findRecordList.jsp").forward(req, resp);
        }
    }

    private void adminSearchByUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        List<Record> records = recordService.findByUsername(username);
        if (StringUtils.isEmpty(username)) {
            findAll(req, resp);
        } else if (records.isEmpty()) {
            req.getSession().setAttribute("searchRecord", "未查询到用户 " + username + " 的借阅记录！");
            findAll(req, resp);
        } else {
            req.setAttribute("recordList", records);
            req.getRequestDispatcher("/admin_findRecordList.jsp").forward(req, resp);
        }
    }

    private void adminBorrow(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        LocalDateTime borrowDate = LocalDateTime.now();
        boolean flag = recordService.add(Record.builder()
                .bookId(Integer.parseInt(req.getParameter("bId")))
                .userId(((User) session.getAttribute("user")).getUserId())
                .borrowDatetime(borrowDate)
                .build());
        if (flag) {
            req.getSession().setAttribute("msg3", "借书成功！");
            req.getRequestDispatcher("/book/adminSelectAll").forward(req, resp);
        } else {
            req.getSession().setAttribute("msg3", "借书失败！借阅记录未添加成功！");
            req.getRequestDispatcher("/book/adminSelectAll").forward(req, resp);
        }
    }


    private void aReturnBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookId = req.getParameter("bId");
        System.out.println(bookId);
        User user = (User) req.getSession().getAttribute("user");
        Record record = Record.builder()
                .bookId(Integer.valueOf(bookId))
                .user(user)
                .build();
        Boolean flag = recordService.returnBook(record);
        if (flag) {
            System.out.println("还书成功！");
            req.getSession().setAttribute("msg4", "还书成功！");
            req.getRequestDispatcher("/record/adminFindByUsername").forward(req, resp);
        } else {
            System.out.println("还书失败！");
            req.getSession().setAttribute("msg4", "还书失败！");
            req.getRequestDispatcher("/record/adminFindByUsername").forward(req, resp);
        }
    }

    private void adminFindByUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        List<Record> records = recordService.findByUsername(user.getUsername());
        System.out.println("用户名:" + user.getUsername());
        System.out.println("当前纪录为:" + records);
        req.setAttribute("recordList", records);
        req.setAttribute("username", user.getUsername());
        req.getRequestDispatcher("/admin_RecordList.jsp").forward(req, resp);
    }

    private void adminReturnBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookId = req.getParameter("bId");
        System.out.println(bookId);
        String userName = req.getParameter("userName");
        User user = new User(null, userName, null, null, null);
        Record record = Record.builder()
                .bookId(Integer.valueOf(bookId))
                .user(user)
                .build();
        Boolean flag = recordService.returnBook(record);
        if (flag) {
            System.out.println("管理员帮归还成功！");
            req.getSession().setAttribute("msg7", "管理员帮归还成功！");
            req.getRequestDispatcher("/record/findAll").forward(req, resp);
        } else {
            System.out.println("还书失败！");
            req.getSession().setAttribute("msg7", "管理员帮归还失败！");
            req.getRequestDispatcher("/record/findAll").forward(req, resp);
        }
    }

    private void returnBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookId = req.getParameter("bId");
        System.out.println(bookId);
        User user = (User) req.getSession().getAttribute("user");
        Record record = Record.builder()
                .bookId(Integer.valueOf(bookId))
                .user(user)
                .build();
        Boolean flag = recordService.returnBook(record);
        if (flag) {
            System.out.println("还书成功！");
            req.getSession().setAttribute("msg4", "还书成功！");
            req.getRequestDispatcher("/record/findByUsername").forward(req, resp);
        } else {
            System.out.println("还书失败！");
            req.getSession().setAttribute("msg4", "还书失败！");
            req.getRequestDispatcher("/record/findByUsername").forward(req, resp);
        }
    }

    private void borrow(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        LocalDateTime borrowDate = LocalDateTime.now();
        boolean flag = recordService.add(Record.builder()
                .bookId(Integer.parseInt(req.getParameter("bId")))
                .userId(((User) session.getAttribute("user")).getUserId())
                .borrowDatetime(borrowDate)
                .build());
        if (flag) {
            req.getSession().setAttribute("msg3", "借书成功！");
            req.getRequestDispatcher("/book/userSelectAll").forward(req, resp);
        } else {
            req.getSession().setAttribute("msg3", "借书失败！借阅记录未添加成功！");
            req.getRequestDispatcher("/book/userSelectAll").forward(req, resp);
        }
    }

//    private void adminFindByBookName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String bookName = req.getParameter("bookName");
//        List<Record> records = recordService.findByBookName(bookName);
//        if (StringUtils.isEmpty(bookName)) {
//            findAll(req, resp);
//        } else if (records.isEmpty()) {
//            req.getSession().setAttribute("searchRecord", "没有找到书名为 " + bookName + "的借阅记录！");
//            findAll(req, resp);
//        }else {
//            req.setAttribute("recordList", records);
//            req.getRequestDispatcher("/admin_RecordList.jsp").forward(req, resp);
//        }
//    }

    private void findByUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        List<Record> records = recordService.findByUsername(user.getUsername());
        System.out.println("用户名:" + user.getUsername());
        System.out.println("当前纪录为:" + records);
        req.setAttribute("recordList", records);
        req.setAttribute("username", user.getUsername());
        req.getRequestDispatcher("/user_RecordList.jsp").forward(req, resp);
    }

    private void findAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<Record> records = recordService.findAll();
        session.setAttribute("recordList", records);
        System.out.println("所有记录为:" + records);
        req.getRequestDispatcher("/admin_findRecordList.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        System.out.println("destroy");
    }
}
