package user;

public class User {
	
	private String userID;
	private int wishID;
	private String userPassword;
	private String userName;
	private String nickName;
	private String userGender;
	private String userEmail;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public int getWishID() {
		return wishID;
	}
	public void setWishID(int wishID) {
		this.wishID = wishID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
    public static class UserInfo {
        private String userName;
        private String userEmail;
        private String nickName;

        public UserInfo(String userName, String userEmail, String nickName) {
            this.userName = userName;
            this.userEmail = userEmail;
            this.nickName = nickName;
        }

        public String getUserName() {
            return userName;
        }

        public String getUserEmail() {
            return userEmail;
        }
        
        public String getNickName() {
            return nickName;
        }
    }
}
