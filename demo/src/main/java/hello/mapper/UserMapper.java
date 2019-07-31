package hello.mapper;

import java.util.List;

import hello.domain.Account;

public interface UserMapper {
    public Account readUser(String username);
    public List<String> readAuthority(String username);
    public void insertUser(Account user);
    public int signUpEmailCheck(String email);
    public int signUpNameCheck(String name);
    public Account userInfo(String username);
    public void modifyName(String username, String name);
    public void modifyPass(String username, String password);
    public void deleteUser(String username);
}
