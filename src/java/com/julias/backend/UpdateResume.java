/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.julias.backend;

import com.julias.dbconnection.DBConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author julia
 */
public class UpdateResume extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        
        String email = (String) session.getAttribute("session_email");
        
        String file_name = null ;
        
        try
        {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(factory);
            List<FileItem> items = sfu.parseRequest(req);
            FileItem item = items.get(0);
            String file_path = item.getName();
            File file = new File(file_path);
            file_name = file.getName();
            
            File f1 = new File(PathDetails.RESUME_PATH+file_name);
            item.write(f1);
        }
        catch(Exception e)
        {
            //out.print(e);
        }
        
        Connection con = null;
        
        
        if( file_name == null || file_name.equals("") )
        {
            req.setAttribute("failed_message", "Resume can't be Selected, Please Select Any Resume...!!!");

            RequestDispatcher rd1 = req.getRequestDispatcher("message-send-failed.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2 = req.getRequestDispatcher("upload-resume.jsp");
            rd2.include(req, resp);
        }
        else
        {
            try
            {
                con = DBConnection.getConnect();

                con.setAutoCommit(false);

                PreparedStatement ps1 = con.prepareStatement("SELECT * FROM resume WHERE email=?");

                ps1.setString(1, email);

                ResultSet rs = ps1.executeQuery();

                if( rs.next() )
                {
                    // If the value is present in our database , then we write Update Query

                    PreparedStatement ps2 = con.prepareStatement("UPDATE resume SET path=? WHERE email=?");

                    ps2.setString(1, file_name);
                    ps2.setString(2, email);

                    int i = ps2.executeUpdate();

                    if( i > 0 )
                    {
                        con.commit();
                        resp.sendRedirect("profile.jsp");
                    }
                    else
                    {
                        con.rollback();

                        req.setAttribute("failed_message", "Resume can't be Selected, Please Select Any Resume...!!!");

                        RequestDispatcher rd1 = req.getRequestDispatcher("message-send-failed.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("upload-resume.jsp");
                        rd2.include(req, resp);
                    }

                }
                else
                {
                    // If the value is not present in our database , then we write Insert Query

                    PreparedStatement ps3 = con.prepareStatement("INSERT INTO resume(email , path) VALUES(?,?)");

                    ps3.setString(1, email);
                    ps3.setString(2, file_name);

                    int i = ps3.executeUpdate();

                    if( i > 0 )
                    {
                        con.commit();
                        resp.sendRedirect("profile.jsp");
                    }
                    else
                    {
                        con.rollback();

                        req.setAttribute("failed_message", "Resume can't be Selected, Please Select Any Resume...!!!");

                        RequestDispatcher rd1 = req.getRequestDispatcher("message-send-failed.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("upload-resume.jsp");
                        rd2.include(req, resp);
                    }

                }

            }
            catch(SQLException | IOException | ServletException e)
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
    
}
