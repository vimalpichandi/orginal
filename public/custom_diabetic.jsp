<%@ include file="include/session_check.jsp"%>
<%@ page import="java.util.ArrayList" errorPage="error.jsp"%>
<%@ page import="com.apollo.dao.*"%>
<%
	String windowTitle = application.getInitParameter("title");

	String month[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};

	ArrayList reports = new ArrayList();

	String uname = (String)session.getAttribute("sess");
	
%>
<title>:: Diabetes Custom Reports :: <%=windowTitle%></title>

<jsp:include page="include/report_header.jsp" />

<body onload="resetCheckBox(customReprt)">

<br><br><jsp:include page="customMenu.jsp"/><br><br>
	<br><br>
<form method="post" action="reports" name="customReprt" onsubmit="return getReportValues('<%=uname%>')">
	
	<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="8" valign="top">
	<tr bgcolor="#FFFFFF">
		<th colspan="6" align="center" bgcolor="#B8DFE4">Select minimum two parameters for reports</th>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td><input type="checkbox" name="Patient_age" onclick="setParam(this.checked,this.name)">&nbsp;Age</td>
		<td>
			<select name="sel_Patient_age" id="sel_Patient_age"> 
				<option selected value="select">---Select---</option>
				<option value=">0">All</option>
				<option value="<50"> <50 yrs </option>
				<option value="50-60">50 - 60 yrs</option>
				<option value="60-70">60 - 70 yrs</option>
				<option value="70-80">70 - 80 yrs</option>
				<option value=">80"> >80 yrs </option>
			</select>
		</td>
		<td rowspan="3">&nbsp;</td>
		<td><input type="checkbox" name="Diabetic" onclick="setParam(this.checked,this.name)">&nbsp;Diabetic</td>
		<td>
			<select name="sel_Diabetic" id="sel_Diabetic"> 
				<option selected value="select">---Select---</option>
				<option value="N">No</option>
				<option value="Y">Yes</option>
			</select>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td><input type="checkbox" name="HyperTensive" onclick="setParam(this.checked,this.name)">&nbsp;HyperTensive</td>
		<td>
			<select name="sel_HyperTensive" id="sel_HyperTensive">
				<option selected value="select">---Select---</option>
				<option value="N">No</option>
				<option value="Y">Yes</option>
			</select>
		</td>
		<td><input type="checkbox" name="Dyslipidaemia" onclick="setParam(this.checked,this.name)">&nbsp;Dyslipidaemia</td>
		<td>
			<select name="sel_Dyslipidaemia" id="sel_Dyslipidaemia">
				<option selected value="select">---Select---</option>
				<option value="Y">Yes</option>
				<option value="N">No</option>
			</select>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td><input type="checkbox" name="Smoker" onclick="setParam(this.checked,this.name)">&nbsp;Smoker</td>
		<td>
			<select name="sel_Smoker" id="sel_Smoker">
				<option selected value="select">---Select---</option>
				<option value="Y">Yes</option>
				<option value="N">No</option>
			</select>
		</td>
	
		<td><input type="checkbox" name="Obese" onclick="setParam(this.checked,this.name)">&nbsp;Obese</td>
		<td>
			<select name="sel_Obese" id="sel_Obese">
				<option selected value="select">---Select---</option>
				<option value="Y">Yes</option>
				<option value="N">No</option>
			</select>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td colspan="6">
			<hr color="#B8DFE4">
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td colspan="6" align="center"><u><b>Surgery Date</b></u> <br><br>
			<table border="0" width="100%" bordercolor="#B8DFE4"  cellspacing="0">
			<tr align="center">
				<th align="center">
					<input type="radio" name="date_range" checked >Month-Year
				</th>
				<th colspan="2" align="center">
					<input type="radio" name="date_range" >Date Range
				</th>
			</tr>
			<tr width="65%">
				<td align="center">
					<select name="monthYear">
						<option value="select" selected>---MMM/YYYY--</option>
						<%
							for(int i=7;i<month.length;i++){
						%>
						<option value="<%=i+1%>-2007"><%=month[i]%>-2007</option>
						<%}
						%>
						<option value="select"></option>
						<%
						for(int i=0;i<month.length;i++){
						%>
						<option value="<%=i+1%>-2008"><%=month[i]%>-2008</option>
						<%
						}
						%>
						<option value="select"></option>
						<%
						for(int i=0;i<month.length;i++){
						%>
						<option value="<%=i+1%>-2009"><%=month[i]%>-2009</option>
						<%
						}
						%>
					</select>
				</td>
				
				<td align="center">From
					<select name="fromDate">
						<option value="select" selected>---MMM/YYYY--</option>
						<%
							for(int i=7;i<month.length;i++){
						%>
						<option value="2007-<%=i+1%>"><%=month[i]%>-2007</option>
						<%}
						%>
						<option value="select"></option>
						<%
						for(int i=0;i<month.length;i++){
						%>
						<option value="2008-<%=i+1%>"><%=month[i]%>-2008</option>
						<%
						}
						%>
						<option value="select"></option>
						<%
						for(int i=0;i<month.length;i++){
						%>
						<option value="2009-<%=i+1%>"><%=month[i]%>-2009</option>
						<%
						}
						%>
					</select>
				</td>
				<td align="center">To
					<select name="toDate">
						<option value="select" selected>---MMM/YYYY--</option>
						<%
							for(int i=7;i<month.length;i++){
						%>
						<option value="2007-<%=i+1%>"><%=month[i]%>-2007</option>
						<%}
						%>
						<option value="select"></option>
						<%
						for(int i=0;i<month.length;i++){
						%>
						<option value="2008-<%=i+1%>"><%=month[i]%>-2008</option>
						<%
						}
						%>
						<option value="select"></option>
						<%
						for(int i=0;i<month.length;i++){
						%>
						<option value="2009-<%=i+1%>"><%=month[i]%>-2009</option>
						<%
						}
						%>
					</select>
				</td>
			</tr>
			<input type="hidden" name="query" value="">
			<input type="hidden" name="mode" value="custom_diabetes">
			<input type="hidden" name="checked_values" value="">
			</table>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td colspan="6" align="center" ><input type="image" src="images/generate1.jpg"></td>
	</tr>
	<%
		
		try{
		
		String checked_values = request.getParameter("checked_values");

		reports = (ArrayList)request.getAttribute("reports");
		
		if(reports!=null){
		%>
		<tr bgcolor="#FFFFFF">
			<td colspan="7"><center><br><b><%=checked_values%><br><br>Total Patients <%=reports.size()%></b><br><br></center>
				<table border="1" width="100%">
					<tr bgcolor="#FFFFFF">
						<th>Patient_id</th>
						<th>Surgery_date</th>
					</tr>
				<%

				for(int i=0;i<reports.size();i++){

					DataAccessDO dataAccessDO = (DataAccessDO)reports.get(i);

				%>
					
					<tr align="center">
						<td><a href="patientReports?mode=patientSrch_mode&Patientid=<%=dataAccessDO.getPatientID()%>"><%=dataAccessDO.getPatientID()%></a></td>
						<td><%=dataAccessDO.getSurgeryDate()%></td>
					</tr>
					<%	
						}
					%>
				</table>
			</td>
		</tr>
	<%
		}
		if(reports.size()==0){
			%>
		<tr bgcolor="#FFFFFF">
			<th colspan="7">
				No records found!!!
			</th>
		</tr>
			<%
		}
		}catch(Exception e){}

	%>
	</table>

