package com.ifat.action;

import com.ifat.model.Admin;
import com.ifat.model.Class;
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
	 * 
	 * @return
	 */
	public String login() {
		if ("loginSuccess".equals(adminService.dealWithLogin(admin))) {
			admin = (Admin) adminService.getAdminDAO()
					.findByName(admin.getName()).get(0);
			session.setAttribute("adminId", admin.getId());
			session.setAttribute("adminName", admin.getName());
			return "loginSuccess";
		}

		request.setAttribute("info", adminService.dealWithLogin(admin));
		return "loginFailed";
	}

	/**
	 * 修改管理员密码。
	 * 
	 * @return
	 */
	public String changePassword() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}

		admin.setId(session.getAttribute("adminId").toString());

		String chPassword = request.getParameter("chPassword");
		String confirmPassword = request.getParameter("confirmPassword");

		if ("changePasswordSuccess".equals(adminService.dealWithChangePassword(
				admin, chPassword, confirmPassword))) {
			return "changePasswordSuccess";
		}

		request.setAttribute("info", adminService.dealWithChangePassword(admin,
				chPassword, confirmPassword));

		return "changePasswordFailed";
	}

	/**
	 * 管理员注销。
	 * 
	 * @return
	 */
	public String logout() {
		if (session.getAttribute("adminId") != null) {
			session.setAttribute("adminId", null);
			session.setAttribute("adminName", null);
		}

		return "logout";
	}

	/**
	 * 添加班级。
	 * 
	 * @return
	 */
	public String addClass() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}

		Class c = new Class();
		c.setName(request.getParameter("className"));

		if ("addClassSuccess".equals(adminService.dealWithAddClass(c))) {
			c = (Class)adminService.getClassDAO().findByName(c.getName()).get(0);
			request.setAttribute("studentList", adminService.getStudentDAO().findByCid(c.getId()));
			request.setAttribute("className", c.getName());
			return "addClassSuccess";
		}

		request.setAttribute("info", adminService.dealWithAddClass(c));
		return "addClassFailed";

	}

	@Override
	public Admin getModel() {

		if (admin == null) {
			admin = new Admin();
		}
		return admin;
	}

}
