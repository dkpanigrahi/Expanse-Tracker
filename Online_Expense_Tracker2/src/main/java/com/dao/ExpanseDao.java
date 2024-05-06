package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expanse;
import com.entity.User;

public class ExpanseDao {

	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx = null;
	
	public ExpanseDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean saveExpanse(Expanse ex)
	{
		boolean f = false;
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			session.save(ex);
			
			tx.commit();
			f=true;
			
		} catch (Exception e) {
			if(tx!=null) {
				f=false;
				e.printStackTrace();
			}
		}
		
		return f;
	}
	
	
	//FETCH ALL EXPANSE OF A USER 
	public List<Expanse> getAllExpanseByUser(User user)
	{
		List<Expanse> list = new ArrayList<Expanse>();
		try {
			session=factory.openSession();
			Query q=session.createQuery("from Expanse where user=:us");
			
			q.setParameter("us", user);
			list = q.list();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	//fetch expanse by entering id
	public Expanse getExpanseById(int id)
	{
		Expanse ex = null;
		
		try {
			session=factory.openSession();
			Query q = session.createQuery("from Expanse where id=:id");
			q.setParameter("id", id);
			ex =(Expanse)q.uniqueResult();
			
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ex;
	}
	
	
	
	public boolean updateExpanse(Expanse ex)
	{
		boolean f = false;
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			session.saveOrUpdate(ex);
			
			tx.commit();
			f=true;
			
		} catch (Exception e) {
			if(tx!=null) {
				f=false;
				e.printStackTrace();
			}
		}
		
		return f;
	}
	
	
	public boolean deleteExpanse(int id)
	{
		boolean f = false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			Expanse ex = session.get(Expanse.class, id);
			session.delete(ex);
			
			tx.commit();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
}
