 <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Save</title>
    </head>
    <body>
        <%
          DiskFileItemFactory fact=new DiskFileItemFactory();
          ServletFileUpload upl=new ServletFileUpload(fact);
          List items=upl.parseRequest(request);
          FileItem a,b,c,d,e,f,g;
         /* out.println(items.size());*/
          
          a=(FileItem)items.get(0);
          b=(FileItem)items.get(1);
          c=(FileItem)items.get(2);
          d=(FileItem)items.get(3);
          e=(FileItem)items.get(4);
          f=(FileItem)items.get(5);
          g=(FileItem)items.get(6);
          String uid,pwd,un,gen,pic,coun,fname;
          uid=a.getString();
          un=b.getString();
          pwd=c.getString();
          gen=e.getString();
          coun=f.getString();
          pic=g.getName();
         int i=pic.lastIndexOf("\\");
          pic=pic.substring(i+1);
          
          fname="C:\\Chat\\Web\\"+pic;
          File fl=new File(fname);
          g.write(fl);
          Connection con;
          PreparedStatement pstm;
             try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ChatDB","root","dhullanu");
            pstm=con.prepareStatement("insert into Users values(?,?,?,?,?,?)");
            pstm.setString(1,uid);
            pstm.setString(2,pwd);
            pstm.setString(3,un);
            pstm.setString(4,gen);
            pstm.setString(5,coun);
            pstm.setString(6,pic);
            pstm.executeUpdate();
            out.println("<div style='padding:100px 100px 50px 200px; background-color:#80ffbf; color:#9900cc;'><h2 align=center>You have successfully created your account.</h2></div><center><img src='smile.png'/>");
            con.close();
        } 
        catch(Exception ex)
            
        {
            out.println(ex.toString());
        }
    
        %>
    </body>
</html>
