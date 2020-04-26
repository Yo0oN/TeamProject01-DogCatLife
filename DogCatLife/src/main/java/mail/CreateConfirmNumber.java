package mail;

import java.util.Random;

public class CreateConfirmNumber {
	
	public String confirmNumber() {
		Random random = new Random();
		String confirmNumber = "";
		for (int i = 0; i < 6; i++) {
			confirmNumber += random.nextInt(10);
		}
		return confirmNumber;
	}
}
