package hello.service.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import hello.domain.Account;
import hello.mapper.UserMapper;
import hello.service.user.SecurityMember;

@Service
//UserDetailsService 인터페이스는 DB에서 유저 정보를 가져오는 역할을 한다
public class CustomUserDetailsService implements UserDetailsService{

    private static final String ROLE_PREFIX = "ROLE_";

    @Autowired
    UserMapper userMapper;

    /**
     * UserDetailsService 인터페이스에는 DB에서 유저 정보를 불러오는 중요한 메소드가 존재한다. 
     * 바로 loadUserByUsername() 메소드이다. 
     * 이 메소드에서 유저 정보를 불러오는 작업을 하면 된다.
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Account account = userMapper.readUser(username);
        if(account != null) {
            account.setAuthorities(makeGrantedAuthority(userMapper.readAuthority(username)));
        }
        return new SecurityMember(account);
    }

    private static List<GrantedAuthority> makeGrantedAuthority(List<String> roles){
        List<GrantedAuthority> list = new ArrayList<>();
        roles.forEach(role -> list.add(new SimpleGrantedAuthority(ROLE_PREFIX + role)));
        return list;
    }
} 