package com.codingdojo.gettinswol.services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.gettinswol.models.Workout;
import com.codingdojo.gettinswol.repositories.WorkoutRepository;


@Service
public class WorkoutService {
	@Autowired
	private WorkoutRepository workoutRepo;
	
	public ArrayList<Workout> getAll(){
		return workoutRepo.findAll();	
		}
	public Workout create(Workout w) {
		return workoutRepo.save(w);
	}
	public Workout update(Workout w) {
		return workoutRepo.save(w);
	}
	public Workout getById(Long id) {
		Optional<Workout> optWorkout = workoutRepo.findById(id);
		if (optWorkout.isPresent()) {
			return optWorkout.get();
		}
		return null;
}
	public void delete(Long id) {
		workoutRepo.deleteById(id);
	}
}
