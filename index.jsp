<%-- 
    Document   : index
    Created on : Feb 18, 2018, 3:45:37 PM
    Author     : Jeganathan
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Home</title>
        <link rel="icon" href="cap.ico"/>
        <link rel="stylesheet" href="style1.css"/>
        <link rel="stylesheet" href="style.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
    </head>
    <body>
         <style>
        .jumbotron { 
            background-color: #f4511e; /* Orange */
            color: #ffffff;
        }
    </style>
    <center>  
        <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">KCET</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.jsp">HOME</a></li>
        <li><a href="busno.html">ABOUT</a></li>
      </ul>
    </div>
  </div>
    <div class="jumbotron text-center"><br>
    <h1>Bus Number Application</h1> <br>
    <p>JEGAN HANISH</p>
    </div>
<%
    String query=request.getParameter("query");
    StringBuilder str=new StringBuilder();
    Class.forName("com.mysql.jdbc.Driver");
    String username="root";
    String password="jeganathan";
    String url="jdbc:mysql://localhost:3306/bus_info";
    str.append("<table>");
    str.append("<tr>");
    str.append("<td>Boarding</td>");
    str.append("<td>Destination</td>");
    str.append("<td>Bus No</td>");
    str.append("</tr>");
    try{
        Connection con=DriverManager.getConnection(url,username,password);
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from madurai;");
        while(rs.next()){
            str.append("<tr>");
            str.append("<td>"+rs.getString("boarding")+"</td>");
            str.append("<td>"+rs.getString("destination")+"</td>");
            str.append("<td>"+rs.getString("bus_no")+"</td>");
            str.append("</tr>");
        }
    con.close();
    str.append("</table>");
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
    out.println(str);
%>
    </center>
</body>
</html>