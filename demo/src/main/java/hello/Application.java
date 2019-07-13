package hello;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.security.crypto.password.PasswordEncoder;

import hello.UserMapper;
import hello.Member;

@SpringBootApplication
@MapperScan(basePackages = "hello")
public class Application implements CommandLineRunner {
    @Autowired
    private UserMapper userMapper;

	@Autowired
	PasswordEncoder passwordEncoder;

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        Member member = new Member();
        member.setUsername("user3");
        member.setPassword(passwordEncoder.encode("password"));
		member.setName("안보여");

        userMapper.insertUser(member);
        
        System.out.println("inserted");

        System.out.println(userMapper.readUser("user3").getPassword());
    }
}