package top.cjw.bookmanagementv0.service;

import top.cjw.bookmanagementv0.entity.Book;

import java.util.List;

public interface BookService {
    List<Book> findAll();
    List<Book> findByName(String name);
    List<Book> findByTypeId(Integer tId);
    Boolean borrow(Integer bId);
}
