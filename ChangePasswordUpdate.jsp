<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password Update</title>
    </head>
    <body>
         <%
         String uid=session.getAttribute("uid")+"";
         String pwd=session.getAttribute("pwd")+"";
         String cp=request.getParameter("cp");
         String np=request.getParameter("np");
         Connection con;
         PreparedStatement pstm;
                
        
         if(pwd.equals(cp))
         { 
              try
              {
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ChatDB","root","dhullanu");
                pstm=con.prepareStatement("update Users set Password=? where UserId=?");
                pstm.setString(1,np);
                pstm.setString(2,uid);
                pstm.executeUpdate();
                out.println("<div style='padding:100px 100px 50px 200px; background-color:#80ffbf; color:#9900cc;'><h2 align=center>Password successfully changed</h2></div><center><img src='smile.png'/>");
                con.close();
               }
              catch(Exception e)
              {
             out.println(e.toString());
              }
             
         }
         
         else
            out.println("<div style='padding:100px 100px 50px 200px; background-color:#80ffbf; color:#9900cc;'><h2 align=center>Invalid Current Password</h2></div><center><img src='sad.jpg'/>");
         
         
             
         %>
    </body>
</html>
