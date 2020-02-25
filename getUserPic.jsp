<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Get User Pic</title>
    </head>
    <body>
        <%
        try
                               {
        String uid=request.getParameter("uid");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ChatDB","root","dhullanu");
        PreparedStatement pstm=con.prepareStatement("select * from Users where UserId=?");
        pstm.setString(1,uid);
        ResultSet rs=pstm.executeQuery();
        rs.next();
        String unm=rs.getString(3);
        String pic=rs.getString(6);
        out.println("<br/><br/><h3 align=center>"+unm+"</h3><img src='"+pic+"' width=250 height=300 />");
               }catch(Exception e)
               {
               out.println(e.toString());
               
               }
        %>
    </body>
</html>
