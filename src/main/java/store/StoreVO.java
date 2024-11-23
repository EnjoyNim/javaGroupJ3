package store;

import common.VOInterface;

public class StoreVO implements VOInterface{
	// sql 과 같은 변수들
	private int idx;
	private String storeId;
	private String pwd;
	private String storeName;
	private String ownerName;
	private String tel;
	private String address;
	private String email;
	private int level;
	private String contractStartDate;
	private String contractEndDate;
	private int contractPrice;
	private String contactName;
	private String contactPhone;
	private String contactTime;
	private String inquiry;
	private String appliedDate;
	private String process;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getStoreId() {
		return storeId;
	}
	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getContractStartDate() {
		return contractStartDate;
	}
	public void setContractStartDate(String contractStartDate) {
		this.contractStartDate = contractStartDate;
	}
	public String getContractEndDate() {
		return contractEndDate;
	}
	public void setContractEndDate(String contractEndDate) {
		this.contractEndDate = contractEndDate;
	}
	public int getContractPrice() {
		return contractPrice;
	}
	public void setContractPrice(int contractPrice) {
		this.contractPrice = contractPrice;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getContactTime() {
		return contactTime;
	}
	public void setContactTime(String contactTime) {
		this.contactTime = contactTime;
	}
	public String getInquiry() {
		return inquiry;
	}
	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}
	public String getAppliedDate() {
		return appliedDate;
	}
	public void setAppliedDate(String appliedDate) {
		this.appliedDate = appliedDate;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	@Override
	public String toString() {
		return "StoreVO [idx=" + idx + ", storeId=" + storeId + ", pwd=" + pwd + ", storeName=" + storeName
				+ ", ownerName=" + ownerName + ", tel=" + tel + ", address=" + address + ", email=" + email + ", level="
				+ level + ", contractStartDate=" + contractStartDate + ", contractEndDate=" + contractEndDate
				+ ", contractPrice=" + contractPrice + ", contactName=" + contactName + ", contactPhone=" + contactPhone
				+ ", contactTime=" + contactTime + ", inquiry=" + inquiry + ", appliedDate=" + appliedDate
				+ ", process=" + process + "]";
	}

	
}
