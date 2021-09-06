package com.myspring.DAO;

import com.myspring.VO.UserVO;

public interface UserDAO {

	//int selectUser(String user);
	public UserVO login(String userID, String userPassword);
	//public int join(UserVO userVO);
	public UserVO selectUser(String userID);
	public void join(UserVO userVO);
	void deleteUser(String userID);
	
}
