package com.jnmd.ssh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.FlushMode;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jnmd.ssh.domain.Book;
import com.jnmd.ssh.exception.BookException;

@Repository//对DAO组件的标注
@Transactional
public class BookDAO {
	@Resource
	private HibernateTemplate hibernateTemplate;
	
	@SuppressWarnings("unchecked")
	public void saveBook(final Book b) throws BookException{
		hibernateTemplate.execute(new HibernateCallback(){
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				
				session.save(b);
				return null;
			}
			
		});
	}
	
	@SuppressWarnings("unchecked")
	public void testRollback(final Object object)  throws BookException{
		hibernateTemplate.execute(new HibernateCallback(){

			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				session.save(object);
				return null;
			}
			
		});
	}
	
	@SuppressWarnings("unchecked")
	public void updateBook(final Book b) throws BookException{
		hibernateTemplate.execute(new HibernateCallback(){

			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String hql = "update t_book set name = ?,sort=?,author=?,discount=?,price=?,count=?,account=? where id = ?";
				Query query = session.createSQLQuery(hql);
				query.setString(0, b.getName());
				query.setString(1, b.getSort());
				query.setString(2, b.getAuthor());
				query.setInteger(3,b.getDiscount());
				query.setDouble(4,b.getPrice());
				query.setInteger(5,b.getCount());
				query.setString(6, b.getAccount());
				query.executeUpdate();
				
				return null;
			}
			
		});
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void delBook(final Book book){
		hibernateTemplate.execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				session.setFlushMode(FlushMode.AUTO);
				session.delete(book);
				return null;
			}
		});
	}
	public Book getBook(int id){
		return hibernateTemplate.get(Book.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Book> findBook(){
		return hibernateTemplate.execute(new HibernateCallback(){

			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String hql = "from Book";
				Query query = session.createQuery(hql);
				List list = query.list();
				return list;
			}
			
		});
	}

	@SuppressWarnings("unchecked")
	public List<Book> limit(final int page){
		return hibernateTemplate.execute(new HibernateCallback(){

			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String hql = "from Book";
				Query query = session.createQuery(hql);
				query.setFirstResult((page-1)*5);
				query.setMaxResults(5);
				List list = query.list();
				return list;
			}
			
		});
	}
	
}
