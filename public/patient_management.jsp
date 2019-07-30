<%@ include file="include/session_check.jsp"%>

<%@ page import="java.sql.*" session="true" errorPage="error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.apollo.dao.*"%>

<%	
	String windowTitle = application.getInitParameter("title");
	String usrStatus = (String)session.getAttribute("usrStatus");

	ArrayList pat_Report = (ArrayList) request
			.getAttribute("patientReport");
	String pageNo = request.getParameter("pageVal");
	int startVal = 0;
	int currentPageNo = 0;

	String currentPage = "";
	if (pageNo == null || pageNo.equals("")) {
		startVal = 0;
		currentPageNo = 0;
	} else {
		currentPage = pageNo;
		//pageNo = pageNo + "0";
		int iVal = Integer.parseInt(pageNo) *10;
		startVal = iVal*3;

		int iVal1 = Integer.parseInt(currentPage);
		currentPageNo = iVal1;
	}

	int totalCount = pat_Report.size();
	int noOfPages = totalCount / 30;
	int reminder1 = totalCount % 30;
	if (reminder1 > 0) {
		noOfPages += 1;
	}
%>

<title>:: Patients List :: <%=windowTitle%></title>
<jsp:include page="include/header.jsp" />
<form name="frmReport" method="post" action="" onsubmit="return IDvalidate()">
<table border=0 width="100%" height="100%" cellspacing="0" cellpadding="0"><!-- Over All Table -->
	<tr>
		<th rowspan="3" width="158"><img src="images/ecggraph.jpg">
			<a href="new_patient.jsp"><img src="images/new_patient.gif" width="118" height="122" border="0" alt=""></a>
		</th>
		<td align="center">
			<table cellspacing="0" cellpadding="0"><!-- Srch Table -->
				<tr>
					<td background="images/search.jpg" width="100" height="31">&nbsp;</td>
					<td background="images/searchmid.jpg">&nbsp;
						<input type="text" id="srchPatientID" name="srchPatientID" size=45>&nbsp;
					</td>
					<td>
						<input type="image" src="images/searchgo.jpg" width="52" height="31" border="0" alt="">
					</td>
				</tr>
			</table><!--end Srch Table -->
		</td>
	</tr>
	<tr>
		<td><br><center><b>
			<% try{
				if((String)session.getAttribute("usrStatus")!=null){
					usrStatus = (String)session.getAttribute("usrStatus");

						out.println("<b>"+usrStatus+"<b><br><br>");

						session.removeAttribute("usrStatus");
				}}catch(Exception e){}
							%>
		</b></center><br>
			<table border="0" align="center"  height="410" background="images/namelistbg2.jpg" cellspacing="0" cellpadding="0">
				<!-- Over all table  -->
				<tr>
					<td width="345" Valign="top">
						<table border="0" width="340" cellspacing="2" cellpadding="3">
						<!-- Table No.1 -->
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						<%
						try {
							String firstname = "";
							String lastname = "";
							String Patientid = "";
							String reportUrl = "";

							//Iterator itr = pat_Report.iterator(); -->
							if(pat_Report.size()>0){

							for (int i = startVal; i < startVal + 15; i++) {

								DataAccessDO dataaccessdo = (DataAccessDO) pat_Report
										.get(i);
								firstname = "" + dataaccessdo.getFirstName();
								lastname = "" + dataaccessdo.getLastName() ;
								Patientid = "" + dataaccessdo.getPatientID();
								reportUrl = "" + dataaccessdo.getReportURL();
					%>
							<tr>
								<td>&nbsp; <a href="patientReports?mode=patientSrch_mode&Patientid=<%=Patientid%>"><%=firstname%>&nbsp;<%=lastname%></a></td>
								<td width="100">&nbsp;<%=Patientid%></td>
							</tr>
					<%
						}
					
					%>
						</table>
				<!--end Table No.1 -->
					</td>
					<td width="345" Valign="top">
						<table border="0" width="340" cellspacing="2" cellpadding="3">
						<!-- Table No.2 -->
							<tr>
								<td>&nbsp;</td><td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td><td>&nbsp;</td>
							</tr>
								<%
									for (int i = startVal + 15; i < startVal + 30; i++) {

											DataAccessDO dataaccessdo = (DataAccessDO) pat_Report
													.get(i);
											firstname = "" + dataaccessdo.getFirstName();
											lastname = "" + dataaccessdo.getLastName();
											Patientid = "" + dataaccessdo.getPatientID();
											reportUrl = "" + dataaccessdo.getReportURL();
								%>
							<tr>
								<td>
									&nbsp;<a href="patientReports?mode=patientSrch_mode&Patientid=<%=Patientid%>"><%=firstname%>&nbsp;<%=lastname%></a>
								</td>
								<td width="100">&nbsp;<%=Patientid%></td>
									<%
									}
									}else {%>
										<th valign="middle">
											<br><br><br><br><br>
											<img src="images/no_record.gif" width="152" height="20" border="0" alt="">
										</th>
									<%
									}
									} catch (Exception e) {
										e.printStackTrace();
									}
								 %>			<!--end Table No.2 -->
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<!--end Table No. 1 & 2 --> 
		</td>
	</tr>
	<tr>
		<td height="30">
			<table width="80%" align="center" border="0">
				<%if (pat_Report.size() > 0) {%>
				<tr>
					<td colspan="2" align="left">&nbsp;
						Page <b><%=currentPageNo + 1%></b> of <%=noOfPages%>&nbsp;
					</td>
					<td align='center'>
						<%if (currentPageNo != 0) {%> 
						<a href="#" onclick="nextPage('<%=0%>')"><b>Start</b></a> <%
					 	}
					 	for (int i = 1; i <= noOfPages; i++) {
				 			if (i - 1 != currentPageNo) {
								%>
									<a href="#" onclick="nextPage('<%=i-1%>')"><b><%=(i)%></b></a>&nbsp;
						<%	} else {%>
								<b><%out.println(i);%></b>
						<%	}
 						}
				 		if (currentPageNo != noOfPages - 1) {
							%>
							<a href="#" onclick="nextPage('<%=noOfPages-1%>')">End</a> 
							<%}
						%>
					</td>
				</tr>
				<%
				}%>
			</table>
		</td>
	</tr>
</table>
		<input type="hidden" name="pageVal" value=""> 
		<input type="hidden" name="mode" value="patientReport_mode">
	

		



<!--end of Over All Table --> <jsp:include page="include/footer.jsp" />

<script language="JavaScript">
function nextPage(val){
	pageNo = val;
	document.frmReport.pageVal.value=pageNo;
	frmReport.action = "patientReports?mode=patientReport_mode";
	frmReport.submit();
}

function IDvalidate(){
	var srchPatientID = document.getElementById("srchPatientID").value;
	if(srchPatientID==""){
		alert("Enter Patient ID");
		document.getElementById("srchPatientID").focus();
		return false;
	}
	if(isNaN(srchPatientID)){
		alert("Invalid Patient ID");
		document.getElementById("srchPatientID").focus();
		return false;
	}

	frmReport.action = "patientReports?mode=patientSrch_mode&Patientid="+srchPatientID;
	frmReport.submit();
}
</script>