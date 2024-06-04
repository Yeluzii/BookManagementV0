package top.cjw.bookmanagementv0.service;

import org.junit.jupiter.api.Test;
import top.cjw.bookmanagementv0.entity.Book;
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
        System.out.println(bookService.findByName("非"));
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

    @Test
    void returnBook() {
        BookService bookService = new BookServiceImpl();
        System.out.println(bookService.returnBook("2",1));
    }

    @Test
    void adminUpdateBook() {
        BookService bookService = new BookServiceImpl();
        System.out.println(bookService.adminUpdateBook(new Book(100,"测试",999,"https://t.tutu.to/img/z117",1)));
    }

    @Test
    void adminAddBook() {
        BookService bookService = new BookServiceImpl();
        System.out.println(bookService.adminAddBook(new Book(null,"测试999",8,null,999)));
    }

    @Test
    void adminDeleteBook() {
        BookService bookService = new BookServiceImpl();
        System.out.println(bookService.adminDeleteBook(102));
    }
}