package com.goodee.everydoctor.board.tip;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/boardTip/*")
public class BoardTipController {

	@Autowired
	private BoardTipService boardTipService;

	@GetMapping("list")
	public ModelAndView getList(BoardTipVO boardTipVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardTipVO> ar = boardTipService.getList(boardTipVO);
		mv.addObject("list", ar);
		mv.setViewName("boardTip/list");
		return mv;
	}

	@GetMapping("detail")
	public ModelAndView getDetail(BoardTipVO boardTipVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		boardTipVO=boardTipService.getDetail(boardTipVO);
		mv.addObject("boardTip",boardTipVO);
		mv.setViewName("boardTip/detail");
		return mv;
	}

}
