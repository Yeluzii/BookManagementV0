package top.cjw.bookmanagementv0.controller;

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
import java.util.List;

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
        resp.setContentType("text/html;charset=utf-8");
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
            case "home" -> {
                home(req, resp);
            }
            case "personal-center" -> {
                personalCenter(req, resp);
            }
            case "update-password" -> {
                updatePassword(req, resp);
            }
            case "record" -> {
                record(req, resp);
            }
            case "bgManagement" -> {
                bgManagement(req, resp);
            }
        }

    }

    private void bgManagement(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin_bgManagement.jsp").forward(req, resp);
    }

    private void record(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println(user);
        req.getRequestDispatcher("/record/findByUsername").forward(req, resp);
    }

    private void updatePassword(HttpServletRequest   req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        String old_password = req.getParameter("old_password");
        String new_password = req.getParameter("new_password");
        User user = (User) session.getAttribute("user");
        System.out.println(user);
        if (user.getPassword().equals(old_password)) {
            userService.updateUser(new User(user.getUsername(), new_password));
            req.setAttribute("msg","修改成功，请重新登录!");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            req.setAttribute("msg","修改失败，原密码不正确，您再好好望望!");
            req.getRequestDispatcher("/PersonalCenter.jsp").forward(req, resp);
        }
    }

    private void personalCenter(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String) req.getSession().getAttribute("username");
        User user = userService.userInfo(username);
        HttpSession session = req.getSession();
        session.setAttribute("user",user);
        System.out.println(user);
        if (user == null) {
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/PersonalCenter.jsp").forward(req, resp);
        }
    }

    private void home(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/book/selectAll").forward(req,resp);
    }

    private void findAll(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        List<User> users = userService.findAll();
        System.out.println(users);
        req.setAttribute("userList",users);
        req.getRequestDispatcher("/admin_UserList.jsp").forward(req,resp);
    }

    private void register(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username= req.getParameter("regUsername");
        String password= req.getParameter("regPassword");
        System.out.println(username + password);
        User user = new User(username,password);

//        String re = req.getParameter("verifyCode");
//        String answer = (String) req.getSession().getAttribute("verifyCode");
//        System.out.println(re);
//        System.out.println(answer);
//        if (!Objects.equals(re, answer)){
//            resp.getWriter().println("Verify-code Error!!!");
//        }else {
            try {
                Boolean flag = userService.register(user);
                if (!flag){
                    req.getSession().setAttribute("msg2","注册失败");
                }else {
                    req.getSession().setAttribute("msg2","注册成功");
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


//        String re = req.getParameter("verifyCode");
//        String answer = (String) req.getSession().getAttribute("verifyCode");
//        System.out.println(re);
//        System.out.println(answer);

//        if(!re.equals(answer)){
//            resp.getWriter().println("Verify-code Error!!!");
//        }else{

            try {
                // 调用业务逻辑的登录功能
                Boolean flag = userService.login(username, password);
                if (flag){
                    req.getSession().setAttribute("msg1","用户名或者密码错误，请重新登录！");
                    req.getRequestDispatcher("/login.jsp").forward(req, resp);
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
        user = userService.userInfo(username);
        session.setAttribute("user", user);
        session.setAttribute("avatar", user.getAvatar());
        session.setAttribute("password", password);
        req.getRequestDispatcher("/book/selectAll").forward(req, resp);
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
