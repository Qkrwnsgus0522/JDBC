package model;

import java.util.ArrayList;

public class MemberDAO {
	
	private ArrayList<MemberVO> datas;
	
	public MemberDAO() {
		datas = new ArrayList<MemberVO>();
		datas.add(new MemberVO("admin", "1234"));
		datas.add(new MemberVO("test", "1234"));
		datas.add(new MemberVO("asd", "1234"));
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
			if (v.getMid().equals(mVO.getMid())) {
				if (v.getMpw().equals(mVO.getMpw())) {
					return v;
				}
			}
		}
		return null;
	}
	
	public ArrayList<MemberVO> selectAll(MemberVO mVO) {
		return null;
	}
}
