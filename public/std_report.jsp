<%@ include file="include/session_check.jsp"%>
<%@ page import="java.util.ArrayList" errorPage="error.jsp"%>
<%@ page import="com.apollo.dao.*"%>
<%	String windowTitle = application.getInitParameter("title"); %>

<title>:: Standard Reports :: <%=windowTitle%></title>

<jsp:include page="include/report_header.jsp" />

<%
	String pieChartName = (String)request.getAttribute("pieChartName");//Need filename from servlet 
	String barChartName = (String)request.getAttribute("cityBarChart");//Need filename from servlet
	String bloodBarChart = (String)request.getAttribute("bloodBarChart");//Need filename from servlet

	String pieURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + pieChartName;
	String barURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + barChartName;

	String years = "2007:2008";

	if(request.getParameter("years")!=null)
		years = request.getParameter("years");
	
	int agePatient_Count = 0;
	double patient_age = 0;

	ArrayList ageRatio = (ArrayList)request.getAttribute("ageRatio");
	ArrayList sexRatio = (ArrayList)request.getAttribute("sexRatio");
	ArrayList surgeryDate = (ArrayList)request.getAttribute("surgeryDate");
	ArrayList ageDistribution = (ArrayList)request.getAttribute("ageDistribution");
	ArrayList monthSurgeryDetail = (ArrayList)request.getAttribute("monthSurgeryDetail");
	ArrayList monthSurgeryDetail1 = (ArrayList)request.getAttribute("monthSurgeryDetail1");

	int cabgCount = Integer.parseInt((String)request.getAttribute("cabgCount"));
	int angioCount = Integer.parseInt((String)request.getAttribute("angioCount"));

	ChartDO chartDO = new ChartDO();

	for(int i=0;i<ageRatio.size();i++){
		chartDO = (ChartDO)ageRatio.get(i);
		agePatient_Count = chartDO.getTotal_count();
		patient_age = (double)chartDO.getPatient_age();
	}

	int totalPrev = 0 , totalCurr = 0;
%>

<link rel="stylesheet" href="css/tab-view.css" type="text/css" media="screen">
<script type="text/javascript" src="include/tab-view.js"></script>
<br><br>

<div id="dhtmlgoodies_tabView">
<!-- Tab - 1  -->


	<div class="dhtmlgoodies_aTab"><br><br>

	<form method="post" action="reports?mode=std" name="stdReport">

				
		<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="5" >
					<tr>
						<th bgcolor="#B8DFE4">Total no.of Patients in the system</th>
						<td align="center" bgcolor="#FFFFFF"><%=agePatient_Count%></td>
					</tr>
					<tr>
						<th bgcolor="#B8DFE4">CABG Surgeries</th>
						<td align="center" bgcolor="#FFFFFF"><%=cabgCount%></td>
					</tr>
					<tr>
						<th bgcolor="#B8DFE4">Angioplasty</th>
						<td align="center" bgcolor="#FFFFFF"><%=angioCount%></td>
					</tr>
				</table>
			
			<br><br><br>
			<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="5" >
					<tr bgcolor="#B8DFE4">
					<th>Earliest Admit Date</th>
					<th>Last Admit Date</th>
				</tr>
				<%try{
				for(int i=0;i<surgeryDate.size();i++){
					
						String sugeryDet[] = surgeryDate.get(i).toString().split("&");

					%>
				<tr align="center" bgcolor="#FFFFFF">
					<td><%=sugeryDet[0]%></td>
					<td><%=sugeryDet[1]%></td>
				</tr>
				<%}
				}catch(Exception e){}
				%>
			</table>
		<br><br><br>

			<table border=0 cellspacing="1" cellpadding="5" bgcolor="#006600">
			<tr bgcolor="#B8DFE4">
				<th colspan=2 align="center">Select Surgeries Year : 
				<select name="" onchange="getYearDetails(this.value)">
					<option value="2007:2008" <%if(years.equals("2007:2008")){%>selected<%}%>>2007 - 2008</option>
					<option value="2008:2009" <%if(years.equals("2008:2009")){%>selected<%}%>>2008 - 2009</option>
					<option value="2009:2010" <%if(years.equals("2009:2010")){%>selected<%}%>>2009 - 2010</option>
				</select>
				
				</th>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td valign="top"><!-- 2007 details -->
					<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="5" >
							<tr bgcolor="#B8DFE4">
							<th>Month</th>
							<th>Year</th>
							<th># of Surgeries</th>
						</tr>
						<%try{
							
						for(int i=0;i<monthSurgeryDetail.size();i++){
							
								DataAccessDO dataAccessDO = (DataAccessDO)monthSurgeryDetail.get(i);

							%>
						<tr align="center" bgcolor="#FFFFFF">
							<td align="left"><%=dataAccessDO.getMonth()%></td>
							<td><%=dataAccessDO.getYear()%></td>
							<td><%=dataAccessDO.getCount()%></td>
							<%	
								totalPrev += dataAccessDO.getCount();
								%>
						</tr>
						<%}
							if(monthSurgeryDetail.size()==0){
								%>
						<tr align="center">
							<th  colspan="3" bgcolor="#FFFFFF"><font size="" color="#FF0000">No Records Found !!!</font></th>
						</tr>
						<%
							}
						}catch(Exception e){}
						%>
					</table>
				</td>
				<td valign="top">
					<!-- 2008 details -->
						<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="5" >
							<tr bgcolor="#B8DFE4">
								<th>Month</th>
								<th>Year</th>
								<th># of Surgeries</th>
							</tr>
							<%try{
							for(int i=0;i<monthSurgeryDetail1.size();i++){
								
									DataAccessDO dataAccessDO = (DataAccessDO)monthSurgeryDetail1.get(i);

								%>
							<tr align="center" bgcolor="#FFFFFF">
								<td align="left"><%=dataAccessDO.getMonth()%></td>
								<td><%=dataAccessDO.getYear()%></td>
								<td><%=dataAccessDO.getCount()%></td>	
							</tr>
							<% totalCurr += dataAccessDO.getCount();
									}

									if(monthSurgeryDetail1.size()==0){
								%>
						<tr align="center">
							<th colspan="3" bgcolor="#FFFFFF"><font size="" color="#FF0000">No Records Found !!!</font></th>
						</tr>
						<%
							}
							}catch(Exception e){}
							%>
						</table>
				
				</td>
			</tr>
			<%
				String tmpYears[] = years.split(":");
			%>
			<tr bgcolor="#FFFFFF" align="center">
				<td>
				Total Surgeries in <%=tmpYears[0]%>  : <b><%=totalPrev%></b>
				</td>
				<td>
				Total Surgeries in <%=tmpYears[1]%>  : <b><%=totalCurr%></b>
				</td>
			</tr>
			</table>
			<input type="hidden" name="years">
			</form>
 </div>

