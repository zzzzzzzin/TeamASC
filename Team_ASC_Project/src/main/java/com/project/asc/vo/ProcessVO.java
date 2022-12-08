package com.project.asc.vo;

public class ProcessVO {

	private int processSeq;
	private int projectSeq;
	private String projectFinishYn;
	private String documentsFinishYn;
	private String taskFinishYn;
	private String wbsFinishYn;
	private String implementationFinishYn;
	private String testFinishYn;
	private String completeYn;
	
	public ProcessVO() {}
	
	public ProcessVO(int processSeq, int projectSeq, String projectFinishYn, String documentsFinishYn, String taskFinishYn, String wbsFinishYn
			, String implementationFinishYn, String testFinishYn, String completeYn) {
		this.processSeq = processSeq;
		this.projectSeq = projectSeq;
		this.projectFinishYn = projectFinishYn;
		this.documentsFinishYn = documentsFinishYn;
		this.taskFinishYn = taskFinishYn;
		this.wbsFinishYn = wbsFinishYn;
		this.implementationFinishYn = implementationFinishYn;
		this.testFinishYn = testFinishYn;
		this.completeYn = completeYn;
	}

	public int getProcessSeq() {
		return processSeq;
	}

	public void setProcessSeq(int processSeq) {
		this.processSeq = processSeq;
	}

	public int getProjectSeq() {
		return projectSeq;
	}

	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}

	public String getProjectFinishYn() {
		return projectFinishYn;
	}

	public void setProjectFinishYn(String projectFinishYn) {
		this.projectFinishYn = projectFinishYn;
	}

	public String getDocumentFinishYn() {
		return documentsFinishYn;
	}

	public void setDocumentFinishYn(String documentFinishYn) {
		this.documentsFinishYn = documentFinishYn;
	}

	public String getTaskFinishYn() {
		return taskFinishYn;
	}

	public void setTaskFinishYn(String taskFinishYn) {
		this.taskFinishYn = taskFinishYn;
	}

	public String getWbsFinishYn() {
		return wbsFinishYn;
	}

	public void setWbsFinishYn(String wbsFinishYn) {
		this.wbsFinishYn = wbsFinishYn;
	}

	public String getImplementationFinishYn() {
		return implementationFinishYn;
	}

	public void setImplementationFinishYn(String implementationFinishYn) {
		this.implementationFinishYn = implementationFinishYn;
	}

	public String getTestFinishYn() {
		return testFinishYn;
	}

	public void setTestFinishYn(String testFinishYn) {
		this.testFinishYn = testFinishYn;
	}

	public String getCompleteYn() {
		return completeYn;
	}

	public void setCompleteYn(String completeYn) {
		this.completeYn = completeYn;
	}
	
	@Override
	public String toString() {
		return "processSeq : " + this.processSeq + 
			   " / projectSeq : " + this.projectSeq + 
			   " / projectFinishYn : " + this.projectFinishYn + 
			   " / documentsFinishYn : " + this.documentsFinishYn + 
			   " / taskFinishYn : " + this.taskFinishYn + 
			   " / wbsFinishYn : " + this.wbsFinishYn + 
			   " / implementationFinishYn : " + this.implementationFinishYn +
			   " / testFinishYn : " + this.testFinishYn +
			   " / completeYn : " + this.completeYn;
	}
}
