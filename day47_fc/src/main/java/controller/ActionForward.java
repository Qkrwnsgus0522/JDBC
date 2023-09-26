package controller;

public class ActionForward {
	private boolean redirect; // redirect인지 아닌지
	private String path; // 이동할 경로
	
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
