package com.julias.dbconnection;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.util.Properties;

/*
* static factory design pattern
*/

public class DBConnection
{
    static Connection con;
    
    public static Connection getConnect() 
    {
        String jdbc_url = null , username = null , password = null;
        
        try
        {
            InputStream is = DBConnection.class.getResourceAsStream("db.properties");
            
            Properties p = new Properties();
            p.load(is);
            
            jdbc_url = p.getProperty("jdbc-url");
            username = p.getProperty("username");
            password = p.getProperty("password");
        }
        catch(Exception ee)
        {
            ee.printStackTrace();
        }
        
        try
        {
            //Class.forName("com.mysql.jdbc.Driver");
            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
            
            /*
            * Using Connection Pooling
            */
            
            MysqlDataSource msds = new MysqlDataSource();
            
            msds.setURL(jdbc_url);
            msds.setUser(username);
            msds.setPassword(password);
            
            con = msds.getConnection();
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return con;
    }
}
