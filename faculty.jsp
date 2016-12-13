<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.MyConnection"%>
<%@page import="java.sql.ResultSet"%><%@page import="java.sql.Statement"%><%@page import="connection.MyConnection"%><%@page import="admin.*"%><%@page import="org.hibernate.Session"%><%@page import="org.hibernate.SessionFactory"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Faculty</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%String course=request.getParameter("course"); %>
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />


<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" /> 
<script type="text/javascript">
 <script type="text/javascript">
function validateForm(){
	var answer = confirm("Are You Sure ?")
	if (answer){
		alert("Insertion  in process!")
		
	}
	else{
		alert("Not INSERTED!")
		return false
	}
	
}  
function pcal1()
          {
             var num1 = document.getElementById("maritial").value;
             var num2 = document.getElementById("physics").value;
             var num3 = document.getElementById("maths").value;
            
               
           
            var sum = parseInt(num1)+  parseInt(num2)+parseInt(num3);
            sum=sum/3;
            var n = sum.toFixed(0); 
             document.getElementById('pcm').value = n;
          }
	  document.getElementById('maritial').onchange = function() {
    document.getElementById('hname').disabled = !this.checked;
};
		  
</script>

</head>
<body id="top">
<%//String mgmt=(String)session.getAttribute("mgmt");
//if(mgmt==null || mgmt==""){
//response.sendRedirect("../../Admin/Management.jsp?logcheck=false&check=false");
//}

MyConnection mc = new MyConnection();
	           			mc.connect();
					Statement st=mc.con.createStatement();
 String fid=request.getParameter("fid");               	
 %>
 <jsp:include page="top.html" ></jsp:include>
<div class="wrapper col2"><div id="header">
    <div class="fl_left" style="width: 200px;">
  <style>

#pa ul#topnav1{display:block;  list-style:none; font-size:14px; font-weight:bold; font-family:Verdana, Arial, Helvetica, sans-serif;}
#pa  ul#topnav1 ul, #pa li{float:; list-style:none; margin:0; padding:0;}
#pa  li a:link, #pa li a:visited, #pa li a:hover{display:block; margin:0 px 0 0; padding:10px 0px; color:#165923; background:orange; border-left:1px solid #FFFFFF;}
#pa  ul#topnav1 ul li a:link, #pa ul#topnav1 ul li a:visited{border:none;}
#pa  ul#topnav1 li.last a{margin-right:0;}
#pa  li a:hover, #pa ul#topnav1 li.active a{color:#FFFFFF; background-color:orange;}
#pa  li li a:link, #pa li li a:visited{width:150px; float:none; margin:0; padding:px 0px; font-size:12px; font-weight:normal; background-color:orange; border-left:1px solid #FFFFFF;}
#pa  li li a:hover{color:#FFFFFF; background-color:orange;}
#pa  li ul{background:; z-index:9999; position:absolute; left:-em; height:auto; width:170px; border-left:1px solid #FFFFFF; border-bottom:1px solid #FFFFFF;}
#pa  li ul a{width:140px;}
#pa  li ul ul{margin:3px 0 0 0;}
#pa  li:hover ul ul{left:-999em;}
#pa  li:hover ul, #pa li li:hover ul{left:auto;}
#pa  li:hover{position:static;}
#pa  li.last a{margin-right:0;}


</style>

   
    </div> <ul id="topnav1" style="float: right;width: 100%;">
    
  
     
<li><a href="index.html">HOMEPAGE</a> 
   
    </li> 
   </ul><br class="clear" />
  </div>

</div>
<%String uid="";
			try{ 
							ResultSet l= st.executeQuery("select id from staff order by id desc limit 1");
                			while(l.next()){
uid=l.getString(1);

 } 
    }
        catch(Exception e){e.printStackTrace();
       }


%>
     
<div class="wrapper col4">
  <div id="container">
    <div id="services">
<center><h1>REGISTRATION FORM</h1></center>
<%if(fid.equals("2")){%>
<center><h1>Registered Scuccesfully</h1>
<h3>Please Login After Management Approval.</h3><%}%>
</center>
	<center><table>
<form action="addfaculty" method="post" name="myForm" onsubmit="return validateForm()">
<tr><td>User ID</td><td><input type="text" name="userid" id="userid" readonly="readonly" value="VKGC_FAC_00<%=uid%>"></td><td> College</td><td><select name="college"><option></option>
<%
			try{ 
							ResultSet l= st.executeQuery("select college from colleges group by college");
                			while(l.next()){
%><option value="<%=l.getString(1)%>"><%=l.getString(1)%></option>
<%
 } 
    }
        catch(Exception e){e.printStackTrace();
       }


%>
</select></td></tr>
<tr><td>Staff Name</td><td><input type="text" name="name"></td> <td>Department</td><td><select name="department"><option value="Applied Science">Applied Science</option><option value="Supporting Staff">Supporting Staff</option>
<option value="BBA">BBA</option><option value="BCA">BCA</option><option value="BEd">BEd</option><option value="Registrar Office">Registrar Office</option><option value="BA">BA</option><%
			try{ ResultSet l= st.executeQuery("select branch from btech group by branch order by branch");while(l.next()){
%><option value="<%=l.getString("branch")%>"><%=l.getString("branch")%></option><% }} catch(Exception e){e.printStackTrace();}%></select></td></tr>

<tr><td>Email</td><td><input type="text" name="email"></td><td>Date Of Joining</td><td><input type="text" name="dateofjoining"></td></tr>

