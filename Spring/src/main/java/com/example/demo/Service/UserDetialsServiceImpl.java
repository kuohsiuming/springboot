package com.example.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.Repository.PortfolioRepository;
import com.example.demo.entity.Employee;

@Service
public class UserDetialsServiceImpl implements UserDetailsService {
	@Autowired
	private PortfolioRepository portfolioRepository;

	@Override
	public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
		System.out.println("loadUserByUsername: " + name);
		Employee user = portfolioRepository.findByname(name);
		if (user == null) {
			System.out.println("UserDetialsServiceImplUserDetialsServiceImplUserDetialsServiceImpl");
			throw new UsernameNotFoundException(name + "not found");
		}
		String password = user.getPassword();
		String authority = user.getRole();

		return new User(name, password, AuthorityUtils.commaSeparatedStringToAuthorityList(authority));
	}

}
