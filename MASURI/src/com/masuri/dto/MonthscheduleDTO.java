package com.masuri.dto;

import java.sql.Date;

//엔지니어 월간 스케줄(휴무관리) 
public class MonthscheduleDTO {

 // 기사ID 
 private String engid;

 // 해당월 
 private Integer month;

 // 휴무일 
 private Date holiday;

 public String getEngid() {
     return engid;
 }

 public void setEngid(String engid) {
     this.engid = engid;
 }

 public Integer getMonth() {
     return month;
 }

 public void setMonth(Integer month) {
     this.month = month;
 }

 public Date getHoliday() {
     return holiday;	
 }

 public void setHoliday(Date holiday) {
     this.holiday = holiday;
 }


  public String toString() {
	return "MonthscheduleDTO [engid=" + engid + ", month=" + month + ", holiday=" + holiday + "]";
  }

 
}
