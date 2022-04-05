package com.example.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Repository.SalaryRepository;
import com.example.demo.entity.Salary;

@Service
public class SalaryServiceImpl implements SalarySevicce {

	@Autowired
	private SalaryRepository salaryrepository;
	
	//薪資加總
	@Override
	public void save(Salary salary) {
		int rase1 = 0;
		int rase2 = 0;
		int rase3 = 0;
		int rase4 = 0;
		int paycut1=0;
		int paycut2=0;
		if (salary.getRaise1() != null) {
			rase1 = salary.getRaise1();
		}
		if (salary.getRaise2() != null) {
			rase2 = salary.getRaise2();
		}
		if (salary.getRaise3() != null) {
			rase3 = salary.getRaise3();
		}
		if (salary.getRaise4() != null) {
			rase4 = salary.getRaise4();
		}
		if (salary.getPaycut1() != null) {
			paycut1 = salary.getPaycut1();
		}
		if (salary.getPaycut2() != null) {
			paycut2 = salary.getPaycut2();
		}
		int rase = rase1 + rase2 + rase3 + rase4;
		int paycut=paycut1+paycut2;
		salary.setRaise(rase);
		salary.setPaycut(paycut);
		int salary1 = salary.getSalary();
		int total;
		total = salary1 + rase - paycut;

		System.out.println(total);
		salary.setTotal(total);

		salaryrepository.saveAndFlush(salary);
		
	}

}
