package hello.custom_annotaion;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import hello.service.user.UserService;

@Component
public class UserNameValidator implements ConstraintValidator<IsUsernameExist, String>{
    @Autowired private UserService userService;

    @Override
    public void initialize(IsUsernameExist emailCheckAnotation) {
    }
    
    @Override
    public boolean isValid(String email, ConstraintValidatorContext context) {
        return !userService.isUsernameExist(email);
    }
}