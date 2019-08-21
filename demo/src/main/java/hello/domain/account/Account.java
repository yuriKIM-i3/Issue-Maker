package hello.domain.account;

import java.util.Collection;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import hello.custom_annotaion.IsNameExist;
import hello.custom_annotaion.IsUsernameExist;
import hello.domain.issue.Issue;
import lombok.Data;

@Data
public class Account implements UserDetails{
    private int id;
    
    @IsUsernameExist
    @NotNull(message = "Email can't be blank")
    @Size(min=10, max=30, message = "check length")
    @Email(message = "type mismatch")
    private String username;   

    @NotNull(message = "Password can't be blank")
    @Size(min=10, message = "at least 10 letters")
    private String password;

    @NotNull
    @Size(min=10, message = "at least 10 letters")
    private String password_check;

    @IsNameExist
    @NotNull(message = "Name can't be blank")
    @Size(max=20, message = "upto 20 letters")
    private String name;
    
    private String create_at;
    private boolean isAccountNonExpired;
    private boolean isAccountNonLocked;
    private boolean isCredentialsNonExpired;
    private boolean isEnabled;

    private Collection<? extends GrantedAuthority> authorities;
    
    private List<Issue> issues;
}

