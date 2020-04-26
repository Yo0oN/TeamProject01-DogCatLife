package mail;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

// Authenticator를 상속받은 이 클래스가 있어야 인증이 가능함
public class MyAuth extends Authenticator {
	private String userName;
	private String password;
	public MyAuth(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		// TODO Auto-generated method stub
		return new PasswordAuthentication(userName, password);
	}
	
}
