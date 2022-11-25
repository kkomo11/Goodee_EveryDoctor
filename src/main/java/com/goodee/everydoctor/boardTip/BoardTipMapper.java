package com.goodee.everydoctor.boardTip;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardTipMapper {

	public List<BoardTipVO> getList(BoardTipVO boardTipVO)throws Exception;

	public int setAdd(BoardTipVO boardTipVO)throws Exception;

	public int setFileAdd(BoardFileVO boardFileVO)throws Exception;

	public BoardTipVO getDetail(BoardTipVO boardTipVO)throws Exception;

	public BoardFileVO getFileDetail(BoardFileVO boardFileVO)throws Exception;

	public int setUpdate(BoardTipVO boardTipVO)throws Exception;

	public int setFileUpdate(BoardFileVO boardFileVO)throws Exception;

	public int setFileDelete(BoardFileVO boardFileVO)throws Exception;


}
