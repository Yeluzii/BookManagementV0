package top.cjw.bookmanagementv0.controller;

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
            case "findByBookName" -> {
                findByBookName(req, resp);
            }
            case "borrow" -> {
                borrow(req, resp);
            }
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
            req.setAttribute("msg3", "借书成功！");
            req.getRequestDispatcher("/book/selectAll").forward(req, resp);
        } else {
            req.setAttribute("msg3", "借书失败！");
            req.getRequestDispatcher("/book/selectAll").forward(req, resp);
        }
    }

    private void findByBookName(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("records", recordService.findByBookName(req.getParameter("bookName")));
    }

    private void findByUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        List<Record> records = recordService.findByUsername(user.getUsername());
        System.out.println("用户名:" + user.getUsername());
        System.out.println("纪录为:" + records);
        req.setAttribute("recordList", records);
        req.setAttribute("username", "小王");
        req.getRequestDispatcher("/user_RecordList.jsp").forward(req, resp);
    }

    private void findAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<Record> records = recordService.findAll();
        session.setAttribute("recordList", records);
        System.out.println("记录为:" + records);
        req.getRequestDispatcher("/admin_RecordList.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        System.out.println("destroy");
    }
}
