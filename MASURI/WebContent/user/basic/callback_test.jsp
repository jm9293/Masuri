

<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>


<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "7x13p0LGy9xlnMVuk3UD";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "XReP301ZZS";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://127.0.0.1:8080/MASURI/user/basic/callback_test.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    StringBuffer res =null;
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
    			System.out.println(res.toString());
    			JSONParser parsing = new JSONParser();
    			Object obj = parsing.parse(res.toString());
    			JSONObject jsonObj = (JSONObject)obj;
    				        
    			access_token = (String)jsonObj.get("access_token");
   				System.out.print(access_token);
      }
      
      if(access_token != null) { // access_token을 잘 받아왔다면
    		try {
    	    	
    			
    			
    			
    	    } catch (Exception e) {
    	    	e.printStackTrace();
    	    }
    	}
      
      
      
      
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
  </body>

</html>