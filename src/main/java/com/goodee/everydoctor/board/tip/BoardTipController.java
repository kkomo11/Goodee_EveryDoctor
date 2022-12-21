package com.goodee.everydoctor.board.tip;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board/tip/*")
public class BoardTipController {

	@Autowired
	private BoardTipService boardTipService;

	@GetMapping("list")
	public void findBoardTipList(BoardTipVO boardTipVO)throws Exception {

	}

	@GetMapping("detail")
	public ModelAndView findBoardTipDetail(BoardTipVO boardTipVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		boardTipVO=boardTipService.findBoardTipDetail(boardTipVO);
		mv.addObject("boardTip",boardTipVO);
		mv.setViewName("board/tip/detail");
		return mv;
	}

}
