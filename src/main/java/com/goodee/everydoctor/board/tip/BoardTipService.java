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

	public List<BoardTipVO> getList(BoardTipVO boardTipVO)throws Exception {
		// TODO Auto-generated method stub
		return boardTipMapper.getList(boardTipVO);
	}

	public void setAdd(BoardTipVO boardTipVO)throws Exception {
		// TODO Auto-generated method stub
		int result = boardTipMapper.setAdd(boardTipVO);
	}

	public BoardTipVO getDetail(BoardTipVO boardTipVO)throws Exception {
		// TODO Auto-generated method stub
		return boardTipMapper.getDetail(boardTipVO);
	}

//	public BoardFileVO getFileDetail(BoardFileVO boardFileVO)throws Exception {
//		// TODO Auto-generated method stub
//		return boardTipMapper.getFileDetail(boardFileVO);
//
//	}

	public int setUpdate(BoardTipVO boardTipVO)throws Exception {
		// TODO Auto-generated method stub
		return boardTipMapper.setUpdate(boardTipVO);
	}

//	public int setFileDelete(BoardFileVO boardFileVO)throws Exception {
//		// TODO Auto-generated method stub
//		boardFileVO = boardTipMapper.getFileDetail(boardFileVO);
//		int result = boardTipMapper.setFileDelete(boardFileVO);
//
//		return result;
//	}


}
