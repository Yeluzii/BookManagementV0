package top.cjw.bookmanagementv0.service.impl;

import top.cjw.bookmanagementv0.entity.Book;
import top.cjw.bookmanagementv0.entity.User;
import top.cjw.bookmanagementv0.service.BookService;
import top.cjw.bookmanagementv0.utils.MyBatisUtils;

import java.util.ArrayList;
import java.util.List;

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
        if (book == null || book.getCount() == 0) {
            flag = false;
        } else {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.update("top.cjw.bookmanagementv0.mapper.BookMapper.decreaseCount", bId));
        }
        return flag;
    }

    @Override
    public Boolean returnBook(Integer bId) {
        boolean flag = true;
        Book book = (Book) MyBatisUtils.executeQuery(sqlSession -> sqlSession.selectOne("top.cjw.bookmanagementv0.mapper.BookMapper.selectById", bId));
        if (book == null) {
            flag = false;
        } else {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.update("top.cjw.bookmanagementv0.mapper.BookMapper.increaseCount", bId));
        }
        return flag;
    }

}
