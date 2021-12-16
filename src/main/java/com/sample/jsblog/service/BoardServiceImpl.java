package com.sample.jsblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.jsblog.dao.BoardDao;
import com.sample.jsblog.vo.Board;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired BoardDao boardDao;
	
	@Override
	public void insertBoard(Board board) {
		boardDao.insertBoardarea(board);
	}
	
	@Override
	public List<Board> getBoardList() {

		return boardDao.getBoardList();
	}
	
	@Override
	public Board getBoardViewNo(String boardNo) {
			 return boardDao.getBoardViewNo(boardNo);
		
	}
	
	@Override
	public void deleteBoard(String boardNo) {
		boardDao.deleteBoard(boardNo);
		
	}
	@Override
	public void updateBoard(Board board) {
		boardDao.updateBoard(board);
	}
		
	@Override
	public List<Board> search(String boardTitle) {
		return boardDao.search(boardTitle);
	}
	
	@Override
	public void viewCount(int boardNo) {
		boardDao.viewCount(boardNo);
		
	}
	@Override
	public void insertSubboard(Board board) {
		boardDao.insertSubBoard(board);
		
	}
	
	@Override
	public List<Board> subBoardlist() {
		return boardDao.subBoardlist();
	}
	
	@Override
	public List<Board> selectsubboard(String boardNo) {
		// TODO Auto-generated method stub
		return boardDao.selectsubboard(boardNo);
	}

}
