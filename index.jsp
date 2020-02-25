
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Front Page</title>
        <style>
            .body
            {
                margin: 0px;
            }
            .signup{
                padding:60px 50px 50px 100px;
            }
            .signin
            {  
                padding:10px 100px 20px 20px;
            }
            .img
            {
                width:50%;
                padding:20px 0px 50px 0px;
                font-family:fantasy;
                text-align: center;
            }
            .livechat
            {
                text-align: center;
                font-weight:bold;
            }
            .head
            {
                background-color: #002b80;
            }
            .foot
            {
                background-color: #002b80;
                height:100px;  
            }
            .a{
                background-color: #3cb371;
                color: white;
                padding:3px 3px 3px 3px;
            }
            .content
            {
                background-color: #e6f7ff;
            }
            .big
            {
                width:60%;
                height:25px;
            }
            .small
            {
                height:25px;
            }
            select
            { 
              height:25px;
            }
            tr
            {
                padding:20px 20px 20px;
            }
            </style>
            <script>
                 function isvalid()
            {
                pwd=document.getElementById("pwd").value;
                cnfp=document.getElementById("cnfp").value;
                str=document.registerform.pwd.value.length;
                if(str<6)
                  { alert("Password must be more than 6 characters.");
                      return(false);
                  }
                  i=document.getElementById("coun").selectedIndex;
                  if(i==0)
                      {
                          alert("Select Country");
                          return(false);
                      }
                if(pwd!=cnfp)
                    {
                    alert("Password Mismathed");
                   return(false);
                    }
               
                    return(true);
            }
             
            </script>
    </head>
    <body>
        <table width="100%" height="100%">
            
            <tr class="head">
                <td class="livechat"><font size="20" color="white" >Chat Server</font></td> 
                <td class="signin">
                      <form method="post" action="logincheck.jsp" name="form1" >
                          <font color="white" >User Id</font> 
                         <span style="padding-left:8em;"> <font color="white" > Password </font> </span>
                        <br/>
                        <input type="text" name="uid" />
                        <span style="padding-left:1em;"><input type="text" name="pwd" /></span>
                        <input type="submit" value=" Sign In " class="a"/>
                        </form>     
                 </td>
            </tr>
            <tr class="content">
                <td class="img">
                    <font size="40px" color="blue" >Connect to more and more number of people..............</font><br/><br/>
                    <img src="ch.jpg" height="100%" width="75%"/>
                </td>
            
                    <td class="signup">
                        <h2>Create an account</h2><br/>
                        <form method="post" action="registersave.jsp" onsubmit="return(isvalid())" enctype="multipart/form-data" name="registerform" >
                   
                            <input type="email" name="uid" placeholder="  User Id" class="small"/> &nbsp;&nbsp;<input type="text"  name="un" placeholder="  User Name" class="small"/><br/><br/>
                    <input type="password" name="pwd" id="pwd" placeholder="  Password" class="big" /><br/><br/>
                    <input type="password" name="cnfp" id="cnfp" placeholder="  Confirm Password" class="big"/><br/><br/>
                     
                    <input type="radio" value="Male" name="gen" />Male &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" value="Female" name="gen" />Female 
                <span style="margin-left: 6em"><select name="coun" id="coun">
                <option>India</option>
                <option>China</option>
                <option>Japan</option>
                <option>Pakistan</option>
                <option>Paris</option>
               <option>Australia</option>
                </select></span>
                <br/><br/>
                Upload pic &nbsp;&nbsp;
                <input type="file" name="pic"/><br/><br/>
                <input type="submit" value=" Sign Up " class="a" />
                </form>
                </td>
            </tr>
            <tr class="foot">
                <td></td>
                <td></td>
            </tr>
        </table>
    </body>
</html>
