package top.cjw.bookmanagementv0.mapper;

import top.cjw.bookmanagementv0.entity.Book;

import java.util.List;

public interface BookMapper {
    //查询所有图书，封装给实现类中的findAll
    List<Book> selectAll();
    //根据图书名称查询，封装给实现类中的findByName
    List<Book> selectByName(String name);
    //根据图书类型（种类id）查询，封装给实现类中的findByTypeId
    List<Book> selectByTypeId(Integer tId);
    //根据图书id查询，封装给实现类中的selectById
    Book selectById(Integer bId);
    //借书，库存减一，封装给实现类中的borrow
    void decreaseCount(Integer bId);
    //还书，库存加一，封装给实现类中的returnBook
    void increaseCount(Integer bId);
    //管理员更新图书信息，封装给实现类中的adminUpdateBook
    void update(Book book);
    //管理员删除图书，封装给实现类中的adminDeleteBook
    void delete(Integer bId);
    //管理员添加图书，封装给实现类中的adminAddBook
    void add(Book book);
}
