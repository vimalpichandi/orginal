<%@ include file="include/session_check.jsp" %>
<%@ page import="java.util.*" errorPage="error.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%	
	String windowTitle = application.getInitParameter("title");
	int patientId = Integer.parseInt((String) session.getAttribute("PatientId"));
	String month[] = {"select","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
	int year = 2015;//dat.getYear() + 1900;
%>
<title>:: Patient Angioplasty :: <%=windowTitle%></title>

<input type="hidden" name="patientId" value="<%=patientId%>">
<jsp:include page="include/header.jsp" />

<form method='post' name="frmProcedure" onsubmit="return validateprocedure()" action="patientDetails">

<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<th background="images/tableTop.jpg" height="23">Angioplasty</th>
	</tr>

	<tr>
		<td class="img">
		<table width="490" border="0" cellspacing="3" cellpadding="3">
			<!--Data Table -->

			<tr>
				<td class="NameTxt">&nbsp;Patient ID</td>
				<th>:</th>
				<td><%=patientId%></td>
				<input type="hidden" name="TxtPat_id" value="<%=patientId%>">
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Date of Procedure</td><th>:</th>
					<td><select name="Pro_Date" > 
							<option selected value="select">-Date-</option>
							<%
								for (int i = 1; i <= 31; i++) {
							%><option value="<%=i%>"><%=i%></option><%
								}
							%>
						</select>&nbsp;
						<select name="Pro_Month" > 
							<option selected value="select">-Month-</option>
							<%
								for (int i = 1; i < month.length; i++) {
							%><option value="<%=i%>"><%=month[i]%></option><%
							}
							%>
						</select>&nbsp;
						<select name="Pro_Year" > 
							<option selected value="select">-Year-</option>
							<%
								for (int i = 2000; i <= year; i++) {
							%><option value="<%=i%>"><%=i%></option><%
								}
							%>
						</select>&nbsp;</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Approach</td><th>:</th>
				<td>
					<input type="radio" name="approach" value="Radial" checked>Radial
					<input type="radio" name="approach" value="Femoral">Femoral
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;LMCA</td>
				<th>:</th>
				<td>
					<input type="radio" name="lmca" value="Normal" checked>Normal
					<input type="radio" name="lmca" value="Short">Short
					<input type="radio" name="lmca" value="Long">Long
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Vessel tackled</td>
				<th>:</th>
				<td>
					<select name="sel_vessel">
						<option value="select">---Select---</option>
						<option value="LAD">LAD</option>
						<option value="Diagonal">Diagonal</option>
						<option value="LCX">LCX</option>
						<option value="OM">OM</option>
						<option value="RCA">RCA</option>
						<option value="PDA">PDA</option>
						<option value="RI">RI</option>
						<option value="PLB">PLB</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Number of Stents</td>
				<th>:</th>
				<td>
					<input type="text" name="no_of_stents" size="4" maxlength="4" onkeyup="Numeric(this)"> 
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Type of Stent</td>
				<th>:</th>
				<td>
					<input type="radio" name="stentType" value="DES" checked>DES
					<input type="radio" name="stentType" value="BMS">BMS
					<input type="radio" name="stentType" value="POBA">POBA
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;G P II b/ III a</td>
				<th>:</th>
				<td>
					<input type="radio" name="gpSelect" checked value="N" onclick="gpOption(this.value)">No
					<input type="radio" name="gpSelect" value="Y" onclick="gpOption(this.value)">Yes
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;</td>
				<th>&nbsp;</th>
				<td>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gpOpt" value="Reopro" disabled checked>Reopro
					<input type="radio" name="gpOpt" value="Integrelin" disabled>Integrelin
					<input type="radio" name="gpOpt" value="Tirofiban" disabled>Tirofiban
				</td><input type="hidden" name="gp" value="">
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Result</td>
				<th>:</th>
				<td>
					<input type="radio" name="result" value="Good" checked>Good
					<input type="radio" name="result" value="Satisfactory">Satisfactory
					<input type="radio" name="result" value="Suboptimal">Suboptimal
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Residual stenosis (%)</td>
				<th>:</th>
				<td>
					<input type="text" name="stenosis" size="5" onkeyup="floatNumeric(this)"> (0 for Nil)
				</td>
			</tr>			
			<tr>
				<td class="NameTxt">&nbsp;Complications</td>
				<th>:</th>
				<td>
					<input type="radio" name="R_complications" value="N" onclick="enableCompl(this.value)" checked>No
					<input type="radio" name="R_complications" value="Y" onclick="enableCompl(this.value)">Yes
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;</td>
				<th>&nbsp;</th>
				<td>
					<select name="sel_complications" disabled>
						<option value="select" selected>---Select---</option>Bleeding
						<option value="Bleeding | Haematoma">Bleeding | Haematoma</option>
						<option value="Acute Stent thrombosis">Acute Stent thrombosis</option>
						<option value="Death">Death</option>
						<option value="MI">MI</option>
						<option value="Arrhythmias">Arrhythmias</option>
					</select>
				</td><input type="hidden" name="complications" value="N">
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<th background="images/tableBottom.jpg" height="40" Valign="top">
		<input type="hidden" name="mode" value="dataProcedure_mode"> 
		<a href="#" onclick="goPage('patientReports?mode=patientEdit_mode&Patientid=<%=patientId%>')"><img src="images/cancel.jpg" width="85" height="30" border="0" alt=""></a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="image" name="imageName" src="images/submit.jpg">
		</th>

	</tr>
</table>
<!-- End Data Table -->
<jsp:include page="include/footer.jsp" /> 

<script language="JavaScript">

function goPage(pgValue){
	frmProcedure.action = pgValue;
	frmProcedure.submit();
}


function gpOption(state){
	
	if(state=="N"){

		var rads = document.frmProcedure.gpOpt;

		for(var i=0; i<rads.length;i++ )
		{
			document.frmProcedure.gpOpt[i].disabled = true;
		}

		
	}

	if(state=="Y"){

		var rads = document.frmProcedure.gpOpt;

		for(var i=0; i<rads.length;i++ )
		{
			document.frmProcedure.gpOpt[i].disabled = false;
		}
		
	}
}

function enableCompl(compl){
	

	if(compl=="N"){
		document.frmProcedure.sel_complications.disabled = true;		
		document.frmProcedure.complications.value = "N";

	}

	if(compl=="Y"){
		
		document.frmProcedure.sel_complications.disabled = false;
		document.frmProcedure.complications.value = document.frmProcedure.sel_complications.value;
		
	}

}

</script>

<script type="text/javascript" src="include/validate.js"></script> 
