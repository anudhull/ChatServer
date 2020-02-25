<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>J\Sign OUt</title>
    </head>
    <body>
       <%
       String uid=session.getAttribute("uid")+"";
       Connection con;
       PreparedStatement pstm;
       try
       {
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ChatDB","root","");
           pstm=con.prepareStatement("delete from CurrentUsers where UserId=?"); 
           pstm.setString(1,uid);
           pstm.executeUpdate();
           session.invalidate();
           response.sendRedirect("index.jsp");
       }
       catch(Exception e)
                             {
           out.println(e.toString());
       }
       %>
    </body>
</html>
