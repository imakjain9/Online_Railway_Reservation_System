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
      Boca
    </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>


</script>
<link href="main.css" rel="stylesheet" type="text/css" />
<link href='bootstrap-3.3.6-dist/css/bootstrap.css' rel='stylesheet'>
<style> 
#flip1 {
    text-align: right;
    background-color: black;
    color:white;
    font-family: "Comic Sans MS", cursive, sans-serif;
    padding-right: 0%;
}
#flip2 {
    text-align: left;
    background-color: black;
    color:white;
    font-size: 22px;
    font-family: "Comic Sans MS", cursive, sans-serif;
    padding-right: 0%;
}

#panel1{
    width:85%;
    height:713px;
    float:right;
    background-color: black;
    color:white;
    font-size: 20px;
    font-family: "Comic Sans MS", cursive, sans-serif;
   
}
#result{
    font-family: "Comic Sans MS", cursive, sans-serif;font-size:20px;background-color:black;color:white;
    text-align: left;
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
<body style="overflow:hidden;">
<div class="container-fluid" >
    <div class="row" style="padding-top: 2%; height:80px; background-color:black;">
        <div class="col-sm-12" style="color:white; font-size: 30px; font-family: 'Comic Sans MS', cursive, sans-serif;"> Railway Management System </div>
    </div>

<div class="row" >
<div class="col-sm-12" style="background-color:white; height=2px;">
</div>
</div>
</div>

<div style="margin:0%; float:left; width:15%; height:800px; background-color:green; z-index:100px;">
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
<% 

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/boca","root","7827444741");  
Statement st= con.createStatement(); 

%>

<div id="panel1">
<div style="margin-top:10px; margin-left:10px; margin-right:20px; background:black;">
<h2><center> Forgot password</center></h2>
<form id="SalInc" role="form" class="form-horizontal" action="UserController?id=updatepassword" method="post">
    
<fieldset>
    <legend style="color:white;">Get New Password</legend>
    <div style="padding-left:250px;" class="form-group">
        <label class="control-label col-sm-3" style="color:white;">Enter Email:</label>
        <div class="col-sm-3">
            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
        </div>
    </div>
    <div style="padding-left:250px;" class="form-group">
        <label class="control-label col-sm-3" style="color:white;">New Password:</label>
        <div class="col-sm-3">
            <input type="password" class="form-control" id="email" placeholder="Enter password" name="newpassword" required>
        </div>
    </div>
    <div style="padding-left:250px;" class="form-group">
        <label class="control-label col-sm-3" style="color:white;">Confirm Password:</label>
        <div class="col-sm-3">
            <input type="password" class="form-control" id="email" placeholder="Enter password" name="confirmpassword" required>
        </div>
    </div>
</fieldset>
<div id="result"></div>
<br/>

<div class="form-group">
    <div class="col-sm-offset-4 col-sm-8">
        <input type="submit" class="button" value="Update Password"/>
        <input type="reset" class="button" value="Reset" />
    </div>
</div>

</form>
</div>
</div>


<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</div>
</body>
</html>
