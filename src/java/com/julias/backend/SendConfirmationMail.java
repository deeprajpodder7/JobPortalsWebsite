/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.julias.backend;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author julia
 */
public class SendConfirmationMail 
{
    public static void sendConfirmationMail(String to_email , String subject , String message)
    {
        String from_email = "juliasbiswasproject@gmail.com" ;
        String mail_password = "JuliasJavaDeveloper" ;
        
        // 1. create an instance of properties class
        Properties props = new Properties();
        
        // we can use gmail mail server
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        Session session = Session.getInstance(props, new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from_email, mail_password);
            }
            
        });
        
        try
        {
            MimeMessage mimemsg = new MimeMessage(session);
            mimemsg.setFrom(new InternetAddress(from_email));
            mimemsg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
            mimemsg.setSubject(subject);
            mimemsg.setText(message);
            
            Transport.send(mimemsg);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
}
