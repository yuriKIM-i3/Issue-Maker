package hello.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hello.domain.Account;
import hello.mapper.UserMapper;

@Service
public class SignUpService{
    @Autowired
    UserMapper userMapper;


}