<tr><td>Date Of Birth</td><td><input type="text" name="dob"><td>Post</td><td><input type="text" name="post"></td></tr>
<tr><td>Mobile</td><td><input type="text" name="mobile"></td><td>Aadhar Number</td><td><input type="text" name="aadharnum"></td></tr>
<tr><td>Emergency Mobile</td><td><input type="text" name="amobile"></td><td>PAN Number</td><td><input type="text" name="pannumber"></td></tr>
<tr><td>Father Name</td><td><input type="text" name="fname"></td><td>Bank Name</td><td><input type="text" name="bankname"></td></tr>
<tr><td>Maritial Status</td><td>
<input type="checkbox" name="maritial" value="1" id="yourBox">

<script>
document.getElementById('yourBox').onchange = function() {
    document.getElementById('hname').disabled = !this.checked;
	document.getElementById('mname').disabled = !this.checked;
};

</script></td><td>Account Number</td><td><input type="text" name="accountnumber"></td></tr>
<tr><td>Husband's Name</td><td><input type="text" name="hname" id="hname"></td><td>Level</td><td><select name="level"><option value="Not Defined"></option><option value="VKIT">VKIT</option><option value="VKDC">VKDC</option></td></tr>
<tr><td>Mother's Name</td><td><input type="text" name="mname" id="mname"></td><td>Religion</td><td><select name="religion"><option value="Not Defined"></option><option value="Hindu">Hindu</option>
         										<option value="Sikh">Sikh</option>
        										 <option value="Muslim">Muslim</option>
         										<option value="Christian">Christian</option>
         										<option value="Other">Other</option>
         							</select></td></tr>
<tr><td>Address</td><td><input type="text" name="address"></td><td>Category</td><td><select name="category"><option value="Not Defined"></option><option value="General">General</option>
         										<option value="OBC">OBC</option>
        										 <option value="SC">SC</option>
         										<option value="Minority">Minority</option>
         										<option value="ST">ST</option>
         							</select></td></tr>
<tr><td>City</td><td><input type="text" name="city"></td><td>Caste</td><td><input type="text" name="caste"></td></tr>
<tr><td>Pin Code</td><td><input type="text" name="pincode"></td><td>Highest Qualification</td><td><input type="text" name="hiqualification"></td></tr>
<tr><td>State</td><td><select name="state"><option></option><option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
<option value="Andhra Pradesh">Andhra Pradesh</option><option value="Arunachal Pradesh">Arunachal Pradesh</option><option value="Assam">Assam</option><option value="Bihar">Bihar</option><option value="Chandigarh">Chandigarh</option><option value="Chhattisgarh">Chhattisgarh</option><option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option><option value="Daman and Diu">Daman and Diu</option><option value="Delhi">Delhi</option><option value="Goa">Goa</option><option value="Gujarat">Gujarat</option><option value="Haryana">Haryana</option><option value="Himachal Pradesh">Himachal Pradesh</option>
<option value="Jammu and Kashmir">Jammu and Kashmir</option><option value="Jharkhand">Jharkhand</option><option value="Karnataka">Karnataka</option><option value="Kerala">Kerala</option><option value="Lakshadweep">Lakshadweep</option><option value="Madhya Pradesh">Madhya Pradesh</option><option value="Maharashtra">Maharashtra</option><option value="Manipur">Manipur</option><option value="Meghalaya">Meghalaya</option><option value="Mizoram">Mizoram</option><option value="Nagaland">Nagaland</option><option value="Orissa">Orissa</option><option value="Pondicherry">Pondicherry</option><option value="Punjab">Punjab</option><option value="Rajasthan">Rajasthan</option><option value="Sikkim">Sikkim</option>
<option value="Tamil Nadu">Tamil Nadu</option><option value="Tripura">Tripura</option><option value="Uttaranchal">Uttaranchal</option><option value="Uttar Pradesh">Uttar Pradesh</option>
<option value="West Bengal">West Bengal</option></select>
</td><td>University</td><td><input type="text" name="university"></td></tr>

<tr><td> Real Birth Day & Month</td><td><select name="day"><%
			try{ ResultSet l= st.executeQuery("select * from day order by id");while(l.next()){
%><option value="<%=l.getString("day")%>"><%=l.getString("day")%></option><% }} catch(Exception e){e.printStackTrace();}%></select><select name="month"><%
			try{ ResultSet l= st.executeQuery("select * from month order by id");while(l.next()){
%><option value="<%=l.getString("month")%>"><%=l.getString("month")%></option><% }} catch(Exception e){e.printStackTrace();}%></select></td><td>%age (Highest qualification)</td><td><input type="text" name="percentage"></td></tr>
<tr><td></td><td><td>Passing Year (Highest qualification)</td><td><input type="text" name="passyear"></td></tr>
<tr></tr>

<tr></tr>

	<tr>
			<input type="hidden" name="basicsalary" value="0">
</tr>

	</table>
<tabLe>
<tr>
<td style="text-align:center;"><input type="submit" style="width:140px;height:30px;background:green;" value="Register Faculty "></td></tr></table>
     </center>
 </form>
     
     
     
      <br class="clear" />
    </div>
   </div>
</div>

<div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2016 - All Rights Reserved - <a href="#">VKGC,Bijnor</a></p>
    <p class="fl_right">Designed by <a target="_blank" href="#" title="">Vipul Kumar</a></p>
    <br class="clear" />
  </div>
</div>
</body>
</html>