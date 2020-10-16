package com.masuri.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator{
	final String ID = "masuri1019";
	final String PW = "ma201019!";
	
	@Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(ID,PW);
    }

}
