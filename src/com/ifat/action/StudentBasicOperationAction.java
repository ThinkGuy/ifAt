package com.ifat.action;

import com.ifat.model.Student;
import com.ifat.service.StudentService;
import com.opensymphony.xwork2.ModelDriven;

public class StudentBasicOperationAction extends SuperAction implements
		ModelDriven<Student> {

	private static final long serialVersionUID = 1L;
	private Student student;
	private StudentService studentService;

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	/**
	 * 学生登录处理。
	 * @return
	 */
	public String login() {
		if ("studentLoginSuccess".equals(studentService.dealWithLogin(student))) {
			student = (Student) studentService.getStudentDAO().findByName(student.getName()).get(0);
			session.setAttribute("studentId", student.getId());
			session.setAttribute("studentName", student.getName());
			//TODO debug.
			displayQuestionnaire();
			return "studentLoginSuccess";
		}
		
		request.setAttribute("info", studentService.dealWithLogin(student));
		
		return "studentLoginFailed";
	}
	
	/**
	 * 显示试卷
	 * @return
	 */
	public String displayQuestionnaire() {
		student.setCid(session.getAttribute("studentId").toString());
		
		request.setAttribute("questionList", studentService.dealWithDisplayQuestionnaire(student));
		return "displayQuestionnaireSuccess";
	}

	@Override
	public Student getModel() {

		if (student == null) {
			student = new Student();
		}
		return student;
	}

}
