<%@ include file="include/session_check.jsp"%>
<%@ page import="java.util.ArrayList" errorPage="error.jsp"%>
<%@ page import="com.apollo.dao.*"%>
<%	
	String windowTitle = application.getInitParameter("title");

	String month[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};

	ArrayList reports = new ArrayList();

	String uname = (String)session.getAttribute("sess");
	
%>
<title>:: CABG Custom Reports :: <%=windowTitle%></title>

<jsp:include page="include/report_header.jsp" />

<body onload="resetCheckBox(customReprt)">

<br><br><jsp:include page="customMenu.jsp"/><br><br>
	<br><br>
<form method="post" action="reports" name="customReprt" onsubmit="return getReportValues('<%=uname%>')">
	
	<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="8" valign="top">
	<tr>
		<th colspan="6" align="center" bgcolor="#B8DFE4">Select minimum two parameters for reports</th>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td><input type="checkbox" name="Graft_types" onclick="setParam(this.checked,this.name)">&nbsp;Graft Type</td>
		<td>
			<select name="sel_Graft_types" id="sel_Graft_types"  multiple >
				<option selected value="select">---Select---</option>
				<option value="LIMA">LIMA</option>
				<option value="RIMA">RIMA</option>
				<option value="BIMA">BIMA</option>
				<option value="LRA">LRA</option>
				<option value="SVG">SVG</option>
				<option value="Others">Others</option>
			</select>
		</td>
		<td rowspan="3">&nbsp;</td>
		<td><input type="checkbox" name="No_grafts" onclick="setParam(this.checked,this.name)">&nbsp;# of Grafts</td>
		<td>
			<select name="sel_No_grafts" id="sel_No_grafts"> 
				<option selected value="select">---Select---</option>
				<%
					for (int i = 0; i <= 7; i++) {
					%><option value="<%=i%>"><%=i%></option><%
					}
				%>
			</select>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td><input type="checkbox" name="IABP" onclick="setParam(this.checked,this.name)">&nbsp;IABP</td>
		<td>
			<select name="sel_IABP" id="sel_IABP">
				<option selected value="select">---Select---</option>
				<option value="Y">Yes</option>
				<option value="N">No</option>
			</select>
		</td>
	
		<td><input type="checkbox" name="Revascularisation" onclick="setParam(this.checked,this.name)">&nbsp;Revascularisation</td>
		<td>
			<select name="sel_Revascularisation" id="sel_Revascularisation">
				<option value="select" selected>---Select---</option>
				<option value="Total">Total</option>
				<option value="Optimal">Optimal</option>
				<option value="Sub-Optimal">Sub-Optimal</option>
			</select>
		</td>
	</tr>
	<tr  bgcolor="#FFFFFF">
		<td><input type="checkbox" name="Peri_op" onclick="setParam(this.checked,this.name)">&nbsp;Peri-Op</td>
		<td>
			<select name="sel_Peri_op" id="sel_Peri_op">
				<option selected value="select">---Select---</option>
				<option value="Y">Yes</option>
				<option value="N">No</option>
			</select>
		</td>
	
		<td><input type="checkbox" name="Mortality" onclick="setParam(this.checked,this.name)">&nbsp;Mortality</td>
		<td>
			<select name="sel_Mortality" id="sel_Mortality">
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
		<td colspan="6" align="center"> <u><b>Surgery Date</b></u> <br><br>
			<table border="0" width="100%" bordercolor="#B8DFE4"  cellspacing="0">
			<tr align="center">
				<th width="30%">
					<input type="radio" name="date_range" checked >Month-Year
				</th>
				<th colspan="2" align="center">
					<input type="radio" name="date_range" >Date Range
				</th>
			</tr>
			<tr width="65%" align="center">
				<td>
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
				
				<td>From
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
				<td>To
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
			<input type="hidden" name="mode" value="custom_cabg">
			<input type="hidden" name="checked_values" value="">
			</table>
		</td>
	</tr>
	<tr  bgcolor="#FFFFFF">
		<td colspan="6" align="center" ><input type="image" src="images/generate1.jpg"></td>
	</tr>
	<%
		
		try{
		
		String checked_values = request.getParameter("checked_values");

		reports = (ArrayList)request.getAttribute("reports");
		
		if(reports!=null){
		%>
		<tr  bgcolor="#FFFFFF">
			<td colspan="7"><center><br><b><%=checked_values%><br><br>Total Patients <%=reports.size()%></b><br><br></center>
				<table border="1" width="100%">
					<tr>
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
		<tr  bgcolor="#FFFFFF">>
			<th colspan="7">
				<font size="" color="#FF0000">No records found!!!</font>
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

var columns = "";
var colSplit = new Array();
var columnValue = new Array();
var dest = new Array();
var dateOption = "";
var dateQuery = "";
var hiddenQuery = "";

var strQuery = "";

var fields = new Array("graft_types","no_grafts","IABP");

function getReportValues(sess){

  var selectedArray = new Array();
  var selObj = document.getElementById('sel_Graft_types');
  var i;
  var pos = 0;
  for (i=0; i<selObj.options.length; i++) {
    if (selObj.options[i].selected) {
      selectedArray[pos] = selObj.options[i].value;
      pos++;
    }
  }
	

if(sess!="admin"){
	strQuery = "select m.patient_id id,date_format(s.surgery_date,'%D-%M-%Y') date from cvtd_master m,cvtd_surgery s where exists (select u.cardio_id,u.surgeon_id from user_access u where u.user_name='"+sess+"' and u.cardio_id=m.cardio_id and u.surgeon_id=m.surgeon_id) and s.patient_id=m.patient_id and ";
}else{
	strQuery = "select m.patient_id id,date_format(s.surgery_date,'%D-%M-%Y') date from cvtd_master m,cvtd_surgery s where s.patient_id=m.patient_id and ";
}

if(count<2){
	alert("Select minimum two parameters!!!");
	return false;
}

if(count==3){

	for(i=0;i<customReprt.elements.length;i++){

		if(customReprt.elements[i].checked==true){

			var fieldname = customReprt.elements[i].name;
		
			if(fieldname!="date_range")
				columns = columns + fieldname +",";
		}


	}

	colSplit = columns.split(",");

	for(ap=0;ap<2;ap++){
		if(colSplit[ap]=="Graft_types"){
			columnValue[0] = selectedArray;
			break;
		}
	}

	if(columnValue[0]==undefined)
		columnValue[0] = document.getElementById("sel_"+colSplit[0]).value;

	columnValue[1] = document.getElementById("sel_"+colSplit[1]).value;
	columnValue[2] = document.getElementById("sel_"+colSplit[2]).value;

	hiddenQuery = strQuery+"s."+colSplit[0]+"='"+columnValue[0]+"' and s."+colSplit[1]+"='"+columnValue[1]+"' and s."+colSplit[2]+"='"+columnValue[2]+"'";


}else if(count==2){
	
	for(i=0;i<customReprt.elements.length;i++){

		if(customReprt.elements[i].checked==true){

			var fieldname = customReprt.elements[i].name;
		
			if(fieldname!="date_range")
				columns = columns + fieldname +",";
		}

	}	

	colSplit = columns.split(",");
	
	for(ap=0;ap<2;ap++){
		if(colSplit[ap]=="Graft_types"){
			columnValue[0] = selectedArray;
			break;
		}
	}
	
	if(columnValue[0]==undefined)
		columnValue[0] = document.getElementById("sel_"+colSplit[0]).value;


	columnValue[1] = document.getElementById("sel_"+colSplit[1]).value;

	hiddenQuery = strQuery+"s."+colSplit[0]+"='"+columnValue[0]+"' and s."+colSplit[1]+"='"+columnValue[1]+"'";


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
		dateQuery = " and month(s.surgery_date)="+datArray[0]+" and year(s.surgery_date)="+datArray[1];
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

	dateQuery = " and s.surgery_date between '"+fromDate+"' and '"+toDate+"'";

	hiddenQuery = hiddenQuery + dateQuery;

}

hiddenQuery = hiddenQuery+" order by id";

document.customReprt.query.value = hiddenQuery;

for(n=0;n<count;n++){
	if(colSplit[n]=="Graft_types")
		dest[n] = colSplit[n]+"="+selectedArray;
	else
		dest[n] = colSplit[n]+"="+document.getElementById("sel_"+colSplit[n]).value;
}

document.customReprt.checked_values.value = dest;

//alert(document.customReprt.query.value);
//return false;

}

function setParam(state,paramName){
	
	if(state)
		count++;
	if(!state)
		count--;

}


</script>

