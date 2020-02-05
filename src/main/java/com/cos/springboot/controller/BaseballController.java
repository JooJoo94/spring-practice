package com.cos.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.springboot.model.Player;
import com.cos.springboot.model.Product;
import com.cos.springboot.model.Team;
import com.cos.springboot.repository.BaseballRepository;
import com.cos.springboot.repository.ProductRepository;

@Controller
public class BaseballController {
	
	@Autowired
	private  BaseballRepository baseballRepository;
	
	@GetMapping("/practice/baseball")
	public String product(Model model) {
		
		List<Team> teams = baseballRepository.findAllTeam();
		model.addAttribute("teams", teams);

		return "baseball/list";
	}
	// 선수 찾기
	@GetMapping("/practice/baseball/player/{teamId}")
	public ResponseEntity<?> playerList(@PathVariable int teamId) {
		
		List<Player> players = baseballRepository.findPlayer(teamId);		
		return new ResponseEntity<List<Player>>(players, HttpStatus.OK);	
	}
	
	// 선수 정보
		@GetMapping("/practice/baseball/detail/{playerId}")
		public ResponseEntity<?> playerDetail(@PathVariable int playerId) {
			
			List<Player> playerDetail = baseballRepository.findPlayerDetail(playerId);	
			return new ResponseEntity<List<Player>>(playerDetail, HttpStatus.OK);	
		}
	

}
