package com.sample.jsblog.service;

import java.util.List;

import com.sample.jsblog.vo.Board;

public interface BoardService {

	void insertBoard(Board board);
	
	List<Board> getBoardList();
	
	Board getBoardViewNo(String boardNo);
	
	void deleteBoard(String boardNo);
	
	void updateBoard(Board board);
	
	List<Board> search(String boardTitle);
	
	void viewCount(int boardNo);
	
	void insertSubboard(Board board);
	
	List<Board> subBoardlist();
	
	List<Board> selectsubboard(String boardNo);
}
