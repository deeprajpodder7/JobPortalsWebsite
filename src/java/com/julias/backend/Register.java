package com.julias.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.julias.dbconnection.DBConnection;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class Register extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String name2 = req.getParameter("name1");
        String email2 = req.getParameter("email1");
        String pass2 = req.getParameter("pass1");
        String gender2 = req.getParameter("gender1");
        String[] field2 = req.getParameterValues("field1");
        String city2 = req.getParameter("city1");

        String fields2 = "";
        
        if( field2 != null )
        {
            for (String s : field2)
            {
                fields2 = fields2 +" "+ s ;
            }
        }

        Connection con = null ;
        PreparedStatement ps = null ;
        PreparedStatement ps2 = null ;
        PreparedStatement ps3 = null ;
        
        try
        {
            con = DBConnection.getConnect();
            
            con.setAutoCommit(false);

            ps = con.prepareStatement("INSERT INTO register (name, email, password, gender, field, city) VALUES(?,?,?,?,?,?)");
            
            ps.setString(1, name2);
            ps.setString(2, email2);
            ps.setString(3, pass2);
            ps.setString(4, gender2);
            ps.setString(5, fields2);
            ps.setString(6, city2);

            int i1 = ps.executeUpdate();
            
            ps2 = con.prepareStatement("INSERT INTO about_user(email , about , skills) VALUES(?,?,?)");
            
            ps2.setString(1, email2);
            ps2.setString(2, "");
            ps2.setString(3, "");
            
            int i2 = ps2.executeUpdate();
            
            ps3 = con.prepareStatement("INSERT INTO profile_pic(email,path) VALUES(?,?)");
            
            ps3.setString(1, email2);
            ps3.setString(2, "default_image.png");
            
            int i3 = ps3.executeUpdate();

            if ( i1 > 0 && i2 > 0 && i3 > 0 ) 
            {
                con.commit();
                
                String subject22 = "Account Created Successfully ";
                String message22 = "Welcome "+name2+" , "
                        + "\nThank You for creating account in our Job Portal website ."
                        + "\nAs soon as your account is active , And you can login your account . "
                        + "\nThanking you to co-opperate with us ."
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
                
                SendCreateAccountMail.sendCreateAccountMail(email2 , subject22 , message22);
                
                //resp.sendRedirect("login.jsp");
                HttpSession session = req.getSession();
                
                session.setAttribute("session_profilepic", "default_image.png");
                
                RequestDispatcher rd1 = req.getRequestDispatcher("header.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("menubar.jsp");
                rd2.include(req, resp);
                
                RequestDispatcher rd3 = req.getRequestDispatcher("registersuccess.jsp");
                rd3.include(req, resp);
                
                RequestDispatcher rd4 = req.getRequestDispatcher("logindiv.jsp");
                rd4.include(req, resp);
                
                RequestDispatcher rd5= req.getRequestDispatcher("footer.jsp");
                rd5.include(req, resp);
            } 
            else
            {
                con.rollback();
                
                out.print("User Register Failed");
            }
        } 
        catch (SQLException | ServletException | IOException e)
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
                ps.close();
                ps2.close();
                ps3.close();
                con.close();
            }
            catch(Exception eee)
            {
                out.print(eee);
            }
        }
    }
}
