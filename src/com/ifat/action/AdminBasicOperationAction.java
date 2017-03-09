package com.ifat.action;

import com.ifat.model.Admin;
import com.ifat.service.AdminService;
import com.opensymphony.xwork2.ModelDriven;

public class AdminBasicOperationAction extends SuperAction implements
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
	
	/**
	 * 管理员登录处理。
	 * @return
	 */
	public String login() {
		if ("adminLoginSuccess".equals(adminService.dealWithLogin(admin))) {
			return "adminLoginSuccess";
		}
		
		request.setAttribute("info", adminService.dealWithLogin(admin));
		return "adminLoginFailed";
	}

	@Override
	public Admin getModel() {

		if (admin == null) {
			admin = new Admin();
		}
		return admin;
	}

}
