<%@ include file="include/session_check.jsp"%>
<%@ page session="true"%>

<%@ page import="java.sql.*" session="true"%>
<%@ page import="java.util.*" errorPage="error.jsp"%>
<%@ page import="java.io.*"%>
<%
String windowTitle = application.getInitParameter("title");

String uname = (String)session.getAttribute("sess");
String usrStatusResult = (String)request.getAttribute("usrStatusResult");
String mode = request.getParameter("mode");


if(mode==null)
	mode=""; 


if(!uname.equals("admin")){
	response.sendRedirect("user_menu.jsp");
}

%>
<title>:: Create User ::<%=windowTitle%></title>
<jsp:include page="include/header.jsp" />

<form method='post' name="frmNewUser" action="login" onsubmit="return validateNewuser();">

<table width="400" border="0" cellspacing="0" cellpadding="2">
	<% if (usrStatusResult != null && usrStatusResult.startsWith("Msg")) {%>
	<tr>
		<td align="center"><font size='2' color="GREEN"> <%= usrStatusResult.substring(usrStatusResult.indexOf(":")+1) %></td>
	</tr>
	<% } else if (usrStatusResult != null && usrStatusResult.startsWith("Error")) {%>
	<tr>
		<td align="center"><font size='2' color="RED"> <%= usrStatusResult.substring(usrStatusResult.indexOf(":")+1) %></td>
	</tr>
	<% } %>
</table>
<%
			try {
				if(mode.equals("selectUserList_mode")) { %>
<table border="0" align="left">
	<tr>
		<td width="60">&nbsp;</td>
		<td><a href="login?mode=changeDomain">
		<img src="images/manageusr.jpg" border="0" alt=""></a> <br>
		<br>
		<br>
		<br>
		<a href="login?mode=changeUserList_mode"> <img
			src="images/changepwd.jpg" border="0" alt=""></a></td>
		<td width="80">&nbsp;</td>
		<td>
		<table width="424" border="0" cellspacing="0" cellpadding="0">
			<!-- Main User Table -->
			<tr>
				<td background="images/U_top.jpg" height="22" class="NameTxt">&nbsp;&nbsp;Add
				User</td>
			</tr>
			<tr>
				<td class="userimg" align="center">&nbsp;
				<table border="0" width="380" height="100" cellspacing="1"
					cellpadding="3">
					<!-- User Table-1 -->
					
					<tr>
						<td class="NameTxt">User Name</td>
						<th>:</th>
						<td>&nbsp;<input type="text" maxlength='45' name="TxtusrName"
							id="TxtusrName" size="26"></td>
					</tr>
					<tr>
						<td class="NameTxt">Password</td>
						<th>:</th>
						<td>&nbsp;<input type="password" maxlength='45' name="TxtPwd"
							id="TxtPwd" size="26"></td>
					</tr>
					<tr>
						<td class="NameTxt">Confirm Password</td>
						<th>:</th>
						<td>&nbsp;<input type="password" maxlength='45'
							name="TxtRePwd" id="TxtRePwd" size="26"></td>
					</tr>
					<% try {
								ArrayList ts = (ArrayList)request.getAttribute("doctorCardioList");
								Iterator itr = ts.iterator(); %>
					<tr>
						<td class="NameTxt">Cardiologist</td>
						<th>:</th>
						<td>&nbsp;<select name="cardio" size='5' style="width: 170px; height: 70px;">
							<%
								while(itr.hasNext())
									{
									String optionValue[] = itr.next().toString().split(":");
								%><option value="<%=optionValue[0]%>"><%=optionValue[1]%></option>
							<%	}
								}catch(Exception e) { e.printStackTrace(); }
								%>
						</select></td>
					</tr>
					<% try {
								ArrayList ts = (ArrayList)request.getAttribute("doctorSurgeonList");
								Iterator itr = ts.iterator(); %>
					<tr>
						<td class="NameTxt">Surgeon</td>
						<th>:</th>
						<td>&nbsp;<select name="surgeon" size='5' style="width: 170px; height: 70px;">
							<%
								while(itr.hasNext())
									{
									String optionValue[] = itr.next().toString().split(":");
								%><option value="<%=optionValue[0]%>"><%=optionValue[1]%></option>
							<%	}
								}catch(Exception e) { e.printStackTrace(); }
								%>
						</select></td>
					</tr>
					<tr>
						<td class="NameTxt">Role</td>
						<th>:</th>
						<td>&nbsp;<select name="selectRole" class="NameTxt">
							<option value="select">--Select--</option>
							<option value="F">Full</option>
							<option value="R">Restricted</option>
						</select></td>
					</tr>
				</table>
				<br>
				<!-- User Table-1 --></td>
			</tr>
			<tr>
				<th background="images/U_bottom.jpg" height="40" Valign="top">
				<input type="image" name="imageName" src="images/add.jpg">&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="menu.jsp"><img src="images/cancel.jpg" width="85"
					height="30" border="0" alt=""></a></th>
			</tr>
			<input type="hidden" name="mode" id="mode" value="newUser_mode">
		</table>
		<!-- Main User Table --></td>
	</tr>
</table>
<%  } else if(mode.equals("newDoctor")) { %>
<table border="0" align="left">
	<tr>
		<td width="80">&nbsp;</td>
		<td><a href="login?mode=doctorDeleteList_mode"> <img
			src="images/delPhysician.jpg" border="0" alt=""></a></td>
		<td width="80">&nbsp;</td>
		<td>
		<table border="0" width="424" cellspacing="0" cellpadding="0">
			<tr>
				<td background="images/U_top.jpg" height="22" class="NameTxt">&nbsp;Add
				Doctor</td>
			</tr>
			<tr>
				<td class="userimg" height="22">&nbsp;</td>
			</tr>
			<tr>
				<td class="userimg" align="center">
				<table border="0" cellspacing="4" cellpadding="4">
					<tr>
						<td class="NameTxt">Doctor Name</td>
						<td>:</td>
						<td>
							Dr.&nbsp;<input type="text" name="usrDoctor" id="usrDoctor" value="" onblur="combinedDr()">
							<input type="hidden" name="TxtusrDoctor" id="TxtusrDoctor" value="">
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">&nbsp;</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td background="images/U_bottom.jpg" height="40" Valign="top"
					align="center"><input type="image" src="images/submit.jpg"
					width="85" height="30" border="0" alt="">&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="menu.jsp"><img src="images/cancel.jpg" width="85"
					height="30" border="0" alt=""></a></td>
			</tr>
			<input type="hidden" name="mode" id="mode" value="newDoctor_mode">
		</table>

		</td>
	</tr>
</table>
<% }
		} catch(Exception e) {} %> 
		
<input type="hidden" name="mode" value="<%=mode%>"> 
<jsp:include page="include/footer.jsp" /> 

<script type="text/javascript" src="include/validate.js"></script> 

<script language="JavaScript">

function combinedDr() {
	document.getElementById("TxtusrDoctor").value =  "Dr."+document.getElementById("usrDoctor").value;
}

</script> 