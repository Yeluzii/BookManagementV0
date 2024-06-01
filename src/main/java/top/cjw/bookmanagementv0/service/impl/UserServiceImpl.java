package top.cjw.bookmanagementv0.service.impl;

import lombok.extern.slf4j.Slf4j;
import top.cjw.bookmanagementv0.entity.User;
import top.cjw.bookmanagementv0.exception.LoginException;
//import top.cjw.bookmanagementv0.exception.RegisterException;
import top.cjw.bookmanagementv0.exception.RegisterException;
import top.cjw.bookmanagementv0.service.UserService;
import top.cjw.bookmanagementv0.utils.MyBatisUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Slf4j
public class UserServiceImpl implements UserService {
    @Override
    public List<User> findAll() {
        return (List<User>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectList("top.cjw.bookmanagementv0.mapper.UserMapper.selectAll"));
    }

    @Override
    public Boolean login(String username, String password) {
        User user = (User) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectOne("top.cjw.bookmanagementv0.mapper.UserMapper.selectByUserName", username));
        return user == null || (! (Objects.equals(password, user.getPassword())));
    }

    @Override
    public Boolean register(User user) {
//        User user2 = (User) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectOne("top.cjw.bookmanagementv0.mapper.UserMapper.selectByUserName"));
//
//        if (Objects.equals(user.getUsername(), user2.getUsername())) {
//            throw new RegisterException("This username has registered!");
//        } else {
        //        }
        List<User> all = new UserServiceImpl().findAll();
        boolean flag = true;
        for (User u:all){
            if (u.getUsername().equals(user.getUsername())) {
                flag = false;
                break;
            }
        }
        if (flag) {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.insert("top.cjw.bookmanagementv0.mapper.UserMapper.add", user.getUsername()));
        }
        return flag;
    }

    @Override
    public User userInfo(String username) {
        return (User) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectOne("top.cjw.bookmanagementv0.mapper.UserMapper.selectByUserName", username));
    }

    @Override
    public Boolean updateUser(User user) {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.update("top.cjw.bookmanagementv0.mapper.UserMapper.update", user));
        return true;
    }


}
