package hello.custom_annotaion;

import java.lang.annotation.*;

import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = NameValidator.class)
@Documented
public @interface IsNameExist {
    String message() default "name already exist";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}