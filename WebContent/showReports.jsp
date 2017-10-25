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
String reporttype = request.getParameter("id");
System.out.println("Not working hell");



if(reporttype.equals("Customers"))
{
System.out.println(true);
ResultSet rs1=st.executeQuery("select * from UserRegistration");
if(!rs1.next())
    out.println("<div style='color:white;text-align:center;'> No Customer Available</div>");
ResultSet rs=st.executeQuery("select * from UserRegistration");
%>
<div style="color:white; font-size:14px;">
<table class="table">
        <thread>
        <tr style="background:green">
            <td width="100px"> Email </td>
            <td width="120px"> Name </td>
            <td width="120px"> DOB </td>
            <td width="120px"> Gender </td>
            <td width="120px"> Mobile </td>
            <td width="140px"> PIN </td>
            <td width="100px"> City </td>
            <td width="120px"> State </td>
        </tr>
        </thread>
            <tbody>
<%
while(rs.next()){ System.out.println("inwedewdedfewdf");
%>
        <tr>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("name")%></td>
            <td><%=rs.getDate("dob")%></td>
            <td><%=rs.getString("gender")%></td>
            <td><%=rs.getLong("mobile")%></td>
            <td><%=rs.getLong("pin")%></td>
            <td><%=rs.getString("city")%></td>
            <td><%=rs.getString("state")%></td>
        </tr>
<%}%>
    </table>
</div>
<%
}


else if(reporttype.equals("Trains"))
{
    System.out.println("Not working yert");

ResultSet rs1=st.executeQuery("select * from trainrecord");
if(!rs1.next())
    out.println("<div style='color:white;text-align:center;'> No trains available</div>");
ResultSet rs=st.executeQuery("select * from trainrecord");
%>
<div style="color:white; font-size:14px;">
<table class="table">
        <thread>
        <tr style="background:green">
            <td > Train No </td>
            <td > Train Name </td>
            <td > Train Type </td>
        </tr>
        </thread>
            <tbody>
<%
while(rs.next()){ 
%>
        <tr>
            <td><%=rs.getInt("train_id")%></td>
            <td><%=rs.getString("train_name")%></td>
            <td><%=rs.getString("train_type")%></td>
        </tr>
<%}%>
    </table>
</div>
<%
}
}catch(Exception e){
	e.printStackTrace();
}

%>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</body>
</html>
