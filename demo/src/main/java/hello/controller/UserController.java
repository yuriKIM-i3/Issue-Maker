package hello.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hello.domain.account.*;
import hello.service.user.UserService;


@Controller
public class UserController{
    /**
     * 세션의 username가져오기
     */
    public void getUsername(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof UserDetails){
            String username = ((UserDetails)principal).getUsername();
            model.addAttribute("account", userService.userInfoService(username));
        }  
    }

    @Autowired
    UserService userService;

	@Autowired
	PasswordEncoder passwordEncoder;

    @RequestMapping("/signUp")
    private String signUpForm(){
        return "SignUp/signUp";
    }

    @PostMapping("/signUp_check")
    public String signUpCheck(@Valid AccountRequest accountCheck, BindingResult bindingResult, Model model, HttpServletRequest request){
        //유효성검사        
        if(bindingResult.hasErrors()){         
            model.addAttribute("errorMessege", bindingResult);
            return "SignUp/signUp";
        }

        //비번 똑같이 입력했니?
        if(!accountCheck.getPassword().equals(accountCheck.getPassword_check())){        
            FieldError fieldError = new FieldError("accountCheck", "password_check", "Passwords must match");
            bindingResult.addError(fieldError);
            model.addAttribute("errorMessege", bindingResult);
            return "SignUp/signUp";
        }

        Account account = new Account();
        account.setUsername(request.getParameter("username"));
        account.setName(request.getParameter("name"));
        account.setPassword(passwordEncoder.encode(request.getParameter("password")));

        userService.userInsertService(account);    
        return "redirect:/login";
    }

    @RequestMapping("/login")
    public String login(){
        return "Login/login";
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

    @RequestMapping("/myPage")
    public String myPage(Model model){
        getUsername(model);
        return "MyPage/myPage";
    }

    @RequestMapping("/myPage_modify_name")
    public String myPage_modify_name(Model model, HttpServletRequest request){
        getUsername(model);        
        return "MyPage/myPage_modify_name";
    }

    @PostMapping("/modify_apply_name")
    public String myPage_apply_name(@Valid AccountRequestName accountCheck, BindingResult bindingResult, Model model, @RequestParam("name") String name){          
        if(bindingResult.hasErrors()){         
            System.out.print(bindingResult.getFieldError());
            model.addAttribute("errorMessege", bindingResult);      
            getUsername(model);      
            return "MyPage/myPage_modify_name";
        }

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof UserDetails){
            String username = ((UserDetails)principal).getUsername();
            userService.modifyNameService(username, name);              
        }                
        return "redirect:/myPage";
    }

    @RequestMapping("/myPage_modify_pass")
    public String myPage_modify_pass(@Valid AccountRequest accountCheck, BindingResult bindingResult, Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof UserDetails){
            String username = ((UserDetails)principal).getUsername();
            model.addAttribute("account", userService.userInfoService(username));
        }               
        return "MyPage/myPage_modify_pass";
    }

    @PostMapping("/modify_apply_pass")
    public String modify_apply_pass(@Valid AccountRequestPass accountCheck, BindingResult bindingResult, Model model, HttpServletRequest request){          
        if(bindingResult.hasErrors()){                     
            model.addAttribute("errorMessege", bindingResult);
            return "MyPage/myPage_modify_pass";
        }

        if(!accountCheck.getPassword().equals(accountCheck.getPassword_check())){            
            FieldError fieldError = new FieldError("accountCheck", "password_check", "Passwords must match");
            bindingResult.addError(fieldError);
            model.addAttribute("errorMessege", bindingResult);
            return "MyPage/myPage_modify_pass";
        }               

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof UserDetails){
            String username = ((UserDetails)principal).getUsername();
            userService.modifyPassService(username, passwordEncoder.encode(request.getParameter("password")));                   
        }                
        return "redirect:/login";
    }

    @GetMapping("/delete_account")
    public String delete_account(){        
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof UserDetails){
            String username = ((UserDetails)principal).getUsername();
            userService.userDeleteService(username);                        
        }  
        return "redirect:/";
    }
}