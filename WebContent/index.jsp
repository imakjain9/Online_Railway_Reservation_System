<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.*"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>
       RMS
    </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script> 
$(document).ready(function(){
    $("#flip1").click(function(){
        $("#panel1").slideToggle("slow");
    });
    $("#flip2").click(function(){
        $("#panel2").slideToggle("slow");
    });
     $("#flip3").click(function(){
        $("#panel3").slideToggle("slow");
    });
    $("#flip1").click(function(){
        $("#panel2").hide();
        $("#panel3").hide();
    });
    $("#flip2").click(function(){
        $("#panel1").hide();
        $("#panel3").hide();
    });
    $("#flip3").click(function(){
        $("#panel1").hide();
        $("#panel2").hide();
    });
    $(".buttonSignUp").click(function(){
        $("#panel3").hide();
    });
    $(".buttonSignUp").click(function(){
        $("#panel2").slideToggle("slow");
    });
    $(".buttonLogin").click(function(){
        $("#panel2").hide();
    });
    $(".buttonLogin").click(function(){
        $("#panel3").slideToggle("slow");
    });
    $("#flip4").click(function(){
        $("#panel4").slideToggle("fast");
    });
});
</script>




<script type="text/javascript">
<!--
var image1=new Image()
image1.src="Images/cover.jpg"
var image2=new Image()
image2.src="Images/cover1.jpg"
var image3=new Image()
image3.src="Images/cover2.jpg"
//-->
</script>
<link href="main.css" rel="stylesheet" type="text/css" />
<link href='bootstrap-3.3.6-dist/css/bootstrap.css' rel='stylesheet'>
<style> 
#flip1 {
    text-align: right;background-color: black;color:white;font-family: "Comic Sans MS", cursive, sans-serif;padding-right: 0%;
}

#flip2 {
    text-align: right;background-color: black;color:white;font-size: 22px;font-family: "Comic Sans MS", cursive, sans-serif;padding-right: 0%;
}

#flip3 {
    padding-left: 0%;text-align: left;background-color: black;color:white;font-size: 22px;font-family: "Comic Sans MS", cursive, sans-serif;
}

#flip4 {
    text-align: center;background-color: black;color:white;font-family: "Comic Sans MS", cursive, sans-serif;font-size: 24px;
}
#panel1 {
    left:15%;right:0%;display: none;width:85%;height:713px;position:absolute;z-index:10;background-color: black;color:white;font-size: 20px;font-family: "Comic Sans MS", cursive, sans-serif;border: 1px solid white;
}

#panel2{
    left:15%;right:0%;display: none;width:85%;height:713px;position:absolute;z-index:10;background-color: black;color:white;font-size: 20px;
    font-family: "Comic Sans MS", cursive, sans-serif;border: 1px solid white; 
}
#panel3{
    left:15%;right:0%;display: none;width:85%;height:713px;position:absolute;z-index:10;background-color: black;color:white;font-size: 20px;
    font-family: "Comic Sans MS", cursive, sans-serif;border: 1px solid white;
}

#panel4 {
    left:86%;right:1%;display: none;width:13%;height:70px;z-index:10;position:absolute;background-color: #4CAF50;border: 1px solid white;text-align: center;
}


.buttonSignUp{
    background-color: #4CAF50; /* Green */border: none;color: white;padding: 5px 20px;text-align: center;text-decoration: none;display: inline-block;
    font-size: 16px;margin: 0px 100px;cursor: pointer;font-family: "Comic Sans MS", cursive, sans-serif;
}

.buttonLogin{
    background-color: #4CAF50; /* Green */border: none;color: white;padding: 8px 40px;text-align: center;text-decoration: none;display: inline-block;
    font-size: 16px;margin: 0px 0px;cursor: pointer;font-family: "Comic Sans MS", cursive, sans-serif;
}

</style>

