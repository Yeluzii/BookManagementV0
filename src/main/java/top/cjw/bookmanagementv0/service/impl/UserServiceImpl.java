package top.cjw.bookmanagementv0.service.impl;

import top.cjw.bookmanagementv0.entity.User;
import top.cjw.bookmanagementv0.exception.LoginException;
import top.cjw.bookmanagementv0.exception.RegisterException;
import top.cjw.bookmanagementv0.service.UserService;
import top.cjw.bookmanagementv0.utils.MyBatisUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class UserServiceImpl implements UserService {
    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<User>();
        users = (List<User>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectList("top.cjw.bookmanagementv0.mapper.UserMapper.selectAll"));
        return users;
    }

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
    public void register(User user) {
//        User user2 = (User) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectOne("top.cjw.bookmanagementv0.mapper.UserMapper.selectByUserName"));
//
//        if (Objects.equals(user.getUsername(), user2.getUsername())) {
//            throw new RegisterException("This username has registered!");
//        } else {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.insert("top.cjw.bookmanagementv0.mapper.UserMapper.add", user.getUsername()));
//        }
    }

}
