package com.ifat.dao;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.ifat.model.ClassQuestionnaire;

/**
 * A data access object (DAO) providing persistence and search support for
 * ClassQuestionnaire entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.ifat.model.ClassQuestionnaire
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class ClassQuestionnaireDAO {
	private static final Logger log = LoggerFactory
			.getLogger(ClassQuestionnaireDAO.class);
	// property constants
	public static final String CID = "cid";
	public static final String QID = "qid";

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(ClassQuestionnaire transientInstance) {
		log.debug("saving ClassQuestionnaire instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ClassQuestionnaire persistentInstance) {
		log.debug("deleting ClassQuestionnaire instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public void deleteByQuestionnaireId(String qid) {
		try {
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			String hqlDelete = "delete from ClassQuestionnaire where qid = :qid";
			int deletedEntities = session.createQuery(hqlDelete)
			.setString("qid", qid)
			.executeUpdate();
			tx.commit();
			session.close();
		} catch (RuntimeException re) {
			log.error("delete by property cid failed", re);
			throw re;
		}
	}

	public ClassQuestionnaire findById(java.lang.String id) {
		log.debug("getting ClassQuestionnaire instance with id: " + id);
		try {
			ClassQuestionnaire instance = (ClassQuestionnaire) getCurrentSession()
					.get("com.ifat.model.ClassQuestionnaire", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ClassQuestionnaire instance) {
		log.debug("finding ClassQuestionnaire instance by example");
		try {
			List results = getCurrentSession()
					.createCriteria("com.ifat.model.ClassQuestionnaire")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding ClassQuestionnaire instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from ClassQuestionnaire as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCid(Object cid) {
		return findByProperty(CID, cid);
	}

	public List findByQid(Object qid) {
		return findByProperty(QID, qid);
	}

	public List findAll() {
		log.debug("finding all ClassQuestionnaire instances");
		try {
			String queryString = "from ClassQuestionnaire";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ClassQuestionnaire merge(ClassQuestionnaire detachedInstance) {
		log.debug("merging ClassQuestionnaire instance");
		try {
			ClassQuestionnaire result = (ClassQuestionnaire) getCurrentSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ClassQuestionnaire instance) {
		log.debug("attaching dirty ClassQuestionnaire instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ClassQuestionnaire instance) {
		log.debug("attaching clean ClassQuestionnaire instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ClassQuestionnaireDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ClassQuestionnaireDAO) ctx.getBean("ClassQuestionnaireDAO");
	}
}