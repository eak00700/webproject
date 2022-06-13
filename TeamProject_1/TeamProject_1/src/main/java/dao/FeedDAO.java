package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.FeedVO;

public class FeedDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<FeedVO> selectList() {
		List<FeedVO> list = sqlSession.selectList("f.feed_list");
		return list;
		
	}
}
