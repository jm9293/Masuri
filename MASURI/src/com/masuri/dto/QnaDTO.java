package com.masuri.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

//상담게시판 
public class QnaDTO {

 // 게시글번호 
 private Integer num;

 // 작성유저ID 
 private String userid;

 // 공개여부 
 private boolean open;

 // 제목 
 private String title;

 // 내용 
 private String content;

 // 조회수 
 private Integer viewcount;

 // 작성시간 
 private Timestamp wrtime;

 // 답변 
 private String answer;

 // 답변작성시간 
 private Timestamp antime;

 public Integer getNum() {
     return num;
 }

 public void setNum(Integer num) {
     this.num = num;
 }

 public String getUserid() {
     return userid;
 }

 public void setUserid(String userid) {
     this.userid = userid;
 }

 public boolean getOpen() {
     return open;
 }

 public void setOpen(boolean open) {
     this.open = open;
 }

 public String getTitle() {
     return title;
 }

 public void setTitle(String title) {
     this.title = title;
 }

 public String getContent() {
     return content;
 }

 public void setContent(String content) {
     this.content = content;
 }

 public Integer getViewcount() {
     return viewcount;
 }

 public void setViewcount(Integer viewcount) {
     this.viewcount = viewcount;
 }

 public Timestamp getWrtime() {
     return wrtime;
 }

 public void setWrtime(Timestamp wrtime) {
     this.wrtime = wrtime;
 }

 public String getAnswer() {
     return answer;
 }

 public void setAnswer(String answer) {
     this.answer = answer;
 }

 public Timestamp getAntime() {
     return antime;
 }

 public void setAntime(Timestamp antime) {
     this.antime = antime;
 } 

//@Override
//public String toString() {
//	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//	return "QnaDto [num=" + num + ", userid=" + userid + ", open=" + open + ", title=" + title + ", content=" + content
//			+ ", viewcount=" + viewcount + ", wrtime=" + sdf.format(wrtime) + ", answer=" + answer + ", antime=" + sdf.format(antime) + "]";
//}



}
