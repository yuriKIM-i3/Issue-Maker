package hello.custom_annotaion;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import hello.service.user.UserService;

@Component
public class NameValidator implements ConstraintValidator<IsNameExist, String>{
    @Autowired private UserService userService;

    @Override
    public void initialize(IsNameExist nameCheckAnotation) {
    }

    @Override
    public boolean isValid(String name, ConstraintValidatorContext context) {
        return !userService.isNameExist(name);
    }
}