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
public class CustomUserDetailsService implements UserDetailsService{
    private static final String ROLE_PREFIX = "ROLE_";

    @Autowired
    UserMapper userMapper;

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