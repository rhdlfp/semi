package chacamList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class ChacamListDAO {

	private ResultSet rs;
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/C:/STUDY/jwbookdb";
	
	
	public Connection open() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"sa","sa");
		} catch (Exception e) {
			e.printStackTrace();
		}
	return conn;
	}
	

	public String getDate() {
		Connection conn = open();
		String sql = "SELECT NOW()";  //현재 시간을 가져오는 데이터
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement(sql);
	    	rs = pstmt.executeQuery();
	    	if(rs.next()) {
	    		return rs.getString(1);
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return ""; //데이터베이스 오류
	    	
	}
	

	public void addChacam(ChacamList n) throws Exception {
		Connection conn = open();
		
		String sql = "insert into CHACAMINFORMATION(infotitle, infoaddress, img1, img2, img3, img4, img5, content, userid, infoDATE) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setString(1, n.getInfotitle());
			pstmt.setString(2, n.getInfoaddress());
			pstmt.setString(3, n.getImg1());
			pstmt.setString(4, n.getImg2());
			pstmt.setString(5, n.getImg3());
			pstmt.setString(6, n.getImg4());
			pstmt.setString(7, n.getImg5());
			pstmt.setString(8, n.getContent());
			pstmt.setString(9, n.getUserID());
			pstmt.setString(10, getDate());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pstmt.close();
			pstmt.close();
		}
	}
	
	
	
	public ArrayList<ChacamList> getList(int pageNumber) throws Exception {
	    Connection conn = open();
	    ArrayList<ChacamList> chacamList = new ArrayList<>();

	    int pageSize = 10; // 한 페이지에 표시될 게시글 수
	    int startIdx = (pageNumber - 1) * pageSize; // 페이지의 시작 인덱스

	    String sql = "select infoid, infotitle, infoaddress, userID, infoDate, img1, likeCount from CHACAMINFORMATION ORDER BY infoid DESC LIMIT ?, ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, startIdx);
	    pstmt.setInt(2, pageSize);
	    ResultSet rs = pstmt.executeQuery();

	    try (conn; pstmt; rs) {
	        while (rs.next()) {
	            ChacamList n = new ChacamList();
	            n.setInfoid(rs.getInt("infoid"));
	            n.setImg1(rs.getString("img1"));
	            n.setInfotitle(rs.getString("infotitle"));
	            n.setInfoaddress(rs.getString("infoaddress"));
	            n.setUserID(rs.getString("userID"));
	            n.setInfoDate(rs.getString("infoDate"));
	            n.setLikeCount(rs.getInt("likeCount"));

	            chacamList.add(n);
	        }
	    }
	    return chacamList;
	}
	
	
	public ArrayList<ChacamList> getAll() throws Exception {
		Connection conn = open();
		ArrayList<ChacamList> newsList = new ArrayList<>();
		
		String sql = "select infoid, infotitle, infoaddress, userid, infoDate, img1, likeCount from CHACAMINFORMATION";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try (conn; pstmt; rs) {
			
			while(rs.next()) {
				ChacamList n = new ChacamList();
				n.setInfoid(rs.getInt("infoid"));
				n.setImg1(rs.getString("img1"));
				n.setInfotitle(rs.getString("infotitle"));
				n.setInfoaddress(rs.getString("infoaddress"));
				n.setUserID(rs.getString("userID"));
				n.setInfoDate(rs.getString("infoDate"));
				n.setLikeCount(rs.getInt("likeCount"));
				
				newsList.add(n);
			}
		return newsList;
	}
	}
	
	
	public int update(int infoid, String infotitle, String infoaddress, String content) {
		Connection conn = open();
		String sql = "UPDATE CHACAMINFORMATION SET infotitle = ?, infoaddress = ?, content = ? WHERE infoid = ?"; 
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, infotitle); //다음 게시판의 번호
	    	pstmt.setString(2, infoaddress);
	    	pstmt.setString(3, content);
	    	pstmt.setInt(4, infoid);
	    	return pstmt.executeUpdate();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return -1; //데이터베이스 오류
	}

	
	public int getNext() {
		Connection conn = open();
		String sql = "SELECT infoid FROM CHACAMINFORMATION ORDER BY infoid DESC";  
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement(sql);
	    	rs = pstmt.executeQuery();
	    	if(rs.next()) {
	    		return rs.getInt(1) + 1; //게시판의 번호를 새겨줌 순서대로
	    	}
	    	return 1; //첫 번째 게시물인 경우
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return -1; //데이터베이스 오류
	    	
	}
	
	
	public boolean nextPage(int pageNumber) {  //게시물이 10개씩 나오면 다음페이지에서 작성을 할 수 있는 함수
		Connection conn = open();
		String sql = "SELECT * FROM CHACAMINFORMATION WHERE infoid < ?";
		
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement(sql);
	    	pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
	    	rs = pstmt.executeQuery();
	    	if(rs.next()) {
	    		return true;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	  return false;
		
	}

	
	public ChacamList getChacam(int infoid) throws SQLException {
		Connection conn = open();
		
		ChacamList n = new ChacamList();
		String sql = "select infoid, infotitle, infoaddress, img1, img2, img3, img4, img5, content, userID, likeCount from CHACAMINFORMATION where infoid=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, infoid);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		try (conn; pstmt; rs) {
				n.setInfoid(rs.getInt("infoid"));
				n.setInfotitle(rs.getString("infotitle"));
				n.setInfoaddress(rs.getString("infoaddress"));
				n.setImg1(rs.getString("img1"));
				n.setImg2(rs.getString("img2"));
				n.setImg3(rs.getString("img3"));
				n.setImg4(rs.getString("img4"));
				n.setImg5(rs.getString("img5"));
				n.setContent(rs.getString("content"));
				n.setUserID(rs.getString("userID"));
				n.setLikeCount(rs.getInt("likeCount"));
				pstmt.executeQuery();
		return n;
	}
}
	
	
	
	public void delChacam(int infoid) throws SQLException {
		Connection conn = open();
		
		String sql = "delete from CHACAMINFORMATION where infoid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setInt(1, infoid);
			
			if(pstmt.executeUpdate() == 0) {
				throw new SQLException("DB에러");
			}
		}
	}
	
	
    public int getTotalPosts() {
    	Connection conn = open();
    	String sql = "SELECT COUNT(*) FROM CHACAMINFORMATION";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); // 전체 게시글 수 반환
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0; // 데이터베이스 오류 등의 경우 0을 반환
    }

    
	 public int getLikeCount(int infoID) {
		 	Connection conn = open();
		    String sql = "SELECT likeCount FROM CHACAMINFORMATION WHERE infoID = ?";
		    try {
		        PreparedStatement pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, infoID);
		        ResultSet rs = pstmt.executeQuery();
		        if (rs.next()) {
		            return rs.getInt("likeCount");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return -1; // 데이터베이스 오류
		}
    
	 
	 public void incrementLikeCount(int infoID, String userID) {
		    Connection conn = open();
		    String sql = "UPDATE CHACAMINFORMATION SET likeCount = likeCount + 1 WHERE infoID = ?";
		    String insertLikedInfoSQL = "INSERT INTO LIKED_INFOS (infoID, userID) VALUES (?, ?)";
		    try (conn) {
		        conn.setAutoCommit(false); // 트랜잭션 시작
		        // 좋아요 카운트 업데이트
		        PreparedStatement updateStmt = conn.prepareStatement(sql);
		        updateStmt.setInt(1, infoID);
		        updateStmt.executeUpdate();
		        
		        // LIKED_INFOS 테이블에 데이터 추가
		        PreparedStatement insertLikedInfoStmt = conn.prepareStatement(insertLikedInfoSQL);
		        insertLikedInfoStmt.setInt(1, infoID);
		        insertLikedInfoStmt.setString(2, userID);
		        insertLikedInfoStmt.executeUpdate();

		        conn.commit(); // 커밋
		    } catch (Exception e) {
		        e.printStackTrace();
		        if (conn != null) {
		            try {
		                conn.rollback(); // 롤백
		            } catch (SQLException ex) {
		                ex.printStackTrace();
		            }
		        }
		    }
		}
	 
	 
	    public boolean checkAlreadyLiked(int infoID, String userID) {
	        Connection conn = open();
	        String sql = "SELECT * FROM LIKED_INFOS WHERE infoID = ? AND userID = ?";
	        try (conn) {
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, infoID);
	            pstmt.setString(2, userID);
	            ResultSet rs = pstmt.executeQuery();
	            return rs.next(); // 해당 조건의 레코드가 존재하면 이미 좋아요를 누른 것
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false; // 데이터베이스 오류 등의 경우 false 반환
	    }
	    
	    
	        public void incrementLikeCount(int infoid) {
	            Connection conn = open();
	            String sql = "UPDATE CHACAMINFORMATION SET likeCount = likeCount + 1 WHERE infoid = ?";
	            try (conn) {
	                PreparedStatement pstmt = conn.prepareStatement(sql);
	                pstmt.setInt(1, infoid);
	                pstmt.executeUpdate();

	                // 좋아요 카운트 증가 후 해당 게시물의 ChacamList 객체에도 좋아요 카운트 증가 반영
	                ChacamList chacam = getChacam(infoid);
	                if (chacam != null) {
	                    chacam.incrementLikeCount();
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
}
