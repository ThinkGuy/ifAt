package com.ifat.action;

import com.ifat.model.Admin;
import com.ifat.service.AdminService;
import com.opensymphony.xwork2.ModelDriven;

public class AdminBaseOperationAction extends SuperAction implements
		ModelDriven<Admin> {

	private static final long serialVersionUID = 1L;
	private Admin admin;
	private AdminService adminService;

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@Override
	public Admin getModel() {

		if (admin == null) {
			admin = new Admin();
		}
		return null;
	}

}
