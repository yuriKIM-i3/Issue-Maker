package hello.domain;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import hello.custom_annotaion.EmailCheckAnotation;
import hello.custom_annotaion.NickCheckAnotation;
import lombok.Data;

@Data
public class AccountRequest{
    @EmailCheckAnotation
    @NotNull(message = "입력은 필수데스네")
    @Size(min=10, max=30, message = "이메일의 길이가 부적절합니다")
    @Email
    private String username;   

    @NotNull(message = "입력은 필수데스네")
    @Size(min=10, message = "at least 10 letters")
    private String password;

    @NotNull
    @Size(min=10)
    private String password_check;

    @NickCheckAnotation
    @NotNull(message = "입력은 필수데스네")
    @Size(max=20, message = "upto 20 letters")
    private String name;
}

