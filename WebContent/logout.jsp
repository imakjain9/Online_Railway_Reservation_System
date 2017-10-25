<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page session="false" %>

<%
	HttpSession s=request.getSession(false);
	s.invalidate(); 
	out.println("<script type='text/javascript'>	window.location.href='index.jsp';	</script>	");	

%>