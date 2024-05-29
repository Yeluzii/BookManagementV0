package top.cjw.bookmanagementv0.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Builder
@Data
@NoArgsConstructor
public class Book {
    private Integer b_id;
    private String name;
    private Integer t_id;
    private String cover;
    private Integer count;
}
