package hello.service;

import org.springframework.stereotype.Service;

import hello.domain.Account;
import hello.mapper.LoginMapper;

@Service
public class SignUpService{
    LoginMapper loginMapper;

    public void signUpOkService(Account account){
        loginMapper.insertUser(account);
    }
}