package com.ifat.service;

import java.util.ArrayList;
import java.util.UUID;
import org.apache.commons.lang.StringUtils;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import com.google.gson.JsonParser;
import com.ifat.dao.ClassQuestionnaireDAO;
import com.ifat.dao.QuestionnaireDAO;
import com.ifat.model.Questionnaire;

/**
 * 试卷service。
 * @author lxw
 *
 */
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
	 * @param questionnaireDAO
	 *            the questionnaireDAO to set
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
	 * @param classQuestionnaireDAO
	 *            the classQuestionnaireDAO to set
	 */
	public void setClassQuestionnaireDAO(
			ClassQuestionnaireDAO classQuestionnaireDAO) {
		this.classQuestionnaireDAO = classQuestionnaireDAO;
	}

	/**
	 * 添加试卷。
	 * 
	 * @param questionnaire
	 * @return
	 */
	public String dealWithAddQuestionnaire(Questionnaire questionnaire) {
		String q = questionnaire.getQuestionnaire();
		if (isGoodJson(q) && q.indexOf(":") > 0) {
			if (questionnaireDAO.findByName(questionnaire.getName()).size() > 0) {
				return "试卷名已存在！请重输：";
			} else if (questionnaire.getTime() > 120 || questionnaire.getTime() < 0) {
				return "试卷时间设置太长，应为0-120分钟";
			}
			questionnaire.setId(UUID.randomUUID().toString());
			questionnaireDAO.save(questionnaire);
			return "addQuestionnaireSuccess";
		}

		return "试卷格式错误， 添加失败！";
	}

	/**
	 * 修改试卷。
	 * 
	 * @param questionnaire
	 * @return
	 */
	public String dealWithChangeQuestionnaire(Questionnaire questionnaire) {
		String q = questionnaire.getQuestionnaire();
		if (isGoodJson(q) && q.indexOf(":") > 0) {

			ArrayList<Questionnaire> qList = (ArrayList<Questionnaire>) questionnaireDAO
					.findByName(questionnaire.getName());
			if (qList.size() > 0
					&& !qList.get(0).getId().equals(questionnaire.getId())) {
				return "试卷名已存在！请重输：";
			} else if (questionnaire.getTime() > 120 || questionnaire.getTime() < 0) {
				return "试卷时间设置太长，应为0-120分钟";
			}
			questionnaireDAO.merge(questionnaire);
			return "changeQuestionnaireSuccess";
		}

		return "试卷格式错误， 添加失败！";
	}

	/**
	 * 判断是否json格式。
	 * 
	 * @param json
	 * @return
	 */
	public static boolean isGoodJson(String json) {
		if (StringUtils.isBlank(json)) {
			return false;
		}
		try {
			JsonParser jsonParser = new JsonParser();
			JsonElement jsonElement = jsonParser.parse(json);
			return true;
		} catch (JsonParseException e) {
			return false;
		}
	}

	/**
	 * 试卷删除。
	 * 
	 * @return
	 */
	public String dealWithDeleteQuestionnaire(Questionnaire questionnaire) {
		questionnaire = questionnaireDAO.findById(questionnaire.getId());
		questionnaireDAO.delete(questionnaire);
		classQuestionnaireDAO.deleteByQuestionnaireId(questionnaire.getId());
		return "试卷：" + questionnaire.getName() + ",删除成功。";
	}
}
