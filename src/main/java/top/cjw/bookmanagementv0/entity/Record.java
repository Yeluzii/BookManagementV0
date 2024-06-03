package top.cjw.bookmanagementv0.entity;

import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@Builder
@Data
@NoArgsConstructor
public class Record {
    private Integer recordId;
    private Integer bookId;
    private Integer userId;
    private LocalDateTime borrowDatetime;
    private LocalDateTime returnDatetime;
    private User user;
    private Book book;
    private Type type;
}
