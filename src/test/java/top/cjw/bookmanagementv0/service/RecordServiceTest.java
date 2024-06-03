package top.cjw.bookmanagementv0.service;

import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;
import java.util.List;
import top.cjw.bookmanagementv0.entity.Record;
import top.cjw.bookmanagementv0.entity.User;
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
        List<Record> records = RecordService.findByUsername("1");
        records.forEach(System.out::println);
    }

    @Test
    void findByBookName() {
    }

    @Test
    void add() {
        LocalDateTime now = LocalDateTime.now();
        Record record = new Record(6, 888, 1,now, now,null,null,null);
        RecordService.add(record);
        List<Record> records = RecordService.findAll();
        records.forEach(System.out::println);
    }

    @Test
    void findBorrowTimesByUsernameAndBookIdSpecific() {
        System.out.println(RecordService.findBorrowTimesByUsernameAndBookIdSpecific("1", 2));
    }
}