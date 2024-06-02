package top.cjw.bookmanagementv0.mapper;

import top.cjw.bookmanagementv0.entity.Book;

import java.util.List;

public interface BookMapper {
    List<Book> selectAll();
    List<Book> selectByName(String name);
    List<Book> selectByTypeId(int typeId);
    Book selectById(Integer b_id);
    void updateCount(Integer b_id);
}
