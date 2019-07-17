// package hello;



// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.context.annotation.Bean;
// import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
// import org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import org.springframework.security.config.annotation.web.builders.WebSecurity;
// import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
// import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// import org.springframework.security.crypto.password.PasswordEncoder;
// import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

// import hello.CustomUserDetailsService;
// import hello.CustomLoginSuccessHandler;
 
// @EnableWebSecurity      //이 어노테이션을 붙이면 사이트 전체가 잠김
// public class CustomWebSecurityConfigurerAdapter extends WebSecurityConfigurerAdapter {
    
//     @Autowired
//     CustomUserDetailsService customUserDetailsService;

//     //비밀번호 암호화
//     @Bean
//     public PasswordEncoder passwordEncoder() {
//         return new BCryptPasswordEncoder();
//     }

//     //로그인 성공하면 리다이렉트 되는 페이지
//     @Bean
//     public AuthenticationSuccessHandler successHandler() {
//         return new CustomLoginSuccessHandler("/issue_list");
//     }

//     // 스프링 시큐리티의 필터 연결을 설정하기 위한 오버라이딩이다.
//     @Override           //자원에 대한 접근은 풀어주기
//     public void configure(WebSecurity web) throws Exception {
//         web.ignoring().antMatchers(
//             "/resources/**"
//         );
//     }
    
//     // 인터셉터로 요청을 안전하게 보호하는 방법을 설정하기 위한 오버라이딩이다.
//     @Override
//     protected void configure(HttpSecurity http) throws Exception {
//         // http.authorizeRequests()
// 		// 	.antMatchers("/**").permitAll();
//         http.csrf().disable()
//         // .authorizeRequests().anyRequest().authenticated()
//             .authorizeRequests()
//             .antMatchers("/", "/home", "/signUp").permitAll()
//         .and()
//         // http
//         //     .authorizeRequests()
//         //     .antMatchers("/", "/home", "/signUp").permitAll()
//         //     .anyRequest().authenticated()
//         //     .and()
//         .formLogin()
//         .loginPage("/login")
//         .successHandler(successHandler())
//         .permitAll();
//     }
 
//     //사용자 세부 서비스를 설정하기 위한 오버라이딩이다.
//     @Override
//     protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//         auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
//     }
// }