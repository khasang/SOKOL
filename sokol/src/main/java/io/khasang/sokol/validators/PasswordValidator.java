package io.khasang.sokol.validators;

import io.khasang.sokol.entity.User;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PasswordValidator implements ConstraintValidator<PasswordMatcher, User> {
    private static final String PASSWORD_PATTERN = "[A-Za-z0-9]+";
    private Matcher matcher;
    private Pattern pattern = Pattern.compile(PASSWORD_PATTERN);

    @Override
    public void initialize(PasswordMatcher constraintAnnotation) {

    }

    @Override
    public boolean isValid(User value, ConstraintValidatorContext context) {
        if(value == null || value.getPassword().length() < 3 || value.getPassword().length() > 20
                ){
            return false;
        }
        matcher = pattern.matcher(value.getPassword());
        return matcher.matches();
    }
}
