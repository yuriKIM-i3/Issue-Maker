package hello.domain;

import java.util.Collection;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class AccountRequest implements UserDetails{
    private Long id;

    @NotNull(message = "입력은 필수데스네")
    @Size(min=10, max=30, message = "이메일의 길이가 부적절합니다")
    @Email
    private String username;   

    @NotNull(message = "입력은 필수데스네")
    @Size(min=10, message = "비밀번호의 최소길이는 10자데스네")
    private String password;

    @NotNull
    @Size(min=10)
    private String password_check;

    @NotNull(message = "입력은 필수데스네")
    @Size(max=20, message = "닉네임의 최대 길이는 20자데스네")
    private String name;
    private boolean isAccountNonExpired;
    private boolean isAccountNonLocked;
    private boolean isCredentialsNonExpired;
    private boolean isEnabled;

    private Collection<? extends GrantedAuthority> authorities;
}

