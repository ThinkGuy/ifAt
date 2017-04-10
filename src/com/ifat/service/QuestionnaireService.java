package com.ifat.service;

import java.util.ArrayList;
import java.util.UUID;

import antlr.collections.List;

import com.ifat.dao.ClassQuestionnaireDAO;
import com.ifat.dao.QuestionnaireDAO;
import com.ifat.model.ClassQuestionnaire;
import com.ifat.model.Questionnaire;

public class QuestionnaireService {
	
	private QuestionnaireDAO questionnaireDAO;
	private ClassQuestionnaireDAO classQuestionnaireDAO;

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
	 * 添加试卷。
	 * @param questionnaire
	 * @return
	 */
	public String dealWithAddQuestionnaire(Questionnaire questionnaire) {
		questionnaire.setId(UUID.randomUUID().toString());
		questionnaireDAO.save(questionnaire);
		return "addQuestionnaireSuccess";
	}
	
	/**
	 * 试卷删除。
	 * @return
	 */
	public String dealWithDeleteQuestionnaire(Questionnaire questionnaire) {
		questionnaire = questionnaireDAO.findById(questionnaire.getId());
		questionnaireDAO.delete(questionnaire);
		classQuestionnaireDAO.deleteByQuestionnaireId(questionnaire.getId());
		return "试卷：" + questionnaire.getName() + ",删除成功。";
	}
}
