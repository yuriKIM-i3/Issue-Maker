package hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.security.crypto.password.PasswordEncoder;

import hello.domain.account.Account;
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
		account.setName("유저3");
        userMapper.insertUser(account);

        Account account1 = new Account();
        account1.setUsername("user4");
        account1.setPassword(passwordEncoder.encode("p"));
		account1.setName("유저4");
        userMapper.insertUser(account1);

        Account account2 = new Account();
        account2.setUsername("user5");
        account2.setPassword(passwordEncoder.encode("p"));
		account2.setName("유저5");
        userMapper.insertUser(account2);
    }
}