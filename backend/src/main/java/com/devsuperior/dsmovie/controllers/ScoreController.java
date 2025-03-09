package com.devsuperior.dsmovie.controllers;
import org.springframework.beans.factory.annotation.Autowired;
 
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.devsuperior.dsmovie.dto.MovieDto;
import com.devsuperior.dsmovie.dto.ScoreDto;
import com.devsuperior.dsmovie.services.ScoreService;


@RestController
@RequestMapping(value = "/scores")
public class ScoreController {
	
	@Autowired
	private ScoreService service;
	
	@PutMapping
    public MovieDto saveScore(@RequestBody ScoreDto dto) {
		MovieDto movieDto = service.saveScore(dto);
		return movieDto;
	 }
	 
}



		

