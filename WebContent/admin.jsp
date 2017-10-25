<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
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
        $("#panel2").slideToggle("fast");
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
    text-align: center;
    background-color: black;
    color:white;
    font-size: 22px;
    font-family: "Comic Sans MS", cursive, sans-serif;
    padding-top:5px;
    padding-right: 0%;
}

#flip2 {
    text-align: right;
    background-color: black;
    color:white;
    font-family: "Comic Sans MS", cursive, sans-serif;
    font-size: 24px;
}


#panel1{
    left:15%;
    right:0%;
    display: none;
    width:85%;
    height:700px;
    position:absolute;
    z-index:10;
    background-color: black;
    color:white;
    font-size: 20px;
    font-family: "Comic Sans MS", cursive, sans-serif;
    border: 1px solid white;
   
}

#panel2 {
    left:87%;
    right:0%;
    display: none;
    width:13%;
    height:50px;
    z-index:10;
    position:absolute;
    background-color: #4CAF50;
    border: 1px solid white;
    text-align: center;
}

</style>

</head>
<body style="margin:0%; background-color:black; overflow:hidden;">
<div class="container-fluid" >
    <div class="row" style="height:80px; padding-top:1%;">
        <div class="col-sm-10" style="color:white; font-size: 30px;font-family: 'Comic Sans MS', cursive, sans-serif;"> Railway Management System </div>
        <%
            HttpSession s=request.getSession(false);
            if(s!=null)
        {%>
            <div class="col-sm-2" id="flip2"><span class="glyphicon glyphicon-user"></span> <%= s.getAttribute("adminuser") %></div>
        <% } else { %>
            <div class="col-sm-2" id="flip1"> <span class="glyphicon glyphicon-log-in"></span> Admin Login</div>
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

<!-- Login Page -->
<div id="panel1">
<div style="margin-top:50px; margin-left:150px; margin-right:20px; background:black;">
<p> Please Login.....</p>
<form role="form" class="form-horizontal" action="UserController?id=adminlogin" method="post">
    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white" for="email">Username:</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter username" name="adminuser" required>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white" for="pwd">Password:</label>
        <div class="col-sm-4">
            <input type="password" class="form-control" placeholder="Enter password" name="adminpassword" required>
        </div>
    </div>
    <div class="form-group"> 
        <div class="col-sm-offset-2 col-sm-10">
           <input type="submit" class="button" value="Login"/>
           <input type="reset" class="button" value="Reset" />
        </div>
    </div> 
</div>
</div>

<!-- Logout Page -->
<div id="panel2">
    <div id="nav" style="padding-top:10px;" >
        <ul>
            <li><a href="adminLogout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
           
        </ul>
    </div>
</div>

<div class="row">
<div class="col-sm-2" style="margin:0%; height:800px;width:15%; background-color:green; z-index:100px; padding-top:10px;">
    <% if(s==null){%>
    <div style="padding-left:10px; padding-top: 0px;" class="col-sm-2"> 
            <button type="button" onclick="window.location.href=('index.jsp')" class="btn btn-default">
                <span class="glyphicon glyphicon-user"></span> Customer Panel
            </button>
    </div>
    <%}%>
    <br/>

    <div id="nav" style="Padding-top:20px;">
        <ul>
            <li><a href="admin.jsp"><span class="glyphicon glyphicon-home"></span> Home </a></li>
            <li><a href="addStation.jsp"><span class="glyphicon glyphicon-plus"></span> Add Station </a></li>
            <li><a href="addTrain.jsp"><span class="glyphicon glyphicon-plus"></span> Add Train </a></li>
            <li><a href="deleteTrain.jsp"><span class="glyphicon glyphicon-remove"></span> Delete Train </a></li>
            <li><a href="checkShedule.jsp"> <span class="glyphicon glyphicon-eye-open"></span> TrainShedule </a></li>
            <li><a href="checkbooking.jsp"><span class="glyphicon glyphicon-flash"></span> Check Booking</a></li>
            <li><a href="reports.jsp"><span class="glyphicon glyphicon-file"></span> Reports</a></li>
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
