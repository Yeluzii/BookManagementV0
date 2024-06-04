package top.cjw.bookmanagementv0.mapper;

import top.cjw.bookmanagementv0.entity.Record;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public interface RecordMapper {
    List<Record> selectAll();
    List<Record> selectByUsername(String username);
    List<Record> selectByPartBookName(String name);
    List<Record> selectByBookName(String name);
    void add(Record record);
    void update(Integer recordId);//还书
    List<Record> findReturnTimeByUsernameAndBookIdSpecific(String username, String bookId);
}
