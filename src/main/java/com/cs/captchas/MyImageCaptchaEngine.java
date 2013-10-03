package com.cs.captchas;

import com.octo.captcha.component.image.backgroundgenerator.BackgroundGenerator;
import com.octo.captcha.component.image.backgroundgenerator.UniColorBackgroundGenerator;
import com.octo.captcha.component.image.color.RandomRangeColorGenerator;
import com.octo.captcha.component.image.fontgenerator.FontGenerator;
import com.octo.captcha.component.image.fontgenerator.RandomFontGenerator;
import com.octo.captcha.component.image.textpaster.RandomTextPaster;
import com.octo.captcha.component.image.textpaster.TextPaster;
import com.octo.captcha.component.image.wordtoimage.ComposedWordToImage;
import com.octo.captcha.component.image.wordtoimage.WordToImage;
import com.octo.captcha.component.word.wordgenerator.RandomWordGenerator;
import com.octo.captcha.component.word.wordgenerator.WordGenerator;
import com.octo.captcha.engine.image.ListImageCaptchaEngine;
import com.octo.captcha.image.gimpy.GimpyFactory;

import java.awt.*;

public class MyImageCaptchaEngine extends ListImageCaptchaEngine {
	@Override
	protected void buildInitialFactories() {
		WordGenerator wgen = new RandomWordGenerator(
				"ABCDEFGHIJKLMNOPQRSTUVWXYZ");
		RandomRangeColorGenerator cgen = new RandomRangeColorGenerator(
				new int[] { 0, 100 }, new int[] { 0, 100 },
				new int[] { 0, 100 });
		TextPaster textPaster = new RandomTextPaster(new Integer(5),
				new Integer(5), cgen, true);

		BackgroundGenerator backgroundGenerator = new UniColorBackgroundGenerator(
				new Integer(200), new Integer(60));

		Font[] fontsList = new Font[] { new Font("Arial", 0, 10),
				new Font("Tahoma", 0, 10), new Font("Verdana", 0, 10), };

		FontGenerator fontGenerator = new RandomFontGenerator(new Integer(20),
				new Integer(35), fontsList);

		WordToImage wordToImage = new ComposedWordToImage(fontGenerator,
				backgroundGenerator, textPaster);
		this.addFactory(new GimpyFactory(wgen, wordToImage));
	}
}
