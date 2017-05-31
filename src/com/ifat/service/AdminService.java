package com.ifat.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import com.ifat.config.PassWordCreate;
import com.ifat.dao.AdminDAO;
import com.ifat.dao.ClassDAO;
import com.ifat.dao.ClassQuestionnaireDAO;
import com.ifat.dao.QuestionnaireDAO;
import com.ifat.dao.StudentDAO;
import com.ifat.model.Admin;
import com.ifat.model.Class;
import com.ifat.model.ClassQuestionnaire;
import com.ifat.model.Student;
import com.sun.mail.handlers.image_gif;

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
	private QuestionnaireDAO questionnaireDAO;
	private ClassQuestionnaireDAO classQuestionnaireDAO;
	
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
	 * 管理员登录处理。
	 * 
	 * @param admin
	 * @return
	 */
	public String dealWithLogin(Admin admin) {
		List<Admin> admins= adminDAO.findByName(admin.getName());
		if (admins.size() == 0) {
			return "用户名不存在,请重新登录";
		} else if (!judgePasswordEqual(admins.get((0)).getPassword(), admin.getPassword())) {
			return "密码错误,请重新登录";
		}

		return "loginSuccess";
	}
	
	/**
	 * 管理员注册处理。
	 * @param admin
	 * @param confirmpwd
	 * @return
	 */
	public String dealWithRegister(Admin admin, String confirmpwd) {
		if (!admin.getPassword().equals(confirmpwd)) {
			return "两次密码输入不一致，请重新输入";
		} else if (adminDAO.findByName(admin.getName()).size() != 0) {
			return "用户名已存在,请重新输入用户名";
		}  

		Random random = new Random();
		admin.setId(UUID.randomUUID().toString());
		admin.setPassword(encryptByMd5AndRandomNum(confirmpwd) + random.nextInt(9));
		adminDAO.save(admin);
		
		return "registerSuccess";
	}
	
	/**
	 * MD5随机数加密。
	 */
	public String encryptByMd5AndRandomNum(String target) {
		String result = null; 
		try { 
		      MessageDigest md5 = MessageDigest.getInstance("MD5"); 
		      byte[] bytes = md5.digest(target.getBytes()); 
		      StringBuffer stringBuffer = new StringBuffer(); 
		      for (byte b : bytes){ 
		        int bt = b&0xff; 
		        if (bt < 16){ 
		          stringBuffer.append(0); 
		        }  
		        stringBuffer.append(Integer.toHexString(bt)); 
		      } 
		      result = stringBuffer.toString(); 
		    } catch (NoSuchAlgorithmException e) { 
		      e.printStackTrace(); 
		    } 
		
		return result;
	}
	
	/**
	 * md5加密方式密码判读。
	 * @param sPassword 原密码。
	 * @param tPassword 目标密码。
	 * @return
	 */
	public boolean judgePasswordEqual(String sPassword, String tPassword) {
		tPassword = encryptByMd5AndRandomNum(tPassword);
		
		int i = 0;
		while (i<10) {
			if ((tPassword+i).equals(sPassword)) {
				return true;
			}
			i++;
		}
		
		return false;
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
	 * 给班级分配试卷。
	 * @param cid
	 * @param qid
	 */
	public String dealwithOfferQuestionnaire(String cid, String qid) {
		
		List<ClassQuestionnaire> list = classQuestionnaireDAO.findByCid(cid);
		if (list.size() > 0) {
			for (ClassQuestionnaire classQuestionnaire : list) {
				classQuestionnaireDAO.delete(classQuestionnaire);
			}
		}
		
		ClassQuestionnaire classQuestionnaire = new ClassQuestionnaire();
		classQuestionnaire.setId(UUID.randomUUID().toString());
		classQuestionnaire.setCid(cid);
		classQuestionnaire.setQid(qid);
		classQuestionnaireDAO.save(classQuestionnaire);
		return "分配成功";
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
