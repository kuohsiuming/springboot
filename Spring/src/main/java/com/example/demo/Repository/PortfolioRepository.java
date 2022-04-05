package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Employee;

//<User,Long> User-->entity類別名 Long--->指的是@id資料型別
@Repository
public interface PortfolioRepository extends JpaRepository<Employee, Integer> {

	void deleteById(Integer id);

	Employee findByid(Integer integer);


	Employee findByname(String name);

	Employee findByNameAndPassword(String name, String password);

}
