package top.cjw.bookmanagementv0.service;

import org.junit.jupiter.api.Test;
import lombok.extern.slf4j.Slf4j;
import top.cjw.bookmanagementv0.entity.User;
import top.cjw.bookmanagementv0.service.impl.UserServiceImpl;

@Slf4j
class UserServiceTest {
    private final UserService userService = new UserServiceImpl();

    @Test
    void login() {
        User user = userService.login("1","1");
        log.info(String.valueOf(user));
    }

    @Test
    void register() {
        User user = userService.register("test1test1","test1test1");
        log.info(String.valueOf(user));
    }
}