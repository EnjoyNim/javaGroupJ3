package common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecurityUtil {

	public String encryptSHA256(String str) {
		String sha = "";
		try {

			MessageDigest sh = MessageDigest.getInstance("SHA-256");

			/*
			 * // 이렇게 솔트를 추가해줘야 보안이 강화된다. 
			 * int salt = (int)(Math.random()*100) + 1; 
			 * // 1에서 100 사이 랜덤 정수 
			 * str += salt;
			 */

			sh.update(str.getBytes());

			byte byteData[] = sh.digest();

			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}

			sha = sb.toString();

		} catch (NoSuchAlgorithmException e) {
			System.out.println("Encrypt Error - NoSuchAlgorithmException");
			sha = null;
		}
		return sha;
	}
}
