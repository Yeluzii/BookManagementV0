package top.cjw.bookmanagementv0.service.impl;

import top.cjw.bookmanagementv0.entity.User;
import top.cjw.bookmanagementv0.exception.LoginException;
import top.cjw.bookmanagementv0.service.UserService;
import top.cjw.bookmanagementv0.utils.MyBatisUtils;

import java.util.Objects;

public class UserServiceImpl implements UserService {
    @Override
    public User login(String username, String password) {
        User user = (User) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectOne("top.cjw.bookmanagementv0.mapper.UserMapper.selectByUserName", username));
        if (user == null) {
            throw new LoginException("Username does not exist!");
        }
        if (! (Objects.equals(password, user.getPassword()) && Objects.equals(username, user.getUsername()))) {
            throw new LoginException("Password is incorrect!");
        }
        return user;
    }

    @Override
    public User register(String username, String password) {
        User user = (User) MyBatisUtils.executeUpdate(sqlSession -> sqlSession.insert("top.cjw.bookmanagementv0.mapper.UserMapper.insertUser", username));
        if (Objects.equals(username, user.getUsername())) {
            throw new LoginException("Username has existed!");
        }
        return user;
    }

}
