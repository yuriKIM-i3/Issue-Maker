package hello.mapper;

import java.util.List;

import hello.domain.Account;

public interface LoginMapper {
    public Account readUser(String username);
    public List<String> readAuthority(String username);
    public void insertUser(Account user);
}
