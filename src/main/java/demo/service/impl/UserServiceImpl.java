package demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import common.util.MD5;
import common.util.web.BusinessException;
import common.util.web.ServiceError;

import demo.dao.UserDao;
import demo.entity.User;
import demo.service.UserService;

@Service
@Transactional(readOnly=false)
public class UserServiceImpl extends GenericServiceImpl implements UserService {
	@Autowired private UserDao userDao;

	@Override
	public User signup(User user) {
		if(user.getId()==null)
			throw new BusinessException(ServiceError.InvalidInput);
		User db = get(user.getId());
		if(db != null)
			throw new BusinessException(ServiceError.Duplicated);
		user.setPassword(MD5.md5(user.getPassword()));
		userDao.create(user);
		return user;
	}

	@Override
	public User get(String userId) {
		return userDao.get(User.class, userId);
	}

	@Override
	public User login(String id, String password) {
		User db = get(id);
		if(password == null)
			throw new BusinessException(ServiceError.InvalidInput, "Password is required");
		if(db == null)
			throw new BusinessException(ServiceError.NotFound, "Cannot find user");
		if(!MD5.md5(password).equals(db.getPassword()))
			throw new BusinessException(ServiceError.InvalidInput, "Wrong password");
		return db;
	}
}
