package top.cjw.bookmanagementv0.service.impl;

import top.cjw.bookmanagementv0.entity.Record;
import top.cjw.bookmanagementv0.service.RecordService;
import top.cjw.bookmanagementv0.utils.MyBatisUtils;

import java.time.LocalDateTime;
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

//    @Override
//    public List<Record> findByPartBookName(String bookName) {
//        return (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.selectByPartBookName", bookName));
//    }

    @Override
    public List<Record> findByBookName(String bookName) {
        return (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.selectByBookName", bookName));
    }

    @Override
    public Boolean add(Record record) {
        boolean flag = true;
        if ((record.getBookId() == null || record.getUserId() == null || record.getBorrowDatetime() == null)) {
            flag = false;
        } else {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.insert("top.cjw.bookmanagementv0.mapper.RecordMapper.add", record));
        }
        return flag;
    }

    @Override
    public Boolean returnBook(Record record) {
        boolean flag = false;
        Map<String, Object> params1 = new HashMap<>();
        params1.put("username", record.getUser().getUsername());
        params1.put("bookId", record.getBookId());
        List<Record> record1 = (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.findReturnTimeByUsernameAndBookIdSpecific", params1));
        System.out.println("修改前：" + record1);
        for (Record singleRecord : record1) {
            Object time = singleRecord.getReturnDatetime();
            System.out.println("修改前：" + time);
            Object now = LocalDateTime.now();
            Map<String, Object> params2 = new HashMap<>();
            params2.put("returnDatetime", now);
            params2.put("recordId", singleRecord.getRecordId());
            if (time == null) {
                MyBatisUtils.executeUpdate(sqlSession -> sqlSession.update("top.cjw.bookmanagementv0.mapper.RecordMapper.update", params2));
                flag = true;//返回true，说明还书时间update成功
                //以下List查出来给测试用
                List<Record> recordUpdate = (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.findReturnTimeByUsernameAndBookIdSpecific", params1));
                for (Record updateRecord : recordUpdate) {
                    System.out.println("修改后：" + updateRecord.getReturnDatetime());
                }

            }
        }
        return flag;
    }

    @Override
    public List<Record> findReturnTimeByUsernameAndBookIdSpecific(String username, Integer bookId) {
        Map<String, Object> params = new HashMap<>();
        params.put("username", username);
        params.put("bookId", bookId);
        return (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.findReturnTimeByUsernameAndBookIdSpecific", params));
    }

}
