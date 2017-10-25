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



<div class="col-sm-10" style="color:white; background-color:black; padding:50px 100px; font-size:22px;">

<% 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
Statement st= con.createStatement(); 
String pnr = (String)s.getAttribute("PNR");
System.out.println("ncwnirfvirg"+s.getAttribute("PNR"));

/*for (Enumeration e = s.getAttributeNames(); e.hasMoreElements(); ) {     
    String attribName = (String) e.nextElement(); 
    System.out.println(attribName);
}*/
ResultSet rs=st.executeQuery("select * from Reservation where PNR ='"+pnr+"'");
while(rs.next())
{System.out.println("Requested ticket");
%>
    
    <table border='10px' width='900px'>
        <tr><td colspan='3'><h2><center> E-Ticket</center></td></tr>
        <tr>
            <td align='right' style='padding-right:20px'>PNR</td>
            <td style='padding-left:20px'><%out.println(rs.getString("PNR"));%></td>
        </tr>
        <tr>
            <td align='right' style='padding-right:20px'> Email</td>
            <td style='padding-left:20px'><%out.println(rs.getString("userEmail"));%></td>
        </tr>
        <tr>
            <td align='right' style='padding-right:20px'>Passenger Name</td>
            <td style='padding-left:20px'><%out.println(rs.getString("passengername"));%></td>
        </tr>
        <tr>
            <td align='right' style='padding-right:20px'> Passenger Age </td>
            <td style='padding-left:20px'><%out.println(rs.getInt("age"));%></td>
        </tr>
        <tr>
            <td align='right' style='padding-right:20px'>Aadhaar Card</td>
            <td style='padding-left:20px'><%out.println(rs.getLong("adhaarcard"));%></td>
        </tr>
            <td align='right' style='padding-right:20px'>Journey Date</td>
            <td style='padding-left:20px'><%out.println(rs.getDate("bookingdate"));%></td>
        </tr>
        </tr>
            <td align='right' style='padding-right:20px'>Train Number</td>
            <td style='padding-left:20px'><%out.println(rs.getInt("train_id"));%></td>
        </tr>
        </tr>
            <td align='right' style='padding-right:20px'>From</td>
            <td style='padding-left:20px'><%out.println(rs.getString("sourceStation"));%></td>
        </tr>
        </tr>
            <td align='right' style='padding-right:20px'>To</td>
            <td style='padding-left:20px'><%out.println(rs.getString("destinationStation"));%></td>
        </tr>
        <% String seattype = rs.getString("seatType");
            String coach = "";
            if(seattype.equals("first_ac"))
            	coach = "FAC";
            else if(seattype.equals("second_ac"))
            	coach = "SAC";
            else if(seattype.equals("third_ac"))
            	coach = "TAC";
            else if(seattype.equals("sleeper"))
            	coach = "SLP";
        %>
        </tr>
            <td align='right' style='padding-right:20px'>Coach</td>
            <td style='padding-left:20px'><%out.println(coach);%></td>
        </tr>
        </tr>
            <td align='right' style='padding-right:20px'>Fare</td>
            <td style='padding-left:20px'><%out.println(rs.getInt("fare"));%></td>
        </tr>
        
        </tr>
            <td align='right' style='padding-right:20px'>Seat Number</td>
            <td style='padding-left:20px'><%out.println(coach+":"+rs.getInt("seatnumber"));%></td>
        </tr>
    </table>
    <div class="form-group"> 
        <div style="padding-left:380px; padding-top:10px;" class="col-sm-10">
           <input type="button" onclick="window.print()" class="button" value="Print"/>
        </div>
    </div>
<%}
%>
</div>
</div>
    
    

<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</body>
</html>
