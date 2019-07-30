<%@ include file="include/session_check.jsp"%>
<%@ page session="true" errorPage="error.jsp"%>

<%
	String windowTitle = application.getInitParameter("title");
	String uname = (String)session.getAttribute("sess");
%>
<html>
	<head>
	<title>:: User Menu :: <%=windowTitle%></title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta name="Generator" content="Npedia Technologies Pvt. Ltd.">
	<meta name="Author" content="HARI.M-VIMAL.P-PULANDRAN.T-RAJA.S">
	<meta name="keywords" content="Keywords here">
	<meta name="description" content="Description here">
	<meta name="robots" content="index, follow"> <!-- (Robot commands: All, None, Index, No Index, Follow, No Follow) -->
	<meta name="revisit-after" content="30 days">
	<meta name="distribution" content="global">
	<meta name="rating" content="general">
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
	<link href="images/apollofavicon.ico" rel="shortcut icon">
	<link href="css/style.css" rel="stylesheet" type="text/css">
<%
String role = (String)session.getAttribute("role");
if(role==null)
	role=""; 
	
%>
<body leftmargin="0" topmargin="0" bottommargin="0" rightmargin="0">

<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0"><!-- Over all outer table-1 -->
  <tr><td align="center" valign="top"> 
	  
	 <table width="1000" height="100%" border="0" align="center" cellpadding="0" cellspacing="0"><!-- all outer table-2 -->
		 <tr><td height="119"  valign="bottom" colspan=3><img src="images/header.jpg" width="1000" height="119" border="0" alt=""></td></tr>
		  <tr><td valign="top" align="right" background="images/sidebg_right.gif" width="18"><img src="images/spacer1.gif" width="18" height="2" border="0" alt=""></td>
			  <td height="500" align="center" valign="top" bgcolor="#FFFFFF">
		  
			<table border="0"  width="950" height="100%" cellspacing="0" cellpadding="0"><!-- Table-1 -->
				<tr height="23">
					<th align="left"><font color='#274E4E'>&nbsp;Welcome, <%=uname%></font> </th>
					<td align="right"><a href='logout.jsp' style='color:red'>Logout</a>&nbsp;</td>
					</tr>
				<tr>
					<td align="center" colspan='2'>
						<form method='post' name="frmMenu" action=""><br>
					
							<table border="0" width="500" cellspacing="0" cellpadding="0">
								<tr><td colspan="3" background="images/menutop.jpg" height="29" valign="top">&nbsp;&nbsp;&nbsp;<font color="white"><b>Main Menu</b></td></tr>
								<tr><td background="images/t_lmiddle.jpg" width="28">&nbsp;</td>
									<td align="center">
										<%	
										try {
												if(role.equals("F")) { %>
											<table width="400" border='0' cellpadding="10" cellspacing='9' align="center">
												<tr><td colspan="2" align="center"><a href="patientReports?mode=patientReport_mode">
													<img src="images/patient.jpg"	border="0" alt=""></a></td></tr>
												<tr><td align="center"><a href="login?mode=changeUserList_mode">
															<img src="images/changepwd.jpg" border="0" alt=""></a></td>
													<td><a href="report_menu.jsp">
														<img src="images/reports.jpg" border="0" alt=""></a></td></tr>
										</table> <br>
								
										<%  } else if(role.equals("R")) { %>

										  <table width="400" border='0' cellpadding="10" cellspacing='9' align="center">
											<tr><td align="center"><a href="login?mode=changeUserList_mode">
													<img src="images/changepwd.jpg" border="0" alt=""></a></td>
												<td><a href="report_menu.jsp">
														<img src="images/reports.jpg" border="0" alt=""></a></td></tr>
											</table> 
											<% }
											} catch(Exception e) {
											e.printStackTrace();
											} %>

										</td>
									<td background="images/t_rmiddle.jpg" width="28"></td></tr>
								<tr><td background="images/t_left.jpg" height="26">&nbsp;</td>
									<td>&nbsp;</td>
									<td background="images/t_right.jpg" height="26">&nbsp;</td></tr>
							</table>
							<input type="hidden" name="role" value="<%=role%>">
					<br><br>
<jsp:include page="include/footer.jsp" /> 

<script type="text/javascript">

function goToNewUser(){

	document.frmMenu.mode.value = "newDoctor";
	frmMenu.action = "new_user.jsp";
	frmMenu.submit();
}

</script> 