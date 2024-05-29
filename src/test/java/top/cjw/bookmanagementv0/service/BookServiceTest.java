package top.cjw.bookmanagementv0.service;

import org.junit.jupiter.api.Test;
import top.cjw.bookmanagementv0.service.impl.BookServiceImpl;

class BookServiceTest {

    @Test
    void findAll() {
        BookService bookService = new BookServiceImpl();
        System.out.println(bookService.findAll());
    }
}