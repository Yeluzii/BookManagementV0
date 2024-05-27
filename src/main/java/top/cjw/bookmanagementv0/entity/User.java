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
    private Integer id;
    private String username;
    private String password;
    private Integer salt;
    private Byte isAdmin;
}
