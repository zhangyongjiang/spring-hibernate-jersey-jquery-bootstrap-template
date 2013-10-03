package demo.rest;

import java.util.UUID;

import junit.framework.Assert;

import org.junit.Test;

import common.util.web.SpringResourceTester;

import demo.entity.User;

public class RestUserTest extends SpringResourceTester {
	@Test
	public void testRestUser() {
		User user = new User();
		user.setFirstName(UUID.randomUUID().toString());
		user.setLastName(UUID.randomUUID().toString());
		user.setId(UUID.randomUUID().toString());
		user.setPassword(UUID.randomUUID().toString());
		User created = getBuilder("/ws/user/signup").post(User.class, user);
		
		User login = new User();
		login.setId(user.getId());
		login.setPassword(user.getPassword());
		getBuilder("/ws/user/login").post(login);
		
		User me = getBuilder("/ws/user/me").get(User.class);
		Assert.assertEquals(user.getId(), me.getId());
		Assert.assertEquals(user.getFirstName(), me.getFirstName());
		Assert.assertEquals(user.getLastName(), me.getLastName());
	}
}
