package hello.custom_annotaion;

import java.lang.annotation.*;

import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = NickValidator.class)
@Documented
public @interface NickCheckAnotation {
    String message() default "nickname already exist";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}