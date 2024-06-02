package top.cjw.bookmanagementv0.service;

import org.junit.jupiter.api.Test;

import java.util.List;
import top.cjw.bookmanagementv0.entity.Record;
import top.cjw.bookmanagementv0.service.impl.RecordServiceImpl;

class RecordServiceTest {
    private final RecordService RecordService = new RecordServiceImpl();

    @Test
    void findAll() {
        List<Record> records = RecordService.findAll();
        records.forEach(System.out::println);
    }

    @Test
    void findByUsername() {
    }

    @Test
    void findByBookName() {
    }

    @Test
    void add() {
    }
}