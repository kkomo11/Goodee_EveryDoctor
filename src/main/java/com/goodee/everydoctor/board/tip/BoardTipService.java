package com.goodee.everydoctor.board.tip;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class BoardTipService {
	@Autowired
	private BoardTipMapper boardTipMapper;

	public List<BoardTipVO> findBoardTipList(BoardTipVO boardTipVO)throws Exception {
		return boardTipMapper.findBoardTipList(boardTipVO);
	}

	public void inputBoardTipAdd(BoardTipVO boardTipVO)throws Exception {
		boardTipMapper.inputBoardTipAdd(boardTipVO);
	}

	public BoardTipVO findBoardTipDetail(BoardTipVO boardTipVO)throws Exception {
		return boardTipMapper.findBoardTipDetail(boardTipVO);
	}

	public int inputBoardTipUpdate(BoardTipVO boardTipVO)throws Exception {
		return boardTipMapper.inputBoardTipUpdate(boardTipVO);
	}

}
