package top.cjw.bookmanagementv0.service.impl;

import top.cjw.bookmanagementv0.entity.Record;
import top.cjw.bookmanagementv0.service.RecordService;
import top.cjw.bookmanagementv0.utils.MyBatisUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RecordServiceImpl implements RecordService {
    @Override
    public List<Record> findAll() {
        return (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.selectAll"));
    }

    @Override
    public List<Record> findByUsername(String username) {
        return (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.selectByUsername", username));
    }

    @Override
    public List<Record> findByBookName(String bookName) {
        return (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.findByBookName", bookName));
    }

    @Override
    public Boolean add(Record record) {
        boolean flag = true;
        if ((record.getBookId() == null || record.getUserId() == null || record.getBorrowDatetime() == null)) {
            flag = false;
        }else {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.insert("top.cjw.bookmanagementv0.mapper.RecordMapper.add", record));
        }
        return flag;
    }

    @Override
    public int findBorrowTimesByUsernameAndBookIdSpecific(String username, Integer bookId) {
        Map<String, Object> params = new HashMap<>();
        params.put("username", username);
        params.put("bookId", bookId);
        List<Record> records = (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.findBorrowTimesByUsernameAndBookIdSpecific", params));
        return records.size();
    }

}
