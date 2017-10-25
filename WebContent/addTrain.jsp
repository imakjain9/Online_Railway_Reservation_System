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
    $("#flip2").click(function(){
        $("#panel2").slideToggle("fast");
    });
});
</script>

<link href="main.css" rel="stylesheet" type="text/css" />
<link href='bootstrap-3.3.6-dist/css/bootstrap.css' rel='stylesheet'>
<style> 


#flip2 {
    text-align: center;
    padding-top:10px;
    background-color: black;
    color:white;
    font-family: "Comic Sans MS", cursive, sans-serif;
    font-size: 24px;
}

#panel2 {
    left:86%;
    right:1%;
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

<!--checking session -->
<% 
HttpSession s=request.getSession(false);
if(s==null)
    out.println("<script type='text/javascript'>    window.location.href='admin.jsp';  alert('Please Login First'); </script>   ");
else
{%>

<body style="margin:0%; background-color:black; overflow:hidden;">
<div class="container-fluid" >
    <div class="row" style="height:80px; padding-top:1%;">
        <div class="col-sm-10" style="color:white; font-size: 30px;font-family: 'Comic Sans MS', cursive, sans-serif;"> Railway Management System </div>
        <div class="col-sm-2" id="flip2"><span class="glyphicon glyphicon-user"></span> <%= s.getAttribute("adminuser") %></div>
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

<!-- Logout Page -->
<div id="panel2">
    <div id="nav" style="padding-top:10px;" >
        <ul>
            <li><a href="adminLogout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
           
        </ul>
    </div>
</div>

<div class="row">
<div class="col-sm-2" style="height:800px;width:15%; background-color:green; z-index:100px; padding-top:30px;">
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

<div class="col-sm-10" style="padding:10px 10px; background-color:black; color:white; font-family: 'Comic Sans MS', cursive, sans-serif; font-size: 20px; height:616px; ">
    <h3><center>Add Train</center></h3>
<fieldset>
    <legend style="color:white;">Enter Train Details..</legend>
    <form class="form-horizontal" role="form" action="setWeekDays.jsp" method="post">
        <div style="padding-left:350px;" class="form-group">
             <div style="text-align:right;" class="col-sm-3">Train Number:</div>
            <div class="col-sm-4">
                <input type="text" name="trainNumber" class="form-control" pattern="[0-9]*" title="Enter Numeric data Only" placeholder="Enter train number" required>
            </div>
        </div>
        <div style="padding-left:350px;" class="form-group">
           <div style="text-align:right;" class="col-sm-3">Train Name:</div>
            <div class="col-sm-4">
                <input type="text" name="trainName" class="form-control"  pattern="[a-zA-Z\s]+" title="Enter Alphabets Only" placeholder="Enter train name" required>
            </div>
        </div>

        <div style="padding-left:350px;" class="form-group">
           <div style="text-align:right;" class="col-sm-3">Train Type:</div>
            <div class="col-sm-4">
                <select class="form-control" name="trainType" required>
                     <option setSelected="true" value=""> Choose Train Type </option>
                    <option > express </option>
                    <option > superfast </option>
                </select>
            </div>  
        </div>

        <div style="padding-left:350px;" class="form-group">
            <div style="text-align:right;" class="col-sm-3">Number of Stops:</div>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="numofstops" pattern="[0-9]*" title="Enter Numeric data Only" placeholder="Enter No of stops" required>
            </div>  
        </div>

        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-7">
                <button type="submit" style="background:green; color:white;" class="btn btn-default">Submit</button>
                <button type="reset" style="background:green; color:white;" class="btn btn-default">Reset</button>
            </div>
        </div>
    </form>
    </legend>
</fieldset>
</div>


<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</div>
</body>

<% } %>
</html>
