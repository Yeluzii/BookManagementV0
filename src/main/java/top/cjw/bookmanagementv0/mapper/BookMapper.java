package top.cjw.bookmanagementv0.mapper;

import top.cjw.bookmanagementv0.entity.Book;

import java.util.List;

public interface BookMapper {
    List<Book> selectAll();
    List<Book> selectByName(String name);
    List<Book> selectByTypeId(Integer tId);
    Book selectById(Integer bId);
    void decreaseCount(Integer bId);
    void increaseCount(Integer bId);
}
