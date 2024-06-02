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
        return (List<Book>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<Book>selectList("top.cjw.bookmanagementv0.mapper.BookMapper.selectAll"));
    }

    @Override
    public List<Book> findByName(String name) {
        return (List<Book>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<Book>selectList("top.cjw.bookmanagementv0.mapper.BookMapper.selectByName", name));
    }

    @Override
    public List<Book> findByTypeId(Integer typeId) {
        return (List<Book>) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<Book>selectList("top.cjw.bookmanagementv0.mapper.BookMapper.selectByTypeId", typeId));
    }

    @Override
    public Boolean borrow(Integer bookId) {
        boolean flag = true;
        Book book = (Book) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectOne("top.cjw.bookmanagementv0.mapper.BookMapper.selectById", bookId));
        if (book == null || book.getCount() == 0) {
            flag = false;
            return flag;
        } else {
            MyBatisUtils.executeUpdate(sqlSession -> sqlSession.update("top.cjw.bookmanagementv0.mapper.BookMapper.update", bookId));
        }
        return flag;
    }

}
