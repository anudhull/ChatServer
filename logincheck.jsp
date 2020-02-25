 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Check</title>
    </head>
    <body>
        
        <%
          String uid,pwd,un,pic;
        Connection con;
        PreparedStatement pstm,pstm2;
        ResultSet rs;
        try {
             Class.forName("com.mysql.jdbc.Driver");
             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ChatDB","root","dhullanu");
             uid=request.getParameter("uid");
             pwd=request.getParameter("pwd");
             pstm=con.prepareStatement("select * from Users where UserId=? and Password=?");
             pstm.setString(1,uid);
             pstm.setString(2,pwd);
             rs=pstm.executeQuery();
             if(rs.next())
             {
                 session=request.getSession();
                 session.setAttribute("uid",uid);
                 session.setAttribute("pwd",pwd);
                 
                 un=rs.getString(3);
                 pic=rs.getString(6);
                 session.setAttribute("pic",pic);
                 session.setAttribute("un",un);
                 pstm2=con.prepareStatement("insert into CurrentUsers Values(?,?,?)");
                 pstm2.setString(1,uid);
                 pstm2.setString(2,un);
                 pstm2.setString(3,pic);
                 pstm2.executeUpdate();
                 
                 response.sendRedirect("ChatPage.jsp");
             }
            
            else
                out.println("<div style='padding:100px 100px 50px 200px; background-color:#80ffbf; color:#9900cc;'><h2 align=center>Please enter valid Email Id and password </h2></div><center><img src='sad.jpg'/>");
             rs.close();
             con.close();
        } 
        catch(Exception e)
        {
            out.println(e.toString());
        }
        %>
    </body>
</html>
