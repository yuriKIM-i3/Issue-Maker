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

import hello.domain.Account;
import hello.domain.AccountRequest;
import hello.domain.AccountRequestEmail;
import hello.domain.AccountRequestName;
import hello.domain.AccountRequestPass;
import hello.service.user.UserService;


@Controller
public class UserController{
    @Autowired
    UserService userService;

	@Autowired
	PasswordEncoder passwordEncoder;

    @GetMapping("/signUp")
    private String signUpForm(){
        return "SignUp/signUp";
    }

    @PostMapping("/signUp_check")
    public String signUpCheck(@Valid AccountRequest accountCheck, BindingResult bindingResult, Model model, HttpServletRequest request){
        //유효성검사
        if(bindingResult.hasErrors()){
            System.out.println("유효성검사에러데스네");            
            model.addAttribute("errorMessege", bindingResult);
            return "SignUp/signUp";
        }

        //비번 똑같이 입력했니?
        if(!accountCheck.getPassword().equals(accountCheck.getPassword_check())){
            System.out.println("비밀번호 확인이 틀림");
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
        System.out.println("회원가입완료");

        return "redirect:/login";
    }

    @RequestMapping("/login")
    public String login(@Valid AccountRequestEmail accountCheck, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            FieldError fieldError = new FieldError("accountCheck", "username", "Email doesn't exist");
            bindingResult.addError(fieldError);
            model.addAttribute("errorMessege", bindingResult);            
            return "Login/login";
        }
        return "Login/login";
    }

    public void get_username(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof UserDetails){
            String username = ((UserDetails)principal).getUsername();
            model.addAttribute("account", userService.userInfoService(username));
        }  
    }

    @RequestMapping("/myPage")
    public String myPage(Model model){
        //로그인한 사용자의 정보 얻기        
        get_username(model);
        return "MyPage/myPage";
    }

    @RequestMapping("/myPage_modify_name")
    public String myPage_modify_name(Model model, HttpServletRequest request){
        get_username(model);        
        return "MyPage/myPage_modify_name";
    }

    @PostMapping("/modify_apply_name")
    public String myPage_apply_name(@Valid AccountRequestName accountCheck, BindingResult bindingResult, Model model, @RequestParam("name") String name){          
        if(bindingResult.hasErrors()){
            System.out.println("이름변경유효성검사에러데스네");            
            System.out.print(bindingResult.getFieldError());
            model.addAttribute("errorMessege", bindingResult);      
            get_username(model);      
            return "MyPage/myPage_modify_name";
        }

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof UserDetails){
            String username = ((UserDetails)principal).getUsername();
            userService.modifyNameService(username, name);      
            System.out.print("이름변경성공");      
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
            System.out.println("유효성검사에러데스네");            
            model.addAttribute("errorMessege", bindingResult);
            return "MyPage/myPage_modify_pass";
        }

        if(!accountCheck.getPassword().equals(accountCheck.getPassword_check())){
            System.out.println("비밀번호 확인이 틀림");
            FieldError fieldError = new FieldError("accountCheck", "password_check", "Passwords must match");
            bindingResult.addError(fieldError);
            model.addAttribute("errorMessege", bindingResult);
            return "MyPage/myPage_modify_pass";
        }               

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof UserDetails){
            String username = ((UserDetails)principal).getUsername();
            userService.modifyPassService(username, passwordEncoder.encode(request.getParameter("password")));      
            System.out.print("이름변경성공");      
        }                
        return "redirect:/login";
    }

    @GetMapping("/delete_account")
    public String delete_account(){
        System.out.println("called");
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof UserDetails){
            String username = ((UserDetails)principal).getUsername();
            userService.userDeleteService(username);            
            System.out.print("회원탈퇴");      
        }  
        return "redirect:/";
    }
}