<%@ page import="java.util.*" errorPage="error.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
	String windowTitle = application.getInitParameter("title");

	String sess = (String)session.getAttribute("sess");
	
	int patientId = Integer.parseInt((String)session.getAttribute("PatientId")); 

%>
<title>:: Patient Details :: <%=windowTitle%></title>

<input type="hidden" name="patientId" value="<%=patientId%>">
<jsp:include page="include/header.jsp"/>

<form method='post' name="frmDetails" onsubmit="return validateDetails();" action="patientDetails">

<table border="0" cellspacing="0" cellpadding="0">
	<tr><th background="images/tableTop.jpg" height="23"> Patient Details </th></tr>
	
	<tr><td class="img">
			<table width="490" border="0" cellspacing="3" cellpadding="3" ><!--Data Table -->
				<tr><td class="NameTxt">&nbsp;Patient ID</td><th>:</th><td><%=patientId%></td></tr>
				<input type="hidden" name="TxtPat_id" value="<%=patientId%>">
				<tr>
					<td class="NameTxt">&nbsp;Height</td><th>:</th>
					<td><input type="text" name="TxtHeight" id="TxtHeight" value="" size="5" maxlength="5" onkeyup="floatNumeric(this)"></td>
				</tr>
				<tr>
					<td class="NameTxt">&nbsp;Weight</td><th>:</th>
					<td><input type="text" name="TxtWeight" value="" size="5" maxlength="5" onkeyup="floatNumeric(this)"></td>
				</tr>
				<tr>
					<td class="NameTxt">&nbsp;Waist Circum</td><th>:</th>
					<td><input type="text" name="TxtWaist" value="" size="5" maxlength="5" onkeyup="floatNumeric(this)"></td>
				</tr>
				<tr><td class="NameTxt">&nbsp;Diabetes</td><th>:</th>
						<td><input type="radio" name="R_Diabetic" id="R_Diabetic" value="N" checked onclick="enableMedic('N')">&nbsp;No
							<input type="radio" name="R_Diabetic" id="R_Diabetic" value="<5y" onclick="enableMedic('Y')">&nbsp;< 5y
							<input type="radio" name="R_Diabetic" id="R_Diabetic" value=">5y" onclick="enableMedic('Y')">&nbsp;> 5y 
							<br>
						</td>
				</tr>
				<tr>
					<td class="NameTxt">
						&nbsp;Medication
					</td>
					<th>:</th>
					<td>
						<select name="diab_medic" disabled>
								<option value="Oral Drugs" selected>Oral Drugs</option>
								<option value="Insulin">Insulin</option>
								<option value="Others">Others</option>
						</select>
					</td><input type="hidden" name="diabetes_medic" value="">
				</tr>

				<tr><td class="NameTxt">&nbsp;HyperTension</td><th>:</th>
						<td><input type="radio" name="R_HY_Tensive" id="R_HY_Tensive" value="N" checked>&nbsp;No
							<input type="radio" name="R_HY_Tensive" id="R_HY_Tensive" value="<5y">&nbsp;< 5y
							<input type="radio" name="R_HY_Tensive" id="R_HY_Tensive" value=">5y">&nbsp;> 5y  
						</td>
				</tr>
				<tr>
					<td class="NameTxt">&nbsp;Dyslipidaemia</td><th>:</th>
						<td>
							<input type="radio" name="R_Dyslip" id="R_Dyslip" value="N" checked onclick="enableDyslipMedic(this.value)">&nbsp;No
							<input type="radio" name="R_Dyslip" id="R_Dyslip" value="Y" onclick="enableDyslipMedic(this.value)">&nbsp;Yes
					</td>
				</tr>
				<tr>
					<td class="NameTxt">
						&nbsp;Medication
					</td>
					<th>:</th>
					<td>
						<input type="radio" name="R_Dyslip_medic" id="R_Dyslip_medic" value="Y" checked disabled onclick="dyslipMedic(this.value)">&nbsp;Yes
						<input type="radio" name="R_Dyslip_medic" id="R_Dyslip_medic" value="N" disabled onclick="dyslipMedic(this.value)">&nbsp;No
					</td><input type="hidden" name="Dyslip_medic" id="Dyslip_medic" value="N">
				</tr>
				<tr>
					<td class="NameTxt">&nbsp;Smoking</td><th>:</th>
					<td>
						<input type="radio" name="R_Smoker" id="R_Smoker" value="Y" onclick="disableSmoker(this.value)">&nbsp;Yes
						<input type="radio" name="R_Smoker" id="R_Smoker" value="N" checked onclick="disableSmoker(this.value)">&nbsp;No
						<input type="radio" name="R_Smoker" id="R_Smoker" value="E" onclick="disableSmoker(this.value)">&nbsp;EX-Smoker
					</td>
				</tr>
				<tr>
					<td class="NameTxt">&nbsp;Smoking Duration</td><th>:</th>
					<td>&nbsp;
						<select name="sel_Smoke_Yrs" disabled onchange="setSmkYrs(this.value)"> 
							<option selected value="select">---Yrs---</option>
								<%for(int i=0;i<30;i++) {%><option value="<%=i%>"><%=i%></option><%}%>
						</select>&nbsp;Yrs&nbsp;&nbsp;&nbsp;
						<input type="text" name="Txt_cigars" id="Txt_cigars" size="3" disabled  onkeyup="Numeric(this)">&nbsp;No. of Cigarettes
					</td>
					<input type="hidden" name="Smoke_Yrs" value="-1">
					<input type="hidden" name="cigars" value="-1">
				</tr>
				<tr><td class="NameTxt">&nbsp;Obesity</td><th>:</th>
						<td><input type="radio" name="R_Obese" id="R_Obese" value="Y">&nbsp;Yes
							<input type="radio" name="R_Obese" id="R_Obese" value="N" checked>&nbsp;No
							<input type="radio" name="R_Obese" id="R_Obese" value="NA">&nbsp;NA
						</td>
				</tr>
				<tr><td class="NameTxt">&nbsp;Exercise</td><th>:</th>
						<td><input type="radio" name="R_Exer" id="R_Exer" value="Y">&nbsp;Yes
							<input type="radio" name="R_Exer" id="R_Exer" value="N">&nbsp;No
							<input type="radio" name="R_Exer" id="R_Exer" value="NA" checked>&nbsp;NA
						</td>
				</tr>

					</table></td>
			</tr>
		<tr><th background="images/tableBottom.jpg" height="40" Valign="top">
				<input type="hidden" name="mode" value="dataDetails_mode">
				<input type="image" name="imageName" src="images/next.jpg"></th></tr>
		</table><!-- End Data Table -->

<jsp:include page="include/footer.jsp"/>
<script language="JavaScript">

var diabtreat_value = "N";
var dyslip_value = "N";
var dyslip_medic_value = "N";

function onload() {

	document.getElementById("TxtHeight").focus();
}

function enableMedic(treat){

	diabtreat_value = treat;
	
	if(treat=="Y"){
		document.frmDetails.diab_medic.disabled = false;

	}
	if(treat=="N"){
		document.frmDetails.diab_medic.disabled = true;
		document.frmDetails.diabetes_medic.value = "";
	}
}

function enableDyslipMedic(treat){

	dyslip_value = treat;

	var rads = document.frmDetails.R_Dyslip_medic; 
	
	if(treat=="N"){
		for (var i=0; i<rads.length; i++) {
				document.frmDetails.R_Dyslip_medic[i].disabled = true;
		}
	}else{
		for (var i=0; i<rads.length; i++) {
				document.frmDetails.R_Dyslip_medic[i].disabled = false;;
		}
	}

}

function dyslipMedic(medicValue){

	dyslip_medic_value = medicValue;

}
</script>
<script type="text/javascript" src="include/validate.js"></script>