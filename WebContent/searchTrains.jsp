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

<script language = "javascript">
var xmlhttp;
function PostRequest(strurl){
    if(window.XMLHttpRequest)
        xmlhttp=new XMLHttpRequest();
    else if(window.ActiveXObject)
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    xmlhttp.open("POST",strurl,true);
    xmlhttp.setRequestHeader("content-type","application/x-www-form-urlencoded");
    xmlhttp.onreadystatechange=function(){
        if(xmlhttp.readyState==4 && xmlhttp.status == 200)
            document.getElementById("result").innerHTML=xmlhttp.responseText;
    }
    xmlhttp.send(strurl);
}
function callAjax(){
    var id=parseInt(document.f1.selectedtrain.value);
    var url="availableSeat.jsp?id="+id+"";
    PostRequest(url);   
}
</script>


<!--<script type='text/javascript'> 
function AlertIt()
{
window.location.href='booking.jsp'; 
}
</script>-->

<link href="main.css" rel="stylesheet" type="text/css" />
<style>
#flip3{
    top:0%;height:55px;text-align: center;background-color: black;color:white;
    font-family: "Comic Sans MS", cursive, sans-serif;font-size: 22px;padding-right: 0%;
}
#panel {
    left:86%;right:1%;display: none;width:13%;height:70px;z-index:10;position:absolute;background-color: #4CAF50;
    border: 1px solid white;text-align: center;
}

#content{
    font-family: "Comic Sans MS", cursive, sans-serif;font-size:16px;background-color: black;color: white;
    text-align: center;
}
#result{
    font-family: "Comic Sans MS", cursive, sans-serif;font-size:20px;background-color: black;color:white;
    text-align: left;
}

#selectTrainId{
    padding:3px 30px;font-size:24px;border-radius: 30px;border-width:5px;border-color: white;
    font-family: "Comic Sans MS", cursive, sans-serif;background-color: grey;color:white;
}
#bookingdate{
    color:black;
}
</style>
</head>

<body style="background-color:black;">
<div class="container-fluid">

<div class="row">
    <div class="col-sm-10" style="top:0%; background-color: black; color:white; height:55px; font-size: 36px; font-family: 'Comic Sans MS', cursive, sans-serif;">Railway Management System</div>
<%
HttpSession s=request.getSession(false);
if(s!=null)
out.println("<div class='col-sm-2' id='flip3'><span class='glyphicon glyphicon-user'></span> "+s.getAttribute("username")+"</div>");
%>
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

<div class="col-sm-10" style="color:white; background-color:black;">
<div style="text-align:center; font-family:'Comic Sans MS', cursive, sans-serif;">
    <h2> Available Trains </h2>
</div>
<div id="content">
    <table class="table">
        <thread>
        <tr>
            <td width="90px"> Train Id </td>
            <td width="190px"> Train Name </td>
            <td width="140px"> Train Type </td>
            <td width="120px"> Select Train </td>
        </tr>
        </thread>
            <tbody>
                <form name="f1">
<% 
//Retrieving the parameters.
String source = request.getParameter("source");
String destination = request.getParameter("destination");
if(source.equals(destination))
    out.println("<script type='text/javascript'>    window.location.href='index.jsp';   alert('Source and destination cannot be same');    </script>   ");
String mySelectedDate1 = request.getParameter("date");
System.out.println(mySelectedDate1);

//setting the session variables.
if(s!=null){
    s.setAttribute("selectedDate",mySelectedDate1);
    s.setAttribute("source",source);
    s.setAttribute("destination",destination);
}

//converting the date and comparing the days.
String mySelectedDate = mySelectedDate1.replace('-', '/');
System.out.println(mySelectedDate);
String day = "";
SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
try {
    Date selecteddate = formatter.parse(mySelectedDate);
    System.out.println(selecteddate);
    Calendar cal = Calendar.getInstance();
    cal.setTime(selecteddate);
    int dayOfWeek  = cal.get(Calendar.DAY_OF_WEEK);
    switch(dayOfWeek)
    {
        case 1:day = "sunday";break;
        case 2:day = "monday";break;
        case 3:day = "tuesday";break;
        case 4:day = "wednesday";break;
        case 5:day = "thursday";break;
        case 6:day = "friday";break;
        case 7:day = "saturday";break;
    }
}catch (Exception e) {
        e.printStackTrace();
} 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
Statement st= con.createStatement();
ResultSet rs1=st.executeQuery("select * from station where station_name='"+source+"'");
int stationSource = 0;
int stationDestination = 0;
int selectedtrain[]=new int[20];
int distance=0;
int i = 0;
while(rs1.next())
    stationSource = rs1.getInt("id");  
System.out.println(stationSource);

ResultSet rs2=st.executeQuery("select * from station where station_name='"+destination+"'");
while(rs2.next())
    stationDestination = rs2.getInt("id"); 
System.out.println(stationDestination);

ResultSet rs6 = st.executeQuery("select A.train_id, B.dstncfrmsrc - A.dstncfrmsrc as distance FROM trainshedule A INNER JOIN trainshedule B ON A.train_id = B.train_id AND A.stop_no < B.stop_no where A.station_id = '"+stationSource+"' AND B.station_id = '"+stationDestination+"'");
if(!rs6.next())
        out.println("<script type='text/javascript'>    window.location.href='index.jsp';   alert('Sorry!!! No Train match your query');    </script>   ");
