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
import java.sql.SQLException;
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
public class AddExperienceDetails extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        
        String email2 = (String) session.getAttribute("session_email");
        
        String company2 = req.getParameter("company1");
        String location2 = req.getParameter("location1");
        String startmonth2 = req.getParameter("startmonth1");
        String startyear2 = req.getParameter("startyear1");
        String endmonth2 = req.getParameter("endmonth1");
        String endyear2 = req.getParameter("endyear1");
        String employmenttype2 = req.getParameter("employmenttype1");
        String description2 = req.getParameter("description1");
        
        Connection con = null ;
        PreparedStatement ps = null ;
        
        try
        {
            con = DBConnection.getConnect();
            
            con.setAutoCommit(false);
                
            ps = con.prepareStatement("INSERT INTO experience(email, company, location, start_month, start_year, end_month, end_year, employement_type, description ) VALUES(?,?,?,?,?,?,?,?,?)");
            
            ps.setString(1, email2);
            ps.setString(2, company2);
            ps.setString(3, location2);
            ps.setString(4, startmonth2);
            ps.setString(5, startyear2);
            ps.setString(6, endmonth2);
            ps.setString(7, endyear2);
            ps.setString(8, employmenttype2);
            ps.setString(9, description2);
            
            int i = ps.executeUpdate();
            
            if( i > 0 )
            {
                con.commit();
                resp.sendRedirect("profile.jsp");
            }
            else
            {
                con.rollback();
                
                req.setAttribute("failed_message", "Experience Added Failed, Please Fill All Fields...!!!");
                
                RequestDispatcher rd1 = req.getRequestDispatcher("message-send-failed.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("add-experience-details.jsp");
                rd2.include(req, resp);
            }
        }
        catch(SQLException | IOException | ServletException e)
        {
            try
            {
                con.rollback();
                
                req.setAttribute("failed_message", "Experience Added Failed, Please Fill All Fields...!!!");
                
                RequestDispatcher rd1 = req.getRequestDispatcher("message-send-failed.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("add-experience-details.jsp");
                rd2.include(req, resp);
            }
            catch(SQLException | ServletException | IOException ee)
            {
                out.print(ee);
            }
        }
        finally
        {
            try
            {
                ps.close();
                con.close();
            }
            catch(Exception eee)
            {
                out.print(eee);
            }
        }
    }
    
}
