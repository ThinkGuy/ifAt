package com.ifat.model;

/**
 * ClassQuestionnaire entity. @author MyEclipse Persistence Tools
 */

public class ClassQuestionnaire implements java.io.Serializable {

	// Fields

	private String id;
	private String cid;
	private String qid;

	// Constructors

	/** default constructor */
	public ClassQuestionnaire() {
	}

	/** minimal constructor */
	public ClassQuestionnaire(String id) {
		this.id = id;
	}

	/** full constructor */
	public ClassQuestionnaire(String id, String cid, String qid) {
		this.id = id;
		this.cid = cid;
		this.qid = qid;
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

	public String getQid() {
		return this.qid;
	}

	public void setQid(String qid) {
		this.qid = qid;
	}

}