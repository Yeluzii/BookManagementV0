package top.cjw.bookmanagementv0.service.impl;

import top.cjw.bookmanagementv0.entity.User;
import top.cjw.bookmanagementv0.exception.LoginException;
import top.cjw.bookmanagementv0.service.UserService;
import top.cjw.bookmanagementv0.utils.MyBatisUtils;

public class UserServiceImpl implements UserService {
    @Override
    public User login(String username, String password) {
        User user = (User) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectOne("top.cjw.bookmanagementv0.mapper.UserMapper.selectByUserName", username));
        if (user == null) {
            throw new LoginException("Username does not exist");
        }
        // 对 password 进行 md5 加 salt 加密，得到密文
        String md5Password = Md5Utils.md5Digest(password, user.getSalt());
        if (!md5Password.equals(user.getPassword())) {
            throw new LoginException("Password does not match");
        }
        return user;
    }
}
