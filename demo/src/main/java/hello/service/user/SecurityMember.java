package hello.service.user;

import org.springframework.security.core.userdetails.User;

import hello.domain.account.Account;

public class SecurityMember extends User {

    private static final long serialVersionUID = 1L;
    private int id;

    public SecurityMember(Account account) {
        super(account.getUsername(), account.getPassword(), account.getAuthorities());
        this.id = account.getId();
    }

    public int getId() {
        return this.id;
    }
} 