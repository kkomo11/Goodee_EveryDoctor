package com.goodee.everydoctor.board;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class BoardService {
	@Autowired
	private BoardMapper boardMapper;

	public List<BoardVO> getList(BoardVO boardVO)throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.getList(boardVO);
	}

	public void setAdd(BoardVO boardVO)throws Exception {
		// TODO Auto-generated method stub
		int result = boardMapper.setAdd(boardVO);
	}

	public BoardVO getDetail(BoardVO boardVO)throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.getDetail(boardVO);
	}

	public BoardFileVO getFileDetail(BoardFileVO boardFileVO)throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.getFileDetail(boardFileVO);

	}

	public int setUpdate(BoardVO boardVO)throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.setUpdate(boardVO);
	}

	public int setFileDelete(BoardFileVO boardFileVO)throws Exception {
		// TODO Auto-generated method stub
		boardFileVO = boardMapper.getFileDetail(boardFileVO);
		int result = boardMapper.setFileDelete(boardFileVO);

		return result;
	}


}
