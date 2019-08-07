package hello.domain.account;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class AccountRequestPass{
    @NotNull(message = "Password can't be blank")
    @Size(min=10, message = "at least 10 letters")
    private String password;

    @NotNull
    private String password_check;
}

