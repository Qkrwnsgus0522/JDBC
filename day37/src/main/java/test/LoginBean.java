package test;

public class LoginBean {
	private String mid;
	private String mpw;
	private String result;
	private boolean flag;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	
	public void check() {
		if (this.mid == null || this.mpw == null) {
			this.mid = "";
			this.mpw = "";
		}
		if (this.mid.equals("admin") && this.mpw.equals("1234")) {
			this.result = "관리자님 환영합니다! :D";
			this.flag = true;
		}
		else {
			this.result = "다시 입력하세요.";
			this.flag = false;
		}
	}
}
