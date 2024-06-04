package top.cjw.bookmanagementv0.service;

import org.junit.jupiter.api.Test;
import lombok.extern.slf4j.Slf4j;
import top.cjw.bookmanagementv0.entity.User;
import top.cjw.bookmanagementv0.service.impl.UserServiceImpl;

import java.util.List;

@Slf4j
class UserServiceTest {
    private final UserService userService = new UserServiceImpl();

    @Test
    void findAll() {
        List<User> users = userService.findAll();
        log.info(String.valueOf(users));
    }

    @Test
    void login() {
        log.info(String.valueOf(userService.login("cy","123")));
    }

    @Test
    void register() {
        User user = new User("cy","123");
        userService.register(user);
        log.info(String.valueOf(user));
    }

    @Test
    void userInfo() {
        log.info(String.valueOf(userService.userInfo("1")));
    }

    @Test
    void updateUser() {
        userService.updateUser(new User("123456","1"));
    }

    @Test
    void deleteUser() {
        userService.deleteUser(6);
    }

    @Test
    void selectIsAdminByUserName() {
        boolean flag = userService.selectIsAdminByUserName("123");
        if (flag) {
            System.out.println("是管理员");
        } else {
            System.out.println("不是管理员");
        }
    }

    @Test
    void updateIsAdminByUserName() {
        boolean flag = userService.updateIsAdminByUserName("123", (byte) 1);
        if (flag) {
            System.out.println("修改成功");
        }
    }

    @Test
    void updateAvatar() {
        User user = new User(null,"2",null,null,"https://img0.baidu.com/it/u=178612712,36487532&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500");
        userService.updateAvatar(user);
        System.out.println("修改 " + user.getUsername() + " 的头像为 " + user.getAvatar() + " 成功");
    }

    @Test
    void findByPartUserName() {
        List<User> users = userService.findByPartUserName("q");
        System.out.println(users.size());
        System.out.println(users);
    }
}