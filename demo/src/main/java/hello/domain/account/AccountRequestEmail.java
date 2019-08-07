package hello.domain.account;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import hello.custom_annotaion.EmailCheckExistAnotation;
import lombok.Data;

@Data
public class AccountRequestEmail{
    @EmailCheckExistAnotation
    @NotNull(message = "Email can't be blank")
    private String username;

    @NotNull(message = "Password can't be blank")
    @Size(min=10, message = "at least 10 letters")
    private String password;
}

