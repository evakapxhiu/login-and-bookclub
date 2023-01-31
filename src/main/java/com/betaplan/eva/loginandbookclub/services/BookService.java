package com.betaplan.eva.loginandbookclub.services;

import com.betaplan.eva.loginandbookclub.models.Book;
import com.betaplan.eva.loginandbookclub.repositories.BookRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {

    @Autowired
    private BookRepo bookRepo;

    public Book findById(Long id) {

        return this.bookRepo.findById(id).orElse(null);
    }


    public List<Book> all() {
        return  bookRepo.findAll();
    }

    public Book create(Book book) {
        return bookRepo.save(book);
    }

    public Book details(Long id){return this.bookRepo.findById(id).orElse(null);}

    public Book update(Book book){return bookRepo.save(book);}

    public void delete(Long id){
        bookRepo.deleteById(id);
    }
}
