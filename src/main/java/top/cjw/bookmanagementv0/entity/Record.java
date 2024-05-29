package top.cjw.bookmanagementv0.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Builder
@Data
@NoArgsConstructor
public class Record {
    private Integer r_id;
    private Integer b_id;
    private Integer u_id;
}
