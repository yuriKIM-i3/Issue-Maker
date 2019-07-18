package hello;

import org.springframework.security.core.userdetails.User;

public class SecurityMember extends User {

    private static final long serialVersionUID = 1L;

    public SecurityMember(Member member) {
        super(member.getUsername(), member.getPassword(), member.getAuthorities());
    }
} 