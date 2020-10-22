package com.masuri.dto;

//유저정보 
public class UserDTO {

 // 식별번호 
 private Integer usernum; 

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

 // 블랙리스트여부 
 private Boolean black;

 public Integer getUsernum() {
     return usernum;
 }

 public void setUsernum(Integer usernum) {
     this.usernum = usernum;
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

 public boolean getBlack() {
     return black;
 }

 public void setBlack(Boolean black) {
     this.black = black;
 }

 // 임시출력
 public String toString() {
		return "UserDto [usernum=" + usernum + ", id=" + id + ", password=" + password + ", name=" + name + ", phone="
				+ phone + ", email=" + email + ", black=" + black + "]";
 }
 
}