else{

ResultSet rs3 = st.executeQuery("select A.train_id, B.dstncfrmsrc - A.dstncfrmsrc as distance FROM trainshedule A INNER JOIN trainshedule B ON A.train_id = B.train_id AND A.stop_no < B.stop_no where A.station_id = '"+stationSource+"' AND B.station_id = '"+stationDestination+"'");
while(rs3.next()){
     selectedtrain[i]= rs3.getInt("train_id");
     distance = rs3.getInt("distance");
     System.out.println(distance);
     i++;
}
}
boolean checkTrain=true;
for(int j=0; j<selectedtrain.length;j++){
    if(selectedtrain[j] != 0){
        ResultSet rs5 =st.executeQuery("select * from WeekDays where train_id='"+selectedtrain[j]+"'");
        boolean flag = false;
        while(rs5.next()){
            System.out.println(day);
            if(rs5.getInt(day)==1)
                flag = true;
        }
        if (flag){
            checkTrain=false;
            ResultSet rs4 =st.executeQuery("select * from trainrecord where train_id='"+selectedtrain[j]+"'");
            while(rs4.next()){
                out.println("<tr><td>"+rs4.getInt("train_id")+"</td><td>"+rs4.getString("train_name")+"</td><td>"+rs4.getString("train_type")+"</td><td><input type='radio' name='selectedtrain' value='"+rs4.getInt("train_id")+"'/></td></tr>");
            }
             if(s!=null){
                s.setAttribute("distance", distance);
                s.setAttribute("stationSource",stationSource);
                s.setAttribute("stationDestination",stationDestination);
            }
        }  
    }
}
if(checkTrain){
            out.println("<script type='text/javascript'>    window.location.href='index.jsp';   alert('Sorry!!! No Train match your query');    </script>   ");
}



/*by separate routes logic. R
oute and shedule in same table 
int selectedtrain[]=new int[20];
int train_id_src = 0;
int train_id_des = 0;
int station_num_src = 0;
int station_num_des = 0;
int srcdis = 0;
int destdis = 0;
int distance;
int i = 0;


ResultSet rs3=st.executeQuery("select * from trainshedule");
int count = 0;
while(rs3.next())
{
    if(stationSource==rs3.getInt("station_id")){
        train_id_src = rs3.getInt("train_id");
        station_num_src = rs3.getInt("stop_no");
        srcdis = rs3.getInt("dstncfrmsrc");
        count++;
    }
    else if(stationDestination == rs3.getInt("station_id")){
        train_id_des = rs3.getInt("train_id");
        station_num_des = rs3.getInt("stop_no");
        count++;
        destdis = rs3.getInt("dstncfrmsrc");
    }
    if(count == 2){
        if((train_id_src == train_id_des) && (station_num_des > station_num_src)){
            selectedtrain[i]= train_id_src;
            System.out.println("trains");
            System.out.println(train_id_src);
            distance = destdis - srcdis;
            System.out.println("distance"+distance);
            if(s!=null)
                s.setAttribute("distance", distance);
            i++;
        }
        count = 0;
    }
}
for(int j=0; j<selectedtrain.length;j++){
    if(selectedtrain[j] != 0){
        ResultSet rs5 =st.executeQuery("select * from WeekDays where train_id='"+selectedtrain[j]+"'");
        boolean flag = false;
        while(rs5.next()){
            System.out.println(day);
            if(rs5.getInt(day)==1)
                flag = true;
        }
        if (flag){
            ResultSet rs4 =st.executeQuery("select * from trainrecord where train_id='"+selectedtrain[j]+"'");
            while(rs4.next()){
                out.println("<tr><td>"+rs4.getInt("train_id")+"</td><td>"+rs4.getString("train_name")+"</td><td>"+rs4.getString("train_type")+"</td><td><input type='radio' name='selectedtrain' value='"+rs4.getInt("train_id")+"'/></td></tr>");
            }
        }
    }
}*/

/*
String selectedRoute="";
ResultSet rs3=st.executeQuery("select * from trainroute");
int count = 0;
while(rs3.next()){
    int routeId = rs3.getInt("route_id");
    String stations = rs3.getString("selected_stations");
    StringTokenizer ss= new StringTokenizer(stations,",");
    while(ss.hasMoreElements()){
        int a = Integer.parseInt(ss.nextToken());
        System.out.println(a);
        if(a==stationSource)
            count++;
        else if(a==stationDestination){
            count++;
            break;
        }
    }
    if(count==2){
        selectedRoute = Integer.toString(routeId);
        System.out.println(routeId);
        break;
    }
}
ResultSet rs4=st.executeQuery("select * from trainrecord where train_root='"+selectedRoute+"'");
while(rs4.next()){
    out.println("<tr><td>"+rs4.getInt("train_id")+"</td><td>"+rs4.getString("train_name")+"</td><td>"+rs4.getString("train_type")+"</td><td>"+rs4.getString("seat_first_class")+"</td><td>"+rs4.getString("seat_second_class")+"</td><td>"+rs4.getString("seat_third_class")+"</td><td><input type='radio' name='selectedtrain' value='"+rs4.getInt("train_id")+"'/></td></tr>");
}
*/
%>
            </form>
        </tbody>
    </table>
    <br/>
</div>
<div>

<!--Login First Popup-->
<script type='text/javascript'>
function loginFirst(){
    window.location.href='index.jsp';
    alert("Login First to continue");
}
</script>

<div id="content" style="text-align:center;">
<% 
if(s!=null)
    out.println("<button class='button' type='button' onclick='callAjax()'>Check Availability</button>");
else
    out.println("<button class='button' type='button' onclick='loginFirst()'>Continue</button>");
%>
</div>
<br/><br/>  
<div id="result" ></div>  
</div>
</div>
</body>
</html>
