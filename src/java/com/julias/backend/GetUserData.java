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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author julia
 */
public class GetUserData extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doService(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        doService(req, resp);
    }
    
    protected void doService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email2 ;
        
        try
        {
            email2 = req.getParameter("email1");
            
            if( email2 == null || email2.equals("null") )
            {
                email2 = (String) req.getAttribute("email1");
            }
        }
        catch(Exception e)
        {
            email2 = (String) req.getAttribute("email1");
        }
        
        String name2 = "" , gender2 = "" , field2 = "" , city2 = "" , about2 = "" , skills2 = "" ;
        
        Connection con = null ;
        PreparedStatement ps = null ;
        PreparedStatement ps2 = null ;
        PreparedStatement ps3 = null ;
        ResultSet rs = null ;
        ResultSet rs2 = null ;
        ResultSet rs3 = null ;
        
        String file_name = "" ;
        
        try
        {
            con = DBConnection.getConnect();
                
            ps = con.prepareStatement("SELECT * FROM register WHERE email=?");
                
            ps2 = con.prepareStatement("SELECT * FROM about_user WHERE email=?");
            
            ps.setString(1, email2);
            
            ps2.setString(1, email2);
            
            rs = ps.executeQuery();
            
            rs2 = ps2.executeQuery();
            
            ps3 = con.prepareStatement("SELECT * FROM profile_pic WHERE email=?");
            
            ps3.setString(1, email2);
            
            rs3 = ps3.executeQuery();
            
            if( rs.next() && rs2.next() && rs3.next() )
            {
                name2 = rs.getString("name");
                gender2 = rs.getString("gender");
                field2 = rs.getString("field");
                city2 = rs.getString("city");
                
                HttpSession session = req.getSession();
                
                session.setAttribute("session_name", name2);
                session.setAttribute("session_email", email2);
                session.setAttribute("session_gender", gender2);
                session.setAttribute("session_field", field2);
                session.setAttribute("session_city", city2);
                
                about2 = rs2.getString("about");
                skills2 = rs2.getString("skills");
                
                session.setAttribute("session_title", about2);
                session.setAttribute("session_skills", skills2);
                
                file_name = rs3.getString("path");
                
                session.setAttribute("session_profilepic", file_name);
                
                resp.sendRedirect("profile.jsp");
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
