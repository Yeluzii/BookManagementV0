package top.cjw.bookmanagementv0.service;

import top.cjw.bookmanagementv0.entity.Book;

import java.util.List;

public interface BookService {
    // 查询所有图书，封装用于BookServlet中的userSelectAll，adminSelectAll，adminAllBook
    List<Book> findAll();
    // 根据图书名查询，封装用于BookServlet中的search，adminSearch
    List<Book> findByName(String name);
    // 根据图书类型（种类id）查询，封装用于BookServlet中的type，adminType
    List<Book> findByTypeId(Integer tId);
    // 借书，封装借书库存减一的操作，封装用于BookServlet中的borrow，adminBorrow
    Boolean borrow(Integer bId);
    // 还书，封装库存加一的操作，封装用于BookServlet中的returnBook，aReturnBook
    Boolean returnBook(String username,Integer bId);
    // 管理员更新图书信息，封装用于BookServlet中的adminUpdateBook
    Boolean adminUpdateBook(Book book);
    // 管理员添加图书，封装用于BookServlet中的addBook
    Boolean adminAddBook(Book book);
    // 管理员删除图书，封装用于BookServlet中的deleteBook
    Boolean adminDeleteBook(Integer bId);
}
