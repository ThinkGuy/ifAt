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
	
	/**
	 * 管理员登录处理。
	 * @param admin
	 * @return
	 */
	public String dealWithLogin(Admin admin) {
		if (adminDAO.findByName(admin.getName()).size() == 0) {
			return "用户名不存在,请重新登录";
		} else if (adminDAO.findByPassword(admin.getPassword()).size() == 0) {
			return "密码错误,请重新登录";
		}
		
		return "adminLoginSuccess";
	}
	
}
