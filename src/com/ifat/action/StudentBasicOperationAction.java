package com.ifat.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentLinkedQueue;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.w3c.dom.ls.LSException;

import com.ifat.config.GetHttpSessionConfigurator;
import com.ifat.config.PassWordCreate;
import com.ifat.model.Question;
import com.ifat.model.Student;
import com.ifat.service.StudentService;
import com.opensymphony.xwork2.ModelDriven;

@ServerEndpoint(value = "/ws/websocket", configurator = GetHttpSessionConfigurator.class)
public class StudentBasicOperationAction extends SuperAction implements
		ModelDriven<Student> {

	/**
	 * 每道题的初始分数。
	 */
	public static final int PERSCORE = 4;
	public static final int DECSCORE = PERSCORE / 4;

	private static final long serialVersionUID = 1L;
	private Student student;
	private StudentService studentService;
	private HttpSession httpSession;
	/**
	 * 存储当前有效的session对象
	 */
	private static Queue<Session> sessionSet = new ConcurrentLinkedQueue<Session>();

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public static Queue<Session> getSessionSet() {
		return sessionSet;
	}

	/**
	 * 处理答题。
	 * 
	 * @return
	 */
	public String dealWithAnswerQuestion(String message) {
		@SuppressWarnings("unchecked")
		ArrayList<Question> questions = (ArrayList<Question>) httpSession
				.getAttribute("questionList");
		int tag = 0;
		String answer = "";
		if (message.length() == 2) {
			tag = Integer.parseInt(message.substring(0, 1));
			answer = message.substring(1, message.length()).trim()
					.toLowerCase();
		} else {
			tag = Integer.parseInt(message.substring(0, 2));
			answer = message.substring(2, message.length()).trim()
					.toLowerCase();
		}
		Question question = questions.get(tag - 1);

		int times = question.getTimes();
		String result = "";

		if (answer.equals(question.getAnswer().trim().toLowerCase())) {

			if (times == 0) {
				question.setScore(PERSCORE);
			} else if (times == 1) {
				question.setScore(PERSCORE - DECSCORE);
			} else if (times == 2) {
				question.setScore(PERSCORE - 2 * DECSCORE);
			} else if (times == 3) {
				question.setScore(PERSCORE - 3 * DECSCORE);
			}

			question.setTimes(++times);
			result = message + " 第" + (times) + "次答题正确，得" + question.getScore()
					+ "分";
		} else {
			question.setTimes(++times);
			result = message + " 答案错误,请继续答题";
		}
		questions.set(tag - 1, question);
		httpSession.setAttribute("questionList", questions);
		return result;
	}

	/**
	 * 接收消息。
	 * 
	 * @param message
	 * @param currentSession
	 */
	@OnMessage
	public void onMessage(String message, Session currentSession) {
		// 未登录连接。
		if (httpSession.getAttribute("studentName") == null || "exit".equals(httpSession.getAttribute("studentName").toString())) {
			return;
		}

		try {
			final Set<Session> sessions = currentSession.getOpenSessions();

			for (Session s : sessions) {
				s.getBasicRemote().sendText(dealWithAnswerQuestion(message));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 打开连接。
	 * 
	 * @param currentSession
	 */
	@OnOpen
	public void onOpen(Session currentSession, EndpointConfig config) {
		httpSession = (HttpSession) config.getUserProperties().get(
				HttpSession.class.getName());

		if (sessionSet.contains(currentSession) == false) {
			sessionSet.add(currentSession);
		}
	}

	/**
	 * 关闭连接。
	 * 
	 * @param currentSession
	 */
	@OnClose
	public void onClose(Session currentSession) {
		if (httpSession.getAttribute("studentName") == null) {
			httpSession.setAttribute("studentName", "exit");
			session = httpSession;
		}

		if (httpSession.getAttribute("studentId") != null) {
			exitSave();
			httpSession.setAttribute("studentName", null);
		}

		if (sessionSet.contains(currentSession)) {
			sessionSet.remove(currentSession);
		}
	}

	/**
	 * 学生登录处理。
	 * 
	 * @return
	 */
	public String login() {
		if ("studentLoginSuccess".equals(studentService.dealWithLogin(student))) {
			student = (Student) studentService.getStudentDAO()
					.findByName(student.getName()).get(0);
			session.setAttribute("studentId", student.getId());
			session.setAttribute("studentName", student.getName());
			session.setAttribute("studentService", studentService);

			String loginResult = displayQuestionnaire();
			if ("OK".equals(loginResult)) {
				return "studentLoginSuccess";
			}

			return loginResult;

		}

		request.setAttribute("info", studentService.dealWithLogin(student));

		return "studentLoginFailed";
	}

	/**
	 * 用户登录显示试卷.
	 * 
	 * @return
	 */
	public String displayQuestionnaire() {
		student.setCid(session.getAttribute("studentId").toString());

		Map<Integer, Integer> questionScoreMap = new TreeMap<Integer, Integer>();
		ArrayList<Question> questionList = studentService
				.dealWithDisplayQuestionnaire(student);
		ArrayList<Question> questions = new ArrayList<Question>();

		student = studentService.getStudentDAO().findById(
				session.getAttribute("studentId").toString());
		if (student.getEachquestionscore() != null
				&& student.getEachquestionscore() != "") {

			String[] eachQuestionScore = student.getEachquestionscore().split(
					"\\|");
			for (int i = 0; i < eachQuestionScore.length; i++) {
				if (Integer.parseInt(eachQuestionScore[i]) == 0) {
					questions.add(questionList.get(i));
				}
			}
			request.setAttribute("questionList", questions);
			session.setAttribute("questionList", questions);

			if (student.getScore() != null && student.getScore() > 0) {
				session.setAttribute("questionList", questions);
				exitSave();
				return countScore();
			}

			return "OK";
		}
		request.setAttribute("questionList", questionList);
		session.setAttribute("questionList", questionList);
		return "OK";
	}

	/**
	 * 统计分数。
	 * 
	 * @return
	 */
	public String countScore() {
		if (session == null && httpSession != null) {
			if (httpSession.getAttribute("studentName") == null) {
				return "LoginNotYet";
			}
			session = httpSession;
			studentService = (StudentService) session
					.getAttribute("studentService");
		} else if (session.getAttribute("studentId") == null
				|| (session.getAttribute("studentName") != null && "exit"
						.equals(session.getAttribute("studentName").toString()))) {
			request.setAttribute("info", "中断答题，请重新登录");
			return "LoginNotYet";
		}

		int firstRightNum = 0;
		int secondRightNum = 0;
		int thirdRightNum = 0;
		int fourthRightNum = 0;
		int score = 0;
		double accuracy = 0;
		int times = 0;
		int qscore = 0;

		ArrayList<Question> questions = (ArrayList<Question>) session
				.getAttribute("questions");
		Student student = studentService.getStudentDAO().findById(
				session.getAttribute("studentId").toString());

		for (Question question : questions) {
			qscore = question.getScore();
			if (qscore == 0) {
				continue;
			}

			times = question.getTimes();
			if (times == 1) {
				firstRightNum++;
			} else if (times == 2) {
				secondRightNum++;
			} else if (times == 3) {
				thirdRightNum++;
			} else if (times == 4) {
				fourthRightNum++;
			}

			score = score + qscore;
		}

		accuracy = score / (double) (questions.size() * PERSCORE) * 100;
		request.setAttribute("firstRightNum", firstRightNum);
		request.setAttribute("secondRightNum", secondRightNum);
		request.setAttribute("thirdRightNum", thirdRightNum);
		request.setAttribute("fourthRightNum", fourthRightNum);
		request.setAttribute("score", score);
		request.setAttribute("accuracy", accuracy);

		student.setScore(score);
		studentService.getStudentDAO().merge(student);

		return "countScoreSuccess";
	}

	/**
	 *  中途退出保存。
	 */
	public void exitSave() {
		if (session == null && httpSession != null) {
			session = httpSession;
			studentService = (StudentService) session
					.getAttribute("studentService");

		}

		int qscore = 0;
		StringBuilder eachQuestionScore = new StringBuilder();

		ArrayList<Question> questions = new ArrayList<Question>();
		ArrayList<Question> questionList = (ArrayList<Question>) session
				.getAttribute("questionList");
		Student student = studentService.getStudentDAO().findById(
				session.getAttribute("studentId").toString());
		if (student.getEachquestionscore() != null
				&& student.getEachquestionscore() != "") {
			String[] eachQuestionScores = student.getEachquestionscore().split(
					"\\|");
			int j = 0;
			Question question = new Question();
			for (int i = 0; i < eachQuestionScores.length; i++) {
				if (Integer.parseInt(eachQuestionScores[i]) == 0) {
					questions.add(questionList.get(j));
					j++;
				} else {
					int s = Integer.parseInt(eachQuestionScores[i]);
					question = new Question();
					question.setScore(s);
					if (s == PERSCORE) {
						question.setTimes(1);
					} else if (s == PERSCORE - DECSCORE) {
						question.setTimes(2);
					} else if (s == PERSCORE - 2 * DECSCORE) {
						question.setTimes(3);
					} else {
						question.setTimes(4);
					}
					questions.add(question);
				}
			}
		} else {
			questions = questionList;
		}

		for (Question question : questions) {
			qscore = question.getScore();
			eachQuestionScore.append(qscore);
			eachQuestionScore.append("|");
			if (qscore == 0) {
				continue;
			}

		}

		String eachScore = eachQuestionScore.toString().substring(0,
				eachQuestionScore.length() - 1);
		student.setEachquestionscore(eachScore);
		studentService.getStudentDAO().merge(student);

		if (httpSession != null) {
			httpSession.setAttribute("questions", questions);
		} else if (session != null) {
			session.setAttribute("questions", questions);
		}
	}

	/**
	 * 退出登录。
	 * 
	 * @return
	 */
	public String logout() {
		if (httpSession != null) {
			httpSession = null;
		}

		if (session != null) {
			session.setAttribute("studentId", null);
			session.setAttribute("studentName", null);
			session.setAttribute("questionList", null);
		}

		return "logout";
	}

	@Override
	public Student getModel() {

		if (student == null) {
			student = new Student();
		}
		return student;
	}

}
