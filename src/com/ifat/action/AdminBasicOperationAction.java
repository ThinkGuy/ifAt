package com.ifat.action;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Queue;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentLinkedQueue;

import javax.servlet.http.HttpSession;
import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.omg.CORBA.PUBLIC_MEMBER;

import java.util.List;

import com.ifat.config.GetHttpSessionConfigurator;
import com.ifat.config.ServerEncoder;
import com.ifat.model.Admin;
import com.ifat.model.Class;
import com.ifat.model.Student;
import com.ifat.service.AdminService;
import com.opensymphony.xwork2.ModelDriven;

@ServerEndpoint(value = "/ws/websocket/admin", encoders = { ServerEncoder.class }, configurator = GetHttpSessionConfigurator.class)
public class AdminBasicOperationAction extends SuperAction implements
		ModelDriven<Admin> {

	private static final long serialVersionUID = 1L;
	private Admin admin;
	private AdminService adminService;
	private HttpSession httpSession;
	/**
	 * 存储当前有效的session对象
	 */
	private static Queue<Session> sessionSet = new ConcurrentLinkedQueue<Session>();

	public static Queue<Session> getSessionSet() {
		return sessionSet;
	}

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
	 * 管理员注册。
	 * 
	 * @return
	 */
	public String register() {
		String confirmpwd = request.getParameter("confirmpwd");
		if ("registerSuccess".equals(adminService.dealWithRegister(admin,
				confirmpwd))) {
			session.setAttribute("info", "注册成功，请登录");
			return "registerSuccess";
		}

		request.setAttribute("info",
				adminService.dealWithRegister(admin, confirmpwd));
		return "registerFailed";
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
			c = (Class) adminService.getClassDAO().findByName(c.getName())
					.get(0);
			
			request.setAttribute("classList", adminService.getClassDAO().findAll());
			request.setAttribute("Info", "班级" + c.getName()
					+ "添加成功");
			return "addClassSuccess";
		}

		request.setAttribute("info", adminService.dealWithAddClass(c));
		return "addClassFailed";

	}

	/**
	 * 分配试卷显示试卷。
	 * 
	 * @return
	 */
	public String displayOfferQuestionnaire() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}

		session.setAttribute("cid", request.getParameter("cid"));
		request.setAttribute("questionnaireList", adminService
				.getQuestionnaireDAO().findAll());
		request.setAttribute("Info", "试卷如下,请选择:");

		return "displayOfferQuestionnaireSuccess";
	}

	/**
	 * 给班级分配试卷。
	 * 
	 * @return
	 */
	public String offerQuestionnaire() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}

		String cid = session.getAttribute("cid").toString();
		String qid = request.getParameter("qid");
		adminService.dealwithOfferQuestionnaire(cid, qid);
		request.setAttribute("classList", adminService.getClassDAO().findAll());
		request.setAttribute("Info", "班级-绑定成功");
		return "offerQuestionnaireSuccess";
	}

	/**
	 * 显示所有班级。
	 * 
	 * @return
	 */
	public String displayClasses() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}

		request.setAttribute("classList", adminService.getClassDAO().findAll());
		request.setAttribute("Info", "班级表如下:");
		return "displayClasses";
	}

	/**
	 * 班级删除。
	 * 
	 * @return
	 */
	public String deleteClass() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}

		request.setAttribute("Info",
				adminService.dealWithDeleteClass(request.getParameter("cid")));
		request.setAttribute("classList", adminService.getClassDAO().findAll());
		return "deleteClassSuccess";
	}

	/**
	 * 显示班级下所有学生。
	 * 
	 * @return
	 */
	public String searchStudentsByClass() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}

		request.setAttribute("studentList", adminService.getStudentDAO()
				.findByCid(request.getParameter("cid")));
		String classname = adminService.getClassDAO()
				.findById(request.getParameter("cid")).getName();
		request.setAttribute("className", classname);
		request.setAttribute("Info", "班级" + classname + "的学生信息如下所示：");
		return "searchStudentsByClassSuccess";
	}

	/**
	 * 显示学生。
	 * 
	 * @return
	 */
	public String displayStudents() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}

		request.setAttribute("studentList", adminService.getStudentDAO()
				.findAll());
		request.setAttribute("Info", "学生表如下：");
		return "displayStudentsSuccess";
	}

	/**
	 * 删除学生。
	 * 
	 * @return
	 */
	public String deleteStudent() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}

		request.setAttribute("Info",
				adminService.dealWithDeleteStudent(request.getParameter("sid")));
		request.setAttribute("studentList", adminService.getStudentDAO()
				.findAll());
		return "deleteStudentSuccess";
	}

	/**
	 * 注入session server.
	 * 
	 * @return
	 */
	public String injectServer() {
		if (session.getAttribute("adminId") == null) {
			return "LoginNotYet";
		}
		session.setAttribute("adminService", adminService);

		return "injectServerSuccess";
	}

	/**
	 * 学生成绩统计。
	 * 
	 * @return
	 */
	public String scoreStatistics(List<Class> classes) {
		Map<String, Integer> studentSocreMap = new TreeMap<String, Integer>();
		Map<Integer, Integer> questionScoreMap = new TreeMap<Integer, Integer>();

		@SuppressWarnings("unchecked")
		AdminService adminService = (AdminService) httpSession
				.getAttribute("adminService");

		String cid = classes.get(0).getId();
		List<Student> list = adminService.getStudentDAO().findByCid(cid);

		for (Student student : list) {
			if (student.getScore() == null) {
				studentSocreMap.put(student.getName(), 0);
			} else {
				studentSocreMap.put(student.getName(), student.getScore());
			}

			if (student.getEachquestionscore() != null
					&& student.getEachquestionscore() != "") {
				String[] eachQuestionScore = student.getEachquestionscore()
						.split("\\|");
				for (int i = 0; i < eachQuestionScore.length; i++) {
					if (questionScoreMap.containsKey(i + 1)) {
						questionScoreMap.put(i + 1, questionScoreMap.get(i + 1)
								+ Integer.parseInt(eachQuestionScore[i]));
					} else {
						questionScoreMap.put(i + 1,
								Integer.parseInt(eachQuestionScore[i]));
					}
				}
			}
		}

		for (Entry<Integer, Integer> questionScore : questionScoreMap
				.entrySet()) {
			questionScoreMap.put(questionScore.getKey(),
					Math.round(questionScore.getValue() / list.size()));
		}

		if (questionScoreMap.size() == 0) {
			for (int i = 1; i < 11; i++) {
				questionScoreMap.put(i, 0);
			}
		}

		//对学生成绩进行降序排序。
		List<Entry<String, Integer>> studentScoreList = new ArrayList<Entry<String, Integer>>(
				studentSocreMap.entrySet());

		Collections.sort(studentScoreList,
				new Comparator<Map.Entry<String, Integer>>() {
					// 升序排序
					public int compare(Entry<String, Integer> o1,
							Entry<String, Integer> o2) {
						return o2.getValue().compareTo(o1.getValue());
					}
				});
		
		String studentScore = "{";
		for (Entry<String, Integer> entry : studentScoreList) {
			studentScore = studentScore + entry.getKey() + "=" +entry.getValue()+", ";
		}
		studentScore = studentScore.substring(0, studentScore.length()-1) + "}";
		
		return questionScoreMap.toString() + "|" + studentScore;

	}

	/**
	 * 接收消息。
	 * 
	 * @param message
	 * @param currentSession
	 * @throws EncodeException
	 */
	@OnMessage
	public void onMessage(String message, Session currentSession)
			throws EncodeException {
		try {
			final Set<Session> sessions = currentSession.getOpenSessions();

			for (Session s : sessions) {

				@SuppressWarnings("unchecked")
				AdminService adminService = (AdminService) httpSession
						.getAttribute("adminService");
				List classes = adminService.getClassDAO().findByName(message);
				if (classes.size() == 0) {
					s.getBasicRemote().sendText("班级不存在");

				} else {
					s.getBasicRemote().sendText(
							scoreStatistics((List<Class>) classes));
				}
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
		if (sessionSet.contains(currentSession)) {
			sessionSet.remove(currentSession);
		}
	}

	@Override
	public Admin getModel() {

		if (admin == null) {
			admin = new Admin();
		}
		return admin;
	}

}
