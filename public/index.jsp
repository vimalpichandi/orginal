<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<%
	//Context parameters
	String title = application.getInitParameter("title");
	String logStatus = (String) request.getAttribute("errorStatus");
%>
<title>:: Login :: <%=title%></title>
<meta name="Generator" content="EditPlus">
<meta name="Author" content="Npedia Technologies Pvt. Ltd.">
<meta name="Keywords" content="HARI.M,VIMAL.P,PULANDRAN.T,RAJA.S">
<meta name="Description" content="">
<link href="images/apollofavicon.ico" rel="shortcut icon">
</head>
<body topmargin="0" rightmargin="0" leftmargin="0" bottommargin="0">
<form name="frmLogin" method="post" onsubmit="return validate()">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0"><!-- Over all outer table-1 -->
	<tr><td align="center" valign="top">

		<table border="0" width="1000" height="100%" align="center"	cellpadding="0" cellspacing="0"><!-- all outer table-2 -->
			<tr><td height="110" valign="bottom" colspan=3><img src="images/header.jpg" width="1000" height="119" border="0" alt=""></td></tr>
			<tr><td valign="top" align="right" background="images/sidebg_right.gif"	width="18"><img src="images/spacer1.gif" width="18" height="2" border="0" alt=""></td>
				<td height="520" align="center" bgcolor="#FFFFFF">
				
					<table  width="950" height="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td><center><font style="color: red" size="2"><br>
						<%
							if (logStatus != null) {
								out.println(logStatus);
								request.removeAttribute("usrStatusResult");
							}
						%> </font></center>
					<table align="center" width="42%" height="200" border="0"  cellpadding="2" cellspacing="0"	background="images/loginbg.jpg">
						<tr>
							<td align="right"><br>
							<br>
							<!--Login user Table -->
							<table border="0" width="100%" height="85" cellspacing="3"
								cellpadding="3">

								<tr>
									<th width="35%"><font size="2">&nbsp;User Name </font></th>
									<th>:</th>
									<td>&nbsp;<input type="text" size='25' id="username"
										name="username" value='' vspace="true"></td>
								</tr>
								<tr>
									<th><font size="2">&nbsp;Password </font></th>
									<th>:</th>
									<td>&nbsp;<input type="password" size='25' id="password"
										name="password" value='' vspace="true"></td>
								</tr>
								<tr>
									<th colspan="3">
									<hr class="page-splits">
									</th>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="middle" Valign="top" ><input
								type="hidden" name="mode" value="login_mode"> <input
								type="image" name="imageName" src="images/login.jpg"></td>
						</tr>
						
					</table></td>
					</tr>
					</table>
								</form>		
				</td>
				<td valign="top" align="right" background="images/sidebg_left.gif" width="18"><img src="images/spacer.gif" width="18" height="2" border="0" alt=""></td>
			</tr>
			<tr height="53">
				<td height="53" align="center" colspan="3"><img src="images/footer2008.jpg" width="1000" height="53" border="0" alt=""></td>
			</tr>
		</table>
		<!--end all outer table-2 --></td>
	</tr>
</table>
<!--end  Over all outer table-1 -->

</body>
</html>
<script language="JavaScript">
		function validate()
			{	
			usrName = document.frmLogin.username.value;
			passwd = document.frmLogin.password.value;
			if(usrName.length==0 || usrName=='')
				{
					alert("Empty UserName Field!!!");
					document.frmLogin.username.focus();
					return false;
				}
			if(passwd.length==0 || passwd=='')
				{
					alert("Empty Password Field!!!");
					document.frmLogin.password.focus();
					return false;
				}
			if(!isNaN(usrName))
				{
					alert("Enter Correct name");
					document.frmLogin.username.value="";
					document.frmLogin.username.focus();
					return false;
				}
				else {
					document.frmLogin.mode.value = 'login_mode';
					document.frmLogin.action = 'login';
					frmLogin.submit();
				}
			}
		function onload() {
			document.getElementById("username").focus();
		}
		
	</script>