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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author julia
 */
public class EditProfileAbout extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        String email2 = (String) session.getAttribute("session_email");
        
        String name2 = req.getParameter("name1");
        String gender2 = req.getParameter("gender1");
        String city2 = req.getParameter("city1");
        String title2 = req.getParameter("title1");
        String skill2 = req.getParameter("skill1");
        
        Connection con = null ;
        PreparedStatement ps1 = null ;
        PreparedStatement ps2 = null ;
        
        try
        {
            con = DBConnection.getConnect();
            
            con.setAutoCommit(false);
            
            ps1 = con.prepareStatement("UPDATE register SET name=? , city=? , gender=? WHERE email=?");
            
            ps1.setString(1, name2);
            ps1.setString(2, city2);
            ps1.setString(3, gender2);
            ps1.setString(4, email2);
            
            int i1 = ps1.executeUpdate();
            
            ps2 = con.prepareStatement("UPDATE about_user SET about=? , skills=? WHERE email=?");
            
            ps2.setString(1, title2);
            ps2.setString(2, skill2);
            ps2.setString(3, email2);
            
            int i2 = ps2.executeUpdate();
            
            if( i1 > 0 && i2 > 0 )
            {
                con.commit();
                
                session.setAttribute("session_name", name2);
                session.setAttribute("session_email", email2);
                session.setAttribute("session_gender", gender2);
                session.setAttribute("session_city", city2);
                
                session.setAttribute("session_title", title2);
                session.setAttribute("session_skills", skill2);
                
                resp.sendRedirect("profile.jsp");
            }
            else
            {
                con.rollback();
                
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("edit-profile-about.jsp");
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
                ps1.close();
                ps2.close();
                con.close();
            }
            catch(Exception eee)
            {
                out.print(eee);
            }
        }
    }
    
}
