package top.cjw.bookmanagementv0.service.impl;

import top.cjw.bookmanagementv0.entity.Record;
import top.cjw.bookmanagementv0.service.RecordService;
import top.cjw.bookmanagementv0.utils.MyBatisUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class RecordServiceImpl implements RecordService {
    @Override
    public List<Record> findAll() {
        return (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.findAll"));
    }

    @Override
    public List<Record> findByUsername(String username) {
        return (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.findAll", username));
    }

    @Override
    public List<Record> findByBookName(String bookName) {
        return (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.findByBookName", bookName));
    }

    @Override
    public List<Record> add(Integer b_id, Integer u_id, SimpleDateFormat borrow_time) {
        return (List<Record>)MyBatisUtils.executeUpdate(sqlSession -> sqlSession.insert("top.cjw.bookmanagementv0.mapper.RecordMapper.add"));
    }
}
