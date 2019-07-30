<%@ include file="include/session_check.jsp" %>
<%@ page session="true"%>

<%@ page import="java.sql.*" session="true"%>
<%@ page import="java.util.*" errorPage="error.jsp"%>
<%@ page import="java.io.*" %>
<%	
	String windowTitle = application.getInitParameter("title");

	String sess = (String)session.getAttribute("sess");
%> 
<title>:: Report Menu :: <%=windowTitle%></title>
<jsp:include page="include/header.jsp"/>

<form method='post' name="frmChange" onsubmit="return validateChangedPwd();" action="login">

			<table width="424" border="0" cellspacing="0" cellpadding="0"><!-- Main User Table -->
				<tr><td background="images/U_top.jpg" height="22" class="NameTxt">&nbsp;&nbsp;Reports </td></tr>
				<tr><td class="userimg" align="center">&nbsp;

					<table border="0" width="350" height="100" cellspacing="4" cellpadding="4">
						<tr align="center">
							<td > 
								<a href="reports?mode=std"><img src="images/standard.jpg" width="125" height="123" border="0" alt=""></a>
							</td>
						 
							<td>
								<a href="reports?mode=diabetic&selectedId=0"><img src="images/preDefine.jpg" width="125" height="123" border="0" alt=""></a>
							</td>
						</tr>
						<tr>
							<td colspan=2 align="center">
								<a href="custom_cabg.jsp"><img src="images/custom.jpg" width="125" height="123" border="0" alt=""></a>
							</td>
						</tr>


					</table><br>

					</td></tr>
				<tr><th background="images/U_bottom.jpg" height="40" Valign="top">
			</table><!-- Main User Table -->
	<input type="hidden" name="mode" value="changePassword_mode">
	<input type="hidden" name="resetMode" value="0">

<br><br>

<jsp:include page="include/footer.jsp"/>

<script language="JavaScript">

</script>


