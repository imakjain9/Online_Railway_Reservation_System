import java.sql.*;
public class BeanRMS
{
	//***************************** VARIABLES FOR REGISTRATION ******************************************//
	private String email;
	private String username;
	private String password;
	private String name;
	private String gender;
	private String dob;
	private long mobile;
	private long pin;
	private String city;
	private String state;

	//****************************** VARIABLES FOR ADDING NEW TRAIN **************************************//
	private String trainname;
	private String traintype;

	//****************************** VARIABLES FOR ADDING NEW STATION *************************************//
	private String stationname;

	//******************************** VARIABLES FOR RESERVATION ******************************************//
	private String pnr;
	private String userEmail;
	private int selectedtrain;
	private String source;
	private String destination;
	private String seatType;
	private String selectedDate;
	private int fare;
	private int seatnumber;
	private String passengername;
	private int passengerage;
	private long passengeraadhaar; 
	private String bookingstatus;
	private String paymentstatus;

	//*******************************CONSTRUCTOR*******************************************//
	public BeanRMS()
	{}

	//*******************************SETTER & GETTER FOR REGISTRATION******************************//
	public String getEmail(){
		return email;
	}
	public void setEmail(String email){
		this.email=email;
	}
	public String getUsername(){
		return username;
	}
	public void setUsername(String username){
		this.username=username;
	}
	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name=name;
	}
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password=password;
	}
	public String getDob(){
		return dob;
	}
	public void setDob(String dob){
		this.dob=dob;
	}
	public long getMobile(){
		return mobile;
	}
	public void setMobile(long mobile){
		this.mobile=mobile;
	}
	public String getGender(){
		return gender;
	}
	public void setGender(String gender){
		this.gender=gender;
	}
	public long getPin(){
		return pin;
	}
	public void setPin(long pin){
		this.pin=pin;
	}
	public String getCity(){
		return city;
	}
	public void setCity(String city){
		this.city=city;
	}
	public String getState(){
		return state;
	}
	public void setState(String state){
		this.state=state;
	}

	//********************************SETTER & GETTER FOR ADDING NEW TRAIN*********************************//
	public String getTrainname(){
		return trainname;
	}
	public void setTrainname(String trainname){
		this.trainname=trainname;
	}
	public String getTraintype(){
		return traintype;
	}
	public void setTraintype(String traintype){
		this.traintype=traintype;
	}

	//*******************************SETTER & GETTER FOR ADDING NEW STATION*********************************//
	public void setStationname(String stationname){
		this.stationname=stationname;
	}
	public String getStationname(){
		return stationname;
	}

	//*******************************SETTER & GETTER FOR RESERVATION*********************************//
	public void setPnr(String pnr){
		this.pnr=pnr;
	}
	public String getPnr(){
		return pnr;
	}
	public void setUserEmail(String userEmail){
		this.userEmail=userEmail;
	}
	public String getUserEmail(){
		return userEmail;
	}
	public void setSelectedtrain(int selectedtrain){
		this.selectedtrain=selectedtrain;
	}
	public int getSelectedtrain(){
		return selectedtrain;
	}
	public void setSource(String source){
		this.source=source;
	}
	public String getSource(){
		return source;
	}
	public void setDestination(String destination){
		this.destination=destination;
	}
	public String getDestination(){
		return destination;
	}
	public void setSeatType(String seatType){
		this.seatType=seatType;
	}
	public String getSeatType(){
		return seatType;
	}
	public void setSelectedDate(String selectedDate){
		this.selectedDate=selectedDate;
	}
	public String getSelectedDate(){
		return selectedDate;
	}
	public void setFare(int fare){
		this.fare=fare;
	}
	public int getFare(){
		return fare;
	}
	public int getSeatnumber(){
		return seatnumber;
	}
	public void setSeatnumber(int seatnumber){
		this.seatnumber=seatnumber;
	}
	public String getPassengername(){
		return passengername;
	}
	public void setPassengername(String passengername){
		this.passengername=passengername;
	}
	public int getPassengerage(){
		return passengerage;
	}
	public void setPassengerage(int passengerage){
		this.passengerage=passengerage;
	}
	public long getPassengeraadhaar(){
		return passengeraadhaar;
	}
	public void setPassengeraadhaar(long passengeraadhaar){
		this.passengeraadhaar=passengeraadhaar;
	}
	public String getBookingstatus(){
		return bookingstatus;
	}
	public void setBookingstatus(String bookingstatus){
		this.bookingstatus=bookingstatus;
	}
	public String getPaymentstatus(){
		return paymentstatus;
	}
	public void setPaymentstatus(String paymentstatus){
		this.paymentstatus=paymentstatus;
	}

	//******************************************* USER REGISTRATION *********************************************//
	public int RegisterUser()
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
			Statement st= con.createStatement(); 
			i=st.executeUpdate("insert into userregistration (email,username,password,name,gender,dob,mobile,pin,city,state) values ('"+email+"','"+username+"','"+password+"','"+name+"','"+gender+"','"+dob+"','"+mobile+"','"+pin+"','"+city+"','"+state+"')");
		}
		catch (Exception e  )
		{
			e.printStackTrace();
		}
		return i;
	}

	//************************************************* UPDATE USER  ***********************************************//
	public int UpdateUser()
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
			Statement st= con.createStatement(); 
			i=st.executeUpdate("UPDATE userregistration SET password='"+password+"',name='"+name+"',gender='"+gender+"',dob='"+dob+"',mobile='"+mobile+"',pin='"+pin+"',city='"+city+"',state='"+state+"' where email='"+email+"'");
		}
		catch (Exception e  )
		{
			e.printStackTrace();
		}
		return i;
	}

	//************************************************* ADD NEW STATION  ***********************************************//
	public int AddStation()
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741");
			Statement st= con.createStatement(); 
			i=st.executeUpdate("insert into station(station_name) values ('"+stationname+"')");
		}
		catch (Exception e  )
		{
			e.printStackTrace();
		}
		return i;
	}

	//************************************************* TRAIN BOOKING  ***********************************************//
	public String BookTicket()
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RMS","root","7827444741"); 
			Statement st= con.createStatement(); 
			System.out.println("working123");
			st.executeUpdate("insert into Reservation values ('"+pnr+"','"+userEmail+"','"+passengername+"','"+passengerage+"','"+passengeraadhaar+"','"+selectedDate+"','"+selectedtrain+"','"+source+"','"+destination+"','"+seatType+"','"+fare+"','"+seatnumber+"','"+bookingstatus+"','"+paymentstatus+"')"); 
			System.out.println("working321");
		}
		catch (Exception e  )
		{
			e.printStackTrace();
		}
		return pnr;
	}

}