<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <style>
            body
            {
                background-color:  #99ebff;
            }
            table{
              border: 4px solid blue;
              border-style: dashed double dashed;
            }
            td{
                padding:20px 20px 20px 20px;
                font-size: 20px;
            }
            .a{
                background-color: green;
                color: white;
                padding:3px 3px 3px 3px;
            }
        </style>
    </head>
    <body>
      <%
      String uid;
      uid=session.getAttribute("uid")+"";
      Connection con;
      PreparedStatement pstm;
      ResultSet rs;
      try
      {
          Class.forName("com.mysql.jdbc.Driver");
          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ChatDB","root","");
          pstm=con.prepareStatement("select * from Users where UserId=?");
          pstm.setString(1,uid);
          rs=pstm.executeQuery();
          rs.next();
          String unm,pwd,gen,coun,pic;
          unm=rs.getString(3);
          pwd=rs.getString(2);
          gen=rs.getString(4);
          coun=rs.getString(5);
          pic=rs.getString(6);
 
          out.println("<table align=center><tr><td><u>User Id</u> : </td><td>"+uid+"</td>");
          out.println("<td rowspan=5><img src="+pic+" width=200 height=150 /></tr><td><u>User Name</u> : </td><td>"+unm+"</td></tr><tr><td><u>Gender</u> : </td><td>"+gen+"</td></tr><tr><td><u>Country</u> : </td><td>"+coun+"</td></tr>");
          out.println("</table>");
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
