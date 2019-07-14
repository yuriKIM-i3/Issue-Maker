package hello;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class Member implements UserDetails{     //시큐리티 내부적으로 User라는 클래스를 이용하기 때문에 Member, Account와 같은 클래스 명을 써준다
    private Long id;
    private String username;
    private String password;
    private String name;
    private boolean isAccountNonExpired;
    private boolean isAccountNonLocked;
    private boolean isCredentialsNonExpired;
    private boolean isEnabled;

    private Collection<? extends GrantedAuthority> authorities;
}