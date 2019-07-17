// package hello;

// import java.util.Collection;

// import org.springframework.security.core.GrantedAuthority;
// import org.springframework.security.core.userdetails.UserDetails;

// import lombok.Data;

// @Data
// public class Member implements UserDetails{     //시큐리티 내부적으로 User라는 클래스를 이용하기 때문에 Member, Account와 같은 클래스 명을 써준다
//     private Long id;
//     private String username;    //아이디 or 이메일
//     private String password;
//     private String name;
//     private String create_at;
//     private String update_at;
//     private boolean isAccountNonExpired;
//     private boolean isAccountNonLocked;
//     private boolean isCredentialsNonExpired;
//     private boolean isEnabled;

//     private Collection<? extends GrantedAuthority> authorities;
// }

// /**
//  * Spring Security에서 사용자의 정보를 담는 인터페이스는 UserDetails 인터페이스이다.
//  * 우리가 이 인터페이스를 구현하게 되면 Spring Security에서 구현한 클래스를 사용자 정보로 인식하고 
//  * 인증 작업을 한다. 쉽게 말하면 UserDetails 인터페이스는 VO 역할을 한다고 보면 된다. 
//  * 그래서 우리는 사용자의 정보를 모두 담아두는 클래스를 구현할 것이다.
//  */