</head>
<body style="overflow:hidden;">
<div class="container-fluid" >
    <div class="row" style="padding-top: 2%; height:80px; background-color:black;">
        <div class="col-sm-8" style="color:white; font-size: 30px; font-family: 'Comic Sans MS', cursive, sans-serif;"> Railway Management System </div>
        <div id="flip1" class="col-sm-2"> 
            <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-search"></span> Search Trains..
            </button>
        </div>
        <%
            HttpSession s=request.getSession(false);
            if(s!=null)
        {%>
            <div class="col-sm-2" id="flip4"><span class="glyphicon glyphicon-user"></span> <%= s.getAttribute("username") %></div>
        <% } else { %>
            <div class="col-sm-1" id="flip2">Sign Up / </div>
            <div class="col-sm-1" id="flip3"><span class="glyphicon glyphicon-log-in"></span> Login</div>
        <% } %>
    </div>
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
Statement st= con.createStatement();  
%>

<div class="row" >
<div class="col-sm-12" style="background-color:white; height=2px;">
</div>
</div>

<!-- search page-->
<div id="panel1">
<div style="margin-top:50px; margin-left:150px; margin-right:20px; background:black;">
<p> &nbsp;&nbsp;&nbsp;&nbsp;Search Train Here.... </p>
<form role="form" class="form-horizontal" action="searchTrains.jsp" method="post">   
    <div class="form-group">
    <label class="control-label col-sm-4" style="color:white" for="mobile">Choose Source:</label>
    <div class="col-sm-4">
        <select type="text" class="form-control" name="source" required/>
            <option setSelected="true" value="">Choose Source</option>
            <% 
                ResultSet rs1=st.executeQuery("select * from station");
                while(rs1.next())
                    out.println("<option>"+rs1.getString("station_name")+"</option>");
            %>
        </select>
    </div>
    </div>

    <div class="form-group">
    <label class="control-label col-sm-4" style="color:white" for="mobile">Choose Destination:</label>
    <div class="col-sm-4">
        <select type="text" class="form-control" name="destination" required/>
            <option setSelected="true" value="">Choose Destination</option>
            <% 
                ResultSet rs2=st.executeQuery("select * from station");
                while(rs2.next())
                    out.println("<option>"+rs2.getString("station_name")+"</option>");
            %>
        </select>
    </div>
    </div>

    <div class="form-group">
    <label class="control-label col-sm-4" style="color:white" for="mobile">Select Date:</label>
    <div class="col-sm-4">
       <% 
        Date date=new Date();
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        String date1 = format1.format(date);  
        out.println("<input type='date' class='form-control' name='date' value='"+date1+"' required/>"); %>
    </div>
    </div>


    <div class="form-group"> 
        <div class="col-sm-offset-4 col-sm-8">
           <input type="submit" class="button" value="Find Trains"/>
           <input type="reset" class="button" value="Reset" />
        </div>
    </div> 
</form>
</div>
</div>



<!-- Registration Page -->
<div id="panel2">
<div style="margin-top:10px; margin-left:10px; margin-right:20px; background:black;">
<h2><center> Registeration</center></h2>
<form id="RegForm" role="form" class="form-horizontal" action="UserController?id=userregister"  method="post">
<fieldset>
      <legend style="color:white;">Player Details</legend>
    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white;" >Email:</label>
        <div class="col-sm-3">
            <input type="email" class="form-control" placeholder="Enter email" name="email" required>
        </div>
        

        <label class="control-label col-sm-3" style="color:white;">Username:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" placeholder="Enter username" name="username" required>
        </div>
        
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white;" for="email">Password:</label>
        <div class="col-sm-3">
            <input type="password" class="form-control" placeholder="Enter Password" name="password" required>
        </div>
        
        <label class="control-label col-sm-3" style="color:white" for="name">Name:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="RegName" placeholder="Enter name" name="name" pattern="[a-zA-Z\s]+" title="Enter Alphabets Only" required>
        </div>
       
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white">Gender:</label>
        <div class="col-sm-3">
            <select type="text" class="form-control" name="gender">
            <option> Male </option>
            <option> Female </option>
            </select>
        </div>
        <label class="control-label col-sm-3" style="color:white" for="mobile">DOB:</label>
        <div class="col-sm-3">
            <input type="date" class="form-control" placeholder="select DOB" name="DOB" required>
        </div> 
        <span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> 
    </div>
    </fieldset>
    <br/>
    <fieldset>
      <legend style="color:white;">Contact Details</legend>
    
    <div class="form-group"> 
        <label class="control-label col-sm-2" style="color:white" for="mobile">Mobile:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="RegMbl" placeholder="Enter Mobile" name="mobile" pattern="[0-9]{10}" title="Enter 10 Numbers Only" required>
        </div>
        <span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> 
        <label class="control-label col-sm-2" style="color:white" for="mobile">PIN:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" placeholder="Enter PIN" name="pin" pattern="[0-9]*" title="Enter Numbers Only" required>
        </div>
        <span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> 
    </div> 

    <div class="form-group"> 
        <label class="control-label col-sm-2" style="color:white">City:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" placeholder="Enter City" name="city" pattern="[a-zA-Z\s]+" title="Enter Alphabets Only" required>
        </div>
        <span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> 
        <label class="control-label col-sm-2" style="color:white">State:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" placeholder="Enter State" name="state" pattern="[a-zA-Z\s]+" title="Enter Alphabets Only" required>
        </div>
    </div> 
    </fieldset>
    <br/>
    <div class="form-group">
        <div class="col-sm-offset-5 col-sm-7">
           <input type="submit" class="button" value="Register"/>
           <input type="reset" class="button" value="Reset" />
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-5 col-sm-7">
    <p style="font-size:16px;">Already a member ?</p>
    <input class="buttonLogin" type="button" onclick="" value="Login Here"/>
    </div>
    </div>
