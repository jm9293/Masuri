package com.masuri.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;


//공지사항 
public class NoticeDTO {

 // 공지사항번호 
 private Integer num;

 // 제목 
 private String title;

 // 내용 
 private String content;

 // 조회수 
 private Integer viewcount;

 // 작성시간 
 private Timestamp wrtime;

 public Integer getNum() {
     return num;
 }

 public void setNum(Integer num) {
     this.num = num;
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

@Override
public String toString() {
	return "NoticeDTO [num=" + num + ", title=" + title + ", content=" + content + ", viewcount=" + viewcount
			+ ", wrtime=" + new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm:ss").format(wrtime) + "]";
}

 

}
