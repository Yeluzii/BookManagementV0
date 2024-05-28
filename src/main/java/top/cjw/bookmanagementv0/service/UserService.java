package top.cjw.bookmanagementv0.service;

import top.cjw.bookmanagementv0.entity.User;

public interface UserService {
    User login(String username, String password);
    User register(String username,String password);
}
