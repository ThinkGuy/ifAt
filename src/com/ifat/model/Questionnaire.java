package com.ifat.model;

/**
 * Questionnaire entity. @author MyEclipse Persistence Tools
 */

public class Questionnaire implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String questionnaire;
	private String scoring;

	// Constructors

	/** default constructor */
	public Questionnaire() {
	}

	/** minimal constructor */
	public Questionnaire(String id) {
		this.id = id;
	}

	/** full constructor */
	public Questionnaire(String id, String name, String questionnaire,
			String scoring) {
		this.id = id;
		this.name = name;
		this.questionnaire = questionnaire;
		this.scoring = scoring;
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

	public String getScoring() {
		return this.scoring;
	}

	public void setScoring(String scoring) {
		this.scoring = scoring;
	}

}