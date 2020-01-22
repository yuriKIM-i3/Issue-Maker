package hello.controller_common_method;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import hello.service.user.SecurityMember;

@Component
public class UserSignedIn{
    public int GetUserId(){
        SecurityMember principal = (SecurityMember) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        
        return principal.getId();
    }
}