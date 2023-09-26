package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardSetDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	static final private String SQL_SELECTALL = "SELECT * FROM BOARD ORDER BY BID DESC LIMIT 0,?";
	static final private String SQL_SELECTALL_REPLY = "SELECT * FROM REPLY WHERE BID = ?";
	
	public ArrayList<BoardSet> selectAll(BoardVO bVO, int count) {
		conn = JDBCUtil.connect();

		ArrayList<BoardSet> datas = new ArrayList<BoardSet>();

		try {
			pstmt = conn.prepareStatement(SQL_SELECTALL);
			pstmt.setInt(1, count);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				System.out.println("dao 보드 while");
				BoardSet bs = new BoardSet();
				BoardVO data = new BoardVO();
				data.setBid(rs.getInt("BID"));
				data.setMid(rs.getString("MID"));
				data.setContent(rs.getString("CONTENT"));
				data.setFavCnt(rs.getInt("FAVCNT"));
				data.setReplyCnt(rs.getInt("REPLYCNT"));
				data.setDate(rs.getDate("DATE"));
				bs.setBoard(data);
				
				//////
				pstmt = conn.prepareStatement(SQL_SELECTALL_REPLY);
				pstmt.setInt(1, data.getBid());
				ResultSet rs2 = pstmt.executeQuery();
				
				ArrayList<ReplyVO> rdatas = new ArrayList<ReplyVO>();
				
				while (rs2.next()) {
					ReplyVO rVO = new ReplyVO();
					rVO.setRid(rs2.getInt("RID"));
					rVO.setBid(rs2.getInt("BID"));
					rVO.setMid(rs2.getString("MID"));
					rVO.setDate(rs2.getDate("DATE"));
					rVO.setrContent(rs2.getString("CONTENT"));
					rdatas.add(rVO);
				}
				//////
				
				bs.setRdatas(rdatas);
				
				datas.add(bs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.disconnect(rs, pstmt, conn);

		return datas;
	}
}
