<%@ include file="include/session_check.jsp"%>
<%@ page import="java.sql.*" session="true" errorPage="error.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%	
	String windowTitle = application.getInitParameter("title");

	String sess = (String)session.getAttribute("sess");
	String usrStatusResult = (String)request.getAttribute("usrStatusResult");
	String mode = request.getParameter("mode");
	
	if(mode==null)
	mode=""; 

%> 
<title>:: Domain & Password Management :: <%=windowTitle%> </title>
<jsp:include page="include/header.jsp"/>
	<center>
			<table width="350" border="0" cellspacing="0" cellpadding="2">

			<% if (usrStatusResult != null && usrStatusResult.startsWith("Msg")) {%>
				<tr>														
					<td align="center"><font size='2' color="GREEN">
						<%= usrStatusResult.substring(usrStatusResult.indexOf(":")+1) %>
					</td>														
				</tr>
			<% } else if (usrStatusResult != null && usrStatusResult.startsWith("Error")) {%>
				<tr>														
					<td align="center"><font size='2' color="RED">
						<%= usrStatusResult.substring(usrStatusResult.indexOf(":")+1) %>
					</td>														
				</tr>
			<% } %>
			</table>
		</center>

<%
			try {
				if(mode.equals("changeUserList_mode")) { %>

			<form method='post' name="frmChange" onsubmit="return validateChangedPwd()" action="login">

			<table width="424" border="0" cellspacing="0" cellpadding="0"><!-- Main User Table -->
				<tr><td background="images/U_top.jpg" height="22" class="NameTxt">&nbsp;&nbsp;Change Password </td></tr>
				<tr><td class="userimg" align="center">&nbsp;

					<table border="0" width="390" height="100" cellspacing="4" cellpadding="4">
						<%  													
							if (sess.equalsIgnoreCase("admin")) {
								ArrayList ts = (ArrayList)request.getAttribute("selectUserList");
								Iterator itr = ts.iterator();
						%>
						<tr><td class="NameTxt">Select User</td><th>:</th>
						    <td><select name="userName">
									<option value="select">--User name--</option>
										<%
											while(itr.hasNext())
												{
													String optionValue = itr.next().toString();
													if(sess.equals(optionValue)) {							
										%>	
										<option value="<%=optionValue%>" selected><%=optionValue%></option>
									<% } else { %>
										<option value="<%=optionValue%>"><%=optionValue%></option>
										<%
											}
										}	%>
								</select>
							</td></tr>
								<% } else { %>
									<input type="hidden" name="userName" value="<%=sess%>">
						<tr><td class="NameTxt">User Name</td><th>:</th><td><font size="2"><%=sess%></font></td></tr>
								<%}%>
						<tr><td class="NameTxt">Old Password</td><th>:</th>
							<td><input type="password" maxlength="31" size='25' name="Txt_OldPwd" id="Txt_OldPwd" vspace="true"></td></tr>
						<tr><td class="NameTxt">New Password</td><th>:</th>
							<td><input type="password" maxlength="31" size='25' name="Txt_NewPwd" id="Txt_NewPwd" vspace="true"></td></tr>
					</table><br>

					</td></tr>
				<tr><th background="images/U_bottom.jpg" height="40" Valign="top">
						<input type="image" src="images/change.jpg">&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#"><img src="images/resetpw.jpg" onclick="resetPassword()" border="0"></a>
					</th></tr>
			</table><!-- Main User Table -->
	<input type="hidden" name="mode" value="changePassword_mode">
	<input type="hidden" name="resetMode" value="0">
	</form>

<%  } else if(mode.equals("changeDomain") && sess.equals("admin")) { %>

<form method='post' name="frmDomain" onsubmit="return resetDomain()" action="login">
	<table border="0" align="left">
		<tr><td width="100">&nbsp;</td>
			<td width="200" > 
				<a href="login?mode=deleteUserList_mode"><img src="images/deleteusr.jpg" width="125" height="123" border="0" alt=""></a>
			</td>
			<td>
				<table  width="424" cellspacing="0" cellpadding="0">
					<tr>
						<td background="images/U_top.jpg" height="22" class="NameTxt">&nbsp;&nbsp;Domain Change</td>
					</tr>
					<tr>
						<td class="userimg" align="center">
							<table border="0" width="390" cellspacing="4" cellpadding="4">
								<%  
									if (sess.equalsIgnoreCase("admin")) {
									ArrayList ts = (ArrayList)request.getAttribute("selectUserList");
									Iterator itr = ts.iterator();
								%>
								<tr>
									<td class="NameTxt">Select User</td><th>:</th>
									<td><select name="userName">
										<option value="select">--User name--</option>
											<%
												while(itr.hasNext()){
													String optionValue = itr.next().toString();
													if(!sess.equals(optionValue)) {							
											%>	
														<option value="<%=optionValue%>"><%=optionValue%></option>
											<%		} 
											}	
											%>
										</select>
									</td>
								</tr>
								<tr>
									<th>
										Role
									</th>
									<th>:</th>
									<td>
										<select name="role">
											<option value="select">-- Select --</option>
											<option value="F">Full</option>
											<option value="R">Restricted</option>
										</select>
									</td>
								</tr>
								<% }%>
							</table>
						</td>
					</tr>
					<tr>
						<td background="images/U_bottom.jpg" height="40" Valign="top" align="center">
							<input type="image" src="images/change.jpg" width="85" height="30" border="0">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<input type="hidden" name="mode" value="updateDomain">
</form>
<% }
} catch(Exception e) {} %> 
<input type="hidden" name="mode" value="<%=mode%>">
<jsp:include page="include/footer.jsp"/>

<script type="text/javascript" src="include/validate.js"></script>

<script language="JavaScript">

function onload() {

	//document.frmChange.Txt_OldPwd.focus();
}

</script>



