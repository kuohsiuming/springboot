package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Salary;
@Repository
public interface SalaryRepository extends JpaRepository<Salary, Integer> {
	void deleteById(Integer id);

	Salary findByid(Integer integer);
}
