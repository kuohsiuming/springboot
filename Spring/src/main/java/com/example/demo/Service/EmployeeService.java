package com.example.demo.Service;

import org.springframework.stereotype.Service;

import com.example.demo.entity.Employee;

@Service
public interface EmployeeService {
	void save(Employee employee);
}
