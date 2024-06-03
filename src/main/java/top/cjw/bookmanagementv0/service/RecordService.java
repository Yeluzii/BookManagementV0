package top.cjw.bookmanagementv0.service;

import top.cjw.bookmanagementv0.entity.Record;

import java.util.Date;
import java.util.List;
public interface RecordService {
    List<Record> findAll();
    List<Record> findByUsername(String username);
    List<Record> findByBookName(String bookName);
    Boolean add(Record record);

    int findBorrowTimesByUsernameAndBookIdSpecific(String username, Integer bookId);
}
