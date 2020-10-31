package com.masuri.dto;

//수리가능기종 
public class FixlistDTO {

 // 식별번호 
 private Integer num;

 // 제조사 
 private String factory;

 // 기종 
 private String model;

 public Integer getNum() {
     return num;
 }

 public void setNum(Integer num) {
     this.num = num;
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

	@Override
	public String toString() {
		return "FixlistDTO [num=" + num + ", factory=" + factory + ", model=" + model + "]";
	}

 
 
}
