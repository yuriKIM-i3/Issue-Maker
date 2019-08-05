package hello.custom_annotaion;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import hello.service.user.UserService;

@Component
public class EmailValidator implements ConstraintValidator<EmailCheckAnotation, String>{
    @Autowired private UserService userService;

    @Override
    public void initialize(EmailCheckAnotation emailCheckAnotation) {
    }
    
    @Override
    public boolean isValid(String email, ConstraintValidatorContext context) {
        return !userService.isUsernameExist(email);
    }
}