package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BbsDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String JDBC_DRIVER = "org.h2.Driver";
			String JDBC_URL = "jdbc:h2:tcp://localhost/C:/STUDY/jwbookdb";
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "sa", "sa");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
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
	
	public int getNext() {
		String sql = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";  
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

	
	public int write(String bbsTitle, String userID, String bbsContent) {
		String sql = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)"; 
	    try {
	    	 PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, getNext()); // 다음 게시판의 번호
	         pstmt.setString(2, bbsTitle);
	         pstmt.setString(3, userID);
	         pstmt.setString(4, getDate());
	         pstmt.setString(5, bbsContent);
	         pstmt.setInt(6, 1); // 초기 bbsAvailable 값
	         //pstmt.setInt(7, 0); // 초기 likeCount 값
	         //pstmt.setInt(8, 0); // 초기 likes 값
	         return pstmt.executeUpdate();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return -1; //데이터베이스 오류
	}
	
	
	public ArrayList<Bbs> getList(int pageNumber) {
	    String sql = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
	    ArrayList<Bbs> list = new ArrayList<Bbs>();
	    try {
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            Bbs bbs = new Bbs();
	            bbs.setBbsID(rs.getInt("bbsID"));
	            bbs.setBbsTitle(rs.getString("bbsTitle"));
	            bbs.setUserID(rs.getString("userID"));
	            bbs.setBbsDate(rs.getString("bbsDate"));
	            bbs.setBbsContent(rs.getString("bbsContent"));
	            bbs.setBbsAvailable(rs.getInt("bbsAvailable"));
	            list.add(bbs);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	
	public boolean nextPage(int pageNumber) {  //게시물이 10개씩 나오면 다음페이지에서 작성을 할 수 있는 함수
		String sql = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
		
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
	
	public Bbs getBbs(int bbsID) {
		String sql = "SELECT * FROM BBS WHERE bbsID = ?";
		
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement(sql);
	    	pstmt.setInt(1, bbsID);
	    	rs = pstmt.executeQuery();
	    	if(rs.next()) {
	    		Bbs bbs = new Bbs();
	    		bbs.setBbsID(rs.getInt(1));
	    		bbs.setBbsTitle(rs.getString(2));
	    		bbs.setUserID(rs.getString(3));
	    		bbs.setBbsDate(rs.getString(4));
	    		bbs.setBbsContent(rs.getString(5));
	    		bbs.setBbsAvailable(rs.getInt(6));
	    		return bbs;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	  return null;
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String sql = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?"; 
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, bbsTitle); //다음 게시판의 번호
	    	pstmt.setString(2, bbsContent);
	    	pstmt.setInt(3, bbsID);
	    	return pstmt.executeUpdate();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return -1; //데이터베이스 오류
	}
	
	
	public int delete(int bbsID) {
		String sql = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?"; 
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement(sql);
	    	pstmt.setInt(1, bbsID);
	    	return pstmt.executeUpdate();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return -1; //데이터베이스 오류
	}
	
	
    public int getTotalPosts() {
        String sql = "SELECT COUNT(*) FROM BBS WHERE bbsAvailable = 1";
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

	 public int incrementLikeCount(int bbsID) {
	        String sql = "UPDATE BBS SET likeCount = likeCount + 1 WHERE bbsID = ?";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, bbsID);
	            pstmt.executeUpdate();
	            
	            // 좋아요 수 조회
	            sql = "SELECT likeCount FROM BBS WHERE bbsID = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, bbsID);
	            ResultSet rs = pstmt.executeQuery();
	            if (rs.next()) {
	                return rs.getInt("likeCount");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return -1; // 데이터베이스 오류
	    }
	 
	 public int getLikeCount(int bbsID) {
		    String sql = "SELECT likeCount FROM BBS WHERE bbsID = ?";
		    try {
		        PreparedStatement pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, bbsID);
		        ResultSet rs = pstmt.executeQuery();
		        if (rs.next()) {
		            return rs.getInt("likeCount");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return -1; // 데이터베이스 오류
		}

	public PreparedStatement getPstmt() {
		return pstmt;
	}

	public void setPstmt(PreparedStatement pstmt) {
		this.pstmt = pstmt;
	}
	  public void increaseLikeCount(int bbsID) {
	        String sql = "UPDATE BBS SET likeCount = likeCount + 1 WHERE bbsID = ?";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, bbsID);
	            pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	  }
	  public void close() {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	  
	  public int addComment(int bbsID, Comment comment) {
		    String SQL = "INSERT INTO comment(bbsID, userID, nickname, commentDate, commentContent) VALUES(?, ?, ?, ?, ?)";
		    try {
		        pstmt = conn.prepareStatement(SQL);
		        pstmt.setInt(1, bbsID);
		        pstmt.setString(2, comment.getUserID());
		        pstmt.setString(3, comment.getNickname()); // 변경된 부분: 닉네임 추가
		        pstmt.setString(4, comment.getCommentDate());
		        pstmt.setString(5, comment.getCommentContent());
		        return pstmt.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return -1; // 댓글 추가 실패
		}

	    
	    // 특정 게시물의 모든 댓글 가져오기
	  public List<Comment> getComments(int bbsID) {
		    String SQL = "SELECT * FROM comment WHERE bbsID=?";
		    List<Comment> comments = new ArrayList<>();
		    try {
		        pstmt = conn.prepareStatement(SQL);
		        pstmt.setInt(1, bbsID);
		        rs = pstmt.executeQuery();
		        while (rs.next()) {
		            Comment comment = new Comment();
		            comment.setCommentID(rs.getInt("commentID"));
		            comment.setUserID(rs.getString("userID"));
		            comment.setCommentDate(rs.getString("commentDate"));
		            comment.setCommentContent(rs.getString("commentContent"));
		            comments.add(comment);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return comments;
		}
	  
	  public int deleteComment(int commentID, String userID) {
		    String sql = "DELETE FROM comment WHERE commentID = ? AND userID = ?";
		    try {
		        PreparedStatement pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, commentID);
		        pstmt.setString(2, userID);
		        return pstmt.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return -1; // 데이터베이스 오류
		}

	// BbsDAO 클래스에 추가할 메서드
	  public String getCommentUserID(int commentID) {
	      String sql = "SELECT userID FROM comment WHERE commentID = ?";
	      try {
	          PreparedStatement pstmt = conn.prepareStatement(sql);
	          pstmt.setInt(1, commentID);
	          rs = pstmt.executeQuery();

	          if (rs.next()) {
	              return rs.getString("userID");
	          }
	      } catch (SQLException e) {
	          e.printStackTrace();
	      }
	      return null;
	  }
	  
	  public Comment getComment(int commentID) {
	        String sql = "SELECT * FROM comment WHERE commentID = ?";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, commentID);
	            ResultSet rs = pstmt.executeQuery();
	            if (rs.next()) {
	                Comment comment = new Comment();
	                comment.setCommentID(rs.getInt("commentID"));
	                comment.setUserID(rs.getString("userID"));
	                comment.setNickname(rs.getString("nickname"));
	                comment.setCommentDate(rs.getString("commentDate"));
	                comment.setCommentContent(rs.getString("commentContent"));
	                return comment;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	
	  public ArrayList<Bbs> searchPosts(String searchType, String searchKeyword) {
		    ArrayList<Bbs> searchResults = new ArrayList<>();
		    
		    try {
		        String query;
		        if (searchType.equals("title")) {
		            query = "SELECT * FROM BBS WHERE bbsTitle LIKE ? AND bbsAvailable = 1 ORDER BY bbsID DESC";
		        } else if (searchType.equals("author")) {
		            query = "SELECT * FROM BBS WHERE userID LIKE ? AND bbsAvailable = 1 ORDER BY bbsID DESC";
		        } else {
		            // Handle invalid searchType
		            return searchResults;
		        }
		        
		        pstmt = conn.prepareStatement(query);
		        pstmt.setString(1, "%" + searchKeyword + "%");
		        rs = pstmt.executeQuery();
		        
		        while (rs.next()) {
		            Bbs bbs = new Bbs();
		            bbs.setBbsID(rs.getInt("bbsID"));
		            bbs.setBbsTitle(rs.getString("bbsTitle"));
		            bbs.setUserID(rs.getString("userID"));
		            bbs.setBbsDate(rs.getString("bbsDate"));
		            bbs.setBbsContent(rs.getString("bbsContent"));
		            bbs.setBbsAvailable(rs.getInt("bbsAvailable"));
		            searchResults.add(bbs);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        // Close resources
		        close();
		    }
		    
		    return searchResults;
		}
	  
	}
    




















