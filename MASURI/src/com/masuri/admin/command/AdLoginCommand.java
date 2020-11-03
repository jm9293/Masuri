package com.masuri.admin.command;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.masuri.command.Command;
import com.masuri.dao.AdminDAO;

public class AdLoginCommand implements Command {
   
   public static final HashMap<String,HttpSession> admin = new HashMap<String,HttpSession>();
   
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      // TODO Auto-generated method stub
      try {
         request.setCharacterEncoding("utf-8");
         String adminID = request.getParameter("adminID");
         String adminPW = request.getParameter("adminPW");
         
         HttpSession session = request.getSession();
         
         if(session.getAttribute("adlogin")!=null) {
            if(admin.containsKey(adminID)) {
               request.setAttribute("logincheck", 2);
            } else {
               session.removeAttribute("adlogin");
               try {
                  session.invalidate();
               } catch (Exception e) {
                  
               }
               request.setAttribute("logincheck", 3);
            }
         } else {
            boolean check =  AdminDAO.logincheck(adminID, adminPW);
            if(check) {
               session.setAttribute("adlogin", adminID);
               
               if(admin.containsKey(adminID)) {
                  try {
                     admin.get(adminID).invalidate();
                  } catch (Exception e) {
                     
                  }
                  request.setAttribute("logincheck", 4);
               } else {
                  request.setAttribute("logincheck", 0);
               }
               admin.put(adminID, session);
               
               
            } else {
               request.setAttribute("logincheck", 1);
            }
         }
         
         
         
         
         
         

      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
   }

}










