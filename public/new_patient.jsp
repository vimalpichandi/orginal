<%@ include file="include/session_check.jsp"%>
<%@ page errorPage="error.jsp"%>
<%
	String windowTitle = application.getInitParameter("title");
	String usrStatus = (String)request.getAttribute("usrStatus");
	String Patient_id = "";

	String role = (String)session.getAttribute("role");

	if(role.equals("R")){
		response.sendRedirect("user_menu.jsp");
	}
%>

<title>:: Add Patient :: <%=windowTitle%></title>

<jsp:include page="include/header.jsp" />

<form method='post' action="patientDetails" name="frmPatient" onsubmit="return IDvalidate()">
	
	<% try{
				Patient_id = request.getParameter("Patient_id");
				
				if(Patient_id==null){
					Patient_id = "";
				}

				if(!usrStatus.equals("") || usrStatus!=null) 
				%> <center><b><%out.println(usrStatus);%></b><br><br></center><%
				}catch(Exception e){}
		%>
	<table border="0" width="424" cellspacing="0" cellpadding="0">
		<tr><td background="images/U_top.jpg" height="22" class="NameTxt">&nbsp;Add Patient</td></tr>
		<tr><td class="userimg" height="22">&nbsp;</td></tr>
		<tr><td class="userimg" align="center">
				<table border="0" cellspacing="4" cellpadding="4">
						<tr><td class="NameTxt">Patient ID</td><td>:</td>
							<td><input type="text" name="patient_id" id="patient_id" onblur="Numeric(this)" onkeydown="Numeric(this)"
								onkeypress="Numeric(this)" onkeyup="Numeric(this)" value="<%=Patient_id%>" maxlength="10" size="20"></td></tr>
								<tr><td class="NameTxt">Location </td><td>:</td>
								<td><select name="sel_location">
									<option selected value="select" disabled>---Select---</option>
									<option value="Chennai">Chennai</option>
									<option value="Delhi">Delhi</option>
									<option value="Hyderabad">Hyderabad</option>
									<option value="Madurai">Madurai</option>
									<option value="Others">Others</option>
								</select>
								</tr>		
						<tr>
							<td colspan="3" align="center"><input type="hidden" name="mode" value="check_patient_id"></td></tr>		
				</table>
				</td></tr>
				<tr><td class="userimg" height="22">&nbsp;</td></tr>
				<tr><td background="images/U_bottom.jpg" height="40" Valign="top" align="center">
					<input type="image"	src="images/go.jpg" width="85" height="30" border="0" alt=""></td></tr>
	</table>

</form>
<jsp:include page="include/footer.jsp" />

<script language="JavaScript" src="include/validate.js"></script>
<script language="JavaScript">

function IDvalidate(){
	var patient_id = document.getElementById("patient_id").value;
	var location_name = document.frmPatient.sel_location.value;

	if(patient_id==""){
		alert("Patient ID Field Empty !!!");
		document.getElementById("patient_id").focus();
		return false;
	}

	if(location_name=="select"){
		alert("Select a Location");
		document.frmPatient.sel_location.focus();
		return false;
	}
}
</script>