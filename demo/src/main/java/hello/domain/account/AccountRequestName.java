package hello.domain.account;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import hello.custom_annotaion.IsNameExist;
import lombok.Data;

@Data
public class AccountRequestName{
    @IsNameExist
    @NotNull(message = "Name can't be blank")
    @Size(max=20, message = "upto 20 letters")
    private String name;
}

