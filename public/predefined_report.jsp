<%@ include file="include/session_check.jsp"%>
<%@ page import="java.util.ArrayList" errorPage="error.jsp"%>
<%@ page import="com.apollo.dao.*"%>

<%
	String windowTitle = application.getInitParameter("title");

	String mode = request.getParameter("mode");

%>

<title>:: Predefined Reports :: <%=windowTitle%></title>

<jsp:include page="include/report_header.jsp" />
	
<%

if(mode.equals("diabetic")){
	%>	

		<br><br><jsp:include page="tabMenu.jsp"/><br><br>

<!-- for DIABETES -->

	<%
		ArrayList diabetic = (ArrayList)request.getAttribute("diabetic");

		ArrayList obese = (ArrayList)request.getAttribute("obese");

		ArrayList dyslip = (ArrayList)request.getAttribute("dyslip");

		String patient_array = (String)request.getAttribute("smokerCount");

		String smokerArray[] = patient_array.split(":");

		String youngDiabetic = (String)request.getAttribute("youngDiabetic");//Need filename from servlet

		String pieURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + youngDiabetic;

		
		try{
			if(diabetic.size()>0 || diabetic!=null){
				%>	
					<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="5" >
					<tr align="center" bgcolor="#B8DFE4">
						<th># of patients</th>
						<th>Smoker</th>
						<th>Non / Ex-Smoker</th>
					</tr>
					<tr align="center" bgcolor="#FFFFFF">
						<td><%=smokerArray[1]%></td>
						<td><%=smokerArray[0]%></td>
						<%
							int non_smoker = Integer.parseInt(smokerArray[1]) - Integer.parseInt(smokerArray[0]);
						%>
						<td><%=non_smoker%></td>
					</tr>
					</table><br><br>
					<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="5" valign="top">
						<tr bgcolor="#B8DFE4">
							<th>Gender</th>
							<th># of Patients</th>
							<th>Diabetic</th>
							<th>Hypertensive</th>
						</tr>
				<%  if(diabetic.size()>0){
				for(int j=0;j<diabetic.size();j++){
					DataAccessDO dataAccessDO = (DataAccessDO)diabetic.get(j);

					String gender = dataAccessDO.getGender();

					if(gender.equals("M"))
						gender = "Male";
					else
						gender = "Female";

							String diab = dataAccessDO.getDiabetic();
							String hyper = dataAccessDO.getHyperTensive();
							String diabImg = "no",hyperImg = "no";
	
							if(!diab.equals("N")) diabImg = "yes";
							if(!hyper.equals("N")) hyperImg = "yes";
					%>
						<tr align="center" bgcolor="#FFFFFF">
							<td align="left"><%=gender%></td>
							<td><%=dataAccessDO.getCount()%></td>
							<td><img src="images/<%=diabImg%>.gif" border="0" alt=""></td>
							<td><img src="images/<%=hyperImg%>.gif" border="0" alt=""></td>
						</tr>
					<%
				} }
					else{
						%>
							<tr>
								<th colspan="4" bgcolor="#FFFFFF">
									<font size="2" color="#FF0000">No records found!!</font>
								</td>
							</tr>
						<%}

					%>
					</table>
					<%

			}

				%>	
					<br>
					<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="5" valign="top">
						<tr bgcolor="#B8DFE4">
							<th>Gender</td>
							<th>Obese Patients</th>
						</tr>

						<%  if(obese.size()>0){
							for(int i=0;i<obese.size();i++){
							
							DataAccessDO dataAccessDO = (DataAccessDO)obese.get(i);

							String gender = dataAccessDO.getGender();

							if(gender.equals("M"))
								gender = "Male";
							else
								gender = "Female";

						%>
						<tr align="center" bgcolor="#FFFFFF">
							<td align="left"><%=gender%></td>
							<td><%=dataAccessDO.getCount()%></td>
						</tr>
						<%}} else{
						%>
							<tr>
								<th colspan="2" bgcolor="#FFFFFF">
									<font size="2" color="#FF0000">No records found !!!</font>
								</td>
							</tr>
						<%}
						%>
					</table><br>
					<br>
					<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="5" valign="top">
						<tr bgcolor="#B8DFE4">
							<th>Gender</td>
							<th>Dyslipidaemic Patients</th>
						</tr>
						<%
							if(dyslip.size()>0){
							for(int i=0;i<dyslip.size();i++){
							
							DataAccessDO dataAccessDO = (DataAccessDO)dyslip.get(i);

							String gender = dataAccessDO.getGender();

							if(gender.equals("M"))
								gender = "Male";
							else
								gender = "Female";

						%>
						<tr align="center" bgcolor="#FFFFFF">
							<td align="left"><%=gender%></td>
							<td><%=dataAccessDO.getCount()%></td>
						</tr>
						<%}}
						else{
						%>
							<tr>
								<th colspan="2" bgcolor="#FFFFFF">
									<font size="2" color="#FF0000">No records found!!</font>
								</td>
							</tr>
						<%}%>
					</table><br>
						<hr width="60%"><br>
						<center><b>Young Diabetes</b></center><br>
						<%if(!pieURL.contains("null")){%>
							<img src="<%=pieURL%>" border="0" alt="">
						<%}else{%>
							<center><b>No records found !!!</b></center><br>
						<%}%>
						<br><br>
				<%
		}catch(Exception e){}

	%>


<%}%>

