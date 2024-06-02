package top.cjw.bookmanagementv0.service;

import top.cjw.bookmanagementv0.entity.Record;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
public interface RecordService {
    List<Record> findAll();
    List<Record> findByUsername(String username);
    List<Record> findByBookName(String bookName);
    List<Record> add(Integer b_id, Integer u_id, SimpleDateFormat borrow_time);
}
