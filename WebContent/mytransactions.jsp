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
    $("#flip4").click(function(){
        $("#panel4").slideToggle("fast");
    });
});
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

#flip4 {
    text-align: center;
    background-color: black;
    color:white;
    font-family: "Comic Sans MS", cursive, sans-serif;
    font-size: 24px;
}

#panel2{
    width:85%;
	float:right;
    background-color: black;
    color:white;
    font-size: 14px;
    font-family: "Comic Sans MS", cursive, sans-serif;
    padding:10px 10px;
   
}

#panel4 {
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

</style>

<!--checking session -->
<% 
HttpSession s=request.getSession(false);
if(s==null)
    out.println("<script type='text/javascript'>    window.location.href='index.jsp';  alert('Please Login First'); </script>   ");
else
{%>

</head>
<body style="overflow-y:scroll;overflow-x:hidden; background:black;">
<div class="container-fluid" >
    <div class="row" style="padding-top: 2%; height:80px; background-color:black;">
        <div class="col-sm-10" style="color:white; font-size: 30px; font-family: 'Comic Sans MS', cursive, sans-serif;"> Railway Management System </div>
        <%
            if(s!=null)
        {%>
            <div class="col-sm-2" id="flip4"><span class="glyphicon glyphicon-user"></span> <%= s.getAttribute("username") %></div>
        <% } %>
    </div>
</div>

<div class="row" >
<div class="col-sm-12" style="background-color:white; height=2px;">
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
String selectedDate = request.getParameter("selectedDate");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
Statement st= con.createStatement(); 
%>

<!-- Registration Page -->
<div id="panel2">
<div style="margin-top:10px; margin-left:10px; margin-right:10px; background:black;">
<h2><center> My Transactions</center></h2>
</div>

<table class="table">
        <thread>
        <tr style="background:green;">
            <td width="100px"> PNR </td>
            <td width="280px"> Name </td>
            <td width="120px"> Aadhaar </td>
            <td width="200px"> Date </td>
            <td width="120px"> Train </td>
            <td width="120px"> Source </td>
            <td width="120px"> Destination </td>
            <td width="120px"> Seattype </td>
            <td width="120px"> Fare </td>
             <td width="120px"> Coach </td>
            <td width="60px"> SeatNum </td>
            <td width="120px"> Status </td>
        </tr>
        </thread>
            <tbody>
<%
String email = (String)s.getAttribute("email");
String coach = "";
ResultSet rs3=st.executeQuery("select * from Reservation where userEmail = '"+email+"'");
while(rs3.next()){ 
String seattype = rs3.getString("seatType");
if(seattype.equals("first_ac"))
	coach = "FAC";
else if(seattype.equals("second_ac"))
	coach = "SAC";
else if(seattype.equals("third_ac"))
	coach = "TAC";
else if(seattype.equals("sleeper"))
	coach = "SLP";
%>
        <tr>
            <td><%=rs3.getString("PNR")%></td>
            <td><%=rs3.getString("passengername")%></td>
            <td><%=rs3.getLong("adhaarcard")%></td>
            <td><%=rs3.getDate("bookingdate")%></td>
            <td><%=rs3.getInt("train_id")%></td>
            <td><%=rs3.getString("sourceStation")%></td>
            <td><%=rs3.getString("destinationStation")%></td>
            <td><%=rs3.getString("seatType")%></td>
            <td><%=rs3.getInt("fare")%></td>
            <td><%=coach%></td>
            <td><%=coach+":"+rs3.getInt("seatnumber")%></td>
            <td><%=rs3.getString("bookingstatus")%></td>
        </tr>
<%}%>
        </tbody>
    </table>
</div>

<%
}catch(Exception e){
    e.printStackTrace();
}
%>
        </tbody>
    </table>
</div>

</div>
</div>



<%}%>

<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</div>
</body>
</html>
