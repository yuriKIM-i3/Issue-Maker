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

import hello.domain.account.Account;
import hello.mapper.UserMapper;
import hello.service.user.SecurityMember;

@Service
public class UserService implements UserDetailsService{
    private static final String ROLE_PREFIX = "ROLE_";
    
    @Autowired
    UserMapper userMapper;

    //Spring boot WebSecurity login
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Account account = userMapper.readUser(username);
        if(account != null) {
            account.setAuthorities(makeGrantedAuthority(userMapper.readAuthority(username)));
        }
        return new SecurityMember(account);
    }

    //Spring boot WebSecurity login
    private static List<GrantedAuthority> makeGrantedAuthority(List<String> roles){
        List<GrantedAuthority> list = new ArrayList<>();
        roles.forEach(role -> list.add(new SimpleGrantedAuthority(ROLE_PREFIX + role)));
        return list;
    }
    
    public void userInsertService(Account account){
        userMapper.insertUser(account);
    }

    public boolean isUsernameExist(String email) {
        if (userMapper.signUpEmailCheck(email) > 0) {
            return true;
        }
        return false;
    }

    public boolean isUsernameNoExist(String email) {
        if (userMapper.signInEmailCheck(email) == 0) {            
            return true;
        }
        return false;
    }

    public boolean isNameExist(String name) {
        if (userMapper.signUpNameCheck(name) > 0) {
            return true;
        }
        return false;
    }

    public Account userInfoService(String username){
        return userMapper.userInfo(username);
    }

    public void modifyNameService(String username, String name){
        userMapper.modifyName(username, name);
    }

    public void modifyPassService(String username, String password){
        userMapper.modifyPass(username, password);
    }

    public void userDeleteService(String username){
        userMapper.deleteUser(username);
    }
} 