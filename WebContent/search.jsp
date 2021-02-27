<%@ page import ="java.sql.*" %>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<%
String name = request.getParameter("val");
if(name==null || name.trim().equals(""))
{
	out.print("<p>Please Enter Name !! </p>");
}
else
{
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedb", "root", "admin123");
		
        PreparedStatement ps=con.prepareStatement("select * from emp where Name like '"+name+"%'"); 
		
        ResultSet rs = ps.executeQuery();
        
        if(!rs.isBeforeFirst())
        {
        	out.println("<p>No Record Found ! </p>");
        	
        }
        else
        {
        	out.print("<table border = '1' cellpadding='2' width = '100%'>");
        	out.print("<tr><th>ID</th><th>Name</th>");
        	
        	while(rs.next())
        	{
        		out.print("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td></tr>");
        		
        	}
        	out.print("</table>");
        }
        con.close();
        
	}catch(Exception e)
	{
		out.print(e);
	}
	
}
%>
</body>
</html>