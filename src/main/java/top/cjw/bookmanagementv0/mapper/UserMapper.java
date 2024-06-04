package top.cjw.bookmanagementv0.mapper;

import top.cjw.bookmanagementv0.entity.User;

import java.util.List;

public interface UserMapper {
    List<User> selectAll();
    User selectByUserName(String username);
    List<User> selectByPartUserName(String username);
    void add(User user);
    void update(User user);
    void updateAvatar(User user);
    void deleteUser(Integer userId);
    void selectIsAdminByUserName(String username);
    void updateIsAdminByUserName(String username);
}
