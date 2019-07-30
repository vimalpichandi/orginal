<%@ include file="include/session_check.jsp"%>
<%@ page import="java.util.*" errorPage="error.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%	
	String windowTitle = application.getInitParameter("title");
	int patientId = Integer.parseInt((String)session.getAttribute("PatientId")); 
	String month[] = {"select","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
	int year = 2015;//dat.getYear() + 1900;
%>
<title>:: Patient CABG :: <%=windowTitle%></title>
<input type="hidden" name="patientId" value="<%=patientId%>">
<jsp:include page="include/header.jsp" />

<form method='post' name="frmSurgery" onsubmit="return validatesurgery()" action="patientDetails">

<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<th background="images/tableTop.jpg" height="23">Coronary Artery Bypass Graft Surgery</th>
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
				<td class="NameTxt">&nbsp;Surgery Completed</td><th>:</th>
				<td><input type="radio" name="R_Surg_Compl" value="Y" onclick="disableDetails(this.value)" checked>Yes&nbsp;&nbsp;&nbsp;
				<input type="radio" value="N" name="R_Surg_Compl" onclick="disableDetails(this.value)">No</td>
			</tr>
			
			<tr>
				<td colspan="3">
					<hr width="80%">
				</td>
			</tr>
			
			<tr>
				<td class="NameTxt">&nbsp;Date of Surgery</td><th>:</th>
					<td><select name="Sgy_Date" > 
							<option selected value="select">-Date-</option>
							<%
								for (int i = 1; i <= 31; i++) {
							%><option value="<%=i%>"><%=i%></option><%
								}
							%>
						</select>&nbsp;
						<select name="Sgy_Month" > 
							<option selected value="select">-Month-</option>
							<%
								for (int i = 1; i < month.length; i++) {
							%><option value="<%=i%>"><%=month[i]%></option><%
							}
							%>
						</select>&nbsp;
						<select name="Sgy_Year" > 
							<option selected value="select">-Year-</option>
							<%
								for (int i = 2000; i <= year; i++) {
							%><option value="<%=i%>"><%=i%></option><%
								}
							%>
						</select>&nbsp;</td>
				</tr>

			<tr>
				<td class="NameTxt">&nbsp;Previous Surgery</td>
				<th>:</th>
				<td>
					<select name="prev_surgery" >
						<option value="select" selected>---Select---</option>
						<option value="NA">NA</option>
						<option value="CABG">CABG</option>
						<option value="Angioplasty">Angioplasty</option>
						<option value="Others">Others</option>
					</select>
				</td>
			</tr>
			<!-- <tr>
				<td class="NameTxt">&nbsp;Procedure</td>
				<th>:</th>
				<td>
					<input type="radio" id="proc" name="proc" value="data_surgery.jsp" checked onclick="goPage(this.value)" disabled>&nbsp;CABG&nbsp;&nbsp;&nbsp;
					<input type="radio" id="proc" name="proc" value="data_procedure.jsp" onclick="goPage(this.value)" disabled>&nbsp;Angioplasty
				</td>
			</tr> -->

			<tr>
				<td class="NameTxt">&nbsp;Surgery Type</td>
				<th>:</th>
				<td><select name="surgery_type" >
					<option selected value="select">---Select---</option>
					<option value="On Pump">On Pump</option>
					<option value="Off Pump">Off Pump</option>
				</select></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;No. of Grafts</td>
				<th>:</th>
				<td><select name="TxtNo_Grafts" > 
						<option selected value="select">---Select---</option>
						<%
						for (int i = 0; i <= 7; i++) {
						%><option value="<%=i%>"><%=i%></option><%
							}
						%>
						</select><!-- <input type="text" name="" id=""	onkeyup="Numeric(this)" size="6"/> -->
							</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Graft Types</td>
				<th>:</th>
				<td>
					<input type="checkbox" name="graft" value="LIMA">&nbsp;LIMA
					<input type="checkbox" name="graft" value="RIMA">&nbsp;RIMA
					<input type="checkbox" name="graft" value="BIMA">&nbsp;BIMA
					<input type="checkbox" name="graft" value="LRA">&nbsp;LRA<br>
					<input type="checkbox" name="graft" value="SVG">&nbsp;SVG
				</td><input type="hidden" name="graft_type" value="NA">
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Associated <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;Surgical Procedures</td>
				<th>:</th>
				<td><select name="surgery_proc" multiple>
					<option selected value="select">---Select---</option>
					<option value="No">No</option>
					<option value="MVR">MVR</option>
					<option value="AVR">AVR</option>
					<option value="DVR">DVR</option>
					<option value="OMV">OMV</option>
					<option value="Pacemaker">Pacemaker</option>
					<option value="ASD">ASD</option>				
					<option value="VSD">VSD</option>
					<option value="MVRepair">MVRepair</option>
					<option value="Aneurysmectomy">Aneurysmectomy</option>
					<option value="Carotid Endarterectomy">Carotid Endarterectomy</option>
					<option value="Others">Others</option>
				</select></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;IABP</td>
				<th>:</th>
				<td>
					<input type="radio" name="IABP" value="Y" >Yes
					<input type="radio" name="IABP" value="N" checked>No
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Revascularisation</td>
				<th>:</th>
				<td>
					<input type="radio" name="revasc" value="Total" checked >Total
					<input type="radio" name="revasc" value="Optiomal" >Optimal
					<input type="radio" name="revasc" value="Sub-Optiomal" >Sub-Optimal
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Peri-op MI</td>
				<th>:</th>
				<td>
					<input type="radio" name="periop" value="Y" checked >Yes
					<input type="radio" name="periop" value="N" >No
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<hr width="80%">
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Mortality</td>
				<th>:</th>
				<td>
					<input type="radio" name="mortality" value="Y" checked onclick="disableDeathCause(this.value)">Yes
					<input type="radio" name="mortality" value="N" onclick="disableDeathCause(this.value)" checked>No
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Cause Of death</td>
				<th>:</th>
				<td>
					<select name="sel_deathCause" disabled>
						<option value="select" selected>--Select---</option>
						<option value="Low Co">Low Co</option>
						<option value="Renal Failure">Renal Failure</option>
						<option value="Bleeding/Tamponade">Bleeding/Tamponade</option>
						<option value="Sepsis">Sepsis</option>
						<option value="Respiratory Failure">Respiratory Failure</option>
						<option value="Neurological">Neurological</option>
						<option value="Others">Others</option>
					</select>
					<input type="hidden" name="deathCause" value="Nil">
				</td>
			</tr>
		</table>
		</td>
	</tr>
		<input type="hidden" name="disable_radio" value="yes">
		<input type="hidden" name="proc_type" value="1">
	<tr>
		<th background="images/tableBottom.jpg" height="40" Valign="top">
		<input type="hidden" name="mode" value="dataSurgery_mode"> <input
			type="image" name="imageName" src="images/submit.jpg"></th>
	</tr>
	
</table><br>
<!-- End Data Table -->
<jsp:include page="include/footer.jsp" /> 
<script type="text/javascript" src="include/validate.js"></script> 

<script language="JavaScript">

function disableDetails(state){

	if(state=="N"){

		frmSurgery.action = "data_procedure.jsp";
		frmSurgery.submit();
	
	}

	
}

function goPage(pgValue){
	frmSurgery.action = pgValue;
	frmSurgery.submit();
}

function disableDeathCause(cause){

	if(cause=="Y")
		document.frmSurgery.sel_deathCause.disabled = false;
	else
		document.frmSurgery.sel_deathCause.disabled = true;

}
</script>