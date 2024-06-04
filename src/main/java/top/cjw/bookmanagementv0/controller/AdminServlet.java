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
import java.util.List;

@WebServlet("/admin/*")
@Slf4j
public class AdminServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("AdminServlet初始化");
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
        switch (method) {
            case "findAll" -> {
                findAll(req, resp);
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
            case "updateAvatar" -> {
                updateAvatar(req, resp);
            }
            case "updateUserAvatar" -> {
                updateUserAvatar(req, resp);
            }
            case "record" -> {
                record(req, resp);
            }
            case "bgManagement" -> {
                bgManagement(req, resp);
            }
            case "adminUpdatePassword" -> {
                adminUpdatePassword(req, resp);
            }
            case "deleteUser" -> {
                deleteUser(req, resp);
            }
            case "updateIsAdminByUserName" -> {
                updateIsAdminByUserName(req, resp);
            }
            case "searchUser" -> {
                searchUser(req, resp);
            }
        }   
    }

    private void searchUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        List<User> users = userService.findByPartUserName(username);
        if (StringUtils.isEmpty(username)){
            findAll(req, resp);
        }else if (users.isEmpty()) {
            req.getSession().setAttribute("searchUser","未找到您要查询的名为： " + username + " 的用户");
            findAll(req, resp);
        } else {
            req.setAttribute("userList",users);
            req.getRequestDispatcher("/admin_UserList.jsp").forward(req, resp);
        }
    }

    private void updateUserAvatar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("userName");
        String avatar = req.getParameter("avatar");
        User user = new User(null,username,null,null,avatar);
        userService.updateAvatar(user);
        req.getSession().setAttribute("updateUserAvatar","修改用户 " + user.getUsername() + " 头像地址为 " + user.getAvatar() + " 成功!");
        req.getRequestDispatcher("/admin/findAll").forward(req, resp);
    }

    private void updateAvatar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println("修改前头像为：" + user.getAvatar());
        user.setAvatar(req.getParameter("avatar"));
        userService.updateAvatar(user);
        System.out.println("修改后头像为：" + user.getAvatar());
        session.setAttribute("updateAvatar","修改头像地址为 " + user.getAvatar() + " 成功,重新登录即可刷新头像！");
        req.getRequestDispatcher("/admin/personal-center").forward(req, resp);
    }

    private void personalCenter(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String) req.getSession().getAttribute("username");
        User user = userService.userInfo(username);
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        System.out.println(user);
        if (user == null) {
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/admin_PersonalCenter.jsp").forward(req, resp);
        }
    }

    private void updateIsAdminByUserName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Byte isAdmin = Byte.valueOf(req.getParameter("isAdmin"));
        String userName = req.getParameter("userName");
        boolean flag = userService.updateIsAdminByUserName(userName, isAdmin);
        if (flag) {
            System.out.println("管理员已修改" + "用户名为：" + req.getParameter("userName") + " 的用户权限！");
            req.getSession().setAttribute("msg11", "管理员修改用户"+userName+"权限成功！");
            req.getRequestDispatcher("/admin/findAll").forward(req, resp);

        }
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer userId = Integer.valueOf(req.getParameter("userId"));
        System.out.println("管理员正在删除" + "用户号为：" + req.getParameter("bId") + " 的用户！");
        if (userService.deleteUser(userId)) {
            System.out.println("管理员已删除" + "用户号为：" + req.getParameter("bId") + " 的用户成功！");
            req.getSession().setAttribute("msg10", "管理员删除用户成功！");
        } else {
            req.getSession().setAttribute("msg10", "管理员删除用户失败！");
        }
        req.getRequestDispatcher("/admin/findAll").forward(req, resp);
    }

    private void adminUpdatePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String new_password = req.getParameter("new_password");
        String userName = (String) req.getParameter("userName");
        System.out.println("即将要修改密码的用户名为：" + userName);
        userService.updateUser(new User(userName, new_password));
        req.getSession().setAttribute("msg5", "成功修改 " + userName +" 的密码");
        req.getRequestDispatcher("/admin/findAll").forward(req, resp);
    }

    private void bgManagement(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin_bgManagement.jsp").forward(req, resp);
    }

    private void record(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println(user);
        req.getRequestDispatcher("/record/adminFindByUsername").forward(req, resp);
    }

    private void updatePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String old_password = req.getParameter("old_password");
        String new_password = req.getParameter("new_password");
        User user = (User) session.getAttribute("user");
        System.out.println(user);
        if (user.getPassword().equals(old_password)) {
            userService.updateUser(new User(user.getUsername(), new_password));
            req.getSession().setAttribute("msg", "修改成功，请重新登录!");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            req.getSession().setAttribute("msg", "修改失败，原密码不正确，您再好好望望!");
            req.getRequestDispatcher("/admin_PersonalCenter.jsp").forward(req, resp);
        }
    }

    private void home(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/book/adminSelectAll").forward(req, resp);
    }

    private void findAll(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        List<User> users = userService.findAll();
        System.out.println(users);
        req.setAttribute("userList", users);
        req.getRequestDispatcher("/admin_UserList.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        System.out.println("AdminServlet销毁");
    }
}
