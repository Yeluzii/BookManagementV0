package top.cjw.bookmanagementv0.service.impl;

import lombok.extern.slf4j.Slf4j;
import top.cjw.bookmanagementv0.entity.User;
//import top.cjw.bookmanagementv0.exception.RegisterException;
import top.cjw.bookmanagementv0.service.UserService;
import top.cjw.bookmanagementv0.utils.MyBatisUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Slf4j
public class UserServiceImpl implements UserService {
    @Override
    public List<User> findAll() {
        return (List<User>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.UserMapper.selectAll"));
    }

    @Override
    public Boolean login(String username, String password) {
        User user = (User) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectOne("top.cjw.bookmanagementv0.mapper.UserMapper.selectByUserName", username));
        return user == null || (! (Objects.equals(password, user.getPassword())));
    }

    @Override
    public Boolean register(User user) {
        List<User> all = new UserServiceImpl().findAll();
        boolean flag = true;
        for (User u:all){
            if (u.getUsername().equals(user.getUsername())) {
                flag = false;
                break;
            }
        }
        if (flag) {
            Map<String, Object> params = new HashMap<>();
            params.put("username", user.getUsername());
            params.put("password", user.getPassword());
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.insert("top.cjw.bookmanagementv0.mapper.UserMapper.add", params));
        }
        return flag;
    }

    @Override
    public User userInfo(String username) {
        return (User) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectOne("top.cjw.bookmanagementv0.mapper.UserMapper.selectByUserName", username));
    }

    @Override
    public List<User> findByPartUserName(String username) {
        return (List<User>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.UserMapper.selectByPartUserName", username));
    }

    @Override
    public void updateUser(User user) {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.update("top.cjw.bookmanagementv0.mapper.UserMapper.update", user));
    }

    @Override
    public void updateAvatar(User user) {
        MyBatisUtils.executeUpdate(sqlSession -> sqlSession.update("top.cjw.bookmanagementv0.mapper.UserMapper.updateAvatar", user));
    }

    @Override
    public Boolean deleteUser(Integer userId) {
        boolean flag = true;
        if (userId == null) {
            flag = false;
        } else {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.delete("top.cjw.bookmanagementv0.mapper.UserMapper.deleteUser", userId));
        }
        return flag;
    }

    @Override
    public Boolean selectIsAdminByUserName(String username) {
         boolean flag = true;
        if (username == null) {
            flag = false;
        } else {
            User user = (User) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectOne("top.cjw.bookmanagementv0.mapper.UserMapper.selectIsAdminByUserName", username));
            if (user == null || user.getIsAdmin() == 0) {
                flag = false;
            }
        }
        return flag;
    }

    @Override
    public Boolean updateIsAdminByUserName(String username,Byte isAdmin) {
        boolean flag = true;
        if (username == null) {
            flag = false;
        } else {
            Map<String, Object> params = new HashMap<>();
            params.put("username", username);
            params.put("isAdmin", isAdmin);
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.update("top.cjw.bookmanagementv0.mapper.UserMapper.updateIsAdminByUserName", params));
        }
        return flag;
    }


}
