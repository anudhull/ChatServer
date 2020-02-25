 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat Page</title>
        <style>
            
            body{
                margin: 0px;
                background-color: whitesmoke;
            }
            #menu
            {
                list-style-type: none;
            }
            
          #menu li{
                 float:right;
                 line-height:30px;
                 border-left:50px;
           }
           #menu li a{
               font-size: 20px;
               padding:18px;
               height:80px;
               display: inline-block;
               text-decoration:none;
               height: auto;
                }
            #menu li a:hover{
                        background-color:#ff0066;
                        display:block;
                }
 
           #green{
               float:left;
           }
           #green li{
               list-style-type: square;
               color: green;
           }
           .onlineusers
           {
               float:right;
               overflow: auto;
               border:2px solid blue;
               border-style: dashed;
           }
           .dropbtn {
           background-color: #002b80;
           color: white;
            padding: 18px;
            font-size: 18px;
            border: none;
           cursor: pointer;
           }

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
 
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color:  #ff0066 ;
}

           
        </style>
    </head>
    <body link="white" alink="white" vlink="white">
        <%
         String uid=session.getAttribute("uid")+"";
        
        Connection con;
        PreparedStatement pstm;  
        ResultSet rs;
        String pic,un;
        try
        {
           pic=session.getAttribute("pic")+"";
           un=session.getAttribute("un")+"";
          out.println("<div style='background-color:#002b80; color:white; height:70px; width:100%; background-attachment:fixed;'><ul id=menu style='margin-right:20px'><li style='float:left; margin-left:200px;'><h1 style='font=weight:bold; font-size:10;'>Let's Chat</h1></li><li style='float:right;'><div class=dropdown><button class=dropbtn>More</button><div class=dropdown-content><a href=Profile.jsp target=chat>Profile</a><a href=ChangePassword.jsp target=chat>Change Password</a><a href=Edit.jsp target=chat>Edit</a></div></div></li><li><a href=signout.jsp  style='margin-left:250px;'>Sign Out</a></li><li><h2 style='margin-left:30px;'>"+un+"</h2></li><li><img src="+pic+" height=60 width=60 style='margin-top:7px; border:3px solid white; border-style:double;'/></li><li style='margin-right:30px;'><a href=Home.jsp target=chat>Home</a></li></ul></div>");
          out.println("<div name=coverpic style='float:left; margin-top:20px; margin-left:120px;  width:50%; height:300px; background-image:url(2.jpg); background-repeat:no-repeat; background-size:cover;'><img src="+pic+" height=300 width=500 style='margin-top:110px;margin-left:50px; border-style:solid; border-radius:20'/></div> "); 
           
          String p,u;
          Class.forName("com.mysql.jdbc.Driver");
          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ChatDB","root","dhullanu");
          pstm=con.prepareStatement("select Photograph,UserName from CurrentUsers where UserId!=?");
          pstm.setString(1,uid);
          rs=pstm.executeQuery();
          out.println("<div class=onlineusers style='height:400px; width:20%;'><h2 align=center>Online Users</h2><ul id=green><table>");
          while(rs.next())
          {
              p=rs.getString(1);
              u=rs.getString(2);
              out.println("<tr><td><li>&nbsp;&nbsp;"+u+"</td><td></td>&nbsp;&nbsp;<td><img src="+p+" height=50 width=50></li></td></tr>");
          }
          out.println("</table></ul></div>");
          out.println("<div style='clear:both; width:100%; height:500px; margin-top:450px;' ><iframe width=100% height=500px name=chat src=Home.jsp></iframe></div>");
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
