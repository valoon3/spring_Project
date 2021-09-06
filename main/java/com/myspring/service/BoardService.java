package com.myspring.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.myspring.VO.BoardVO;
import com.myspring.VO.UserVO;

public interface BoardService {
	public String userLogin(String userID, String userPassword, HttpSession session, Model model);
	public String join(UserVO userVO, Model model);
	String deleteUser(String userID, HttpSession session);
	String boardList(int pageNumber, Model model);
	BoardVO selectPost(int boardID);
	String selectPost(int boardID, Model model, HttpServletRequest request);
	String boardWrite(BoardVO boardVO, Model model, HttpSession session);
	String boardUpdate(BoardVO boardVO);
	String boardDelete(BoardVO boardVO, Model model);
	String myBoardList(String userID, Model model);
}
