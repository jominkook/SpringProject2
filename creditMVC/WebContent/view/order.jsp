<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Order Information</h3><br>
	<hr>
	<table border = "1">
		<tr><th height="40" width="40">Parameter Name</th><th height="40" width="40">Parameter Value</th></tr>
		<tr><td height="20" width="40">Item Number:</td><td height="20" width="40">${itemnumber}</td></tr>
		<tr><td height="20" width="40">Card Type:</td><td height="20" width="40">${card}</td></tr>
		<tr><td height="20" width="40">Price:</td><td height="20" width="40">${price}</td></tr>
		<tr><td height="20" width="40">First Name:</td><td height="20" width="40">${firstname}</td></tr>
		<tr><td height="20" width="40">Last Name:</td><td height="20" width="40">${lastname}</td></tr>
		<tr><td height="20" width="40">Middle Initial:</td><td height="20" width="40">${middlename}</td></tr>
		<tr><td height="20" width="40">Address:</td><td height="20" width="40">${address}</td></tr>
		<tr><td height="20" width="40">Card number:</td><td height="20" width="40">${cardnumber1}</td></tr>
		
	</table>
		
</body>
</html>