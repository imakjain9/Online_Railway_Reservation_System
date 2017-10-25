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
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
Statement st= con.createStatement(); 
int selectedTrain = Integer.parseInt(request.getParameter("id"));
st.executeUpdate("CREATE OR REPLACE VIEW showshedule AS select A.* , B.station_name FROM trainshedule A JOIN station B ON A.station_id = B.id where A.train_id = '"+selectedTrain+"'");
System.out.println("done working");
String day ="";
ResultSet rs=st.executeQuery("select * from trainrecord where train_id = '"+selectedTrain+"'");
if(!rs.next())
    out.println("<div style='color:white;text-align:center;'>No Trains Available</div>");

ResultSet rs2=st.executeQuery("select * from WeekDays where train_id = '"+selectedTrain+"'");
if(rs2.next()){
int sun = rs2.getInt("sunday");
int mon = rs2.getInt("monday");
int tue = rs2.getInt("tuesday");
int wed = rs2.getInt("wednesday");
int thu = rs2.getInt("thursday");
int fri = rs2.getInt("friday");
int sat = rs2.getInt("saturday");

if(sun == 1) day = day + "SUN,"; else day = day + "--,";
if(mon == 1) day = day + "MON,"; else day = day + "--,";
if(tue == 1) day = day + "TUE,"; else day = day + "--,";
if(wed == 1) day = day + "WED,"; else day = day + "--,";
if(thu == 1) day = day + "THU,"; else day = day + "--,";
if(fri == 1) day = day + "FRI,"; else day = day + "--,";
if(sat == 1) day = day + "SAT"; else day = day + "--";
}

System.out.println("2");

ResultSet rs1=st.executeQuery("select * from trainrecord where train_id = '"+selectedTrain+"'");
if(rs1.next()){
%>

<div style="color:white; font-size:14px;">
<table style="padding-left:100px;" class="table">
       <tr style="background:green;">
            <td>Train Number</td>
            <td>Train Name</td>
            <td>Running Days</td>
       </tr>
       <tr>
            <td><%=rs1.getInt("train_id")%></td>
            <td><%=rs1.getString("train_name")%></td>
            <td><%=day%></td>
       </tr>
</table>
</div>
<% } %>

<div style="color:white; font-size:14px;">
<table class="table">
        <thread>
        <tr style="background:green;">
            <td width="100px"> SNo </td>
            <td width="120px"> Station ID </td>
            <td width="120px"> Station Name </td>
            <td width="120px"> Stop Number </td>
            <td width="120px"> Arrival </td>
            <td width="120px"> Departure </td>
            <td width="140px"> Distance </td>
        </tr>
        </thread>
            <tbody>
<%
ResultSet rs3=st.executeQuery("select * from showshedule");
int SNo = 1;
while(rs3.next()){ 
%>
        <tr>
            <td><%=SNo++%></td>
            <td><%=rs3.getInt("station_id")%></td>
            <td><%=rs3.getString("station_name")%></td>
            <td><%=rs3.getInt("stop_no")%></td>
            <td><%=rs3.getString("arrival_time")%></td>
            <td><%=rs3.getString("departure_time")%></td>
            <td><%=rs3.getInt("dstncfrmsrc")%></td>
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
