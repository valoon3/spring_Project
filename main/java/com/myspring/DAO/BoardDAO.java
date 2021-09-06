package com.myspring.DAO;

import java.util.List;
import java.util.Map;

import com.myspring.VO.BoardVO;

public interface BoardDAO {
	
	public int write(BoardVO boardVO) throws Exception;
//	public boolean nextPage(int pageNumber);

	List<BoardVO> getList(int pageNumber);

	BoardVO selectPost(int boardID);

	boolean nextPage(int pageNumber);

	void boardWrite(BoardVO boardVO);

	void boardUpdate(BoardVO boardVO);

	void boardDelete(BoardVO boardVO);

	List<BoardVO> getMyList(String userID);

	
}
