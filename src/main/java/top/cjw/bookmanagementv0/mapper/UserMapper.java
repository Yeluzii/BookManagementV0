package top.cjw.bookmanagementv0.mapper;

import top.cjw.bookmanagementv0.entity.User;

public interface UserMapper {
    User selectByUserName(String userName);
    User insertUser(String username, String password);
}
