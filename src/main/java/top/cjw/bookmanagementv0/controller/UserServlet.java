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
import top.cjw.bookmanagementv0.entity.User;
import top.cjw.bookmanagementv0.service.UserService;
import top.cjw.bookmanagementv0.service.impl.UserServiceImpl;
import top.cjw.bookmanagementv0.utils.StringUtil;

import java.io.IOException;

@WebServlet("/user/*")
@Slf4j
public class UserServlet extends HttpServlet{
    private UserService userService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        String method = StringUtil.subUri(uri);
//        login(req, resp);
        switch (method) {
            case "register" -> {
                register(req, resp);
            }
            case "login" -> {
                login(req, resp);
            }
            case "logout" -> {
                logout(req, resp);
            }
        }

    }

    public void register(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username= req.getParameter("regUsername");
        String password= req.getParameter("regPassword");
        System.out.println(username + password);
        User user = null;
        try {
            user = userService.register(username, password);
            log.info(String.valueOf(user));
            user.setPassword(null);
        }catch (Exception e) {
            log.info(e.getMessage());
        }
        HttpSession session = req.getSession();
        session.setAttribute("username", username);
        assert  user != null;
        session.setAttribute("avatar", user.getAvatar());
        resp.sendRedirect("/login.jsp");
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 接收用户输入，前端用表单键值对的形式传参
        String username = req.getParameter("loginUsername");
        String password = req.getParameter("loginPassword");
        System.out.println(username + password);
        User user = null;
        try {
            // 调用业务逻辑的登录功能
            user = userService.login(username, password);
            log.info(String.valueOf(user));
            // 将用户的密码置空，保护敏感数据
            user.setPassword(null);
        } catch (Exception e) {
            log.info(e.getMessage());
        }

        // 将用户信息存储到 Session 中
        HttpSession session = req.getSession();
        session.setAttribute("username", username);
        assert  user != null;
        session.setAttribute("avatar", user.getAvatar());
        resp.sendRedirect("/homepage.jsp");
    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        resp.sendRedirect("/login.jsp");
    }


    @Override
    public void destroy() {
        System.out.println("destroy");
    }
}