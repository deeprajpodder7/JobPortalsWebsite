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

/**
 *
 * @author julia
 */
public class SimpleJobSearchWithLocation extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String location = req.getParameter("location");
        
        String id = "" , job_profile = "" , company = "" , experience = "" , salary = "" , job_location = "" , description = "" , date1 = "" , time1 = "" ;
        
        Connection con = null ;
        
        try
        {
            con = DBConnection.getConnect();
            
            PreparedStatement ps = con.prepareStatement("SELECT * FROM jobs WHERE job_location LIKE '%"+location+"%'");
            
            //ps.setString(1, tech1);
            
            ResultSet rs = ps.executeQuery();
            
            while( rs.next() )
            {
                id = rs.getString("id");
                job_profile = rs.getString("job_profile");
                company = rs.getString("company");
                experience = rs.getString("experience");
                salary = rs.getString("salary");
                job_location = rs.getString("job_location");
                description = rs.getString("description");
                date1 = rs.getString("date1");
                time1 = rs.getString("time1");
                
                out.print("<div class=\"col-md-12 display_job_div\" style=\"border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;\" >\n" +
"                                <b style=\"font-size: 20px; color: blue;\"> "+job_profile+"</b> <span style=\"color: #6cd1fb; float: right;\"> ("+date1+"&&nbsp;"+time1+") </span>  <br>\n" +
"                                <span> <i class='fas fa-building'></i> "+company+ "</span> <br>\n" +
"                                <span> <i class=\"glyphicon glyphicon-briefcase\"></i> "+experience+"</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"                                <span> <i class=\"fa fa-inr\"></i> "+salary+" </span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"                                <span> <i class=\"glyphicon glyphicon-map-marker\"></i> "+job_location+"</span><br>\n" +
"                                <span> <i class=\"glyphicon glyphicon-file\"></i> "+description+"</span> <br>\n" +
"                                <span> <i class=\"glyphicon glyphicon-upload\"></i> "+date1+" </span><br><br>\n" +
"                                <a href=\"job-description.jsp?id="+id+"\" class=\"another_hyperlink\" > See Full Details </a>\n" +
"                            </div>");
                
            }
            
        }
        catch(Exception e)
        {
            out.print(e);
        }
        finally
        {
            try
            {
                con.close();
            }
            catch(Exception ee)
            {
                out.print(ee);
            }
        }
    }
    
}
