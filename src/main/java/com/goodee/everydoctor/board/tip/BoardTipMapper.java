package com.goodee.everydoctor.board.tip;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardTipMapper {

	public List<BoardTipVO> findBoardTipList(BoardTipVO boardTipVO)throws Exception;

	public int inputBoardTipAdd(BoardTipVO boardTipVO)throws Exception;

//	public int setFileAdd(BoardFileVO boardFileVO)throws Exception;

	public BoardTipVO findBoardTipDetail(BoardTipVO boardTipVO)throws Exception;

//	public BoardFileVO getFileDetail(BoardFileVO boardFileVO)throws Exception;

	public int inputBoardTipUpdate(BoardTipVO boardTipVO)throws Exception;

//	public int setFileUpdate(BoardFileVO boardFileVO)throws Exception;
//
//	public int setFileDelete(BoardFileVO boardFileVO)throws Exception;


}
