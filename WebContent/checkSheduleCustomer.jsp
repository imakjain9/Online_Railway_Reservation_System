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

    var id=document.getElementById("mySelect").value;
    var url="showTrainShedule.jsp?id="+id+"";
    PostRequest(url);   
}
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
    height:713px;
    float:right;
    background-color: black;
    color:white;
    font-size: 20px;
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
</head>

<!--checking session -->
<% 
HttpSession s=request.getSession(false);
if(s==null)
    out.println("<script type='text/javascript'>    window.location.href='index.jsp';  alert('Please Login First'); </script>   ");
else
{%>

</head>
<body style="overflow-x:hidden; overflow-y:scroll;background:black;">
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


<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
Statement st= con.createStatement();  
%>

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



<div class="col-sm-10" style="padding:0px 10px; background-color:black; color:white; font-family: 'Comic Sans MS', cursive, sans-serif; font-size: 20px; height:616px; ">
    <h3><center> Check Train Shedule</center></h3>
    <div style="padding-left:250px;" class="form-group">
    <div style="color:white;text-align:right;font-size:18px;" class="control-label col-sm-4" >Select Train:</div>
    <div class="col-sm-4">
    <select id="mySelect" class="form-control" name="selectedTrain" onchange="callAjax()" required>
        <option setselected="true" value="">Choose Train</option>
        <% 
            ResultSet rs1=st.executeQuery("select * from trainrecord");
            while(rs1.next())
                out.println("<option value='"+rs1.getInt("train_id")+"'>"+rs1.getString("train_id")+":"+rs1.getString("train_name")+"</option>");
        %>
    </select>
    </div>
</div> 
<br/>
<br/>

<div id="result"></div>
</div>


<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</div>
</body>

<% } %>
</html>