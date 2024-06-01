package top.cjw.bookmanagementv0.service;

import top.cjw.bookmanagementv0.entity.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    Boolean login(String username, String password);
    Boolean register(User user);
    User userInfo(String username);
    Boolean updateUser(User user);
}
