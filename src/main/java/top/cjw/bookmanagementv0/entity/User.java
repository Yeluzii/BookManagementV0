package top.cjw.bookmanagementv0.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Builder
@Data
@NoArgsConstructor
public class User {
    private Integer u_id;
    private String username;
    private String password;
    private Byte isAdmin;
    private String avatar;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }
}
