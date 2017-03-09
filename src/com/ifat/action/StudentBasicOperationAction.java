package com.ifat.action;

import com.ifat.model.Student;
import com.ifat.service.StudentService;
import com.opensymphony.xwork2.ModelDriven;

public class StudentBasicOperationAction extends SuperAction implements
		ModelDriven<Student> {

	private static final long serialVersionUID = 1L;
	private Student Student;
	private StudentService StudentService;

	public StudentService getStudentService() {
		return StudentService;
	}

	public void setStudentService(StudentService StudentService) {
		this.StudentService = StudentService;
	}
	
	/**
	 * 学生登录处理。
	 * @return
	 */
	public String login() {
		if ("studentLoginSuccess".equals(StudentService.dealWithLogin(Student))) {
			return "studentLoginSuccess";
		}
		
		request.setAttribute("info", StudentService.dealWithLogin(Student));
		return "studentLoginFailed";
	}

	@Override
	public Student getModel() {

		if (Student == null) {
			Student = new Student();
		}
		return Student;
	}

}
