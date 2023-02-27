package com.codingdojo.gettinswol.repositories;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.gettinswol.models.Workout;

public interface WorkoutRepository extends CrudRepository<Workout, Long>{
	public ArrayList<Workout> findAll();
}
