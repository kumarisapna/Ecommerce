package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.entity.Category;
import com.entity.Product;
import com.entity.User;



@Component
public class EcommerceDao {
	@Autowired
	HibernateTemplate hibernateTemplate;

	@Transactional
	public void createUser(User user){
		this.hibernateTemplate.saveOrUpdate(user);
		
	}
	//save category
	@Transactional
	public void createCategory(Category category){
		this.hibernateTemplate.saveOrUpdate(category);
		
	}
	
	
		 
	
	//get user by email and password
		
	@SuppressWarnings("unchecked")
    public User getUserDetailsByEmailAndPassword(String userEmail,String userPassword){
        DetachedCriteria detachedCriteria =  DetachedCriteria.forClass(User.class);
        detachedCriteria.add(Restrictions.eq("userEmail", userEmail));
        detachedCriteria.add(Restrictions.eq("userPassword", userPassword));
        List<User> findByCriteria = (List<User>) hibernateTemplate.findByCriteria(detachedCriteria);
        if(findByCriteria !=null && findByCriteria.size()>0)
        {
        return findByCriteria.get(0);
        }
        else
            return null;
    }
		
	
	//get all Categories
	
		public List<Category> getCategory(){
			List<Category> categories = this.hibernateTemplate.loadAll(Category.class);
			return categories;
			
			}
		
		// get single category
		
		public Category getSingleCategory(int categoryId){
			Category cat =null;
			
			cat =  this.hibernateTemplate.get(Category.class, categoryId);
				
			return cat;
			
			
		}
		// get all users
		
		
		public List<User> getUsers(){
			List<User> users = this.hibernateTemplate.loadAll(User.class);
			return users;
			
			}
		}

