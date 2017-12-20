package com.tie.document.model;

public class SettlementDto extends DocumentDto{
	private int signSeq;
	private String signState;
	private int signStep;
	private int docId;
	private int personId;
	
	public int getSignSeq() {
		return signSeq;
	}
	public void setSignSeq(int signSeq) {
		this.signSeq = signSeq;
	}
	public String getSignState() {
		return signState;
	}
	public void setSignState(String signState) {
		this.signState = signState;
	}
	public int getSignStep() {
		return signStep;
	}
	public void setSignStep(int signStep) {
		this.signStep = signStep;
	}
	public int getDocId() {
		return docId;
	}
	public void setDocId(int docId) {
		this.docId = docId;
	}
	public int getPersonId() {
		return personId;
	}
	public void setPersonId(int personId) {
		this.personId = personId;
	}


}
