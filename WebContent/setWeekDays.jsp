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
        <div class="col-sm-2" id="flip2"> <span class="glyphicon glyphicon-user"></span> <%= s.getAttribute("adminuser") %></div>
    </div>


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

<div class="col-sm-10" style="background-color:black; color:white; font-family: 'Comic Sans MS', cursive, sans-serif; font-size: 20px; height:616px; ">
    <h2><center>Train Details</center></h2>
<fieldset>
    <legend style="color:white;">Enter Train Details..</legend>
     <form class="form-horizontal" role="form" action="addTrainShedule.jsp" method="post">
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
Statement st= con.createStatement(); 
int trainNumber = Integer.parseInt(request.getParameter("trainNumber"));
String trainName = request.getParameter("trainName");
String trainType = request.getParameter("trainType");
int trainStops = Integer.parseInt(request.getParameter("numofstops"));
s.setAttribute("numtrainstop",trainStops);
int i = 1;
out.println("<div style='padding-left:10px' class='form-group'><label class='control-label col-sm-2'> Train Number:</label><div class='col-sm-2'><input type='text' name='trainNumber' value='"+trainNumber+"' class='form-control' readonly/></div> <label class='control-label col-sm-2'> Train Name:</label><div class='col-sm-2'><input type='text' name='trainName' value='"+trainName+"' class='form-control' readonly/></div><label class='control-label col-sm-2'> Train Name:</label><div class='col-sm-2'><input type='text' name='trainType' value='"+trainType+"' class='form-control' readonly/></div></div>");
%>
        <div class="form-group">
            <label class="control-label col-sm-3">Sunday:</label>
            <div class="col-sm-1">
                <input type="checkbox" name="weekday" value="sunday" class="form-control"/>
            </div>
            <label class="control-label col-sm-3">Monday:</label>
            <div class="col-sm-1">
                <input type="checkbox" name="weekday" value="monday" class="form-control"/>
            </div>
            <label class="control-label col-sm-3">Tuesday:</label>
            <div class="col-sm-1">
                <input type="checkbox" name="weekday" value="tuesday" class="form-control"/>
            </div>
            <label class="control-label col-sm-3">Wednesday:</label>
            <div class="col-sm-1">
                <input type="checkbox" name="weekday" value="wednesday" class="form-control"/>
            </div>
            <label class="control-label col-sm-3">Thursday:</label>
            <div class="col-sm-1">
                <input type="checkbox" name="weekday" value="thursday" class="form-control"/>
            </div>
            <label class="control-label col-sm-3">Friday:</label>
            <div class="col-sm-1">
                <input type="checkbox" name="weekday" value="friday" class="form-control"/>
            </div>
            <label class="control-label col-sm-3">Saturday:</label>
            <div class="col-sm-1">
                <input type="checkbox" name="weekday" value="saturday" class="form-control"/>
            </div>
        </div>
 <div style="padding-left:450px; padding-top:10px;">
        <input type="submit" style="background:green; color:white;" class="btn btn-default" value="Submit"/>
        <input type="button" style="background:green; color:white;"class="btn btn-default" value="Cancel" />
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
