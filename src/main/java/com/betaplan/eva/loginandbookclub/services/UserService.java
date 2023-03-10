package com.betaplan.eva.loginandbookclub.services;

import com.betaplan.eva.loginandbookclub.models.LoginUser;
import com.betaplan.eva.loginandbookclub.models.User;
import com.betaplan.eva.loginandbookclub.repositories.UserRepo;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepo userRepo;
    public User userRegister(User newUser, BindingResult result){
        Optional<User> potentialUser = this.userRepo.findByEmail(newUser.getEmail());

        if(potentialUser.isPresent()) {
            result.rejectValue("email", "Matches", "An account with that email already exists!");
        }

        if(!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }

        if(result.hasErrors()) {
            return null;
        }
        else {
            String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
            newUser.setPassword(hashed);
            return userRepo.save(newUser);
        }
    }

    public User login(LoginUser newLoginUser, BindingResult result) {

        Optional<User> potentialUser = this.userRepo.findByEmail(newLoginUser.getEmail());

        if(!potentialUser.isPresent()) {
            result.rejectValue("email", "Matches", "User not found!");
        }

        else {
            if (!BCrypt.checkpw(newLoginUser.getPassword(), potentialUser.get().getPassword())) {
                result.rejectValue("password", "Matches", "Invalid Password!");
            }
        }

        if(result.hasErrors()) {
            return null;
        }
        {
            return potentialUser.get();
        }
    }

    public User findByEmail(String email) {

        return this.userRepo.findByEmail(email).orElse(null);
    }

    public User findById(Long id) {

        return this.userRepo.findById(id).orElse(null);
    }}

