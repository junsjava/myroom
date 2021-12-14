package com.sample.jsblog.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.jsblog.service.BoardService;
import com.sample.jsblog.vo.Board;

@Controller
public class BoardController {
	@Autowired BoardService boardSerivce;

	@GetMapping("board")
	public String board(Model model) {
		List<Board> boardList = boardSerivce.getBoardList();
		
		System.out.println(boardList);
		model.addAttribute("boardList", boardList);
		
		return "comunity/board";
	}
	
	@GetMapping("boardcreate")
	public String boardcreate() {
		return "comunity/boardcreate";
	}
	
	@PostMapping("textcreate")
	public String textcreate(@RequestParam("title")String title, @RequestParam("textarea")String textarea, @RequestParam("userId")String userId
								,Model model) {
		Board board = new Board();
		board.setBoardTitle(title);
		board.setBoardArea(textarea);
		board.setUserId(userId);
		
		List<Board> list = boardSerivce.getBoardList();
		model.addAttribute("boardList",list);
		boardSerivce.insertBoard(board);
		return "redirect:board";
	}
	
	@GetMapping("boardview")
	public String boardview(@RequestParam("boardNo")String boardNo, Model model) {
		Board boardview =boardSerivce.getBoardViewNo(boardNo);
		model.addAttribute("boardview",boardview);
		System.out.println(boardNo);
		return "/comunity/boardview";
	}
	@GetMapping("boardDelete")
	public String boardDelete(@RequestParam("boardNo")String boardNo) {
		boardSerivce.deleteBoard(boardNo);
		return "redirect:board";
		
	}
	
	@PostMapping("boardchange")
	public String boardChange(@RequestParam("titles")String titles, @RequestParam("textareas")String textareas,Model model) {
		
		model.addAttribute("titles",titles);
		model.addAttribute("textareas",textareas);
		
		return "comunity/boardcreate";
	}
	
	@GetMapping("modifyboard")
	public String modifyboard(@RequestParam("title")String title, @RequestParam("area")String textarea, @RequestParam("userId")String userId,@RequestParam("boardNo")String boardNo
								,Model model) {
		Board board = new Board();
		board.setBoardTitle(title);
		board.setBoardArea(textarea);
		board.setUserId(userId);
		board.setBoardNo(boardNo);
		
		model.addAttribute("board",board);
		return "comunity/modifyboard";
	}
	
	@PostMapping("modify")
	public String modify(@RequestParam("title")String title, @RequestParam("textarea")String textarea, @RequestParam("userId")String userId, @RequestParam("boardNo")String boardNo) {
		
		Board board = new Board();
		board.setBoardTitle(title);
		board.setBoardArea(textarea);
		board.setUserId(userId);
		board.setBoardNo(boardNo);
		boardSerivce.updateBoard(board);
		
		System.out.println(title);
		System.out.println(textarea);
		System.out.println(userId);
		System.out.println(boardNo);
		return "redirect:board";
		
	}
	@PostMapping("search")
	public String search(@RequestParam("search")String boardTitle, Model model) {
		List<Board> board = boardSerivce.search(boardTitle);
		String searchname = boardTitle;
		model.addAttribute("search", board);
		model.addAttribute("searchtext",searchname);
		System.out.println(boardTitle);

		return "/comunity/searchlist";
	}
	@RequestMapping(value = "/boardview")
	public String detailProject(@ModelAttribute("BoardVO") Board board, Model model) {

		// 조회수 증가
		boardSerivce.viewCount(Integer.parseInt(board.getBoardNo()));
		
		String a = board.getBoardNo();
		
		a = Integer.toString(board.getViewCount());
		
		List<Board> boardList = boardSerivce.getBoardList();

	    model.addAttribute("boardList", boardList);
	    
	    return "comunity/board";
	}
}