<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.*"%>
<%@ page session="false" %>
<html>
<body>
<%

System.out.println("availableseats");
HttpSession s=request.getSession(false);
String source = (String)s.getAttribute("source");
String destination = (String)s.getAttribute("destination");
int first_ac = 0, lfirst_ac = 1;
int second_ac = 0, lsecond_ac = 1;
int third_ac = 0, lthird_ac = 1;
int sleeper = 0, lsleeper = 1;
int waitingleft = 20;
Date date=new Date();
SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
String date1 = format1.format(date);


int selectedtrain = Integer.parseInt(request.getParameter("id"));

String trainName = "", trainType = "";
try{
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from trainrecord where train_id='"+selectedtrain+"'");
while(rs.next()){
trainName = rs.getString("train_name");
trainType = rs.getString("train_type");
if(s!=null){
s.setAttribute("selectedtrain", selectedtrain);
s.setAttribute("selectedTrainName", trainName);
s.setAttribute("selectedTrainType", trainType);
}
if(trainType.equals("superfast"))
	first_ac = 15;second_ac = 15;third_ac = 15;sleeper = 15;
if(trainType.equals("express"))
	first_ac = 2;second_ac = 10;third_ac = 10;sleeper = 10;


out.println("<form action='bookingDetails.jsp' ><table align='center'><tr><td>Train Id </td><td>:</td><td style='padding-left:20px'>"+rs.getInt("train_id")+"</td></tr><tr><td>Train Name</td><td >:</td><td style='padding-left:20px'>"+trainName+"</td></tr><tr><td>Train Type</td><td >:</td><td style='padding-left:20px'>"+trainType+"</td></tr><tr><td>Date</td><td >:</td><td style='padding-left:20px'>"+(String)s.getAttribute("selectedDate")+"</td></tr>");
}

System.out.println("vcnfva"+s.getAttribute("selectedDate"));

ResultSet rs1=st.executeQuery("select * from Reservation where bookingdate='"+s.getAttribute("selectedDate")+"'AND train_id ='"+selectedtrain+"'AND bookingstatus ='confirmed'");
while(rs1.next())
{
	if(rs1.getString("seatType").equals("first_ac"))
	{
		first_ac--;
		lfirst_ac++;
	}
	else if(rs1.getString("seatType").equals("second_ac"))
	{
		second_ac--;
		lsecond_ac++;
	}
	else if(rs1.getString("seatType").equals("third_ac"))
	{
		third_ac--;
		lthird_ac++;
	}
	else if(rs1.getString("seatType").equals("sleeper"))
	{
		sleeper--;
		lsleeper++;
	}

}

ResultSet rs2=st.executeQuery("select * from Reservation where bookingdate='"+s.getAttribute("selectedDate")+"'AND train_id ='"+selectedtrain+"'AND sourceStation ='"+source+"'AND destinationStation ='"+destination+"'AND bookingstatus ='waiting'");
while(rs2.next())
{
waitingleft--;
}

out.println("<tr><td>Seats First AC</td><td >:</td><td style='padding-left:20px'>"+first_ac+"</td></tr><tr><td>Seats Second AC</td><td >:</td><td style='padding-left:20px' >"+second_ac+"</td></tr><tr><td>Seats Third AC</td><td >:</td><td style='padding-left:20px'>"+third_ac+"</td></tr><tr><td>Seats Sleeper</td><td >:</td><td style='padding-left:20px'>"+sleeper+"</td></tr><tr><td style='padding-left:150px; padding-top:50px;'><input class='button' type='submit' value='conitinue to book tickets'/></td></tr></table>");
 }catch(Exception e){
	out.println(e);
} 
if(s!=null){
	s.setAttribute("first_ac", first_ac);
	s.setAttribute("second_ac", second_ac);
	s.setAttribute("third_ac", third_ac);
	s.setAttribute("sleeper", sleeper);
	s.setAttribute("waitingleft", waitingleft);
	s.setAttribute("lfirst_ac", lfirst_ac);
	s.setAttribute("lsecond_ac", lsecond_ac);
	s.setAttribute("lthird_ac", lthird_ac);
	s.setAttribute("lsleeper", lsleeper);
}

%>
</body>
</html>
