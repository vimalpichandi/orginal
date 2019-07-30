<%@ page import="java.sql.*" session="true"%>
<%@ page import="java.util.*"  errorPage="error.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%	
	String windowTitle = application.getInitParameter("title");

	int patientId = Integer.parseInt((String)session.getAttribute("PatientId")); 
%>
<title>:: Patient Diagnosis :: <%=windowTitle%></title>
<input type="hidden" name="patientId" value="<%=patientId%>">
<jsp:include page="include/header.jsp"/>
 
<form method='post' name="frmDiags" onsubmit="return validateDiags();" action="patientDetails">

	<table border="0" cellspacing="0" cellpadding="0">
		<tr><th background="images/tableTop.jpg" height="23"> Diagnosis </th></tr>
		
		<tr><td class="img">
				<table width="490" border="0" cellspacing="3" cellpadding="3" ><!--Data Table -->
			<tr><td class="NameTxt" width="40%">&nbsp;Patient ID</td><th>:</th><td><%=patientId%></td></tr>
			<input type="hidden" name="TxtPat_id" value="<%=patientId%>">
			<tr><td class="NameTxt" width="40%">&nbsp;LMCA</td><th>:</th>
				<td>
		 
				  <input type="radio" name="R_LMCA" checked value="N" onclick="enableLmca(this.value)">&nbsp;No  
				  <input type="radio" name="R_LMCA" value="Y" onclick="enableLmca(this.value)">&nbsp;Yes
				  <input type="radio" name="sel_LMCA" value="<50%" disabled checked>&nbsp;< 50%
				  <input type="radio" name="sel_LMCA" value=">50%" disabled>&nbsp;> 50%
				  <input type="hidden" name="LMCA" value="N">
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;CAD</td><th>:</th>
				<td>
					<select name="cad" id="cad" multiple>
						<option value="select" selected>---Select---</option>
						<option value="CAD-No">No</option>
						<option value="LMCA">LMCA</option>
						<option value="Single Vessel Disease">Single Vessel Disease</option>
						<option value="Two Vessel Disease">Two Vessel Disease</option>
						<option value="Triple Vessel Disease">Triple Vessel Disease</option>
						<option value="Four Vessel Disease">Four Vessel Disease</option>
						<option value="Diffuse Disease">Diffuse Disease</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Valvular Heart Disease</td><th>:</th>
				
					<!-- <input type="radio" name="R_valvular" value="Y">&nbsp;Yes
					<input type="radio" name="R_valvular" checked value="N">&nbsp;No <br> -->
				
			
				<td>
					<select name="R_valvular" id="R_valvular" multiple>
						<option value="select" selected>---Select---</option>
						<option value="N">No</option>
						<option value="Mitral-Stenosis">Mitral-Stenosis</option>
						<option value="Mitral-Regurgitation">Mitral-Regurgitation</option>
						<option value="Aortic-Stenosis">Aortic-Stenosis</option>
						<option value="Aortic-Regurgitation">Aortic-Regurgitation</option>
						<option value="Others">Others</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<hr width="80%">
				</td>
			</tr>
			<tr align="center">
				<td class="NameTxt" colspan="3">&nbsp;Comorbidities</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;COPD</td><th>:</th>
				<td>
					<input type="radio" name="R_copd" value="Y">&nbsp;Yes
					<input type="radio" name="R_copd" checked value="N">&nbsp;No
					<input type="radio" name="R_copd" value="NA">&nbsp;NA
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;RENAL</td><th>:</th>
				<td>
					<input type="radio" name="R_renal" value="Y">&nbsp;Yes
					<input type="radio" name="R_renal" checked value="N">&nbsp;No
					<input type="radio" name="R_renal" value="NA">&nbsp;NA
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;NEUROLOGICAL</td><th>:</th>
				<td>
					<input type="radio" name="R_neuro" value="Y" >&nbsp;Yes
					<input type="radio" name="R_neuro" checked value="N">&nbsp;No
					<input type="radio" name="R_neuro" value="NA">&nbsp;NA
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;PVOD</td><th>:</th>
				<td>
					<input type="radio" name="R_povd" value="Y">&nbsp;Yes
					<input type="radio" name="R_povd" checked value="N">&nbsp;No
					<input type="radio" name="R_povd" value="NA">&nbsp;NA
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<hr width="80%">
				</td>
			</tr>
			
			<tr>
				<td class="NameTxt">&nbsp;Previous M.I</td><th>:</th>
				<td>
					<input type="radio" name="R_PreviousMI" id="R_PreviousMI" value="N" checked onclick="enableThrom(this.value)">&nbsp;No
					<input type="radio" name="R_PreviousMI" id="R_PreviousMI" value="Y" onclick="enableThrom(this.value)">&nbsp;Yes
					<input type="radio" name="R_PreviousMI" id="R_PreviousMI" value="NA" onclick="enableThrom(this.value)">&nbsp;NA
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Thrombolysis</td><th>:</th>
				<td>
					<input type="radio" name="Thrombolysis" id="Thrombolysis" value="Y" checked disabled>&nbsp;Yes
					<input type="radio" name="Thrombolysis" id="Thrombolysis" value="N" disabled>&nbsp;No
					<input type="hidden" name="R_Thrombolysis" value="">
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Angina class</td><th>:</th>
				<td>
					<input type="radio" name="angina" value="N" onclick="enableAngio(this.value)">&nbsp;UnStable
					<input type="radio" name="angina" value="Y" onclick="enableAngio(this.value)"checked>&nbsp;Stable
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td><td>&nbsp;</td>
				<td>&nbsp;
						<select name="sel_Angina_Cls" id="sel_Angina_Cls"> 
							<option selected value="select">---Select---</option>
							<option value="Class I">Class I</option>
							<option value="Class II">Class II</option>
							<option value="Class III">Class III</option>
							<option value="Class IV">Class IV</option>
						</select><input type="hidden" name="Angina_Cls" value="Unstable">
			</td></tr>
			<tr><td class="NameTxt">&nbsp;LV Angio Done</td><th>:</th>
						<td><input type="radio" name="R_LVDone" id="R_LVDone" value="Y" checked >&nbsp;Yes
							<input type="radio" name="R_LVDone" id="R_LVDone" value="N">&nbsp;No
				</td>
			</tr>

			<tr>
				<td class="NameTxt">&nbsp;LV Function (ECHO)</td><th>:</th>
				<td>&nbsp;
					<select name="LV_Type">  
						<option selected value="select">---Select---</option>
						<option value="Normal function (> 60%)">Normal function (> 60%)</option>
						<option value="Mild dysfunction (45-60%)">Mild dysfunction (45-60%)</option>
						<option value="Moderate dysfunction (30-45%)">Moderate dysfunction (30-45%)</option>
						<option value="Severe dysfunction (< 30%)">Severe dysfunction (< 30%)</option>
					</select>
				</td>
			</tr>
		</table>
	</td>
			</tr>
		<tr><th background="images/tableBottom.jpg" height="40" Valign="top">
				<input type="hidden" name="mode" value="dataDiags_mode">
				<input type="image" name="imageName" src="images/next.jpg"></th></tr>
		</table><!-- End Data Table -->
		<br>

<jsp:include page="include/footer.jsp"/>

<script language="JavaScript">

var throm = "N";

function onload() {
	document.getElementById("cad").focus();
}

function enableThrom(thr){
	
	throm = thr;

	var rads = document.frmDiags.Thrombolysis; 

	if(throm=="Y"){
		for (var i=0; i<rads.length; i++) {
				document.frmDiags.Thrombolysis[i].disabled = false;
		}
	}
	else{
		for (var i=0; i<rads.length; i++) {
				document.frmDiags.Thrombolysis[i].disabled = true;
		}
	}


}

function enableAngio(state){

	if(state=="Y"){
		document.frmDiags.sel_Angina_Cls.disabled = false;
	}else{
		document.frmDiags.sel_Angina_Cls.disabled = true;
	}


}

function enableLmca(lmca){
	
	var rad = document.frmDiags.sel_LMCA; 

	if(lmca=="Y"){
		for (var i=0; i<rad.length; i++) {
				document.frmDiags.sel_LMCA[i].disabled = false;
		}
	}
	else{
		for (var i=0; i<rad.length; i++) {
				document.frmDiags.sel_LMCA[i].disabled = true;
		}
	}


}

</script>

<script type="text/javascript" src="include/validate.js"></script>
