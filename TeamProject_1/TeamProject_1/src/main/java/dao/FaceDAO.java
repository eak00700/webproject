package dao;

import org.apache.ibatis.session.SqlSession;

import vo.FaceVO;

public class FaceDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//회원가입 페이지
	public int insert(FaceVO vo) {
		int res = sqlSession.insert("f.face_insert", vo);
		return res;
	}
	
	//아이디 중복체크
	public FaceVO id_check(String id) {
		FaceVO vo = sqlSession.selectOne("f.idcheck", id);
		return vo;
	}
	
	//아이디 찾기
	 public FaceVO find_id(String name) {
		 FaceVO vo = sqlSession.selectOne("f.find_id",name);
		 return vo;
	}
}








