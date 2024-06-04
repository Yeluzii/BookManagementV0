package top.cjw.bookmanagementv0.service.impl;

import top.cjw.bookmanagementv0.entity.Book;
import top.cjw.bookmanagementv0.entity.Record;
import top.cjw.bookmanagementv0.service.BookService;
import top.cjw.bookmanagementv0.utils.MyBatisUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookServiceImpl implements BookService {
    @Override
    public List<Book> findAll() {
//        books = MyBatisUtils.executeQuery(sqlSession -> sqlSession.getMapper(BookMapper.class).selectAll());
        return (List<Book>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.BookMapper.selectAll"));
    }

    @Override
    public List<Book> findByName(String name) {
        return (List<Book>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.BookMapper.selectByName", name));
    }

    @Override
    public List<Book> findByTypeId(Integer tId) {
        return (List<Book>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.BookMapper.selectByTypeId", tId));
    }

    @Override
    public Boolean borrow(Integer bId) {
        boolean flag = true;
        Book book = (Book) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectOne("top.cjw.bookmanagementv0.mapper.BookMapper.selectById", bId));
        if (book == null || book.getCount() <= 0) {
            flag = false;
        } else {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.update("top.cjw.bookmanagementv0.mapper.BookMapper.decreaseCount", bId));
        }
        return flag;
    }

    @Override
    public Boolean returnBook(String username,Integer bId) {
        boolean flag = true;

        Map<String, Object> params = new HashMap<>();
        params.put("username", username);
        params.put("bookId", bId);
        List<Record> record = (List<Record>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectList("top.cjw.bookmanagementv0.mapper.RecordMapper.findReturnTimeByUsernameAndBookIdSpecific", params));
        int unReturned = 0;
        for (Record r : record) {
            Object time = r.getReturnDatetime();
            if (time == null) {
                unReturned++;
            }
        }
        if (unReturned > 0) {
            Book book = (Book) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectOne("top.cjw.bookmanagementv0.mapper.BookMapper.selectById", bId));
            if (book == null) {
                flag = false;
            } else {
                MyBatisUtils.executeUpdate(sqlSession -> sqlSession.update("top.cjw.bookmanagementv0.mapper.BookMapper.increaseCount", bId));
            }
        }

        return flag;
    }

    @Override
    public Boolean adminUpdateBook(Book book) {
        boolean flag = true;
        if (book.getName() == null || book.getTypeId() == null || book.getCount() == null) {
            flag = false;
        } else {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.update("top.cjw.bookmanagementv0.mapper.BookMapper.update", book));
        }
        return flag;
    }

    @Override
    public Boolean adminAddBook(Book book) {
        boolean flag = true;
        if (book.getName() == null || book.getTypeId() == null || book.getCount() == null) {
            flag = false;
        } else {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.insert("top.cjw.bookmanagementv0.mapper.BookMapper.add", book));
        }
        return flag;
    }

    @Override
    public Boolean adminDeleteBook(Integer bId) {
        boolean flag = true;
        if (bId == null) {
            flag = false;
        } else {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.delete("top.cjw.bookmanagementv0.mapper.BookMapper.delete", bId));
        }
        return flag;
    }

}
