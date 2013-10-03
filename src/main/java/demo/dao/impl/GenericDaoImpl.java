package demo.dao.impl;

import java.io.Serializable;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import demo.dao.GenericDao;

public class GenericDaoImpl implements GenericDao {
	
    protected HibernateTemplate hibernateTemplate;

	@Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        hibernateTemplate = new HibernateTemplate(sessionFactory);
    }

	@Override
	public <T> T get(Class<T> cls, Serializable id) {
		return hibernateTemplate.get(cls, id);
	}

	@Override
	public <T> void create(T entity) {
		hibernateTemplate.save(entity);
	}
	
}
