package top.cjw.bookmanagementv0.controller;

import com.alibaba.druid.util.StringUtils;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
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
import top.cjw.bookmanagementv0.utils.ResponseUtils;
import top.cjw.bookmanagementv0.utils.StringUtil;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

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
            case "findAll" -> {
                findAll(req, resp);
            }
            case "logout" -> {
                logout(req, resp);
            }
        }

    }

    private void findAll(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ResponseUtils responseUtils;
        List<User> users = userService.findAll();
        responseUtils = new ResponseUtils().put("list",users);
        resp.setContentType("text/html;charset=utf-8");
        resp.getWriter().println(responseUtils.toJsonString());
    }

    private void register(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username= req.getParameter("regUsername");
        String password= req.getParameter("regPassword");
        System.out.println(username + password);
        User user = new User(username,password);

        String re = req.getParameter("verifyCode");
        String answer = (String) req.getSession().getAttribute("verifyCode");
        System.out.println(re);
        System.out.println(answer);
//        if (!Objects.equals(re, answer)){
//            resp.getWriter().println("Verify-code Error!!!");
//        }else {
            try {
                Boolean flag = userService.register(user);
                if (!flag){
                    req.getSession().setAttribute("register","FAILED");
                }else {
                    req.getSession().setAttribute("register","SUCCESS");
                }
                log.info(String.valueOf(user));
                user.setPassword(null);
            }catch (Exception e) {
                log.info(e.getMessage());
            }
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            session.setAttribute("avatar", user.getAvatar());
            resp.sendRedirect("/login.jsp");
//        }

    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 接收用户输入，前端用表单键值对的形式传参
        String username = req.getParameter("loginUsername");
        String password = req.getParameter("loginPassword");
        System.out.println(username + " " + password);
        User user = new User(username,password);

        String re = req.getParameter("verifyCode");
        String answer = (String) req.getSession().getAttribute("verifyCode");
        System.out.println(re);
        System.out.println(answer);
//        if(!re.equals(answer)){
//            resp.getWriter().println("Verify-code Error!!!");
//        }else{

            try {
                // 调用业务逻辑的登录功能
                Boolean flag = userService.login(username, password);
                if (flag){
                    req.getSession().setAttribute("login","FAILED");
//                    request.setAttribute("failMsg", "用户名、邮箱或者密码错误，请重新登录！");
                    req.getRequestDispatcher("/login.jsp").forward(req, resp);
//                    resp.sendRedirect("/login.jsp");
                }
                log.info(String.valueOf(user));
                // 将用户的密码置空，保护敏感数据
                user.setPassword(null);
            } catch (Exception e) {
                resp.sendRedirect("/login.jsp");
                log.info(e.getMessage());
            }

//        }


        // 将用户信息存储到 Session 中
        HttpSession session = req.getSession();
        session.setAttribute("username", username);
        assert  user != null;
        session.setAttribute("avatar", user.getAvatar());
        session.setAttribute("password", password);
        resp.sendRedirect("/header.jsp");
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
