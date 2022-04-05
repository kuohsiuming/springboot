package com.example.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.example.demo.handle.LoginFailureHandler;


@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	private LoginFailureHandler loginFailureHandler;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.formLogin()
				// loginpage.html 表單 action 內容
				// .loginProcessingUrl("/login")
				.usernameParameter("name")
				// 自定義登入頁面
				.loginPage("/login")
				// 登入成功之後要造訪的頁面
				.successForwardUrl("/welcome")// welcome 頁面
				// 登入失敗後要造訪的頁面
				.failureHandler(loginFailureHandler);//登入失敗處理
		http.authorizeRequests()
				// 不需要被認證的頁面：/loginpage
				.antMatchers("/login", "/register")
				.permitAll()
				// 必須要有 admin 權限才可以訪問
				.antMatchers("/salary/**","/portfolio/**").hasAuthority("admin")
				// 必須要有 manager 角色才可以訪問
				.antMatchers("/salary/**","/portfolio/**").hasRole("manager")
				.antMatchers("/employeepage").hasAnyRole("manager", "employee")
				
				.anyRequest()
				.authenticated();

		// 登出
		http.logout()
		.deleteCookies("JSESSIONID")
		.logoutSuccessUrl("/login")
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout")); // 可以使用任何的 HTTP 方法登出
		
		// 勿忘我（remember-me）
				http.rememberMe()
					.userDetailsService(userDetailsService)
					.tokenValiditySeconds(60); // 通常都會大於 session timeout 的時間
				
			

	}

	// 注意！規定！要建立密碼演算的實例
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
