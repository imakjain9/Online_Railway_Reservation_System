import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import java.lang.*;
public class UserController extends HttpServlet
{
	public String createRandomNumber(long len) 
	{
    	if (len > 18)
        	throw new IllegalStateException("To many digits");
    	long tLen = (long) Math.pow(10, len - 1) * 9;
		long number = (long) (Math.random() * tLen) + (long) Math.pow(10, len - 1) * 1;
		String tVal = number + "";
    	if (tVal.length() != len) {
        	throw new IllegalStateException("The random number '" + tVal + "' is not '" + len + "' digits");
    	}
    	return tVal;
	}

	public void doPost(HttpServletRequest request ,HttpServletResponse response) throws IOException,ServletException
	{
	try{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<html><body>");
		HttpSession session = request.getSession(false);
		ServletContext context=getServletContext(); 

		String id = request.getParameter("id");
		System.out.println("id: "+id);


		//*********************************************** USER REIGISTRATION *********************************************************//
		if(id.equals("userregister"))
		{
			
				String email=request.getParameter("email"); 
				String username=request.getParameter("username"); 
				String password=request.getParameter("password"); 
				String name=request.getParameter("name"); 
				String gender=request.getParameter("gender");
				String dob=request.getParameter("DOB");
				long mobile=Long.parseLong(request.getParameter("mobile")); 
				long pin=Long.parseLong(request.getParameter("pin"));
				String city=request.getParameter("city");
				String state=request.getParameter("state");
			
				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
				Statement st= con.createStatement(); 
				ResultSet rs=st.executeQuery("select * from userregistration where email='"+email+"'"); 
				if(rs.next()) {	 
					out.println("<script type='text/javascript'>	window.location.href='index.jsp';	alert('Email Already Exists');</script>	");
				}
				else{
					BeanRMS bean = new BeanRMS();
					bean.setEmail(email);
					bean.setUsername(username);
					bean.setPassword(password);
					bean.setName(name);
					bean.setGender(gender);
					bean.setDob(dob);
					bean.setMobile(mobile);
					bean.setPin(pin);
					bean.setCity(city);
					bean.setState(state);
					bean.RegisterUser();
					out.println("<script type='text/javascript'>	window.location.href='index.jsp';	alert('Regestration Successful Please Login');	</script>	");		
				}
		}


		//*************************************************** UPDATE USER *********************************************************//
		if(id.equals("userupdate"))
		{
			
				String email=(String)session.getAttribute("email"); 
				String username=(String)session.getAttribute("username"); 
				String password=request.getParameter("password"); 
				String name=request.getParameter("name"); 
				String gender=request.getParameter("gender");
				String dob=request.getParameter("DOB");
				long mobile=Long.parseLong(request.getParameter("mobile")); 
				long pin=Long.parseLong(request.getParameter("pin"));
				String city=request.getParameter("city");
				String state=request.getParameter("state");

				BeanRMS bean = new BeanRMS();
				bean.setEmail(email);
				bean.setUsername(username);
				bean.setPassword(password);
				bean.setName(name);
				bean.setGender(gender);
				bean.setDob(dob);
				bean.setMobile(mobile);
				bean.setPin(pin);
				bean.setCity(city);
				bean.setState(state);
				bean.UpdateUser();
				out.println("<script type='text/javascript'>	window.location.href='index.jsp';	alert('Profile Updated Succesfully');	</script>	");	
		}


		//*************************************************** USER LOGIN *********************************************************//
		if(id.equals("userlogin"))
		{
				String email=request.getParameter("email");  
				String password=request.getParameter("password");
			
				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
				Statement st= con.createStatement(); 
				ResultSet rs=st.executeQuery("select * from userregistration where email='"+email+"' AND password='"+password+"'"); 
				if(rs.next()){ 
					HttpSession s=request.getSession();
					out.println("<script type='text/javascript'>	window.location.href='index.jsp';	</script>	");
					s.setAttribute("email",email);
					s.setAttribute("username",rs.getString("username"));
				}
				else{ 
					out.println("<script type='text/javascript'>	window.location.href='index.jsp'; alert('Login Failed Incorrect password')	</script>");	
				}
		}


		//*************************************************** ADD STATION *********************************************************//
		if(id.equals("addstation"))
		{
				boolean check = true;
				String stationname1 = request.getParameter("station_name");
				String stationname = stationname1.toUpperCase();
				System.out.println(stationname);
				BeanRMS bean = new BeanRMS();
				bean.setStationname(stationname);
				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
				Statement st= con.createStatement(); 
				ResultSet rs=st.executeQuery("select * from station where station_name='"+stationname+"'");
				if(rs.next())
				{
					check = false;
				}
				if(check){
					bean.AddStation();
					out.println("<script type='text/javascript'>	window.location.href='addStation.jsp';	alert('Station Added Successfully');	</script>	");	
				}
				else
					out.println("<script type='text/javascript'>	window.location.href='addStation.jsp';	alert('Station Already Exists');	</script>	");
		}


		//*************************************************** CANCEL BOOKING *********************************************************//
		if(id.equals("cancelbooking1"))
		{
			String cancelpnr = request.getParameter("selectedPNR");
			session.setAttribute("cancelPNR",cancelpnr);
			RequestDispatcher dispatcher = request.getRequestDispatcher("UserController?id=cancelbooking");
			dispatcher.forward(request,response);
		}


		//*************************************************** CANCEL LAST BOOKING *********************************************************//
		if(id.equals("cancelbooking"))
		{
			String cancelPNR = (String)session.getAttribute("cancelPNR");
			System.out.println("pnr: "+cancelPNR);
			int canceltrain = 0, cancelseatnumber = 0;
			String canceldate ="", cancelSource = "", cancelDestination = "", cancelseatType = "";
			boolean check = false;
			
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
			Statement st= con.createStatement(); 
			ResultSet rs5=st.executeQuery("select * from Reservation where PNR='"+cancelPNR+"'");
			if(rs5.next())
			{
				if(rs5.getString("bookingstatus").equals("waiting"))
				{
					st.executeUpdate("update Reservation set bookingstatus = 'cancelled' where PNR='"+cancelPNR+"'"); 
					out.println("<script type='text/javascript'>	window.location.href='index.jsp';	alert('Reservation Cancelled Successfully');	</script>	");	
					System.out.println("canceled waitng no move ahead");
				}
				else
					check = true;
			}
			if(check)
			{
				System.out.println(check);
				ResultSet rs4=st.executeQuery("select * from Reservation where PNR='"+cancelPNR+"'");
				if(rs4.next()){
					canceltrain = rs4.getInt("train_id");
					cancelseatType = rs4.getString("seatType"); 
					cancelseatnumber = rs4.getInt("seatnumber");
					canceldate = rs4.getString("bookingdate");
					System.out.println("getting the values");
				}
				System.out.println(cancelPNR);
				st.executeUpdate("update Reservation set bookingstatus = 'cancelled' where PNR='"+cancelPNR+"'"); 
				System.out.println("canceled confirmed");

				ResultSet rs2=st.executeQuery("select * from Reservation where train_id='"+canceltrain+"' AND seatType='"+cancelseatType+"' AND bookingdate='"+canceldate+"' AND bookingstatus='waiting' LIMIT 1");
				if(rs2.next()){
					System.out.println("yes waiting");
					st.executeUpdate("update Reservation set bookingstatus = 'confirmed', seatnumber = '"+cancelseatnumber+"' where PNR='"+rs2.getString("PNR")+"'"); 
					System.out.println("canceled successfully with wating final");
				}
				out.println("<script type='text/javascript'>	window.location.href='index.jsp';	alert('Reservation Cancelled Successfully');	</script>	");	
				
			}
		}



		//*************************************************** TRAIN BOOKING *********************************************************//
		if(id.equals("trainbooking"))
		{
			
			if(session!=null){
			String userEmail = (String)session.getAttribute("email");
			int selectedtrain = (Integer)session.getAttribute("selectedtrain");
			String source = (String)session.getAttribute("source");
			String destination = (String)session.getAttribute("destination");
			String seatType = (String)session.getAttribute("seattype");
			String passengername= (String)session.getAttribute("passengername"); 
			int passengerage= Integer.parseInt((String)session.getAttribute("passengerage")); 
			long passengeraadhaar= Long.parseLong((String)session.getAttribute("passengeraadhaar")); 
			String selectedDate = (String)session.getAttribute("selectedDate");
			int fare = (Integer)session.getAttribute("fare");
			int waitingleft = (Integer)session.getAttribute("waitingleft");
			int seatLeft = (Integer)session.getAttribute(seatType);
			int seatnumber = (Integer)session.getAttribute("l"+seatType);
			String bookingstatus="";
			String paymentstatus="paid";
			System.out.println(seatnumber);
			
			String pnr = "";
			boolean check = true;
			while(check)
			{
				pnr = new UserController().createRandomNumber(10);
				System.out.println(pnr);
			
				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
				Statement st= con.createStatement(); 
				ResultSet rs=st.executeQuery("SELECT * FROM Reservation where PNR='"+pnr+"'"); 
				if(!rs.next())
					check = false;
			}
					
			session.setAttribute("PNR", pnr);
			BeanRMS bean = new BeanRMS();
			bean.setPnr(pnr);
			bean.setUserEmail(userEmail);
			bean.setPassengername(passengername);
			bean.setPassengerage(passengerage);
			bean.setPassengeraadhaar(passengeraadhaar);
			bean.setSelectedDate(selectedDate);
			bean.setSelectedtrain(selectedtrain);
			bean.setSource(source);
			bean.setDestination(destination);
			bean.setSeatType(seatType);
			bean.setFare(fare);
			bean.setPaymentstatus(paymentstatus);
			if(seatLeft>0){
				bookingstatus = "confirmed";
				bean.setSeatnumber(seatnumber);
				bean.setBookingstatus(bookingstatus);
				bean.BookTicket();
				RequestDispatcher dispatcher = request.getRequestDispatcher("showTicket.jsp");
				dispatcher.forward(request,response);
			}
			if(seatLeft<=0 && waitingleft>0){
				bookingstatus = "waiting";
				bean.setSeatnumber(0);
				bean.setBookingstatus(bookingstatus);
				String i = bean.BookTicket();
				out.println("<script type='text/javascript'>	window.location.href='index.jsp';	alert('Seat is not available your ticket is in waiting list. Your PNR : " +i+"');	</script>	");	
			}
			if(waitingleft<=0){
				System.out.println("working2");
				out.println("<script type='text/javascript'>	window.location.href='index.jsp';	alert('Sorry!!! Seat is not available');	</script>	");
			}
			}
		}


		//*************************************************** ADMIN LOGIN *********************************************************//
		if(id.equals("adminlogin"))
		{
			String adminuser = request.getParameter("adminuser");
			String adminpassword = request.getParameter("adminpassword");
			if(adminuser.equals("imakjain") && adminpassword.equals("12345")){
				HttpSession s = request.getSession();
				s.setAttribute("adminuser",adminuser);
				out.println("<script type='text/javascript'>	window.location.href='admin.jsp';	</script>	");
			}
			else
				out.println("<script type='text/javascript'>	alert('Incorrect Username or Password'); window.location.href='admin.jsp';	</script>	");
		}



		//********************************************* Update Password*******************************************************
		if(id.equals("updatepassword"))
		{
			
				String email = request.getParameter("email");
				String newpassword = request.getParameter("newpassword");
				String confirmpassword = request.getParameter("confirmpassword");

				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
				Statement st= con.createStatement(); 
				ResultSet rs=st.executeQuery("select * from UserRegistration where email='"+email+"'"); 
				if(!rs.next()) 
					out.println("<script type='text/javascript'>	window.location.href='forgotpassword.jsp';	alert('Wrong email entered!! Try agian')</script>	");
				else { 
					System.out.println("undone");
					if(newpassword.equals(confirmpassword)){
						st.executeUpdate("update UserRegistration set password = '"+newpassword+"' where email='"+email+"'");
						out.println("<script type='text/javascript'>	window.location.href='index.jsp'; alert('Password Updated successfully!! login now')	</script>");	
					}
				}
			
		}




		//*************************************************** Delete Trains *********************************************************//
		if(id.equals("deleteTrain"))
		{
			int deletetrain = Integer.parseInt(request.getParameter("deletetrain"));
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
			Statement st= con.createStatement(); 
			st.executeUpdate("delete from trainrecord where train_id = '"+deletetrain+"'");
			out.println("<script type='text/javascript'>	alert('Train Deleted Successfully'); window.location.href='admin.jsp';	</script>	");
		}



		//*************************************************** Feedback *********************************************************//
		if(id.equals("feedback"))
		{
			String email = (String)session.getAttribute("email");
			String feedback = request.getParameter("feedback");
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
			Statement st= con.createStatement(); 
			st.executeUpdate("update UserRegistration set feedback = '"+feedback+"' where email = '"+email+"'");
			out.println("<script type='text/javascript'>	alert('Feedback submitted successfully'); window.location.href='index.jsp';	</script>	");
		}



		//*************************************************** NEW TRAIN & TRAIN SHEDULE *********************************************************//
		if(id.equals("addTrainShedule"))
		{
			ArrayList<String> weekdays = (ArrayList<String>)session.getAttribute("weekdays");
			System.out.println("start1");
			int trainNumber = Integer.parseInt(request.getParameter("trainNumber"));
			System.out.println("start2");
			System.out.println("number "+trainNumber);
			String trainName = request.getParameter("trainName");
			System.out.println("start3");
			System.out.println("number "+trainName);
			String trainType = request.getParameter("trainType");
			System.out.println("type "+trainType);
			//int trainStops = Integer.parseInt(request.getParameter("numofstops"));
			String[] stopnumber = request.getParameterValues("stopnumber");
			System.out.println("start4");
			String[] stationid = request.getParameterValues("stationid");
			String[] arrival = request.getParameterValues("arrival");
			System.out.println("start5");
			String[] departure = request.getParameterValues("departure");
			String[] dstncFrmSrc = request.getParameterValues("dstncFrmSrc");
			int sunday = 0, monday = 0, tuesday = 0, wednesday = 0, thursday = 0,friday = 0, saturday =0;
			for(int i = 0;i<weekdays.size();i++)
			{
				if(weekdays.get(i).equals("sunday"))
					sunday = 1;
				if(weekdays.get(i).equals("monday"))
					monday = 1;
				if(weekdays.get(i).equals("tuesday"))
					tuesday = 1;
				if(weekdays.get(i).equals("wednesday"))
					wednesday = 1;
				if(weekdays.get(i).equals("thursday"))
					thursday = 1;
				if(weekdays.get(i).equals("friday"))
					friday = 1;
				if(weekdays.get(i).equals("saturday"))
					saturday = 1;
			}

			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
			Statement st= con.createStatement(); 
			st.executeUpdate("insert into trainrecord values('"+trainNumber+"','"+trainName+"','"+trainType+"')");
			st.executeUpdate("insert into WeekDays values('"+trainNumber+"','"+sunday+"','"+monday+"','"+tuesday+"','"+wednesday+"','"+thursday+"','"+friday+"','"+saturday+"')");
			System.out.println("start6");
			System.out.println(stopnumber.length);
			for(int i=0;i<stopnumber.length;i++)
			{	
				System.out.println(trainNumber);
				System.out.println(Integer.parseInt(stationid[i]));
				System.out.println(Integer.parseInt(stopnumber[i]));
				System.out.println(arrival[i]);
				System.out.println(departure[i]);
				System.out.println(Integer.parseInt(dstncFrmSrc[i]));
				st.executeUpdate("insert into trainshedule values('"+trainNumber+"','"+Integer.parseInt(stationid[i])+"','"+Integer.parseInt(stopnumber[i])+"','"+arrival[i]+":00','"+departure[i]+":00','"+Integer.parseInt(dstncFrmSrc[i])+"')");
				System.out.println("start7");
			}
			out.println("<script type='text/javascript'>	alert('Train has been added Successfully'); window.location.href='admin.jsp';	</script>	");
		}



	}catch(Exception e){
				PrintWriter out=response.getWriter();
				out.println("<html><body>");
				HttpSession s = request.getSession(false);
				s.invalidate();
				out.println("<script type='text/javascript'>	window.location.href='index.jsp';	alert('OOPS!! some unexpected error occured');	</script>");	
				e.printStackTrace();
	}
}
}