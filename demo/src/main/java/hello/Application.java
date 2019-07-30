package hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.security.crypto.password.PasswordEncoder;

import hello.domain.Account;
import hello.mapper.UserMapper;

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
        Account account = new Account();
        account.setUsername("user3");
        account.setPassword(passwordEncoder.encode("p"));
		account.setName("안보여");
        userMapper.insertUser(account);
        
        System.out.println("inserted");
        System.out.println(userMapper.readUser("user3").getPassword());
    }
}