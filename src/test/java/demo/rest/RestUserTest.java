package demo.rest;

import org.junit.Assert;
import org.junit.Test;

import common.util.web.SpringResourceTester;

import demo.entity.User;

public class RestUserTest extends SpringResourceTester {
	@Test
	public void testSignupAndGet() {
		User user = new User();
		user.setFirstName(getCurrentTimeMillisString());
		user.setLastName(getCurrentTimeMillisString());
		User saved = getBuilder("/ws/user/signup").post(User.class, user);
		Assert.assertNotNull(saved.getId());
		User db = getBuilder("/ws/user", "userId", saved.getId()).get(User.class);
		Assert.assertEquals(user.getFirstName(), db.getFirstName());
		Assert.assertEquals(user.getLastName(), db.getLastName());
	}
}
