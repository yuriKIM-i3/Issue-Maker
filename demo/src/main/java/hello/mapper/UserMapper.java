package hello.mapper;

import java.util.List;

import hello.domain.account.Account;

public interface UserMapper {
    public Account readUser(String username);
    public List<String> readAuthority(String username);
    public void insertUser(Account user);
    public int isUsernameExist(String email);
    public int signInEmailCheck(String email);
    public int isNameExist(String name);
    public Account info(int id);
    public void modifyName(int id, String name);
    public void modifyPass(int id, String password);
    public void deleteUser(int id);
}
