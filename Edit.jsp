<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
        <style>
            body{
                background-color:  #99ebff;
            }
             .a{
                background-color: green;
                color: white;
                padding:3px 3px 3px 3px;
            }
        </style>
    </head>
    <body>
         <center>
             <div style="border:2px solid blue; border-style:dashed double; margin:100px; padding:70px; margin-top: 20px">
             <form method=post enctype='multipart/form-data' action=EditSave.jsp >
                 <h3>Update Values</h3><br/><br/>
                 User Name : <input type=text name=u /><br/><br/>
                 Gender : <input type=radio name=g value=Male>Male
                 <input type=radio name=g value=Female />Female <br/><br/>
                 Country : <select name=c>
                     <option>India</option>
                     <option>China</option>
                     <option>Japan</option>
                     <option>Pakistan</option>
                     <option>Paris</option>
                     <option>Australia</option>
                 </select><br/><br/>
                 Upload Pic : <input type=file name=p /><br/><br/>
                 <input type=submit class="a" value=" Confirm Change " />
             </form>
             </div>
         </center>
    </body>
</html>
