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
        if (userMapper.isUsernameExist(email) > 0) {
            return true;
        }
        return false;
    }

    // 로그인시 존재하지 않는 이메일을 쓸 경우
    // public boolean isUsernameNoExist(String email) {
    //     if (userMapper.signInEmailCheck(email) == 0) {            
    //         return true;
    //     }
    //     return false;
    // }

    public boolean isNameExist(String name) {
        if (userMapper.isNameExist(name) > 0) {
            return true;
        }
        return false;
    }

    public Account userInfoService(int user_id){
        return userMapper.userInfo(user_id);
    }

    public void modifyNameService(int user_id, String name){
        userMapper.modifyName(user_id, name);
    }

    public void modifyPassService(int user_id, String password){
        userMapper.modifyPass(user_id, password);
    }

    public void userDeleteService(int user_id){
        userMapper.deleteUser(user_id);
    }
} 