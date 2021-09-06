package com.myspring.boardApp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.VO.BoardVO;
import com.myspring.VO.UserVO;
import com.myspring.service.BoardService;

//import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
public class MainController {
	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {
		logger.info("main");
		
		return "main";
	}
	
	
	@RequestMapping(value = "/navBarLogin", method = RequestMethod.GET)
	public String loginGet(Model model) {
		logger.info("loginGet");
		
		
		return "login";
	}
	
	@RequestMapping(value = "/navBarLogin", method = RequestMethod.POST)
	public String loginPost(Model model, HttpSession session, @RequestParam String userID, @RequestParam String userPassword) {
		logger.info("loginPost");
		
		return boardService.userLogin(userID, userPassword, session, model);
		//return "redirect:/main";
	}
	
	
	@RequestMapping(value="/logOut", method = {RequestMethod.GET, RequestMethod.POST})
	public String logOut(HttpSession session) {
		logger.info("logOut");
		session.invalidate();
		
		return "main";
	}
	
	@RequestMapping(value="/navBarJoin", method = RequestMethod.GET)
	public String joinGet(HttpSession session) {
		logger.info("joinGet");
		session.removeAttribute("userVO");
		return "join";
	}
	
	@RequestMapping(value="/navBarJoin", method = RequestMethod.POST)
	public String joinPost(@ModelAttribute UserVO userVO, Model model) {
		logger.info("joinPost");
		System.out.println(userVO);
		
		return boardService.join(userVO, model);
	}
	
	
	@RequestMapping(value="/myPageUserDelete", method = RequestMethod.POST)
	public String myPageUserDeletePost(HttpSession session, UserVO userVO) {
		logger.info("myPageUserDeletePost");
		userVO = (UserVO) session.getAttribute("userVO");
		return boardService.deleteUser(userVO.getUserID(), session);
	}
	
	@RequestMapping(value = "/navBarBoard", method = {RequestMethod.GET, RequestMethod.POST})
	public String board(@RequestParam(defaultValue = "1") int pageNumber, Model model) {
		logger.info("navBarBoard");
		if(model.getAttribute("pageNumber") != null) {
			pageNumber = (int) model.getAttribute("pageNumber");
		}		
		
		return boardService.boardList(pageNumber, model); //board
	}
	
	@RequestMapping(value="/myPage")
	public String myPage(HttpSession session, Model model) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		String userID = userVO.getUserID();
		
		return boardService.myBoardList(userID, model);
	}
	
	@RequestMapping(value="/overLapChk")
	public String overLapChk() {
		
		
		return "";
	}
	
	
	// board
	//=========================================================
	
	
	@RequestMapping(value="/boardTitle", method = RequestMethod.GET)
	public String boardTitle(@RequestParam int boardID, Model model, HttpServletRequest request) {
		logger.info("boardTitle");
		
		return boardService.selectPost(boardID, model, request); //view
	}
	
	
	@RequestMapping(value="/boardWrite", method = RequestMethod.GET)
	public String boardWriteGet(HttpSession session, Model model, HttpServletRequest request) {
		
		if(request.getParameter("boardID") != null) {
			int boardID = Integer.parseInt(request.getParameter("boardID"));
			model.addAttribute("boardVO", boardService.selectPost(boardID));
		}
		
		if(session.getAttribute("userVO") == null) {
			model.addAttribute("loginError", "글 작성을 위해서는 로그인이 필요합니다.");
			return "login";
		}
		else
			return "write";
		
		
	}
	
	@RequestMapping(value="/boardWriteComplete", method = RequestMethod.POST)
	public String boardWriteComplete(@ModelAttribute BoardVO boardVO, Model model, HttpSession session) {
		
		
		return boardService.boardWrite(boardVO, model, session);
	}
	
	@RequestMapping(value="/editWrite", method = RequestMethod.GET)
	public String editWriteGet(Model model, HttpServletRequest request) {
		int boardID = Integer.parseInt(request.getParameter("boardID"));
		model.addAttribute("boardID", boardID);
		
		return "redirect:/boardWrite";
	}
	
	@RequestMapping(value="/editComplete", method = RequestMethod.POST)
	public String editComplete(@ModelAttribute BoardVO boardVO) {
		
		return boardService.boardUpdate(boardVO);
	}
	
	@RequestMapping(value="/delete", method = {RequestMethod.POST, RequestMethod.GET})
	public String delete(@ModelAttribute BoardVO boardVO, Model model) {
		
		return boardService.boardDelete(boardVO, model);
	}
	
	
}
