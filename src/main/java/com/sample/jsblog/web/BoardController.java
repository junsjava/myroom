package com.sample.jsblog.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sample.jsblog.service.BoardService;
import com.sample.jsblog.view.JsonView;
import com.sample.jsblog.vo.Board;

@Controller
public class BoardController {
	@Autowired BoardService boardSerivce;
	
	@Autowired JsonView jsonView;

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
		List<Board> sub = boardSerivce.selectsubboard(boardNo);
		model.addAttribute("boardNo",boardNo);
		model.addAttribute("subitem", sub);
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
	    model.addAttribute("boardList", a);
	    
	    return "comunity/board";
	}
	
	@RequestMapping(value="/subBoard", method=RequestMethod.GET)
	public ModelAndView subBoard(@RequestParam("subB") String subBoard,
			@RequestParam(/* value = */"userId"/* ,required=false */)String userId, @RequestParam("boardNo")String boardNo) {
		//게시판 테이블에 댓글 컬러 하나 추가해서 내용 받을수잇게 작업해야함
		
		Board sub = new Board();
		
		sub.setSubBoard(subBoard);
		sub.setUserId(userId);
		sub.setBoardNo(boardNo);
		boardSerivce.insertSubboard(sub);
		//insert작업 이루어진뒤에 반환값 json으로 반환 작업 필요
		List<Board> list = boardSerivce.selectsubboard(boardNo);
		ModelAndView mav = new ModelAndView();;
		System.out.println(list+"여기");
		mav.addObject("data", list);
		mav.setView(jsonView);
		//페이지에 댓글 보이게 param 값 전송 작업해야함  예를들어 select 를 하나 더만들ㄹ어서 데이터값 뿌려지게 ?
		return mav;
	}
}