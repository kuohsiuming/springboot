package com.example.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.Repository.PortfolioRepository;
import com.example.demo.entity.Employee;
@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private PortfolioRepository portfolioRepository;
	
	@Override
	public void save(Employee employee) {
		PasswordEncoder pe =new BCryptPasswordEncoder();
		String password = pe.encode(employee.getPassword());
		employee.setPassword(password);
		employee.setRole("normal,ROLE_employee");
		portfolioRepository.saveAndFlush(employee);
	}

}
