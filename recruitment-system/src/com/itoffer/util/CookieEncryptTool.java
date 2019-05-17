package com.itoffer.util;

import java.io.UnsupportedEncodingException;

import org.apache.tomcat.util.codec.binary.Base64;

/**
 * 用Base64加解密保存在Cookie中的信息
 * 按照RFC2045的定义，Base64被定义为：Base64内容传送编码被设计用来把任意序列的8位字节描述为一种不易被人直接识别的形式。
 * 
 * @author TianYanan
 *
 */
public class CookieEncryptTool {

	/**
	 * Base64加密
	 * 
	 * @param cleartext
	 * @return
	 */
	public static String encodeBase64(String cleartext) {

		try {
			cleartext = new String(Base64.encodeBase64(cleartext
					.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return cleartext;
	}

	/**
	 * Base64解密
	 * 
	 * @param ciphertext
	 * @return
	 */
	public static String decodeBase64(String ciphertext) {
		try {
			ciphertext = new String(Base64.decodeBase64(ciphertext.getBytes()),
					"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return ciphertext;
	}

	public static void main(String[] args) throws UnsupportedEncodingException {
		String str = "测试abc123";
		String encode = CookieEncryptTool.encodeBase64(str);
		System.out.println(encode);

		String decode = CookieEncryptTool.decodeBase64(encode);
		System.out.println(decode);
	}
}
