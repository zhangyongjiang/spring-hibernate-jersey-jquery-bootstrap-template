package demo.service;

import demo.entity.User;

public interface UserService extends GenericService {

	User signup(User user);

	User get(String userId);

	User login(String id, String password);

}
