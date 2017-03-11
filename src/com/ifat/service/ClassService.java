package com.ifat.service;

import com.ifat.dao.ClassDAO;

public class ClassService {

	private ClassDAO classDAO;

	/**
	 * @return the classDAO
	 */
	public ClassDAO getClassDAO() {
		return classDAO;
	}

	/**
	 * @param classDAO the classDAO to set
	 */
	public void setClassDAO(ClassDAO classDAO) {
		this.classDAO = classDAO;
	}

}
