package com.erison.beltexam.services;

import com.erison.beltexam.models.User;
import com.erison.beltexam.models.UserLogin;
import com.erison.beltexam.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    @Transactional
    public User register(User newUser , BindingResult result){

        Optional<User> theUser = this.userRepository.findByEmail(newUser.getEmail());

        if (theUser.isPresent()){
            result.rejectValue("email","Email Taken","Email address already exist!");
        }
        if (!newUser.getPassword().equals(newUser.getConfirm())){
            result.rejectValue("confirm","Matches","Passwords must match");
        }

        if (result.hasErrors()){
            return null;
        }else {
            String hashed = BCrypt.hashpw(newUser.getPassword(),BCrypt.gensalt());
            newUser.setPassword(hashed);
            return userRepository.save(newUser);
        }
    }

    public User login(UserLogin newLogin , BindingResult result){
        Optional<User>theUser = userRepository.findByEmail(newLogin.getEmail());
        if (!theUser.isPresent()){
            result.rejectValue("email","EmailNotFound","No user found with that email address");
        }else {
            if (!BCrypt.checkpw(newLogin.getPassword(),theUser.get().getPassword())){
                result.rejectValue("password","Matches","Invalid Password");
            }
        }
        if (result.hasErrors()){
            return null;
        }else {
            return theUser.get();
        }
    }

    public User findUser(Long id){
        return userRepository.findById(id).orElse(null);
    }
}
