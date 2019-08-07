package hello.custom_annotaion;

import java.lang.annotation.*;

import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = EmailExistValidator.class)
@Documented
public @interface EmailCheckExistAnotation {
    String message() default "Email doesn't exist";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}