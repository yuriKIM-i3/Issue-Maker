package hello.custom_annotaion;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import hello.service.user.UserService;

@Component
public class EmailExistValidator implements ConstraintValidator<EmailCheckExistAnotation, String>{
    @Autowired private UserService userService;

    @Override
    public void initialize(EmailCheckExistAnotation constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }
    
    @Override
    public boolean isValid(String email, ConstraintValidatorContext context) {
        return !userService.isUsernameNoExist(email);
    }
}