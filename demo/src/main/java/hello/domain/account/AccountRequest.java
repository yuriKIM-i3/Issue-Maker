package hello.domain.account;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import hello.custom_annotaion.EmailCheckAnotation;
import hello.custom_annotaion.NameCheckAnotation;
import lombok.Data;

@Data
public class AccountRequest{
    @EmailCheckAnotation
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

    @NameCheckAnotation
    @NotNull(message = "Name can't be blank")
    @Size(max=20, message = "upto 20 letters")
    private String name;
}

