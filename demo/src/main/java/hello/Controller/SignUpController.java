package hello.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hello.Member;
import hello.UserMapper;
import hello.service.SignUpService;

@Controller
public class SignUpController{
    // @Resource(name="hello.service.SignUpService")
    // SignUpService signUpService;

    @Autowired
    private UserMapper userMapper;

	@Autowired
	PasswordEncoder passwordEncoder;

    @GetMapping("/signUp")
    private String signUpForm(){
        return "SignUp/signUp";
    }

    @PostMapping("/signUpOk")
    public String signUpOk(HttpServletRequest request){
        Member member = new Member();
        member.setUsername(request.getParameter("username"));
        member.setName(request.getParameter("name"));
        member.setPassword(passwordEncoder.encode(request.getParameter("password")));
        userMapper.insertUser(member);
        System.out.println("회원가입완료");
        return "/index";
    }
}