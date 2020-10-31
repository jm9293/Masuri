package com.masuri.dto;

import java.sql.Date;

//엔지니어 일간 스케줄(일일 스케줄) 
public class DayscheduleDTO {

 // 기사ID 
 private String engid;

 // 해당일 
 private Date day;

 // TIME1 
 private Integer time1;

 // TIME2 
 private Integer time2;

 // TIME3 
 private Integer time3;

 public String getEngid() {
     return engid;
 }

 public void setEngid(String engid) {
     this.engid = engid;
 }

 public Date getDay() {
     return day;
 }

 public void setDay(Date day) {
     this.day = day;
 }

 public Integer getTime1() {
     return time1;
 }

 public void setTime1(Integer time1) {
     this.time1 = time1;
 }

 public Integer getTime2() {
     return time2;
 }

 public void setTime2(Integer time2) {
     this.time2 = time2;
 }

 public Integer getTime3() {
     return time3;
 }

 public void setTime3(Integer time3) {
     this.time3 = time3;
 }

	@Override
	public String toString() {
		return "DayscheduleDTO [engid=" + engid + ", day=" + day + ", time1=" + time1 + ", time2=" + time2 + ", time3="
				+ time3 + "]";
	}


}