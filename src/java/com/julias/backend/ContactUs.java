/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.julias.backend;

import com.julias.dbconnection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author julia
 */
public class ContactUs extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        doServices(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        doServices(req, resp);
    }
    
    protected void doServices(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String name2 = req.getParameter("name1");
        String email2 = req.getParameter("email1");
        String subject2 = req.getParameter("subject1");
        String message2 = req.getParameter("message1");
        
        Date d = new Date();
        
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
        String date1 = sdf1.format(d);
        
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
        String time1 = sdf2.format(d);
        
        Connection con = null ;
        
        try
        {
            con = DBConnection.getConnect();
            
            con.setAutoCommit(false);
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO contact_us(name , email , subject , message , date1 , time1) VALUES(?,?,?,?,?,?)");
            
            ps.setString(1, name2);
            ps.setString(2, email2);
            ps.setString(3, subject2);
            ps.setString(4, message2);
            ps.setString(5, date1);
            ps.setString(6, time1);
            
            int i = ps.executeUpdate();
            
            if( i > 0 )
            {
                con.commit();
                
                String subject22 = "Thank You "+name2+" ";
                String message22 = "Thank you for contact with us , Our team will contact you as soon as possible ."
                        + "\nAs soon as your query is solved by our teams . So to be pleased passioned . "
                        + "\nThanking you to co-opperate with us .\n"
                        + "\n\n\n\t\t\t\t\t\tThank You "+name2+""
                        + "\n\t\t\t\t\t\tPlease visit again....!!!!"
                        + "\n\n\n"
                        + "\n\t\tThis email was sent by Job Portal."
                        + "\n\t\tJulias Biswas , Java Developer "
                        + "\n\t\tNewtown , Kolkata , West Bengal , 700135"
                        + "\n\n==========----------==========----------=========="
                        + "\nNotice: The information contained in this e-mail\n" +
                            "message and/or attachments to it may contain\n" +
                            "confidential or privileged information. If you are\n" +
                            "not the intended recipient, any dissemination, use,\n" +
                            "review, distribution, printing or copying of the\n" +
                            "information contained in this e-mail message\n" +
                            "and/or attachments to it are strictly prohibited. If\n" +
                            "you have received this communication in error,\n" +
                            "please notify us by reply e-mail or telephone and\n" +
                            "immediately and permanently delete the message\n" +
                            "and any attachments. Thank you";
                
                SendConfirmationMail.sendConfirmationMail(email2 , subject22 , message22);
                
                req.setAttribute("success_message", "Message Send Successfully , We Are Replay Soon , Please Check Your Email...!!!");
                
                RequestDispatcher rd1 = req.getRequestDispatcher("message-send-successfully.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("contact-us.jsp");
                rd2.include(req, resp);
            }
            else
            {
                con.rollback();
                
                req.setAttribute("failed_message", "Message Send Failed , Please Check Try Again...!!!");
                
                RequestDispatcher rd1 = req.getRequestDispatcher("message-send-failed.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("contact-us.jsp");
                rd2.include(req, resp);
            }
            
        }
        catch(Exception e)
        {
            try
            {
                con.rollback();
            }
            catch(Exception ee)
            {
                out.print(ee);
            }
        }
        finally
        {
            try
            {
                con.close();
            }
            catch(Exception eee)
            {
                out.print(eee);
            }
        }
    }
    
}
