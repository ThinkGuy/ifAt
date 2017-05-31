package com.ifat.model;

/**
 * Questionnaire entity. @author MyEclipse Persistence Tools
 */

public class Questionnaire implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String questionnaire;

	// Constructors

	/** default constructor */
	public Questionnaire() {
	}

	/** minimal constructor */
	public Questionnaire(String id) {
		this.id = id;
	}

	/** full constructor */
	public Questionnaire(String id, String name, String questionnaire) {
		this.id = id;
		this.name = name;
		this.questionnaire = questionnaire;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getQuestionnaire() {
		return this.questionnaire;
	}

	public void setQuestionnaire(String questionnaire) {
		this.questionnaire = questionnaire;
	}

}