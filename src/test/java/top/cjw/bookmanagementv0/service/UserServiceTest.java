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
        log.info(String.valueOf(userService.login("1","1")));
    }

    @Test
    void register() {
        User user = new User("test1test1","test1test1");
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
}