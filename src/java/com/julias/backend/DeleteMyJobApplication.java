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
public class DeleteMyJobApplication extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        
        String email = (String) session.getAttribute("session_email");
        
        String jid = req.getParameter("jobid");
        
        Connection con = null ;
        
        try
        {
            con = DBConnection.getConnect();
            
            con.setAutoCommit(false);
            
            PreparedStatement ps = con.prepareStatement("DELETE FROM applied_jobs WHERE email=? AND jobid=?");
            
            ps.setString(1, email);
            ps.setString(2, jid);
            
            int i = ps.executeUpdate();
            
            if( i > 0 )
            {
                con.commit();
                
                resp.sendRedirect("my-applied-jobs.jsp");
            }
            else
            {
                con.rollback();
                
                RequestDispatcher rd1 = req.getRequestDispatcher("job-failed-applied.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("my-applied-jobs.jsp");
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
