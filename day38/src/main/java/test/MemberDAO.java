package test;

import java.util.ArrayList;

public class MemberDAO {
	
	private ArrayList<MemberVO> datas;
	
	public MemberDAO() {
		datas = new ArrayList<MemberVO>();
		datas.add(new MemberVO("admin", "1234,", "관리자"));
		datas.add(new MemberVO("test", "1234,", "테스트"));
		datas.add(new MemberVO("hong", "1234,", "홍길동"));
		
	}
	
	public boolean insert(MemberVO mVO) {
		return false;
	}
	
	public boolean update(MemberVO mVO) {
		return false;
	}
	
	public boolean delete(MemberVO mVO) {
		return false;
	}
	
	public MemberVO selectOne(MemberVO mVO) {
		for (MemberVO v : datas) {
			// 아이디
			if (mVO.getMid().equals(v.getMid())) {
				// 비밀번호
				if (mVO.getMpw().equals(v.getMpw())) {
					return v;
				}
			}
		}
		return null;
	}
	
	public ArrayList<MemberVO> selectAll(MemberVO mVO) {
		return datas;
	}
}
