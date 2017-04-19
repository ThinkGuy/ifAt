package com.ifat.service;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ifat.dao.ClassQuestionnaireDAO;
import com.ifat.dao.QuestionnaireDAO;
import com.ifat.dao.StudentDAO;
import com.ifat.model.ClassQuestionnaire;
import com.ifat.model.Question;
import com.ifat.model.Questionnaire;
import com.ifat.model.Student;

/**
 * StudentService.
 * @author lxw
 *
 */
public class StudentService {

	private StudentDAO studentDAO;
	private QuestionnaireDAO questionnaireDAO;
	private ClassQuestionnaireDAO classQuestionnaireDAO;

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
	 * @return the questionnaireDAO
	 */
	public QuestionnaireDAO getQuestionnaireDAO() {
		return questionnaireDAO;
	}

	/**
	 * @param questionnaireDAO the questionnaireDAO to set
	 */
	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.questionnaireDAO = questionnaireDAO;
	}

	/**
	 * @return the classQuestionnaireDAO
	 */
	public ClassQuestionnaireDAO getClassQuestionnaireDAO() {
		return classQuestionnaireDAO;
	}

	/**
	 * @param classQuestionnaireDAO the classQuestionnaireDAO to set
	 */
	public void setClassQuestionnaireDAO(ClassQuestionnaireDAO classQuestionnaireDAO) {
		this.classQuestionnaireDAO = classQuestionnaireDAO;
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
	
	/**
	 * 试卷显示。
	 * @param student
	 * @return
	 */
	public ArrayList<Question> dealWithDisplayQuestionnaire(Student student) {
		student = studentDAO.findById(student.getId());
		
		ClassQuestionnaire classQuestionnaire = null;
		if (classQuestionnaireDAO.findByCid(student.getCid()).size() > 0) {
			classQuestionnaire = (ClassQuestionnaire) classQuestionnaireDAO.findByCid(student.getCid()).get(0);
		}
		
		Questionnaire questionnaire = questionnaireDAO.findById(classQuestionnaire.getQid());
		String questionJson = questionnaire.getQuestionnaire().trim();
		return dealWithQuestionJson(questionJson);
	}
	
	/**
	 * 处理试卷JSON。
	 * @return
	 */
	public ArrayList<Question> dealWithQuestionJson(String questionJson) {
		Gson gson = new Gson(); 
		ArrayList<Question> questions = gson.fromJson(questionJson, new TypeToken<List<Question>>(){}.getType());
		return questions;
	}

}
