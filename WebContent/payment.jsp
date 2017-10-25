<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.util.StringTokenizer" %>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.util.Calendar"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>
        RMS
    </title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script> 
$(document).ready(function(){
    $("#flip3").click(function(){
        $("#panel").slideToggle("fast");
    });
});
</script>




<!--<script type='text/javascript'> 
function AlertIt()
{
window.location.href='booking.jsp'; 
}
</script>-->

<link href="main.css" rel="stylesheet" type="text/css" />
<style>
#flip3 {
    top:0%;height:55px;text-align: center;background-color: black;color:white;
    font-family: "Comic Sans MS", cursive, sans-serif;font-size: 24px;padding-right: 0%;
}

#panel {
    left:86%;
    right:1%;
    display: none;
    width:13%;
    height:70px;
    z-index:10;
    position:absolute;
    background-color: #4CAF50;
    border: 1px solid white;
    text-align: center;
}


#nav{
    padding-top: 170px;
}


</style>
</head>

<body style="background-color:black;">
<div class="container-fluid">
<div class="row">
    <div class="col-sm-10" style="color:white; font-size: 30px; font-family: 'Comic Sans MS', cursive, sans-serif;"> Railway Management System </div>
    <%
        HttpSession s=request.getSession(false);
        if(s!=null)
    {%>
        <div class="col-sm-2" id="flip3"><span class="glyphicon glyphicon-user"></span> <%= s.getAttribute("username") %></div>
    <% } %>
</div>


<!-- Logout Page -->
<div id="panel">
    <div id="nav" style="padding-top: 10px;">
        <ul>
            <li><a href="editprofile.jsp"><span class="glyphicon glyphicon-edit"></span> Edit Profile </a></li>
            <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
           
        </ul>
    </div>
</div>

<div class="row" >
<div class="col-sm-12" style="background-color:white; height=2px;">
</div>
</div>
</div>

<div style="margin:0%; float:left; width:15%; height:616px; background-color:green; z-index:100px;">
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

<%
try{
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
Statement st= con.createStatement(); 

System.out.println("1");
int distance = (Integer)s.getAttribute("distance");
System.out.println("2");
System.out.println(s.getAttribute("selectedTrainType"));
int traincharge = Integer.parseInt((String)application.getInitParameter((String)s.getAttribute("selectedTrainType")));
System.out.println("3");
int seatcharge = Integer.parseInt((String)application.getInitParameter(request.getParameter("seatType")));
System.out.println("4");
System.out.println(distance+" "+traincharge+" "+seatcharge);
int fare = (distance * traincharge) + seatcharge;
System.out.println(fare);
if(s!=null) {
    s.setAttribute("passengername",request.getParameter("passengername"));
    s.setAttribute("passengerage",request.getParameter("passengerage"));
    s.setAttribute("passengeraadhaar",request.getParameter("passengeraadhaar"));
    s.setAttribute("seattype",request.getParameter("seatType"));
    s.setAttribute("fare",fare);
}

%>

<div class="col-sm-10" style="color:white; background-color:black; padding-left:20px; padding-top:50px;">
    
    <form role="form" class="form-horizontal" action="UserController?id=trainbooking" method="post">
    <div class="form-group" style="padding-left:250px;">
        <label style="text-align:left; font-size:30px;" class="control-label col-sm-4" style="color:white">Payable Amount :</label>
        <div style="text-align:left;font-size:30px;" class="col-sm-2">
            <%out.println(fare);
            }catch(Exception e){
    out.println("<script type='text/javascript'>   alert('TSystem failed with an exception'); window.location.href='index.jsp';    </script>   ");
}
%>    
        </div>
    </div>

    <fieldset>
      <legend style="color:white;">Payment</legend>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="card-holder-name">Name on Card</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" name="card-holder-name" placeholder="Card Holder's Name" pattern="[a-zA-Z\s]+" title="Enter Alphabets Only" required>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="card-number">Card Number</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" name="card-number" placeholder="Card Number" pattern="[0-9]{16}" title="Enter 16 digits Only" required>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="expiry-month">Expiration Date</label>
        <div class="col-sm-6">
          <div class="row">
            <div class="col-xs-4">
              <select class="form-control col-sm-4" name="expiry-month" id="expiry-month" required>
                <option value="">Month</option>
                <option value="01">Jan (01)</option>
                <option value="02">Feb (02)</option>
                <option value="03">Mar (03)</option>
                <option value="04">Apr (04)</option>
                <option value="05">May (05)</option>
                <option value="06">June (06)</option>
                <option value="07">July (07)</option>
                <option value="08">Aug (08)</option>
                <option value="09">Sep (09)</option>
                <option value="10">Oct (10)</option>
                <option value="11">Nov (11)</option>
                <option value="12">Dec (12)</option>
              </select>
            </div>
            <div class="col-xs-4">
              <select class="form-control col-sm-4" name="expiry-year" required>
                <option value="13">2013</option>
                <option value="14">2014</option>
                <option value="15">2015</option>
                <option value="16">2016</option>
                <option value="17">2017</option>
                <option value="18">2018</option>
                <option value="19">2019</option>
                <option value="20">2020</option>
                <option value="21">2021</option>
                <option value="22">2022</option>
                <option value="23">2023</option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="cvv">Card CVV</label>
        <div class="col-sm-4">
          <input type="password" class="form-control" name="cvv" id="cvv" placeholder="Security Code" pattern="[0-9]{4}" title="Enter 4 digits Only" required>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
          <button type="submit" class="btn btn-success">Pay Now</button>
          <input type="button" class="btn btn-warning" value="Cancel" />
        </div>
      </div>
    </fieldset>
  </form>
</div>

<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</body>
</html>
