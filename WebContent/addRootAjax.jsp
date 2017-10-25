<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="java.text.*"%>
<html>
<body>
<%
int numofstation = Integer.parseInt(request.getParameter("num"));
try{
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from station");
ArrayList<String> mylist = new ArrayList<String>();
ArrayList<String> mylistId = new ArrayList<String>();
while(rs.next()){
mylist.add(rs.getString("name"));
mylistId.add(rs.getString("id"));
}


int i=0;
int count = 0;
if(numofstation == 0)
%>
	<div class='form-group'>
		<label class='control-label col-sm-3'>Select Stations <%=++i%>:</label>
	<div class="col-sm-3">
		<%out.println("<select class='form-control' name="+(count+1)+">");%>
			<option setSelected="true"> Choose Station </option>
			<% 
				for(int j=0;j<mylist.size();j++) 
				{
            		out.println("<option value="+mylistId.get(j)+">"+ mylist.get(j) +"</option>");
            	}
            %>
		</select>
	</div>
	</div>
<% 
}
catch(Exception e)
{}%>

</body>
</html>


