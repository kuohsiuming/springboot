package com.example.demo.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.Repository.PortfolioRepository;
import com.example.demo.Repository.SalaryRepository;
import com.example.demo.Service.EmployeeServiceImpl;
import com.example.demo.Service.SalaryServiceImpl;
import com.example.demo.entity.Employee;
import com.example.demo.entity.Salary;

@Controller
public class PortfolioController {
	@Autowired
	private PortfolioRepository portfoliorepository;
	@Autowired
	private SalaryRepository salaryrepository;
	@Autowired
	private EmployeeServiceImpl employeeServiceImpl;
	@Autowired
	private SalaryServiceImpl salaryserviceimpl;

	// 員工資料表讀取
	@GetMapping(value = { "/portfolio", "/portfolio/{id}", "/portfolio/{delete}/{id}" })
	public String read(Model model, @PathVariable Optional<Integer> id, @PathVariable Optional<String> delete) {
		Employee employee = new Employee();
		String _method = "POST";
		if (id.isPresent()) {// isPresent()是否存在值
			employee = portfoliorepository.findByid(id.get());
			if (delete.isPresent() && delete.get().equals("delete")) {
				_method = "DELETE";

			} else {
				_method = "PUT";
			}
		}
		model.addAttribute("_method", _method);
		model.addAttribute("employee", employee);
		model.addAttribute("employees", portfoliorepository.findAll());
		return "employee";
	}

	// 薪資表讀取
	@GetMapping(value = { "/salary", "/salary/{id}", "/salary/{delete}/{id}" })
	public String salary(Model model, @PathVariable Optional<Integer> id, @PathVariable Optional<String> delete) {
		Salary salary = new Salary();
		String _method = "POST";
		if (id.isPresent()) {// isPresent()是否存在值
			salary = salaryrepository.findByid(id.get());
			if (delete.isPresent() && delete.get().equals("delete")) {
				_method = "DELETE";

			} else {
				_method = "PUT";
			}
		}

		model.addAttribute("salary", salary);
		model.addAttribute("_method", _method);
		model.addAttribute("salarys", salaryrepository.findAll());
		model.addAttribute("employees", portfoliorepository.findAll());
		return "salary";
	}

	// 新增薪資
	@PostMapping(value = "/salary")
	public String addSalary(@ModelAttribute("salary") Salary salary) {
		salaryserviceimpl.save(salary);
		return "redirect:/salary";
	}

	// 修改薪資
	@PutMapping(value = "/salary/{id}")
	public String UpdateSalary(@ModelAttribute("salary") Salary salary) {
		salaryserviceimpl.save(salary);
		return "redirect:/salary";
	}

	// 刪除薪資
	@DeleteMapping(value = "/salary/{delete}/{id}")
	public String DeleteSalary(@ModelAttribute("salary") Salary salary) {
		salaryrepository.delete(salary);
		return "redirect:/salary";
	}

	// 註冊
	@GetMapping(value = { "/register" })
	public String register(Model model) {
		Employee employee = new Employee();
		model.addAttribute("employee", employee);
		return "/register";
	}

	// 註冊
	@PostMapping(value = { "/register" })
	public String register1(@ModelAttribute("employee") Employee employee, RedirectAttributes redirectAttributes) {
		System.out.println(employee + "44444444444444444444444444");
		Employee employee1 = portfoliorepository.findByname(employee.getName());
		// System.out.println("-----------------"+employee1);
		if (employee1 == null) {
			employeeServiceImpl.save(employee);

			return "redirect:/login";
		} else {
			redirectAttributes.addFlashAttribute("MESSAGE", "用戶名稱已註冊");
			return "redirect:/register";
		}
	}

	// 登入
	@GetMapping(value = { "/login" })
	public String login(Model model,@RequestParam(value = "error",required = false) String error) {
		if(error !=null) {
			System.out.println("haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
			model.addAttribute("error", "帳號或密碼錯誤");
		}
		Employee employee = new Employee();
		model.addAttribute("employee", employee);

		return "/login";
	}

	// 登入成功 頁面
	@RequestMapping("/welcome")
	public String welcome() {
		return "/welcome";
	}


	@RequestMapping("/employeepage")
	@ResponseBody
	public String employeepage() {
		return "employeepage";
	}

	// 員工新增
	@PostMapping(value = "/portfolio")
	public String addEmployee(@ModelAttribute("employee") Employee employee) {
		System.out.println(employee + "88888888888888888888888888888");
		employeeServiceImpl.save(employee);

		return "redirect:/portfolio";
	}

	// 員工修改
	@PutMapping(value = "/portfolio/{id}")
	public String UpdateEmployee(@ModelAttribute("employee") Employee employee) {
		System.out.println(employee + "9999999999999999999999999999999");
		employeeServiceImpl.save(employee);

		return "redirect:/portfolio";
	}

	// 員工刪除
	@DeleteMapping(value = "/portfolio/{delete}/{id}")
	public String DeleteEmployee(@ModelAttribute("employee") Employee employee) {
		System.out.println(employee + "2222222222222222222222222222222222222");
		portfoliorepository.delete(employee);
		return "redirect:/portfolio";
	}

}
