package hello.common_method;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import hello.service.user.SecurityMember;

@Component
public class GetUserId{
    public int get_user_id(){
        SecurityMember principal = (SecurityMember) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int id = principal.getId();
        
        return id;
    }
}