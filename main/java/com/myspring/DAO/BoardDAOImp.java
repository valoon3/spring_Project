package com.myspring.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.VO.BoardVO;

@Repository
public class BoardDAOImp implements BoardDAO {

	private static final String MAPPER = "boardMapper.";

	@Autowired
	private SqlSession sqlSession;
	
	//private BoardVO boardVO = new BoardVO();

	
	public String getDate() { // 글을 쓸때 글의 시간을 저장한다.

		String SQL = MAPPER + "getDate";

		return sqlSession.selectOne(SQL);

	}

	public int getNext() {
		String SQL = MAPPER + "getNext";
		int num = sqlSession.selectOne(SQL);
		
		return num + 1;
	}
	
	@Override
	public int write(BoardVO boardVO) throws Exception { //1이면 글쓰기 성공 0이면 실패
		String SQL = MAPPER + "write";
		
		try {
			boardVO.setBoardDate(this.getDate());
			boardVO.setBoardID(getNext());
			boardVO.setBoardAvailable(1);
			return sqlSession.insert(SQL, boardVO); // 글쓰기 성공시 1이상이 반환됨
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("글쓰기 실패");
		}
		
		return 0; // 글쓰기 실패s
	}
	
	@Override
	public List<BoardVO> getList(int pageNumber) {
		String SQL = MAPPER + "getList";
		List<BoardVO> list = sqlSession.selectList(SQL, this.getNext() - (pageNumber - 1) * 10); 
		
		return list;
	}
	
	@Override
	public List<BoardVO> getMyList(String userID) {
		String SQL = MAPPER + "getMyList";
		List<BoardVO> list = sqlSession.selectList(SQL, userID); 
		
		return list;
	}
	
//	@Override
//	public List<BoardVO> getMyList(int pageNumber) { // getList 에서 userID 검색만 추가된 상태
//		String SQL = MAPPER + "getMyList";
//		List<BoardVO> list = sqlSession.selectList(SQL, this.getNext() - (pageNumber - 1) * 10); 
//		
//		return list;
//	}
	
	
	@Override
	public BoardVO selectPost(int boardID) {
		String SQL = MAPPER + "selectPost";
		
		return sqlSession.selectOne(SQL, boardID);
	}
	
	@Override
	public boolean nextPage(int pageNumber) {
		String SQL = MAPPER + "nextPage";
		
		return sqlSession.selectOne(SQL, this.getNext() - (pageNumber - 1) * 10);
	}
	
	@Override
	public void boardWrite(BoardVO boardVO) {
		String SQL = MAPPER + "boardWrite";
		boardVO.setBoardID(getNext());
		boardVO.setBoardDate(getDate());
		boardVO.setBoardAvailable(1);
		sqlSession.insert(SQL, boardVO);
	}
	
	@Override
	public void boardUpdate(BoardVO boardVO) {
		String SQL = MAPPER + "boardUpdate";
		boardVO.setBoardDate(getDate());
		sqlSession.update(SQL, boardVO);
	}
	
	@Override
	public void boardDelete(BoardVO boardVO) {
		String SQL = MAPPER + "delete";
		boardVO.setBoardAvailable(0);
		sqlSession.update(SQL, boardVO);
	}


}
