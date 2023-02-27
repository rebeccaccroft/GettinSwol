package com.codingdojo.gettinswol.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.gettinswol.models.LoginUser;
import com.codingdojo.gettinswol.models.User;
import com.codingdojo.gettinswol.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;

	public User getById(Long id) {
		Optional<User> optUser = userRepo.findById(id);
		if (optUser.isPresent()) {
			return optUser.get();
		}
		return null;
	}

	public User create(User u) {
		return userRepo.save(u);
	}

	public User getOne(Long id) {
		Optional<User> user = userRepo.findById(id);
		if (user.isEmpty()) {
			return null;
		}
		return user.get();
	}

	public User register(User createdUser, BindingResult result) {
		if (!createdUser.getPasswordActive().equals(createdUser.getConfirmPass())) {
			result.rejectValue("confirmPass", "Match", "Passwords must match.");
		}
	
		if (!result.hasErrors()) {
			createdUser.setPasswordActive(BCrypt.hashpw(createdUser.getPasswordActive(), BCrypt.gensalt()));
			return this.create(createdUser);
		}
		return null;
	}

	public User login(LoginUser loginUser, BindingResult result) {
		Optional<User> user = userRepo.findByEmail(loginUser.getEmail());
		if (user.isPresent() && BCrypt.checkpw(loginUser.getPassword(), user.get().getPasswordActive())) {
			return user.get();
		}
		result.rejectValue("password", "invalid", "invalid credentials");
		return null;
	}
}
