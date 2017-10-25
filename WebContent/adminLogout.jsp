<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page session="false" %>

<%
	HttpSession sAdmin=request.getSession(false);
	sAdmin.invalidate(); 
	out.println("<script type='text/javascript'>	window.location.href='admin.jsp';	</script>	");	

%>