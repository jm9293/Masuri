package com.masuri.dto;

//자주묻는질문 
public class FaqDTO {

 // 질문번호 
 private Integer num;

 // 질문 
 private String question;

 // 답변 
 private String answer;

 public Integer getNum() {
     return num;
 }

 public void setNum(Integer num) {
     this.num = num;
 }

 public String getQuestion() {
     return question;
 }

 public void setQuestion(String question) {
     this.question = question;
 }

 public String getAnswer() {
     return answer;
 }

 @Override
public String toString() {
	return "FaqDTO [num=" + num + ", question=" + question + ", answer=" + answer + "]";
}

public void setAnswer(String answer) {
     this.answer = answer;
 }


}