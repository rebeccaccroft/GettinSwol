package com.codingdojo.gettinswol.controllers;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.gettinswol.models.User;
import com.codingdojo.gettinswol.models.Workout;
import com.codingdojo.gettinswol.services.UserService;
import com.codingdojo.gettinswol.services.WorkoutService;


@Controller
@RequestMapping("/workout")
public class WorkoutController {
	@Autowired
	private UserService userServ;
	@Autowired
	private WorkoutService workoutServ;
	
	@GetMapping("/new")
	public String addWorkoutForm(Model model, HttpSession session) {
		if (session.getAttribute("userId") ==null) {
			return "redirect:/";
		}
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.getOne(userId));
		model.addAttribute("workout", new Workout());
		List<String> typesOfWorkouts = Arrays.asList("Cardio", "Strength & Conditioning", "HIIT", "Pushing", "Pulling", "Arms", "Abs", "Butt", "Legs", "Other");
		model.addAttribute("typesOfWorkouts", typesOfWorkouts);
		return "addWorkout.jsp";
	}
	@GetMapping("/{id}/edit")
	public String editWorkoutForm(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("userId") ==null) {
			return "redirect:/";
		}
		model.addAttribute("workout", workoutServ.getById(id));
		List<String> typesOfWorkouts = Arrays.asList("Cardio", "Strength & Conditioning", "HIIT", "Pushing", "Pulling", "Arms", "Abs", "Butt", "Legs", "Other");
		model.addAttribute("typesOfWorkouts", typesOfWorkouts);
		return "editWorkout.jsp";
	}
	@GetMapping("/{id}/view")
	public String viewOne(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("userId") ==null) {
			return "redirect:/";
	}
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.getOne(userId));
		model.addAttribute("workout", workoutServ.getById(id));
		return "viewWorkout.jsp";
	}
	@PostMapping("/new")
	public String create(@Valid @ModelAttribute("workout") Workout workout, BindingResult result, HttpSession session) {
			if (result.hasErrors()) {
			return "addWorkout.jsp";
		}
		Long userId = (Long) session.getAttribute("userId");
		User loginUser = userServ.getById(userId);
		workout.setCreatedBy(loginUser);
		workoutServ.create(workout);
		return "redirect:/dashboard";
	}
	@PutMapping("/{id}/update")
	public String update(@Valid @ModelAttribute("workout") Workout workout,  BindingResult result, @PathVariable("id")Long id, Model model , HttpSession session) {
		if (result.hasErrors()) {
			return "editWorkout.jsp";
		}
		Long userId = (Long) session.getAttribute("userId");
		User loginUser = userServ.getById(userId);
		workout.setCreatedBy(loginUser);
		workoutServ.update(workout);
		return "redirect:/dashboard";
}
	@GetMapping("/{id}/delete")
	public String delete(@PathVariable("id")Long id) {
		workoutServ.delete(id);
		return "redirect:/dashboard";
	}
}
