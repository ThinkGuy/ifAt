package com.ifat.service;

import java.util.UUID;
import com.ifat.dao.AdminDAO;
import com.ifat.dao.ClassDAO;
import com.ifat.dao.StudentDAO;
import com.ifat.model.Admin;
import com.ifat.model.Class;
import com.ifat.model.Student;

/**
 * AdminService.
 * 
 * @author lxw
 *
 */
public class AdminService {
	
	private AdminDAO adminDAO;
	private ClassDAO classDAO;
	private StudentDAO studentDAO;
	
	/**
	 * @return the adminDAO
	 */
	public AdminDAO getAdminDAO() {
		return adminDAO;
	}

	/**
	 * @param adminDAO
	 *            the adminDAO to set
	 */
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

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

	/**
	 * @return the studentDAO
	 */
	public StudentDAO getStudentDAO() {
		return studentDAO;
	}

	/**
	 * @param studentDAO the studentDAO to set
	 */
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	/**
	 * 管理员登录处理。
	 * 
	 * @param admin
	 * @return
	 */
	public String dealWithLogin(Admin admin) {
		if (adminDAO.findByName(admin.getName()).size() == 0) {
			return "用户名不存在,请重新登录";
		} else if (adminDAO.findByPassword(admin.getPassword()).size() == 0) {
			return "密码错误,请重新登录";
		}

		return "loginSuccess";
	}

	/**
	 * 管理员密码修改。
	 * @param admin
	 * @param chPassword
	 * @param confirmPassword
	 * @return
	 */
	public String dealWithChangePassword(Admin admin, String chPassword,
			String confirmPassword) {
		if (!chPassword.equals(confirmPassword)) {
			return "两次输入密码不一致，请重新输入";
		}
		
		admin = adminDAO.findById(admin.getId());
		admin.setPassword(chPassword);
		adminDAO.merge(admin);
		return "changePasswordSuccess";
	}
	
	/**
	 * 添加班级。
	 * @param c
	 * @return
	 */
	public String dealWithAddClass(Class c) {
		if (classDAO.findByName(c.getName()).size() !=0) {
			return "该班级已经存在，请重新添加班级";
		}
		
		c.setId(UUID.randomUUID().toString());
		classDAO.merge(c);
		
		//自动添加学生账号。
		Student student;
		int i = 0;
		while (i < 15) {
			student = new Student();
			student.setId(UUID.randomUUID().toString());
			student.setCid(c.getId());
			student.setName(c.getName() + 0 + i);
			student.setPassword(new PassWordCreate().createPassWord(9));
			studentDAO.merge(student);
			i++;
		}
		
		return "addClassSuccess";
	}
	
	/**
	 * 删除班级。
	 * @return
	 */
	public String dealWithDeleteClass(String cid) {
		Class c = classDAO.findById(cid);
		classDAO.delete(c);
		//删除班级下的所有学生。
		studentDAO.deleteByClassId(cid);
		return "班级：" + c.getName() + "已被删除";
	}
	
	/**
	 * 删除学生。
	 * @param sid
	 * @return
	 */
	public String dealWithDeleteStudent(String sid) {
		Student student = studentDAO.findById(sid);
		studentDAO.delete(student);
		return "学生：" + student.getName() + "已被删除";
	}
	

}
