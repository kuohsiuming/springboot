package com.example.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table
public class Salary {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	// 員工id
	@Column
	private String employeeid;
	@DateTimeFormat(pattern = "MM.yyyy")
	@Column
	private String date;
	// 本薪
	@Column
	private Integer salary;
	// 加薪總
	@Column
	private Integer raise;
	// 加薪1
	@Column
	private Integer raise1;
	// 加薪2
	@Column
	private Integer raise2;
	// 加薪3
	@Column
	private Integer raise3;
	// 加薪4
	@Column
	private Integer raise4;
	// 減薪1
	@Column
	private Integer paycut;
	// 減薪2
	@Column
	private Integer paycut1;
	@Column
	private Integer paycut2;
	// 總薪
	@Column
	private Integer total;

	
	
	public Integer getPaycut2() {
		return paycut2;
	}

	public void setPaycut2(Integer paycut2) {
		this.paycut2 = paycut2;
	}

	public Integer getPaycut1() {
		return paycut1;
	}

	public void setPaycut1(Integer paycut1) {
		this.paycut1 = paycut1;
	}

	public Integer getRaise4() {
		return raise4;
	}

	public void setRaise4(Integer raise4) {
		this.raise4 = raise4;
	}

	public Integer getRaise1() {
		return raise1;
	}

	public void setRaise1(Integer raise1) {
		this.raise1 = raise1;
	}

	public Integer getRaise2() {
		return raise2;
	}

	public void setRaise2(Integer raise2) {
		this.raise2 = raise2;
	}

	public Integer getRaise3() {
		return raise3;
	}

	public void setRaise3(Integer raise3) {
		this.raise3 = raise3;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public Integer getRaise() {
		return raise;
	}

	public void setRaise(Integer raise) {
		this.raise = raise;
	}

	public Integer getPaycut() {
		return paycut;
	}

	public void setPaycut(Integer paycut) {
		this.paycut = paycut;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public String getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
	}

	@Override
	public String toString() {
		return "Salary [id=" + id + ", employeeid=" + employeeid + ", date=" + date + ", salary=" + salary + ", raise="
				+ raise + ", paycut=" + paycut + ", total=" + total + "]";
	}

}