</div>
</div>
</form>

</div>
</div>


<!-- Login Page -->
<div id="panel3">
<div style="margin-top:50px; margin-left:150px; margin-right:20px; background:black;">
<p> Please Login.....</p>
<form role="form" class="form-horizontal" action="UserController?id=userlogin" method="post">
    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white" for="email">Email:</label>
        <div class="col-sm-4">
            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white" for="pwd">Password:</label>
        <div class="col-sm-4">
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password" required>
        </div>
    </div>
    <div class="form-group"> 
        <div class="col-sm-offset-2 col-sm-10">
           <input type="submit" class="button" value="Login"/>
           <input type="reset" class="button" value="Reset" />
        </div>
    </div> 
    <p style="font-size:16px; padding-left:170px;">New User ?<a style="font-size:16px; padding-left:10px; text-decoration:none;color:white;" href="forgotpassword.jsp">forgot Password?</a></p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="buttonSignUp" type="button" onclick="" value="Register Here"/>
</div>
</div>

<!-- Logout Page -->
<div id="panel4">
    <div id="nav" style="padding-top: 10px;">
        <ul>
            <li><a href="editprofile.jsp"><span class="glyphicon glyphicon-edit"></span> Edit Profile </a></li>
            <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
           
        </ul>
    </div>
</div>

<div style="margin:0%; float:left; width:15%; height:800px; background-color:green; z-index:100px;">
    <% if(s==null){%>
    <div style="padding-left:15px; padding-top: 10px;" class="col-sm-2"> 
            <button type="button" onclick="window.location.href=('admin.jsp')" class="btn btn-default">
                <span class="glyphicon glyphicon-user"></span> Admin Panel
            </button>
    </div>
    <%}%>
    <div id="nav" style="padding-top: 50px;">
        <ul>
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Home </a></li>
            <li><a href="mytransactions.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> My Transactions </a></li>
            <li><a href="checkSheduleCustomer.jsp"><span class="glyphicon glyphicon-flash"></span> Train Shedule </a></li>
            <li><a href="cancelbooking.jsp"><span class="glyphicon glyphicon-remove"></span> Cancel Booking </a></li>
            <li><a href="cancellastbooking.jsp"><span class="glyphicon glyphicon-remove"></span> Cancel Last Booking </a></li>
            <li><a href="feedback.jsp"><span class="glyphicon glyphicon-file"></span> Feedback </a></li>
        </ul>
    </div>
</div>

<div>
    <img src="Images/cover1.jpg" name="slide" width="85%" height="713px">
</div>
<script>
var step=1
function slideit(){
if (!document.images)
return
document.images.slide.src=eval("image"+step+".src")
if (step<3)
step++
else
step=1
setTimeout("slideit()",1500)
}
slideit()
</script>


<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</div>
</body>
</html>
