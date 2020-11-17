/**
 * 
 */
package com.util;

import java.util.Base64;



/**
 * @author sapna
 *
 */
public class Utilities {
	
	
	public static String getImageString(byte[] imageBytes) {

		String base64Image = null;
		if (imageBytes != null) {
			base64Image = Base64.getEncoder().encodeToString(imageBytes);
		}
		return base64Image;
	}
	
	
	
}
