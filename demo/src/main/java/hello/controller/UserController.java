package hello.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hello.domain.account.*;
import hello.service.user.SecurityMember;
import hello.service.user.UserService;


@Controller
public class UserController{
    /**
     * 세션의 user_id가져오기
     */
    public int get_user_id(){
        SecurityMember principal = (SecurityMember) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int id = principal.getId();
        return id;
    }

    @Autowired
    UserService userService;

	@Autowired
	PasswordEncoder passwordEncoder;

    @RequestMapping("/sign_up")
    private String signUp(){
        return "sign_up/sign_up";
    }

    @PostMapping("/sign_up/check")
    public String signUpCheck(@Valid Account account, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){         
            model.addAttribute("errorMessege", bindingResult);
            return "sign_up/sign_up";
        }
        
        if(!account.getPassword().equals(account.getPassword_check())){        
            FieldError fieldError = new FieldError("account", "password_check", "Passwords must match");
            bindingResult.addError(fieldError);
            model.addAttribute("errorMessege", bindingResult);
            return "sign_up/sign_up";
        }        

        account.setPassword(passwordEncoder.encode(account.getPassword()));
        userService.userInsertService(account);
        return "redirect:/login";
    }

    @RequestMapping("/login")
    public String login(){
        return "login/login";
    }

    // 로그인시 아이디가 있는지 검사, 값이 controller로 안넘어옴 / 아마 시큐리티문제인듯... 시큐리티에 걸리는듯...
    // /**
    //  * Email이 있는지 검사
    //  */
    // // @RequestMapping("/login_check")
    // @PostMapping("/login_check")
    // public String login_check(@Valid AccountRequestEmail accountCheck, BindingResult bindingResult, Model model, HttpServletRequest request){      
    //     System.out.println(request.getParameter("username"));            
    //     System.out.println(request.getParameter("password"));  
    //     if(bindingResult.hasErrors()){
    //         System.out.println("유효성검사에러데스네");            
    //         System.out.println(request.getParameter("username"));            
    //         System.out.println(request.getParameter("password"));            
    //         model.addAttribute("errorMessege", bindingResult);
    //         System.out.println(bindingResult.getFieldError());        
    //         return "Login/login";
    //     }
    //     return "redirect:/issue_list";
    // }

    @RequestMapping("/my_page")
    public String my_page(Model model){
        model.addAttribute("account", userService.userInfoService(get_user_id()));
        return "my_page/my_page";
    }

    @RequestMapping("/my_page/modify/name")
    public String myPage_modify_name(Model model){
        model.addAttribute("account", userService.userInfoService(get_user_id()));
        return "my_page/modify/name";
    }

    @PostMapping("/my_page/apply/name")
    public String myPage_apply_name(@Valid AccountRequestName accountCheck, BindingResult bindingResult, Model model){          
        if(bindingResult.hasErrors()){         
            System.out.print(bindingResult.getFieldError());
            model.addAttribute("errorMessege", bindingResult);      
            model.addAttribute("account", userService.userInfoService(get_user_id()));
            return "my_page/modify/name";
        }

        userService.modifyNameService(get_user_id(), accountCheck.getName());                              
        return "redirect:/my_page";
    }

    @RequestMapping("/my_page/modify/pass")
    public String myPage_modify_pass(){              
        return "my_page/modify/pass";
    }

    @PostMapping("/my_page/apply/pass")
    public String modify_apply_pass(@Valid AccountRequestPass accountCheck, BindingResult bindingResult, Model model){          
        if(bindingResult.hasErrors()){                     
            model.addAttribute("errorMessege", bindingResult);
            return "my_page/modify/pass";
        }

        if(!accountCheck.getPassword().equals(accountCheck.getPassword_check())){            
            FieldError fieldError = new FieldError("accountCheck", "password_check", "Passwords must match");
            bindingResult.addError(fieldError);
            model.addAttribute("errorMessege", bindingResult);
            return "my_page/modify/pass";
        }    

        userService.modifyPassService(get_user_id(), passwordEncoder.encode(accountCheck.getPassword()));                   
        return "redirect:/login";
    }

    @GetMapping("/delete_account")
    public String delete_account(){        
        userService.userDeleteService(get_user_id());                          
        return "redirect:/";
    }
}