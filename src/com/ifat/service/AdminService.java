package com.ifat.service;

import com.ifat.dao.AdminDAO;
import com.ifat.model.Admin;

/**
 * AdminService.
 * @author lxw
 *
 */
public class AdminService {

	private AdminDAO adminDAO;

	/**
	 * @return the adminDAO
	 */
	public AdminDAO getAdminDAO() {
		return adminDAO;
	}

	/**
	 * @param adminDAO the adminDAO to set
	 */
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	
	public boolean isLoginSuccess(Admin admin) {
		return true;
	}
	
}
