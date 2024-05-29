package top.cjw.bookmanagementv0.mapper;

import top.cjw.bookmanagementv0.entity.Record;

import java.util.List;

public interface RecordMapper {
    List<Record> selectAll();
    List<Record> selectByUsername(String username);
    List<Record> selectByBookName(String name);
}
