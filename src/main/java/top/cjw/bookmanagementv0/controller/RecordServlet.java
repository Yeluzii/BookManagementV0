package top.cjw.bookmanagementv0.controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import top.cjw.bookmanagementv0.entity.Record;
import top.cjw.bookmanagementv0.service.RecordService;
import top.cjw.bookmanagementv0.service.impl.RecordServiceImpl;
import top.cjw.bookmanagementv0.utils.StringUtil;

import java.io.IOException;

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
        String uri = req.getRequestURI();
        String method = StringUtil.subUri(uri);
        switch (method) {
            case "findAll":
                req.setAttribute("records", recordService.findAll());
                req.getRequestDispatcher("").forward(req, resp);
                break;
            case "findByUsername":
                req.setAttribute("records", recordService.findByUsername(req.getParameter("username")));
                req.getRequestDispatcher("").forward(req, resp);
                break;
            case "findByBookName":
                req.setAttribute("records", recordService.findByBookName(req.getParameter("bookName")));
                req.getRequestDispatcher("").forward(req, resp);
                break;
        }
    }

    @Override
    public void destroy() {
        System.out.println("destroy");
    }
}
