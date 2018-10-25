<html>
<head>
<title>Package Page</title>
</head>
<body>
<center>
<form action="pack" method="post">
<table>
<tr>
<td>
UserId<input type="text" name="username" value="<%= request.getSession().getAttribute("Id") %>"><br>
</td>
</tr>
<tr>
<td>
Your Starting Point?<select name="usercity">
    <option value="Dhaka">Dhaka</option>
    <option value="Khulna">Khulna</option>
    <option value="Rajshahi">Rajshahi</option>
    <option value="Chittagong">Chittagong</option>
    <option value="Sylhet">Sylhet</option>
    <option value="Barisal">Barisal</option>
</select><br><br>
</td>
</tr>
<tr>
<td>
Phno <input type="text" name="userphno"><br>
</td>
</tr>
<tr>
<td>
Choose your Destination<select name="dest">
    <option value="Cox's Bazar">Cox's Bazar</option>
    <option value="Saint Martin">Saint Martin</option>
    <option value="Sundarban">Sundarban</option>
    <option value="Sylhet">Sylhet</option>
</select><br><br>
</td>
</tr>
<tr><td>
Choose your holiday Package<select name="types">
    <option value="Honeymoon">Honeymoon Package: 20000-40000 BDT</option>
    <option value="Family">Family Package: 30000-60000 BDT</option>
    <option value="Friends">Friends Holiday: 25000-50000 BDT</option>
    <option value="Trip">Weekend Trip: 20000-40000 BDT</option>
</select><br><br>
</td>
</tr>
<tr>
<td>
Hotel Catagory<select name="hotels">
    <option value="Budget">Budget: 20000-25000 BDT</option>
    <option value="Standard">Standard: 30000-50000 BDT</option>
    <option value="Delux">Delux: 40000-60000 BDT</option>
</select><br><br>
</td>
</tr>
<tr>
<td>
Ticket Booking<select name="book">
    <option value="1000">Bus: 1000 BDT per person</option>
    <option value="3000">Flight: 3000 BDT per person</option><br><br>
    </select><br><br>
  </td>
  </tr>
  <tr><td>  
Date to Start Journey: <input type="date" name="date" value="2017-06-01"><br><br><br>    
</td>
</tr>
<tr>
<td>
No. of Member: <input type="text" name="member"><br><br><br>
</td>
</tr>
<tr>
<td>
Need a Guide?<select name="guide">
    <option value="1200">Yes</option>
    <option value="0">No</option><br><br>
    </select><br><br><br>
  </td>
  </tr>  
</table>    
<input type="submit" value="Finish">
</form>
</center>
</body>
</html>