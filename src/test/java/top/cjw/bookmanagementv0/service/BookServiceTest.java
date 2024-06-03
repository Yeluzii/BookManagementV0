package top.cjw.bookmanagementv0.service;

import org.junit.jupiter.api.Test;
import top.cjw.bookmanagementv0.service.impl.BookServiceImpl;

class BookServiceTest {

    @Test
    void findAll() {
        BookService bookService = new BookServiceImpl();
        System.out.println(bookService.findAll());
    }

    @Test
    void findByName() {
        BookService bookService = new BookServiceImpl();
        System.out.println(bookService.findByName("三"));
    }

    @Test
    void findByTypeId() {
        BookService bookService = new BookServiceImpl();
        System.out.println(bookService.findByTypeId(1));
    }

    @Test
    void borrow() {
        BookService bookService = new BookServiceImpl();
        System.out.println(bookService.borrow(1));
    }
}