</form>

</body>
<script language="JavaScript" src="include/validate.js"></script>

<jsp:include page="include/footer.jsp" />

<script language="JavaScript">

var count = 0;

var fieldname = "";
var columns = "";
var colSplit = new Array();
var columnValue = new Array();
var dest = new Array();
var dateOption = "";
var dateQuery = "";
var hiddenQuery = "";

var strQuery = "";

function getReportValues(sess){


if(sess!="admin"){
	strQuery = "select m.patient_id id,date_format(s.surgery_date,'%D-%M-%Y') date from cvtd_surgery s,cvtd_master m,cvtd_details d where exists (select u.cardio_id,u.surgeon_id from user_access u where u.user_name='"+sess+"' and u.cardio_id=m.cardio_id and u.surgeon_id=m.surgeon_id) and d.patient_id=m.patient_id and ";
}else{
	strQuery = "select m.patient_id id,date_format(s.surgery_date,'%D-%M-%Y') date from cvtd_surgery s,cvtd_master m,cvtd_details d where d.patient_id=m.patient_id and ";
}

if(count<2){
	alert("Select minimum two parameters!!!");
	return false;
}

if(count==3){

	for(i=0;i<customReprt.elements.length;i++){

		if(customReprt.elements[i].checked==true){

			fieldname = customReprt.elements[i].name;
		
			if(fieldname!="date_range"){
				columns = columns + fieldname +":";

			}
		}


	}
	//columns = columns.substring(0,columns.lastIndexOf(":"));
	
	colSplit = columns.split(":");
	
	columnValue[0] = document.getElementById("sel_"+colSplit[0]).value;
	columnValue[1] = document.getElementById("sel_"+colSplit[1]).value;
	columnValue[2] = document.getElementById("sel_"+colSplit[2]).value;
	
	var stWith = columnValue[0].substring(0,1);

	var firstColumn = "";
	var secondColumn = "";
	var thirdColumn = "";

	if(colSplit[0]=="Patient_age"){
		//code to change < and > into mysql between
		if(stWith=="<" || stWith==">")
			firstColumn = "m."+colSplit[0]+columnValue[0]+" ";
		else{
			var ageDiff = new Array();
			ageDiff = columnValue[0].split("-");
			firstColumn = "m."+colSplit[0]+">"+ageDiff[0]+" and m."+colSplit[0]+"<"+ageDiff[1]+" ";
		}

	}else if(colSplit[0]!="Patient_age"){// 
		if(columnValue[0]=="Y"){
			firstColumn = "d."+colSplit[0]+"!='N' ";
		}
		else{
			firstColumn = "d."+colSplit[0]+"='N' ";
		}
	}

	if(colSplit[1]!="Patient_age"){

		if(columnValue[1]=="Y")
			secondColumn = "d."+colSplit[1]+"!='N' ";
		else
			secondColumn = "d."+colSplit[1]+"='N' ";
	}
	if(colSplit[2]!="Patient_age"){

		if(columnValue[2]=="Y")
			thirdColumn = "d."+colSplit[2]+"!='N' ";
		else
			thirdColumn = "d."+colSplit[2]+"='N' ";
	}
	hiddenQuery = strQuery+firstColumn+" and "+secondColumn+" and "+thirdColumn+" and m.patient_id=s.patient_id and";

	
}else if(count==2){

	for(i=0;i<customReprt.elements.length;i++){

		if(customReprt.elements[i].checked==true){

			var fieldname = customReprt.elements[i].name;
		
			if(fieldname!="date_range"){
				columns = columns + fieldname +":";
			}
		}

	}	

	colSplit = columns.split(":");
	columnValue[0] = document.getElementById("sel_"+colSplit[0]).value;
	columnValue[1] = document.getElementById("sel_"+colSplit[1]).value;
	
	var stWith = columnValue[0].substring(0,1);

	var firstColumn = "";
	var secondColumn = "";


	if(colSplit[0]=="Patient_age"){
		//code to change < and > into mysql between
		if(stWith=="<" || stWith==">")
			firstColumn = "m."+colSplit[0]+columnValue[0]+" ";
		else{
			var ageDiff = new Array();
			ageDiff = columnValue[0].split("-");
			firstColumn = "m."+colSplit[0]+">"+ageDiff[0]+" and m."+colSplit[0]+"<"+ageDiff[1]+" ";
		}


	}else if(colSplit[0]!="Patient_age"){// 
		if(columnValue[0]=="Y"){
			firstColumn = "d."+colSplit[0]+"!='N' ";
		}
		else{
			firstColumn = "d."+colSplit[0]+"='N' ";
		}
	}
	
	if(colSplit[1]!="Patient_age"){

		if(columnValue[1]=="Y")
			secondColumn = "d."+colSplit[1]+"!='N' ";
		else
			secondColumn = "d."+colSplit[1]+"='N' ";
	}
	

	hiddenQuery = strQuery+firstColumn+" and "+secondColumn +" and ";
	

}else if(count>3){
	alert("You can select upto three");
	columns = "";
	return false;
}



if(columnValue[0]=="select"){
	alert("Select a "+colSplit[0].toUpperCase()+" status");
	columns = "";
	return false;
}
if(columnValue[1]=="select"){
	alert("Select a "+colSplit[1].toUpperCase()+" status");
	columns = "";
	return false;
}
if(columnValue[2]=="select"){
	alert("Select a "+colSplit[2].toUpperCase()+" status");
	columns = "";
	return false;
}


if(document.customReprt.date_range[0].checked==true){
	dateOption = document.customReprt.monthYear.value;

	if(dateOption!="select"){
		var datArray = new Array();

		datArray = dateOption.split("-");
		dateQuery = " month(s.surgery_date)="+datArray[0]+" and year(s.surgery_date)="+datArray[1]+" and s.patient_id=d.patient_id";
		hiddenQuery = hiddenQuery + dateQuery;
	}else{
		alert("Select Month-Year status!!!");
		document.customReprt.monthYear.focus();
		return false;
	}


}else if(document.customReprt.date_range[1].checked==true){

	var fromDate = document.customReprt.fromDate.value;
	var toDate = document.customReprt.toDate.value;
	
	if(fromDate!="select"){
		fromDate = fromDate + "-01";
	}else{
		alert("Select From date status!!!");
		document.customReprt.fromDate.focus();
		return false;
	}
	if(toDate!="select"){
		toDate = toDate + "-01"; 
	}else{
		alert("Select To date status!!!");
		document.customReprt.toDate.focus();
		return false;
	}
	
	dateQuery = " s.surgery_date between '"+fromDate+"' and '"+toDate+"' and s.patient_id=d.patient_id";

	hiddenQuery = hiddenQuery + dateQuery;
}

document.customReprt.query.value = hiddenQuery;

for(n=0;n<count;n++){
	dest[n] = colSplit[n]+"="+document.getElementById("sel_"+colSplit[n]).value;
}

document.customReprt.checked_values.value = dest;

//alert(document.customReprt.query.value)

//return false;

}

function setParam(state,paramName){
	
	if(state)
		count++;
	if(!state)
		count--;

}


</script>

