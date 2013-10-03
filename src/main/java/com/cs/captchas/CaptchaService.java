package com.cs.captchas;

import com.octo.captcha.service.captchastore.FastHashMapCaptchaStore;
import com.octo.captcha.service.image.ImageCaptchaService;
import com.octo.captcha.service.image.DefaultManageableImageCaptchaService;

public class CaptchaService {
	// a singleton class
	private static ImageCaptchaService instance = new DefaultManageableImageCaptchaService(
			new FastHashMapCaptchaStore(), new MyImageCaptchaEngine(), 180,
			100000, 75000);

	public static ImageCaptchaService getInstance() {
		return instance;
	}
}
