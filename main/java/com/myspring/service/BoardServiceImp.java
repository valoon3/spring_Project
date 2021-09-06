package com.myspring.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.DAO.BoardDAO;
import com.myspring.DAO.UserDAO;
import com.myspring.VO.BoardVO;
import com.myspring.VO.UserVO;

@Service
public class BoardServiceImp implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private UserDAO userDAO;

	@Override
	public String userLogin(String userID, String userPassword, HttpSession session, Model model) {
		UserVO userVO = userDAO.login(userID, userPassword);
		if (userVO == null) {
			// 아이디 불일치
			model.addAttribute("userIDError", "조회되지 않는 아이디입니다.");
			// session.setAttribute("userLoginResult", "조회되지 않는 아이디입니다.");
			return "login";
		} else {
			if (userVO.getUserPassword().equals(userPassword)) {
				// 로그인 성공

				session.setAttribute("userVO", userDAO.selectUser(userID));
				return "redirect:/main";
			} else {
				// 비밀번호 불일치
				model.addAttribute("userPasswordError", "비밀번호가 틀렸습니다.");
				return "login";
			}

		}

	}

	@Override
	public String join(UserVO userVO, Model model) {
		if(userVO.getUserID().equals("") || userVO.getUserPassword().equals("") || userVO.getUserName().equals("") || userVO.getUserEmail().equals("") 
				|| userVO.getUserGender().equals("")) {
			model.addAttribute("nullError", "입력되지 않은 정보가 있습니다.");
			return "join";
		}
		else {
			userDAO.join(userVO);
			return "redirect:/navBarLogin";
		}
		
	}
	
	@Override
	public String deleteUser(String userID, HttpSession session) {
		userDAO.deleteUser(userID);
		session.invalidate();
		return "redirect:/main";
	}
	
	
	// 여기서부터 board =======================================================
	
	@Override
	public String boardList(@RequestParam(defaultValue = "1") int pageNumber, Model model) {
		model.addAttribute("boardList", boardDAO.getList(pageNumber));
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("nextPage", boardDAO.nextPage(pageNumber));
		System.out.println(boardDAO.nextPage(pageNumber));
		
		return "board";
	}
	
	@Override
	public String myBoardList(String userID, Model model) {
		model.addAttribute("boardList", boardDAO.getMyList(userID));
		
		return "myPage";
	}
	
	
	@Override
	public BoardVO selectPost(int boardID) {
		return boardDAO.selectPost(boardID);
	}
	
	@Override
	public String selectPost(int boardID, Model model, HttpServletRequest request) {
		model.addAttribute("post", boardDAO.selectPost(boardID));
		model.addAttribute("pageNumber", request.getParameter("pageNumber"));
		
		return "view";
	}
	
	@Override
	public String boardWrite(BoardVO boardVO, Model model, HttpSession session) {
		if(boardVO.getBoardTitle().equals("") || boardVO.getBoardContent().equals("") || boardVO.getBoardTitle() == null || boardVO.getBoardContent() == null) {
			model.addAttribute("NullError", "입력되지 않은 내용이 있습니다.");
			
			return "write"; 
		}
		else {
			boardVO.setUserID(((UserVO)session.getAttribute("userVO")).getUserID());
			boardDAO.boardWrite(boardVO);
			
			return "redirect:/navBarBoard";
		}
	}
	
	@Override
	public String boardUpdate(BoardVO boardVO) {
		boardDAO.boardUpdate(boardVO);
		
		
		return "redirect:/navBarBoard";
	}
	
	@Override
	public String boardDelete(BoardVO boardVO, Model model) {
		boardDAO.boardDelete(boardVO);
		model.addAttribute("deleteResult", "성공적으로 삭제되었습니다.");
		
		return "redirect:/navBarBoard";
	}

	
	

}
