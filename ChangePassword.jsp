
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <style>
            .a{
                background-color: green;
                color: white;
                padding:3px 3px 3px 3px;
            }
        </style>
        <script>
           function isvalid()
            {
                np=document.getElementById("np").value;
                cnfp=document.getElementById("cnfp").value;
                if(np!=cnfp)
                    {
                    alert("New Password and Confirm Password does not match");
                    return(false);
                    }
                else if(np.length<6)
                    {
                        alert("Password must be 6 or more characters long.");
                        return(false);
                    }
                    else
                    return(true);
            }
            
            function strength()
            {
               str=document.form1.np.value.length;
               if(str>5)
                   msg='Good';
               else
                   msg='Poor';
               document.getElementById('mylocation').innerText=msg;
            }
        </script>
    </head>
    <body>
        <div style="padding: 20px 20px 20px 20px; background-color: lightskyblue; margin-left:400px; margin-right:400px;">
            <form method="post" name="form1" action="ChangePasswordUpdate.jsp" onsubmit="return(isvalid())">
                Current Password : <input type="password" name="cp" id="cp" required /><br/><br/>
                New Password :  <input type="password" name="np" id="np" onkeyup="strength()" required />   Strength:  <span id="mylocation">No Strength</span><br/><br/>
                Confirm Password : <input type="password" name="cnfp" id="cnfp" required /><br/><br/>
                <input type="submit" value="Change Password" class="a" />
            </form>
        </div>
    </body>
</html>
