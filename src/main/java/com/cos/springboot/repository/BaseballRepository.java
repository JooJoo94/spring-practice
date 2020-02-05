package com.cos.springboot.repository;

import java.util.List;

import com.cos.springboot.model.Player;
import com.cos.springboot.model.Team;

public interface BaseballRepository {
	
	// 팀 보기
	List<Team> findAllTeam();
	// 선수 보기
	List<Player> findPlayer(int teamId);
	// 상세보기
	List<Player> findPlayerDetail(int id);
}
