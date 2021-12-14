package com.sample.jsblog.dao;

import java.util.List;

import com.sample.jsblog.vo.Board;

public interface BoardDao {
	/**
	 * 게시물 등록
	 * @param board 게시물의 정보 
	 */
	void insertBoardarea(Board board);
	/**
	 * 게시물 조회
	 * @return 저장되어있는 게시불 리스트 반환
	 */
	List<Board> getBoardList();
	/**
	 * 게시물 선택 좋회
	 * @param boardNo 게시물 번호
	 * @return 번호에 해당하는 게시물 반환
	 */
	Board getBoardViewNo(String boardNo);
	
	/**
	 * 
	 * @param boardNo
	 */
	void deleteBoard(String boardNo);
	/**
	 * 
	 * @param board
	 */
	void updateBoard(Board board);
	/**
	 * 
	 * @param boardTitle
	 * @return
	 */
	List<Board> search(String boardTitle);
	
	void viewCount(int boardNo);
	
	List<Board> selectBoardNo() throws Exception;
}
