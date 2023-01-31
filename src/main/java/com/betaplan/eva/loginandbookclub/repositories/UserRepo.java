package com.betaplan.eva.loginandbookclub.repositories;

import com.betaplan.eva.loginandbookclub.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepo extends CrudRepository<User,Long> {
    Optional<User> findByEmail(String email);
}
