package com.ifat.service;

import com.ifat.dao.StudentDAO;
import com.ifat.model.Student;

/**
 * StudentService.
 * @author lxw
 *
 */
public class StudentService {

	private StudentDAO studentDAO;

	/**
	 * @return the studentDAO
	 */
	public StudentDAO getStudentDAO() {
		return studentDAO;
	}

	/**
	 * @param studentDAO
	 *            the studentDAO to set
	 */
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	
	/**
	 * 学生登录处理。
	 * @param student
	 * @return
	 */
	public String dealWithLogin(Student student) {
		if (studentDAO.findByName(student.getName()).size() == 0) {
			return "用户名不存在,请重新登录";
		} else if (studentDAO.findByPassword(student.getPassword()).size() == 0) {
			return "密码错误,请重新登录";
		}
		
		return "studentLoginSuccess";
	}

}
