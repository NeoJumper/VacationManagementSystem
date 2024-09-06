package com.kcc.vacation.global.config;


import com.kcc.vacation.global.oauth.PrincipalOauth2UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.User;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Configuration
@RequiredArgsConstructor
@EnableWebSecurity
@EnableMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class SecurityConfig {

    private final PrincipalOauth2UserService principalOauth2UserService;

    private static final String[] AUTH_WHITELIST = {
            "/**",
            "/resources/**",
            "/WEB-INF/views/**",
            "/auth/**",
            "/api/auth/**",
    };

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf(AbstractHttpConfigurer::disable);
        http.authorizeHttpRequests(authorize ->
                        authorize
                                .requestMatchers(AUTH_WHITELIST).permitAll()
                                .requestMatchers("/manager/**").hasAnyRole("ADMIN", "MANAGER")
                                .requestMatchers("/auth/login").permitAll()
                                .anyRequest().authenticated()
                )
                .headers(headers -> headers.frameOptions(HeadersConfigurer.FrameOptionsConfig::sameOrigin))
                .formLogin(form -> form.loginPage("/auth/login-form")
                        .loginProcessingUrl("/auth/login")
                        .defaultSuccessUrl("/index")
                        .failureHandler(authenticationFailureHandler())
                ).oauth2Login(oauth2Login -> oauth2Login.loginPage("/auth/login-form")
                                .userInfoEndpoint(
                                        userInfoEndpointConfig -> userInfoEndpointConfig.userService(principalOauth2UserService)
                                )
                                .defaultSuccessUrl("/client/client-calender")
                );
        return http.build();
    }
    @Bean
    public AuthenticationFailureHandler authenticationFailureHandler() {
        return new SimpleUrlAuthenticationFailureHandler() {

            @Override
            public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException, ServletException, IOException {

                String errorMessage = getExceptionMessage(exception);

                errorMessage = URLEncoder.encode(errorMessage, StandardCharsets.UTF_8);  //한글 인코딩
                setDefaultFailureUrl("/auth/login-form?error=true&exception=" + errorMessage);
                System.out.println(errorMessage);
                super.onAuthenticationFailure(request, response, exception);
            }

            private String getExceptionMessage(AuthenticationException exception) {
                if (exception instanceof BadCredentialsException)  {
                    return  "아이디 또는 비밀번호가 일치하지 않습니다.";
                } else if (exception instanceof UsernameNotFoundException){
                    return "계정정보가 없습니다.";
                } else {
                    return "잘못된 로그인 시도입니다. 아이디 또는 비밀번호를 확인해 주세요.";
                }
            }
        };
    }





    @Bean
    public BCryptPasswordEncoder ecodePwd() {
        return new BCryptPasswordEncoder();
    }

}
/*
 *  /\           /\
 * /   \________/  \
 * |               |
 * | ()     ( | )  |
 * |     /\        |
 *  \______________/
 *
 *
 *
 * */