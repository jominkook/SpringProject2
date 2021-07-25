<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/creditMVC/DoOrder" method="get" >
		Item Number:
		<input type ="text" name="itemnumber"><br/>
		Desription:
		<input type="text" name="desription"><br/>
		Price Each:
		<input type="text" name="price"><br/>
		<hr>
		First Name:
		<input type="text" name="firstname"><br/>
		Last Name:
		<input type="text" name="lastname"><br/>
		Middle Initial:
		<input type="text" name="middlename"><br/>
		Shopping Address:
		<input type="text" name="address"><br/>
		Credit Card:<br/>
		<input type="radio" name="card" value="Visa">Visa<br/>
		<input type="radio" name="card" value="masterCard">MasterCard<br/>
		<input type="radio" name="card" value="american express">American Express<br/>
		<input type="radio" name="card" value="discover">Discover<br/>
		<input type="radio" name="card" value="discover">Java SmartCard<br/>
		Credit Card Number:
		<input type="password" name="cardnumber1"><br/>
		Repeat Credit Card Number:
		<input type="password" name="cardnumber2"><br/>
		<input type="submit" value="Press">
	</form>

</body>
</html>