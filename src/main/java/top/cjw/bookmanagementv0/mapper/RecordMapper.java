package top.cjw.bookmanagementv0.mapper;

import top.cjw.bookmanagementv0.entity.Record;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public interface RecordMapper {
    List<Record> selectAll();
    List<Record> selectByUsername(String username);
    List<Record> selectByBookName(String name);
    List<Record> add(Integer b_id, Integer u_id, SimpleDateFormat borrow_time);
}
