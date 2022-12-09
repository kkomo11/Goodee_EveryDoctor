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
		// TODO Auto-generated method stub
		return boardTipMapper.findBoardTipList(boardTipVO);
	}

	public void inputBoardTipAdd(BoardTipVO boardTipVO)throws Exception {
		// TODO Auto-generated method stub
		int result = boardTipMapper.inputBoardTipAdd(boardTipVO);
	}

	public BoardTipVO findBoardTipDetail(BoardTipVO boardTipVO)throws Exception {
		// TODO Auto-generated method stub
		return boardTipMapper.findBoardTipDetail(boardTipVO);
	}

//	public BoardFileVO getFileDetail(BoardFileVO boardFileVO)throws Exception {
//		// TODO Auto-generated method stub
//		return boardTipMapper.getFileDetail(boardFileVO);
//
//	}

	public int inputBoardTipUpdate(BoardTipVO boardTipVO)throws Exception {
		// TODO Auto-generated method stub
		return boardTipMapper.inputBoardTipUpdate(boardTipVO);
	}

//	public int setFileDelete(BoardFileVO boardFileVO)throws Exception {
//		// TODO Auto-generated method stub
//		boardFileVO = boardTipMapper.getFileDetail(boardFileVO);
//		int result = boardTipMapper.setFileDelete(boardFileVO);
//
//		return result;
//	}


}
