package com.codingdojo.gettinswol.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.gettinswol.models.LoginUser;
import com.codingdojo.gettinswol.models.User;
import com.codingdojo.gettinswol.services.UserService;
import com.codingdojo.gettinswol.services.WorkoutService;



@Controller
public class MainController {
	@Autowired
	private UserService userServ;
	@Autowired
	private WorkoutService workoutServ;

	@GetMapping("/")
	public String login(Model model) {
		model.addAttribute("loginUser", new LoginUser());
		return"login.jsp";
	}
	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("user", new User());
		return"registration.jsp";
	}
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.getOne(userId));
		model.addAttribute("allWorkouts", workoutServ.getAll());
		return "dashboard.jsp";
	}
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		userServ.register(user, result);
		if (result.hasErrors()) {
		return "registration.jsp";
		}
		User createdUser = userServ.create(user);
		session.setAttribute("userId", createdUser.getId());
		return "redirect:/dashboard";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("loginUser") LoginUser logUser, BindingResult result, HttpSession session) {
		
		User loggedUser = userServ.login(logUser, result);
		if(loggedUser == null) {
			return "login.jsp";
		}
		session.setAttribute("userId", loggedUser.getId());
		return "redirect:/dashboard";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		return "redirect:/";
	}

}
