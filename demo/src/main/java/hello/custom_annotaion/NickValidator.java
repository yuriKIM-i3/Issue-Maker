package hello.custom_annotaion;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import hello.service.user.UserService;

@Component
public class NickValidator implements ConstraintValidator<NickCheckAnotation, String>{
    @Autowired private UserService userService;

    @Override
    public void initialize(NickCheckAnotation nickCheckAnotation) {
    }

    @Override
    public boolean isValid(String nickname, ConstraintValidatorContext context) {
        return !userService.isNicknameExist(nickname);
    }
}