<!-- Tab - 2  -->

<div class="dhtmlgoodies_aTab"><br><br><br>
			<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="5" >
				<tr bgcolor="#B8DFE4">
					<th>Gender</th>
					<th>Total</th>
					<th>Average Age</th>
				</tr>
				<%for(int j=0;j<sexRatio.size();j++){
					chartDO = (ChartDO)sexRatio.get(j);%>
				<tr align="center">
					<td bgcolor="#B8DFE4" align="left">
						<b><%if(chartDO.getSex().equals("M")){%>Male
						<%}else{%>Female<%}%></b>
					</td>
					<td bgcolor="#FFFFFF"><%=chartDO.getTotal_count()%></td>
					<td bgcolor="#FFFFFF"><%=Math.round(chartDO.getPatient_age())%> Yrs</td>
				</tr>
				<%} %>
			</table>
				
<br><br>
	<br><br>


				<table border="0" bgcolor="#006600" cellspacing="1" cellpadding="5" >
				<tr><th colspan="3" bgcolor="#FFFFFF">Patients Age band</th></tr>
				<tr bgcolor="#B8DFE4">
					<th>Age Band<br>(Yrs)</th>
					<th># of patients</th>
					<th>Distribution</th>
				</tr>
				<%for(int j=0;j<ageDistribution.size();j++){
					chartDO = (ChartDO)ageDistribution.get(j);%>
				<tr align="center" bgcolor="#FFFFFF">
					<td>
						<%=chartDO.getAgeDiff()%>
					</td>
					<td><%=chartDO.getTotal_count()%></td>
					<td>
						<%
							int count = chartDO.getTotal_count();
							double percent = (count*100)/(double)agePatient_Count;
							out.println(Math.round(percent)+" %");
						%>
					</td>
				</tr>
				<%} %>
				<tr align="center" >
						<th bgcolor="#B8DFE4">Average Age</th>					
						<td colspan="2" bgcolor="#FFFFFF"><%=Math.round(patient_age)%> Yrs</td>
					</tr>
			</table>

</div>

<!-- Tab - 3  -->
<div class="dhtmlgoodies_aTab"><br><br>

	<table>
		<tr align="center">
			<td><img src="<%=pieURL%>" border="0" alt=""></td>
		</tr>
	</table>
	<br>
	<table>
			<tr>
				<td align="center"><img src="<%=barURL%>" border="0" alt=""></td>
			</tr>
		</table>
</div>

 
</div>
<script type="text/javascript">
	initTabs('dhtmlgoodies_tabView',Array('Surgical','Age Distribution','Graphical'),0,900,780);
</script>


<jsp:include page="include/footer.jsp" />

<script language="JavaScript">

function getYearDetails(yearValue){
	document.stdReport.years.value = yearValue;
	stdReport.submit();

}

</script>