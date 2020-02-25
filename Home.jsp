 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <script>
            function onlineUsers()
            {
                x=new XMLHttpRequest();
                x.onreadystatechange=function()
                {
                    if(x.readyState==4 && x.status==200)
                        {
                            document.getElementById("ulistdiv").innerHTML=x.responseText;
                        }
                }
                x.open("GET","getOnlineUsers.jsp",true);
                x.send();
                setTimeout(onlineUsers,3000);
            }
            function LoadChatUser()
            {
                i=document.getElementById("ulist").selectedIndex;
                uid=document.getElementById("ulist").options[i].value;
  
                x=new XMLHttpRequest()
                x.open("GET","getUserPic.jsp?uid="+uid,true);
                x.onreadystatechange=function()
                {
                    if(x.readyState==4 && x.status==200)
                        document.getElementById("pic").innerHTML=x.responseText;
                }
                x.send();
            }
            function sendMessage()
            {
                msg=document.getElementById("msg").value;
                i=document.getElementById("ulist").selectedIndex;
                tuid=document.getElementById("ulist").options[i].value;
                x=new XMLHttpRequest();
                x.open("GET","SaveChatMessage.jsp?tuid="+tuid+"&msg="+msg,true);
                x.onreadystatechange=function()
                {
                    
                }
                x.send();
            }
        </script>
        <style>
            input[type=button]
            {
                background-color: green;
                color: white;
                padding:3px 3px 3px 3px;
            }
        </style>
    </head>
    <body onload="onlineUsers()">
        <table width="100%">
            <tr>
                <td><h2>Choose a friend with <br/>whom you want to chat</h2><br/>
                  <div id="ulistdiv">
                  </div></td>    
                  <td>
                      <h2 id="cbunm" align="center">Chat Box</h2><br/></br>
                      <textarea id="cb" rows="20" cols="100"></textarea><br/>
                      <input type="text" id="msg" size="90" placeholder="Write Message" /><input type="button" value="Send" onclick="sendMessage()"  /> 
                      <input type="button" value="Clear Chat Session" onclick="clearChat()" style='margin-left:6.5em;' />
                  </td>
                  <td id="pic" >
                      <img  alt="Not Choosen Yet" /></td>
            </tr>
        </table>
    </body>
</html>
