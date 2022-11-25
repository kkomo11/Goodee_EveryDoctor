package com.goodee.everydoctor.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("list")
	public ModelAndView getList(BoardVO boardVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardVO> ar = boardService.getList(boardVO);
		mv.addObject("list", ar);
		mv.setViewName("board/list");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(BoardVO boardVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		boardVO=boardService.getDetail(boardVO);
		mv.addObject("board",boardVO);
		mv.setViewName("board/detail");
		return mv;
	}

}
