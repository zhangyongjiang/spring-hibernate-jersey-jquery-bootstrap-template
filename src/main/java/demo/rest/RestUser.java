package demo.rest;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import common.util.web.GenericResponse;
import common.util.web.JerseyBaseResource;

import demo.entity.User;
import demo.service.UserService;

@Path("/ws/user")
@Component
@Produces({ "text/html;charset=utf-8", "text/xml;charset=utf-8", "application/json" })
public class RestUser extends JerseyBaseResource {
	@Autowired private UserService userService;
	
	@Path("/signup")
	@POST
	public User signup(User user) {
		User db = userService.signup(user);
		return db;
	}
	
	@Path("/login")
	@POST
	public User login(User user) {
		User db = userService.login(user.getId(), user.getPassword());
		setUserIdCookie(db.getId());
		return db;
	}
	
	@Path("/logout")
	@POST
	public GenericResponse logout() {
		removeUserCookie();
		return new GenericResponse();
	}
	
	@GET
	public User get(@QueryParam("userId") String userId) {
		User db = userService.get(userId);
		return db;
	}
	
	@GET
	@Path("/{userId}")
	public User getUser(@PathParam("userId") String userId) {
		return get(userId);
	}
	
	@GET
	@Path("/me")
	public User me() {
		String meId = getRequesterUserId();
		if(meId != null)
			return getUser(meId);
		else
			return new User();
	}
}
