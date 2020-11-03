package com.masuri.user.command;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.masuri.command.Command;
import com.masuri.dao.UserDAO;
import com.masuri.dto.UserDTO;
import com.masuri.file.DefaultImgSet;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.net.URLEncoder;
import java.net.URL;
import java.net.HttpURLConnection;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

public class NaverLoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String clientId = "7x13p0LGy9xlnMVuk3UD";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "XReP301ZZS";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI =null;
		try {
			redirectURI = URLEncoder.encode("http://localhost:8080/MASURI/user/basic/navercallback.do", "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
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
	    			JSONParser parsing = new JSONParser();
	    			Object obj = parsing.parse(res.toString());
	    			JSONObject jsonObj = (JSONObject)obj;
	    				        
	    			access_token = (String)jsonObj.get("access_token");
	   				System.out.print(access_token);
	      }
	      
	      if(access_token != null) { // access_token을 잘 받아왔다면
	    		try {
	    	    int resNum =  getProperty(access_token,request,response);	
	    			
	    		
	    			request.setAttribute("res", resNum);
	    			
	    	    } catch (Exception e) {
	    	    	request.setAttribute("res", 0);
	    	    }
	    	}
	      
	      
	      
	      
	    } catch (Exception e) {
	      System.out.println(e);
	    }

	}
	
	int getProperty(String access_token , HttpServletRequest request ,HttpServletResponse response) {
		try {
			
			 String header = "Bearer " + access_token;
			String apiurl = "https://openapi.naver.com/v1/nid/me";
			 URL url = new URL(apiurl);
			 HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println(responseCode);
			if(responseCode==200) { // 정상 호출
			 br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			 while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
			}
			br.close();
			
			JSONParser parsing = new JSONParser();
			Object obj = parsing.parse(res.toString());
			JSONObject jsonObj = (JSONObject)obj;
			JSONObject resObj = (JSONObject)jsonObj.get("response");
			 
			//왼쪽 변수 이름은 원하는 대로 정하면 된다. 
			//단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
			String naverCode = (String)resObj.get("id");
			System.out.println(naverCode);
			String email = (String)resObj.get("email");
			System.out.println(email);
			String name = (String)resObj.get("name");
			System.out.println(name);
			
			if(UserDAO.idcheck(email.split("@")[0])) { // 해당아이디가 있다면 
				HttpSession session = request.getSession();
				session.setAttribute("login", email.split("@")[0]);
				LoginCommand.Users.put(email.split("@")[0], session);
				return 1;
			}else {
				UserDTO newuser = new UserDTO();
				newuser.setName(name);
				newuser.setEmail(email);
				newuser.setPassword(naverCode);
				newuser.setId(email.split("@")[0]);
				newuser.setPhone("01000000000");
				int resNum = UserDAO.insert(newuser);
				if(resNum==1) {
					HttpSession session = request.getSession();
					session.setAttribute("login", email.split("@")[0]);
					LoginCommand.Users.put(email.split("@")[0], session);
				   DefaultImgSet.imgSet(request, "userimg", email.split("@")[0]);
				   return 2;
				}else {
					return 0;
				}
				
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		 
		
	}

}
