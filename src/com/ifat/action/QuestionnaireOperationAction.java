package com.ifat.action;

import com.ifat.model.Questionnaire;
import com.ifat.service.QuestionnaireService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 试卷Action。
 * @author lxw
 *
 */
public class QuestionnaireOperationAction extends SuperAction implements
		ModelDriven<Questionnaire> {

	private static final long serialVersionUID = 1L;
	private Questionnaire questionnaire;
	private QuestionnaireService questionnaireService;

	public QuestionnaireService getQuestionnaireService() {
		return questionnaireService;
	}

	public void setQuestionnaireService(
			QuestionnaireService questionnaireService) {
		this.questionnaireService = questionnaireService;
	}

	/**
	 * 添加试卷。
	 * 
	 * @return
	 */
	public String addQuestionnaire() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}

		if ("addQuestionnaireSuccess".equals(questionnaireService
				.dealWithAddQuestionnaire(questionnaire))) {
			request.setAttribute("questionnaireList", questionnaireService
					.getQuestionnaireDAO().findAll());
			request.setAttribute("Info", "试卷： " + questionnaire.getName()
					+ ",添加成功!");
			return "addQuestionnaireSuccess";
		}

		request.setAttribute("info",
				questionnaireService.dealWithAddQuestionnaire(questionnaire));
		return "addQuestionnaireFaild";
	}

	/**
	 * 修改试卷。
	 * 
	 * @return
	 */
	public String changeQuestionnaire() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}
		
		session.setAttribute("cqid", request.getParameter("cqid").toString());
		questionnaire.setId(session.getAttribute("cqid").toString());
		if ("changeQuestionnaireSuccess".equals(questionnaireService
				.dealWithChangeQuestionnaire(questionnaire))) {
			request.setAttribute("questionnaireList", questionnaireService
					.getQuestionnaireDAO().findAll());
			request.setAttribute("Info", "试卷： " + questionnaire.getName()
					+ ",修改成功!");
			session.setAttribute("cqid", null);
			return "changeQuestionnaireSuccess";
		}

		request.setAttribute("info",
				questionnaireService.dealWithChangeQuestionnaire(questionnaire));
		return "changeQuestionnaireFaild";

	}

	/**
	 * 显示全部试卷。
	 * 
	 * @return
	 */
	public String displayQuestionnaires() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}

		request.setAttribute("questionnaireList", questionnaireService
				.getQuestionnaireDAO().findAll());
		request.setAttribute("Info", "试卷如下:");
		return "displayQuestionnairesSuccess";
	}

	/**
	 * 删除试卷。
	 * 
	 * @return
	 */
	public String deleteQuestionnaire() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}
		request.setAttribute("Info",
				questionnaireService.dealWithDeleteQuestionnaire(questionnaire));
		request.setAttribute("questionnaireList", questionnaireService
				.getQuestionnaireDAO().findAll());
		return "deleteQuestionnaireSuccess";
	}

	@Override
	public Questionnaire getModel() {

		if (questionnaire == null) {
			questionnaire = new Questionnaire();
		}
		return questionnaire;
	}
}
