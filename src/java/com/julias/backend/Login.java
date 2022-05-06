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
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author julia
 */
public class Login extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email2 = req.getParameter("email1");
        String pass2 = req.getParameter("pass1");
        String remme2 = req.getParameter("rememberme1");
        
        Connection con = null ;
        PreparedStatement ps = null ;
        PreparedStatement ps2 = null ;
        PreparedStatement ps3 = null ;
        ResultSet rs = null ;
        ResultSet rs2 = null ;
        ResultSet rs3 = null ;
        
        
        try
        {
            con = DBConnection.getConnect();
                
            ps = con.prepareStatement("SELECT * FROM register WHERE email=? AND password=?");
                
            ps2 = con.prepareStatement("SELECT * FROM about_user WHERE email=?");
            
            ps.setString(1, email2);
            ps.setString(2, pass2);
            
            ps2.setString(1, email2);
            
            rs = ps.executeQuery();
            
            rs2 = ps2.executeQuery();
            
            ps3 = con.prepareStatement("SELECT * FROM profile_pic WHERE email=?");
            
            ps3.setString(1, email2);
            
            rs3 = ps3.executeQuery();
            
            if( rs.next() && rs2.next() && rs3.next() )
            {
                
                if( remme2 == null || remme2.equals("null") )
                {
                    remme2 = "" ;
                }
                
                if( remme2.equals("rememberme") )
                {
                    Cookie ck1 = new Cookie("cookie_email", email2);
                    ck1.setMaxAge(60*60*24*365);
                    resp.addCookie(ck1);
                    
                    Cookie ck2 = new Cookie("cookie_status", "true");
                    ck2.setMaxAge(60*60*24*365);
                    resp.addCookie(ck2);
                }
                
                RequestDispatcher rd = req.getRequestDispatcher("GetUserData");
                rd.include(req, resp);
                
                RequestDispatcher rd1 = req.getRequestDispatcher("index.jsp");
                rd1.include(req, resp);
                //resp.sendRedirect("profile.jsp");
            }
            else
            {
                
                //resp.sendRedirect("loginerror.jsp");
//                RequestDispatcher rd1 = req.getRequestDispatcher("header.jsp");
//                rd1.include(req, resp);
//                
//                RequestDispatcher rd2 = req.getRequestDispatcher("menubar.jsp");
//                rd2.include(req, resp);
//                
//                RequestDispatcher rd3 = req.getRequestDispatcher("loginerror.jsp");
//                rd3.include(req, resp);
//                
//                RequestDispatcher rd4 = req.getRequestDispatcher("logindiv.jsp");
//                rd4.include(req, resp);
//                
//                RequestDispatcher rd5= req.getRequestDispatcher("footer.jsp");
//                rd5.include(req, resp);
                
                req.setAttribute("failed_message", "Email & Password : Email & Password are Invalid...!!!");
            
                RequestDispatcher rd1 = req.getRequestDispatcher("message-send-failed.jsp");
                rd1.include(req, resp);

                RequestDispatcher rd2 = req.getRequestDispatcher("login.jsp");
                rd2.include(req, resp);
                
            }
        }
        catch(Exception e)
        {
            //e.printStackTrace();
            out.print(e);
        }
        finally
        {
            try
            {
                rs.close();
                rs2.close();
                rs3.close();
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
