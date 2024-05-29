package top.cjw.bookmanagementv0.service;

import top.cjw.bookmanagementv0.entity.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    User login(String username, String password);
    void register(User user);
}
