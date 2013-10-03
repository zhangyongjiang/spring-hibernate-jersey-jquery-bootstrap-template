package demo.dao;

import java.io.Serializable;

public interface GenericDao {
	<T> void create(T entity);
	<T> T get(Class<T> cls, Serializable id);
}
