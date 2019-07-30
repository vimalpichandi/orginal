<%@ page import="java.sql.*" session="true"%>
<%@ page import="java.util.*" errorPage="error.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%	
	String windowTitle = application.getInitParameter("title");
	int patientId = Integer.parseInt((String)session.getAttribute("PatientId")); 
%>

<title>:: Patient Profile :: <%=windowTitle%></title>
<input type="hidden" name="patientId" value="<%=patientId%>">
<jsp:include page="include/header.jsp"/>
 <form method='post' name="frmProfile" onsubmit="return validateProfile();" action="patientDetails">

	<table border="0" cellspacing="0" cellpadding="0">
		<tr><th background="images/tableTop.jpg" height="23"> Patient Profile </th></tr>
		
		<tr><td class="img">
				<table width="490" border="0" cellspacing="3" cellpadding="3" ><!--Data Table -->
			<tr><td class="NameTxt" width="40%">&nbsp;Patient ID</td><th>:</th><td><%=patientId%></td></tr>
			<input type="hidden" name="TxtPat_id" value="<%=patientId%>">
			<tr><td class="NameTxt">&nbsp;Total Cholesterol (mgs%)</td><th>:</th>
				<td><input type="text" name="TxtCholestrol" id="TxtCholestrol" Maxlength="3" onkeyup="Numeric(this)"/></td></tr>
			<tr><td class="NameTxt">&nbsp;HDL (mgs%)</td><th>:</th>
				<td><input type="text" name="TxtHDL" id="TxtHDL" Maxlength="3" onkeyup="Numeric(this)"/></td></tr>
			<tr><td class="NameTxt">&nbsp;LDL (mgs%)</td><th>:</th>
				<td><input type="text" name="TxtLDL" id="TxtLDL" Maxlength="3" onkeyup="Numeric(this)"/></td></tr>
			<tr><td class="NameTxt">&nbsp;Triglycerides (mgs%)</td><th>:</th>
				<td><input type="text" name="TxtTRI_Glyceride" id="TxtTRI_Glyceride" Maxlength="3" onkeyup="Numeric(this)"/></td></tr>
			<tr><td class="NameTxt">&nbsp;Creatinine (mgs%)</td><th>:</th>
				<td><!-- <input type="text" name="TxtCreatine" id="TxtCreatine"> -->
				  <input type="radio" name="TxtCreatine" checked value="<1.5"> < 1.5 
				  <input type="radio" name="TxtCreatine" value="1.5-3"> 1.5-3
				  <input type="radio" name="TxtCreatine" value=">3"> > 3
				</td></tr>
			<tr><td class="NameTxt">&nbsp;ECG</td><th>:</th>
				<td>
					<input type="checkbox" name="ECG" value="AF">AF
					<input type="checkbox" name="ECG" value="ASMI">ASMI
					<input type="checkbox" name="ECG" value="ALMI">ALMI
					<input type="checkbox" name="ECG" value="AWMI">AWMI
					<input type="checkbox" name="ECG" value="IPWMI">IPWMI<br>
					<input type="checkbox" name="ECG" value="IWMI">IWMI
					<input type="checkbox" name="ECG" value="LVH">LVH
					<input type="checkbox" name="ECG" value="RBBB">RBBB
					<input type="checkbox" name="ECG" value="RVH">RVH<br>
					<input type="checkbox" name="ECG" value="LBBB">LBBB
					<input type="checkbox" name="ECG" value="NSR">Within Normal limits
					<input type="checkbox" name="ECG" value="Others">Others
				</td>
				<input type="hidden" name="Sel_ECG" value="">
			</tr>
		</table>
	</td>
			</tr>
		<tr><th background="images/tableBottom.jpg" height="40" Valign="top">
				<input type="hidden" name="mode" value="dataProfile_mode">
				<input type="image" name="imageName" src="images/next.jpg"></th></tr>
		</table><!-- End Data Table -->
		

<jsp:include page="include/footer.jsp"/>

<script type="text/javascript" src="include/validate.js"></script>

<script language="JavaScript">

function onload() {
	document.getElementById("TxtCholestrol").focus();
}
</script>