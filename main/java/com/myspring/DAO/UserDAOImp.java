package com.myspring.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.VO.UserVO;

@Repository
public class UserDAOImp implements UserDAO{
	private static final String MAPPER = "userMapper.";

	@Autowired
	private SqlSession sqlSession;
	
//	@Override
//	public int selectUser(String userID) {
//		String SQL = MAPPER + "selectUser";
//		try {
//			UserVO userVO = new UserVO(); 
//			userVO = sqlSession.selectOne(SQL, userID);
//			System.out.println(userVO.getUserEmail());
//		} catch (Exception e) {
//			System.out.println("실행 실패");
//			e.printStackTrace();
//		}
//		return 0;
//	}
	
	@Override
	public UserVO login(String userID, String userPassword){
		String SQL = MAPPER + "selectUser";
		try { 
			return sqlSession.selectOne(SQL, userID); // 아이디가 있으면 아이디 계정을 반
		}
		catch (Exception e) {
			e.printStackTrace();
			return null; // 아이디가 없으면 null을 반환
		}
		
	}
	
	@Override
	public UserVO selectUser(String userID) {
		String SQL = MAPPER + "selectUser";
		UserVO userVO = new UserVO(); 
		try {
			userVO = sqlSession.selectOne(SQL, userID);
		} catch (Exception e) {
			System.out.println("실행 실패");
			e.printStackTrace();
		}
		return userVO;
	}
	
	@Override
	public void join(UserVO userVO) {
		String SQL = MAPPER + "join";
		sqlSession.insert(SQL, userVO);
		System.out.println("회원가입 성공");
		
	}
	
	@Override
	public void deleteUser(String userID) {
		String SQL = MAPPER + "deleteUser";
		sqlSession.delete(SQL, userID);
		System.out.println("회원탈퇴 성공");
	}
	
	
}
