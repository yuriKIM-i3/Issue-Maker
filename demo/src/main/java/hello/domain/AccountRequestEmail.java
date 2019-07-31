package hello.domain;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import hello.custom_annotaion.EmailCheckAnotation;
import lombok.Data;

@Data
public class AccountRequestEmail{
    @EmailCheckAnotation
    @NotNull(message = "Email can't be blank")
    @Email
    private String username;   
}