<!-- for DIAGNOSIS -->

<% if(mode.equals("diagnosis")){

	%>
				<br><br><jsp:include page="tabMenu.jsp"/><br><br>

	<%

			ArrayList diagDetails = (ArrayList)request.getAttribute("diagDetails");

			String diagBarChart = (String)request.getAttribute("diagBarChart");

			String barURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + diagBarChart;
%>
		<img src="<%=barURL%>" border="0" alt=""><br><br>
		<hr width="60%"><br>
		<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="5" valign="top">
		<tr>
			<th colspan="5" bgcolor="#43A4B1">ECG Details</th>
		</tr>
		<tr bgcolor="#B8DFE4">
			<th>ECG</th>
			<th># of Patients</th>
			<th>Cholestrol<br>(Avg)</th>
			<th>Triglyceride<br>(Avg)</td>
		</tr>
		<%
	try{
		if(diagDetails.size()>0){
		for(int k=0;k<diagDetails.size();k++){
	
			DataAccessDO dataAccessDO = (DataAccessDO)diagDetails.get(k);

		%>	
		<tr align="center">
			<th bgcolor="#B8DFE4"><%=dataAccessDO.getECG()%></th>
			<td bgcolor="#FFFFFF"><%=dataAccessDO.getCount()%></td>
			<td bgcolor="#FFFFFF"><%=dataAccessDO.getTotalCholesterol()%></td>
			<td bgcolor="#FFFFFF"><%=dataAccessDO.getTriglyceride()%></td>
		</tr>
		<%}}
		else
			{%>
			<tr  bgcolor="#FFFFFF"><th colspan=4><font size="2" color="#FF3300">No records found !!!</font></th></tr>
			<%}
		}catch(Exception e){e.printStackTrace();}
		%>
		</table><br><br>
<%}%>

<!-- for CABG -->

<%if(mode.equalsIgnoreCase("surgery")){
	
		ArrayList graftTypes = (ArrayList)request.getAttribute("graftTypes");
		
		String surgery = (String)request.getAttribute("surgery");

		String pieURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + surgery;

		try{

	%>
	<br><br><jsp:include page="tabMenu.jsp"/><br><br>
	<center>
			<%if(!pieURL.contains("null")){%>
				<img src="<%=pieURL%>" border="0" alt="">
			<%}else{%>
				<center><b><h2><font size="2" color="#FF3300">No records found !!!</font></h2></b></center><br>
			<%}%>
	</center>
	<br>
	<hr width="60%">
	<br>

	<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="5" valign="top">
		<tr bgcolor="#B8DFE4">
			<th># of Grafts</th>
			<th># of Patients</th>
			<th>Graft Type</th>
		</tr>

		<%	if(graftTypes.size()>0){
		for(int h=0;h<graftTypes.size();h++){
			DataAccessDO dataAccessDO = (DataAccessDO)graftTypes.get(h);
			%>
		<tr align="center" bgcolor="#FFFFFF">
			<%if(dataAccessDO.getNoGrafts()!=0){%>
			<td><%=dataAccessDO.getNoGrafts()%></td>
			<td><%=dataAccessDO.getCount()%></td>
			<td><%=dataAccessDO.getGraftTypes()%></td>
			<%}%>
		</tr>
			<%
		}}else{%>
		<tr><th colspan=3 bgcolor="#FFFFFF"><font size="2" color="#FF3300">No records found !!!</font></th></tr>
			 <%}%>
			 
		</table><br><br>

	<%}catch(Exception e){}%>
<%}%>


<!-- for Angio -->

<%if(mode.equalsIgnoreCase("angio")){
	
		ArrayList stents = (ArrayList)request.getAttribute("stents");
		
		String approachPieChart = (String)request.getAttribute("approachPieChart");

		String pieURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + approachPieChart;

		try{%>
			<br><br><jsp:include page="tabMenu.jsp"/><br><br>

			<center>
				<%if(!pieURL.contains("null")){%>
							<img src="<%=pieURL%>" border="0" alt="">
						<%}else{%>
							<center><b>No records found !!!</b></center><br>
						<%}%>
			</center>
			<br>
	<hr width="60%">
	<br>
	<table border="1" bordercolor="#330000" cellspacing="0" cellpadding="5" valign="top">
		<tr bgcolor="#B8DFE4">
			<th># of Stents</th>
			<th># of Patients</th>
			<th>Stent Type</th>
		</tr>
		<%	
			if(stents.size()>0){
		for(int h=0;h<stents.size();h++){
			DataAccessDO dataAccessDO = (DataAccessDO)stents.get(h);
			%>
		<tr align="center">
			<td><%=dataAccessDO.getNoOfStents()%></td>
			<td><%=dataAccessDO.getCount()%></td>
			<td><%=dataAccessDO.getStentType()%></td>
		</tr>
			<%
		}}else{%>
			<tr><th colspan=3><font size="2" color="#FF3300">No records found !!!</font></th></tr>
		<%}%>
		</table>
	<br><br><br><br><br>
	<%}catch(Exception e){}%>
<%}%>
<jsp:include page="include/footer.jsp" />