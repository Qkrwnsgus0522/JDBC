package test;

import java.util.ArrayList;

public class MemberDAO {
	
	ArrayList<MemberVO> datas;
	
	public MemberDAO() {
		datas = new ArrayList<MemberVO>();
		datas.add(new MemberVO("admin", "1234"));
		datas.add(new MemberVO("timo", "1234"));
		datas.add(new MemberVO("kim", "1234"));
	}
	
	public boolean insert(MemberVO vo) {
		for (MemberVO v : datas) {
			if (vo.getMid().equals(v.getMid())) {
				return false;
			}
		}
		datas.add(vo);
		return true;
	}
	
	public boolean delete(MemberVO vo) {
		return false;
	}
	
	public boolean update(MemberVO vo) {
		return false;
	}
	
	public MemberVO selectOne(MemberVO vo) {
		for (MemberVO v : datas) {
			if (vo.getMid().equals(v.getMid()) && v.getMpw().equals(v.getMpw())) {
				return v;
			}
		}
		return null;
	}
	
	public ArrayList<MemberVO> selectAll(MemberVO vo) {
		return datas;
	}
}
