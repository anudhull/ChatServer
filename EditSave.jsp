 
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
    </head>
    <body>
        <%
          String uid=session.getAttribute("uid")+"";
          DiskFileItemFactory fact=new DiskFileItemFactory();
          ServletFileUpload upl=new ServletFileUpload(fact);
          List items=upl.parseRequest(request);
          FileItem a,b,c,d;
         /* out.println(items.size());*/
          
          a=(FileItem)items.get(0);
          b=(FileItem)items.get(1);
          c=(FileItem)items.get(2);
          d=(FileItem)items.get(3);
          
          String un,gen,pic,coun,fname;
           
          un=a.getString();
          
          gen=b.getString();
          coun=c.getString();
          pic=d.getName();
         int i=pic.lastIndexOf("\\");
          pic=pic.substring(i+1);
          
          fname="C:\\Chat\\Web\\"+pic;
          File fl=new File(fname);
          d.write(fl);
          Connection con;
          PreparedStatement pstm;
             try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ChatDB","root","dhullanu");
             pstm=con.prepareStatement("update Users set UserName=? , Gender=? , Country=? , Photograph=? where UserId=?");
            pstm.setString(1,un);
            pstm.setString(2,gen);
            pstm.setString(3,coun);
            pstm.setString(4,pic);
            pstm.setString(5,uid);
            pstm.executeUpdate();
            out.println("<div style='padding:100px 100px 50px 200px; background-color:#80ffbf; color:#9900cc;'><h2 align=center>You have successfully updated your info.</h2></div><center><img src='smile.png'/>");
            con.close();
        } 
        catch(Exception ex)
            
        {
            out.println(ex.toString());
        }
       %>
    </body>
</html>
