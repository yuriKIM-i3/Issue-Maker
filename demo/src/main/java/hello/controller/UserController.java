package hello.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hello.domain.Account;
import hello.domain.AccountRequest;
import hello.service.SignUpService;

@Controller
public class UserController{
    @Autowired
    SignUpService signUpService;

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
            FieldError fieldError = new FieldError("accountCheck", "password_check", "암호가 일치하지 않는다능");
            bindingResult.addError(fieldError);
            model.addAttribute("errorMessege", bindingResult);
            return "SignUp/signUp";
        }

        Account account = new Account();
        account.setUsername(request.getParameter("username"));
        account.setName(request.getParameter("name"));
        account.setPassword(passwordEncoder.encode(request.getParameter("password")));

        signUpService.signUpOkService(account);
        System.out.println("회원가입완료");

        return "redirect:/login";
    }


    @PostMapping("/signUpOk")
    public String signUpOk(HttpServletRequest request){
        Account account = new Account();
        account.setUsername(request.getParameter("username"));
        account.setName(request.getParameter("name"));
        account.setPassword(passwordEncoder.encode(request.getParameter("password")));

        signUpService.signUpOkService(account);
        System.out.println("회원가입완료");
        return "/index";
    }

    @RequestMapping("/login")
    public String login(){
        return "Login/login";
    }

    @RequestMapping("/myPage")
    public String myPage(){
        return "MyPage/myPage";
    }
}