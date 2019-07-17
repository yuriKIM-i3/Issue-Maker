package hello.service.login;

import org.springframework.security.core.userdetails.User;

import hello.domain.Account;

public class SecurityMember extends User {

    private static final long serialVersionUID = 1L;

    public SecurityMember(Account account) {
        super(account.getUsername(), account.getPassword(), account.getAuthorities());
    }
} 