package com.ifat.model;
// default package

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student implements java.io.Serializable {

	// Fields

	private String id;
	private String cid;
	private String name;
	private String password;
	private Integer score;
	private String eachquestionscore;

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** minimal constructor */
	public Student(String id) {
		this.id = id;
	}

	/** full constructor */
	public Student(String id, String cid, String name, String password,
			Integer score, String eachquestionscore) {
		this.id = id;
		this.cid = cid;
		this.name = name;
		this.password = password;
		this.score = score;
		this.eachquestionscore = eachquestionscore;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCid() {
		return this.cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getEachquestionscore() {
		return this.eachquestionscore;
	}

	public void setEachquestionscore(String eachquestionscore) {
		this.eachquestionscore = eachquestionscore;
	}

}