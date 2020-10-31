package com.masuri.dto;

import java.sql.Timestamp;

//예약신청서 
public class ReslistDTO {

 // 신청서 번호 
 private Integer num;

 // 신청일시 
 private Timestamp time;

 // 출장주소 
 private String address;

 // 신청자 아이디 
 private String userid;

 // 수리기사 아이디 
 private String engid;

 // 제조사 
 private String factory;

 // 기종 
 private String model;

 // 고장상황 
 private String failsit;

 // 고장상세상황 
 private String failmsg;

 // 예약상태 
 private String state;

 public Integer getNum() {
     return num;
 }

 public void setNum(Integer num) {
     this.num = num;
 }

 public Timestamp getTime() {
     return time;
 }

 public void setTime(Timestamp time) {
     this.time = time;
 }

 public String getAddress() {
     return address;
 }

 public void setAddress(String address) {
     this.address = address;
 }

 public String getUserid() {
     return userid;
 }

 public void setUserid(String userid) {
     this.userid = userid;
 }

 public String getEngid() {
     return engid;
 }

 public void setEngid(String engid) {
     this.engid = engid;
 }

 public String getFactory() {
     return factory;
 }

 public void setFactory(String factory) {
     this.factory = factory;
 }

 public String getModel() {
     return model;
 }

 public void setModel(String model) {
     this.model = model;
 }

 public String getFailsit() {
     return failsit;
 }

 public void setFailsit(String failsit) {
     this.failsit = failsit;
 }

 public String getFailmsg() {
     return failmsg;
 }

 public void setFailmsg(String failmsg) {
     this.failmsg = failmsg;
 }

 public String getState() {
     return state;
 }

 public void setState(String state) {
     this.state = state;
 }

@Override
public String toString() {
	return "ReslistDTO [num=" + num + ", time=" + time + ", address=" + address + ", userid=" + userid + ", engid="
			+ engid + ", factory=" + factory + ", model=" + model + ", failsit=" + failsit + ", failmsg=" + failmsg
			+ ", state=" + state + "]";
}

 

}
