<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.*"%>
<%@ page session="false" %>
<html>
<head>
	<link href="main.css" rel="stylesheet" type="text/css" />
	<link href='bootstrap-3.3.6-dist/css/bootstrap.css' rel='stylesheet'>
</head>
<body>
<% 
try{
String selectedDate= request.getParameter("id");
System.out.println(selectedDate);

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
Statement st= con.createStatement(); 
%>

<div style="color:white; font-size:14px;">
<table class="table">
        <thread>
        <tr style="background:green;">
            <td width="100px"> PNR </td>
            <td width="120px"> USER </td>
            <td width="300px"> Name </td>
            <td width="120px"> Age </td>
            <td width="120px"> Aadhaar </td>
            <td width="120px"> Train </td>
            <td width="120px"> Source </td>
            <td width="120px"> Destination </td>
            <td width="120px"> Fare </td>
            <td width="120px"> Coach </td>
            <td width="100px"> SeatNum </td>
            <td width="120px"> Status </td>
        </tr>
        </thread>
            <tbody>
<%
String coach = "";
ResultSet rs3=st.executeQuery("select * from Reservation where bookingdate = '"+selectedDate+"'");
while(rs3.next()){ 
String seattype = rs3.getString("seatType");
            switch(seattype)
            {
                case "first_ac":
                    coach = "FAC";break;
                case "second_ac":
                    coach = "SAC";break;
                case "third_ac":
                    coach = "TAC";break;
                case "sleeper":
                    coach = "SLP";break;                
            }
%>
        <tr>
            <td><%=rs3.getString("PNR")%></td>
            <td><%=rs3.getString("userEmail")%></td>
            <td><%=rs3.getString("passengername")%></td>
            <td><%=rs3.getInt("age")%></td>
            <td><%=rs3.getLong("adhaarcard")%></td>
            <td><%=rs3.getInt("train_id")%></td>
            <td><%=rs3.getString("sourceStation")%></td>
            <td><%=rs3.getString("destinationStation")%></td>
            <td><%=rs3.getInt("fare")%></td>
            <td><%=coach%></td>
            <td><%=rs3.getInt("seatnumber")%></td>
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
<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</body>
</html>
