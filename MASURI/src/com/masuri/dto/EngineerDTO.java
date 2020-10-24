package com.masuri.dto;

//수리기사 
public class EngineerDTO {

 // 사원번호 
 private Integer engnum;

 // 아이디 
 private String id;

 // 패스워드 
 private String password;

 // 이름 
 private String name;

 // 전화번호 
 private String phone;

 // 이메일 
 private String email;

 // 소개메세지 
 private String intro;

 // 근무지역 
 private String area;

 // 상태 
 private boolean state;

 public Integer getEngnum() {
     return engnum;
 }

 public void setEngnum(Integer engnum) {
     this.engnum = engnum;
 }

 public String getId() {
     return id;
 }

 public void setId(String id) {
     this.id = id;
 }

 public String getPassword() {
     return password;
 }

 public void setPassword(String password) {
     this.password = password;
 }

 public String getName() {
     return name;
 }

 public void setName(String name) {
     this.name = name;
 }

 public String getPhone() {
     return phone;
 }

 public void setPhone(String phone) {
     this.phone = phone;
 }

 public String getEmail() {
     return email;
 }

 public void setEmail(String email) {
     this.email = email;
 }

 public String getIntro() {
     return intro;
 }

 public void setIntro(String intro) {
     this.intro = intro;
 }

 public String getArea() {
     return area;
 }

 public void setArea(String area) {
     this.area = area;
 }

 public boolean getState() {
     return state;
 }

 public void setState(boolean state) {
     this.state = state;
 }

 @Override
 public String toString() {
	return "EngineerDTO [engnum=" + engnum + ", id=" + id + ", password=" + password + ", name=" + name + ", phone="
			+ phone + ", email=" + email + ", intro=" + intro + ", area=" + area + ", state=" + state + "]";
 }

 
 
}