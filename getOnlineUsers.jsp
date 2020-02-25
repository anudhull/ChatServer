<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Get Online Users</title>
    </head>
    <body>
        <%
        Connection con;
        PreparedStatement pstm;
        ResultSet rs;
        String uid,unm;
        try
                               {
          Class.forName("com.mysql.jdbc.Driver");
          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ChatDB","root","dhullanu");
          pstm=con.prepareStatement("select * from CurrentUsers");
   
          rs=pstm.executeQuery();
          out.println("<select onchange='LoadChatUser()' id=ulist size=20>");
          while(rs.next())
                    {
              uid=rs.getString(1);
              unm=rs.getString(2);
              out.println("<option value="+uid+">"+unm+"</option>");
                    }
          out.println("</select>");
        }
        catch(Exception e)
                               {
            out.println(e.toString());
        }
        %>
    </body>
</html>
