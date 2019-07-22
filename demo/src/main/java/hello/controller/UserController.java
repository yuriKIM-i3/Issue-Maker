package hello.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hello.domain.Account;
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