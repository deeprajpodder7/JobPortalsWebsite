/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.julias.backend;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.julias.dbconnection.DBConnection;
import java.awt.Font;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author julia
 */
public class ResumeBuilder extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        try
        {
            //=================== GET VALUE FROM SESSION =================================
            HttpSession session = req.getSession();

            String name2 = (String) session.getAttribute("session_name");
            String email2 = (String) session.getAttribute("session_email");
            String profile_pic2 = (String) session.getAttribute("session_profilepic");

            //=================== GET VALUE FROM JSP PAGE ================================ 
            String address2 = req.getParameter("address1");
            String career2 = req.getParameter("career1");
            String hobbies2 = req.getParameter("hobbies1");
            String dateofbirth2 = req.getParameter("dateofbirth1");
            String marital2 = req.getParameter("marital1");
            String language2 = req.getParameter("language1");

            // 1. Create pdf file name
            String resume_pdf_name = email2+".pdf" ;

            // 2. Create Document class object 
            Document document = new Document();

            // 3. Get PdfWriter instance 
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(PathDetails.RESUME_BUILDER_PATH+resume_pdf_name));
        
            // 4. Open document
            document.open();
            
            // ========================== Image Start =================================
            Image image1 = Image.getInstance(PathDetails.PROFILE_PIC_PATH+profile_pic2);
            image1.scaleAbsolute(100f, 100f);
            document.add(image1);
            // ========================== Image End =================================
            
            
            // ========================== Name Start =================================
            String font_name = "Arial";
            float font_size = 20;
            int font_style = Font.BOLD;
            
            Paragraph name = new Paragraph(name2 , FontFactory.getFont(font_name, font_size, font_style, BaseColor.BLACK));
            document.add(name);
            // ========================= Name End ====================================
            
            // ========================= Email Start =================================
            int email_font_size = 10 ;
            
            Paragraph email = new Paragraph(email2 , FontFactory.getFont(font_name , email_font_size , Font.ITALIC , BaseColor.BLACK));
            document.add(email);
            // ========================= Email End =================================
            
            // ========================= For Empty Space Start ==================================
            Paragraph emptyspace = new Paragraph(" ");
            document.add(emptyspace);
            // ========================= For Empty Space End ==================================
            
            // ========================== Career Objective Header Start =================================
            String co_font_name = "Arial";
            float co_font_size = 18;
            int co_font_style = Font.BOLD;
            
            Paragraph co_header = new Paragraph("CAREER OBJECTIVE : " , FontFactory.getFont(co_font_name, co_font_size, co_font_style, BaseColor.BLUE));
            document.add(co_header);
            // ========================= Career Objective Header End ====================================
            
            // ========================== Career Objective Body Start =================================
            
            document.add(emptyspace);
            
            Paragraph co_body = new Paragraph(career2);
            document.add(co_body);
            // ========================= Career Objective Body End ====================================
            
            // ========================== Education Header Start =================================
            document.add(emptyspace);
            Paragraph edu_header = new Paragraph("EDUCATION : " , FontFactory.getFont(co_font_name, co_font_size, co_font_style, BaseColor.BLUE));
            document.add(edu_header);
            // ========================== Education Header End =================================
            
            // ========================== Education Body Start =================================
            document.add(emptyspace);
            
            PdfPTable table = new PdfPTable(5);
            
            table.setSpacingBefore(20);
            
            PdfPCell c1 = new PdfPCell(new Phrase("Year"));
            table.addCell(c1);
            
            PdfPCell c2 = new PdfPCell(new Phrase("Institute"));
            table.addCell(c2);
            
            PdfPCell c3 = new PdfPCell(new Phrase("Degree"));
            table.addCell(c3);
            
            PdfPCell c4 = new PdfPCell(new Phrase("Field"));
            table.addCell(c4);
            
            PdfPCell c5 = new PdfPCell(new Phrase("Grade"));
            table.addCell(c5);
            
            String collegee1 = "" , degreee1 = "" , fieldd1 = "" , start_yearr1 = "" , end_yearr1 = "" , gradee1 = "" ;
            Connection con1 = null ;
            
            try
            {
                con1 = DBConnection.getConnect();
                
                PreparedStatement ps = con1.prepareStatement("SELECT * FROM education WHERE email=?");
                ps.setString(1, email2);
                ResultSet rs = ps.executeQuery();
                
                while( rs.next() )
                {
                    collegee1 = rs.getString("school_college");
                    degreee1 = rs.getString("degree");
                    fieldd1 = rs.getString("field_of_study");
                    start_yearr1 = rs.getString("start_year");
                    end_yearr1 = rs.getString("end_year");
                    gradee1 = rs.getString("grade");
                    
                    table.addCell(start_yearr1+" - "+end_yearr1);
                    table.addCell(collegee1);
                    table.addCell(degreee1);
                    table.addCell(fieldd1);
                    table.addCell(gradee1);
                    
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
                    con1.close();
                }
                catch(Exception ee)
                {
                    out.print(ee);
                }
            }
            
            document.add(table);
            // ========================= Education Body End ====================================
            
            // ========================== Experience Header Start =================================
            document.add(emptyspace);
            Paragraph exp_header = new Paragraph("EXPERENCE : " , FontFactory.getFont(co_font_name, co_font_size, co_font_style, BaseColor.BLUE));
            document.add(exp_header);
            // ========================== Experience Header End =================================
            
            // ========================== Experience Body Start =================================
            document.add(emptyspace);
            
            PdfPTable table2 = new PdfPTable(5);
            
            table2.setSpacingBefore(20);
            
            PdfPCell ec1 = new PdfPCell(new Phrase("Year"));
            table2.addCell(ec1);
            
            PdfPCell ec2 = new PdfPCell(new Phrase("Company"));
            table2.addCell(ec2);
            
            PdfPCell ec3 = new PdfPCell(new Phrase("Location"));
            table2.addCell(ec3);
            
            PdfPCell ec4 = new PdfPCell(new Phrase("Employment Type"));
            table2.addCell(ec4);
            
            PdfPCell ec5 = new PdfPCell(new Phrase("Description"));
            table2.addCell(ec5);
            
            String companyy1 = "" , locationn1 = "" , start_yearr11 = "" , end_yearr11 = "" , employement_typee11 = "" , descriptionn1 = "" ;
            Connection con2 = null ;
            
            try
            {
                con2 = DBConnection.getConnect();
                
                PreparedStatement ps1 = con2.prepareStatement("SELECT * FROM experience WHERE email=?");
                ps1.setString(1, email2);
                ResultSet rs1 = ps1.executeQuery();
                
                while( rs1.next() )
                {
                    companyy1 = rs1.getString("company");
                    locationn1 = rs1.getString("location");
                    start_yearr11 = rs1.getString("start_year");
                    end_yearr11 = rs1.getString("end_year");
                    employement_typee11 = rs1.getString("employement_type");
                    descriptionn1 = rs1.getString("description");
                    
                    table2.addCell(start_yearr11+" - "+end_yearr11);
                    table2.addCell(companyy1);
                    table2.addCell(locationn1);
                    table2.addCell(employement_typee11);
                    table2.addCell(descriptionn1);
                    
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
                    con2.close();
                }
                catch(Exception ee)
                {
                    out.print(ee);
                }
            }
            
            document.add(table2);
            // ========================= Experience Body End ====================================
            
            // ========================== Activities Header Start =================================
            document.add(emptyspace);
            Paragraph activities = new Paragraph("ACTIVITIES : " , FontFactory.getFont(co_font_name, co_font_size, co_font_style, BaseColor.BLUE));
            document.add(activities);
            // ========================== Activities Header End =================================
            
            // ========================== Activities Body Start =================================
            document.add(emptyspace);
            
            PdfPTable table3 = new PdfPTable(1);
            
            table3.setSpacingBefore(20);
            
            PdfPCell mec1 = new PdfPCell(new Phrase("PARTICIPATED ACTIVITIES"));
            table3.addCell(mec1);
            
            String achivement = "" ;
            Connection con3 = null ;
            int count = 1 ;
            
            try
            {
                con3 = DBConnection.getConnect();
                
                PreparedStatement ps2 = con3.prepareStatement("SELECT * FROM education WHERE email=?");
                ps2.setString(1, email2);
                ResultSet rs2 = ps2.executeQuery();
                
                while( rs2.next() )
                {
                    achivement = rs2.getString("description");
                    table3.addCell(count+". "+achivement);
                    count++;
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
                    con3.close();
                }
                catch(Exception ee)
                {
                    out.print(ee);
                }
            }
            document.add(table3);
            // ========================= Activities Body End ====================================
            
            // ========================== Hobbies Header Start =================================
            document.add(emptyspace);
            
            Paragraph hobbies = new Paragraph("HOBBIES / INTERESTS : " , FontFactory.getFont(co_font_name, co_font_size, co_font_style, BaseColor.BLUE));
            document.add(hobbies);
            // ========================= Hobbies Header End ====================================
            
            // ========================== Hobbies Body Start =================================
            
            document.add(emptyspace);
            
            Paragraph hobbies_body = new Paragraph(hobbies2);
            document.add(hobbies_body);
            // ========================= Hobbies Body End ====================================
            
            // ========================== Personal Information Header Start =================================
            document.add(emptyspace);
            
            Paragraph personal_status  = new Paragraph("PERSONAL INFORMATION : " , FontFactory.getFont(co_font_name, co_font_size, co_font_style, BaseColor.BLUE));
            document.add(personal_status);
            // ========================= Personal Information Header End ====================================
            
            // ========================== Personal Information Body Start =================================
            
            document.add(emptyspace);
            
            Paragraph dob = new Paragraph("Date Of Birth : "+dateofbirth2);
            document.add(dob);
            
            Paragraph material_status = new Paragraph("Gender / Marital Status : "+marital2);
            document.add(material_status);
            
            Paragraph language = new Paragraph("LanguageProficiency : "+language2);
            document.add(language);
            
            Paragraph address = new Paragraph("Address : "+address2);
            document.add(address);
            // ========================= Personal Information Body End ====================================
            
            // ========================== DECLARATION Header Start =================================
            document.add(emptyspace);
            
            Paragraph declaration = new Paragraph("DECLARATION : " , FontFactory.getFont(co_font_name, co_font_size, co_font_style, BaseColor.BLUE));
            document.add(declaration);
            // ========================= DECLARATION Header End ====================================
            
            // ========================== DECLARATION Body Start =================================
            
            document.add(emptyspace);
            
            String my_declaration = "I do hereby declare that the above information is true to the best of my knowledge." ;
            
            Paragraph declaration_body = new Paragraph(my_declaration);
            document.add(declaration_body);
            
            document.add(emptyspace);
            
            Paragraph l_name = new Paragraph("Name : "+name2);
            document.add(l_name);
            
            document.add(emptyspace);
            
            Date d = new Date();
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
            
            Paragraph datee = new Paragraph("Date : "+sdf1.format(d));
            document.add(datee);
            
            // ========================= DECLARATION Body End ====================================
            
            // Last Step : close the document
            document.close();
            
            resp.sendRedirect("profile.jsp");
            
        }
        catch(Exception e)
        {
            out.print(e);
        }
        
    }
    
}
