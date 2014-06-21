<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
     <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jchartfx.system.js"></script>   	
   	<script type="text/javascript" src="js/jchartfx.coreBasic.js"></script> 
    <script type="text/javascript"src="js/jchartfx.animation.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>drag 2 chart</title>
</head>
<body onload="loadChart()">
<%
String colx=request.getParameter("x");   
//out.println("x axis-column before crop:  "+colx+"<br>");
String x1[]=colx.split("[.]");
String x=x1[1];//after dot store the value
out.println("x axis-column:  "+x+"<br>");
String coly=request.getParameter("y");
//out.println("Y axis-column before crop: "+coly+"<br>"); 
String y1[]=coly.split("[.]");
String y=y1[1];
out.println("y axis-column:  "+y+"<br>");
	
    //db connection starts and chart
      String query = "Select * from namelist"; 
	ArrayList listy=new ArrayList();
	ArrayList listx=new ArrayList();	
String db = "aravindh";  
  try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/"+db, "root", "aravindh");
    out.println (db+ " database successfully opened.fetching data<br>");
     Statement stmt = con.createStatement();   
     out.println("<b>data from database</b><br>");
     ResultSet rs = stmt.executeQuery(query);
   while (rs.next()) {
    	listx.add("'"+rs.getString(x)+"'");
		listy.add(rs.getString(y));				
	}        
	 for(int i=0;i<listy.size();i++)
	 {				
		out.println(listx.get(i));
		out.println(listy.get(i));		
		out.print("<br>");
	 }  
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  } 
%>
<div id="chart_box" class="col-md-5" style="width: 400px;height: 300px;background-color: grey;"> <p id="a" align="center" ></p></div>
<script type="text/javascript">
var chart1;
function loadChart()
  {
	//alert("hi in fun");
	console.log("in seperate bar function");		
	chart1 = new cfx.Chart();
	chart1.getData().setSeries(1);
	chart1.getAxisY().setMin(50);
	chart1.getAxisY().setMax(500);
	var Series1 = chart1.getSeries().getItem(0);		
	Series1.setGallery(cfx.Gallery.Bar);	
	window.data = new Array();
	//alert("data");	
	<%
    for(int i=0;i<listy.size();i++){    	
    	%>    	    	    
    	var obj = new Object();
    	obj['xaxis'] = <%=listx.get(i)%>;
    	obj['yaxis'] = <%=listy.get(i)%>;    	    	    	
    	data.push(obj);    	
    	<%
    }
	%>
	//alert(data);
	chart1.getAnimations().getLoad().setEnabled(true);
	chart1.setDataSource(data);
	var divholder = document.getElementById("chart_box");
	chart1.create(divholder);	
  }  
</script>

</body>
</html>
