<%@ page session="true"%>

<%@ page import="java.sql.*" session="true"%>
<%@ page import="java.util.*" errorPage="error.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="com.apollo.dao.*" %>

<%
	String apollo_html = application.getInitParameter("Apollo-html");

	String sess = (String)session.getAttribute("sess");
	ArrayList  patientSrch = (ArrayList)request.getAttribute("patientSrch");
	int Patientid =Integer.parseInt((String)request.getAttribute("Patientid"));
	String realPath = (String)request.getRealPath("/");
		//out.println("real path-->"+realPath);
	
%>

<%
	//Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control","no-cache");
	//Directs caches not to store the page under any circumstance
	response.setHeader("Cache-Control","no-store");
	//Causes the proxy cache to see the page as "stale"
	response.setDateHeader("Expires", 0);
	//HTTP 1.0 backward compatibility
	response.setHeader("Pragma","no-cache");

	String windowTitle = application.getInitParameter("title");
	String uname = (String)session.getAttribute("sess");
	
%>
	<html>
	<head>
	<title>:: Search Patient :: <%=windowTitle%></title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta name="Generator" content="Npedia Technologies Pvt. Ltd.">
	<meta name="Author" content="HARI.M-VIMAL.P-PULANDRAN.T-RAJA.S">
	<meta name="keywords" content="Keywords here">
	<meta name="description" content="Description here">
	<meta name="robots" content="index, follow"> <!-- (Robot commands: All, None, Index, No Index, Follow, No Follow) -->
	<meta name="revisit-after" content="30 days">
	<meta name="distribution" content="global">
	<meta name="rating" content="general">
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
	<link href="images/apollofavicon.ico" rel="shortcut icon">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	
<body leftmargin="0" topmargin="0" bottommargin="0" rightmargin=0 >
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0"><!-- Over all outer table-1 -->
  <tr><td align="center" valign="top"> 
 
	<input type="hidden" name="path" id="path" value="<%=realPath%>" /> 
<!-- <input type="hidden" name="path" id="path" value="e:\hemarani" /> -->



	  
	  <table width="1000" height="100%" border="0" align="center" cellpadding="0" cellspacing="0"><!-- all outer table-2 -->
		 <tr><td height="119"  valign="bottom" colspan=3><img src="images/header.jpg" width="1000" height="119" border="0" alt=""></td></tr>
		  <tr><td valign="top" align="right" background="images/sidebg_right.gif" width="18"><img src="images/spacer1.gif" width="18" height="2" border="0" alt=""></td>
			 <td height="425" align="center" valign="top" bgcolor="#FFFFFF">
		  
			<table border="0" width="100%" height="100%" cellspacing="0" cellpadding="0"><!-- Table-1 -->
				<tr height="23"><th align="left"><font color='#274E4E'>&nbsp;Welcome, <%=uname%></font> </th>
								<td align="right"><%
										try {
											if(uname.equals("admin")) { %>
													<a href="patientReports?mode=patientReport_mode">								
											<% } else { %>
													<a href="user_menu.jsp">
											<% }
											} catch(Exception e) { } %>Menu</a>&nbsp;&nbsp;
							<a href='logout.jsp' style='color:red'>Logout</a>&nbsp;</td>
					</tr>
				<tr>
					<td align="center" colspan="2">



<form method="post" name="srchReport" action="">
<table width=490 border="0" cellspacing="0" cellpadding="0">
	<tr><th background="images/tableTop.jpg" height="23" colspan="2">  Patient Details</th></tr>

	<tr><td class="img" colspan="2" align="center">&nbsp;

	<table border="0" width="420" cellspacing="4" cellpadding="3"><!-- Table No.1 -->

	<%
		//ArrayList lookupList = null;
	try{
		if(patientSrch!=null || patientSrch.size()!=0){
		//lookupList = (ArrayList)request.getAttribute("lookupList");

		String firstname = ""; String lastname = ""; String gender= ""; 		
		String age = ""; String Doc_Name = ""; String location= ""; String reportUrl = ""; 
		//String bloodGroup= "";
		String hyperTensive = ""; String diabetic = ""; String anginaClass = ""; String prev_MI= "";
		String state_org = "",surgeon = "", stent = "";
		String T_cholestrol = ""; String ecg= "";
		String creatinine = ""; String prev_surgery = "";int no_grafts = 0;
		
		Iterator itr = patientSrch.iterator();

		while(itr.hasNext())
			{

			DataAccessDO dataaccessdo = (DataAccessDO)itr.next();

			//x, Cardio_ID, Location, doc_name, Diabetic, HyperTensive, Angina_class, Prev_MI, Total_cholesterol, ECG, Creatinine, Prev_surgery, No_grafts

			location = ""+dataaccessdo.getLocation();

			firstname = ""+dataaccessdo.getFirstName();
			lastname = ""+dataaccessdo.getLastName();
			gender = ""+dataaccessdo.getGender();
			age = ""+dataaccessdo.getAge();
			state_org = ""+dataaccessdo.getStateorg();
			Doc_Name = ""+dataaccessdo.getDoc_Name();

			surgeon = ""+dataaccessdo.getSurgeon();
			stent = ""+dataaccessdo.getStentType();

			reportUrl = ""+dataaccessdo.getReportURL();
			
			if(!reportUrl.equals("N.A")){
				reportUrl = apollo_html+reportUrl;
			}else{
				reportUrl = "";
			}

			//bloodGroup = ""+dataaccessdo.getBloodGroup();
			hyperTensive = ""+dataaccessdo.getHyperTensive();
			diabetic = ""+dataaccessdo.getDiabetic();
			anginaClass = ""+dataaccessdo.getAngina();
			prev_MI = ""+dataaccessdo.getPrevMI();

			T_cholestrol = ""+dataaccessdo.getTotalCholesterol();
			ecg = ""+dataaccessdo.getECG();
			creatinine = dataaccessdo.getCreatinine();

			prev_surgery = ""+dataaccessdo.getPrevSurgery();
			no_grafts = dataaccessdo.getNoGrafts();

			if(prev_surgery.equals("null"))
				prev_surgery = "Angioplasty";
			else
				prev_surgery = "CABG";

		%>
	
		<tr><td class="NameTxt">&nbsp;Patient ID</td><th>:</th><td><%=Patientid%></td></tr>
			<input type="hidden" name="patient_ID" id="patient_ID" value="<%=Patientid%>" />
	

		<tr><td class="NameTxt">&nbsp;Location</td><th>:</th><td><%=location%></td></tr>

		<tr><td class="NameTxt">&nbsp;Patient Name</td><th>:</th>
			<td>
				<%
					if(!reportUrl.equals("")){
				%>
					<a href="<%=reportUrl%>" target="_blank" onclick="generateCookie()"><%=firstname%>&nbsp;<%=lastname%></a>
				<%} else{
				%>
						<%=firstname%>&nbsp;<%=lastname%>
				<%}%>
			</td>
		</tr>


		<tr><td class="NameTxt">&nbsp;Gender</td><th>:</th><td><%if(gender.equalsIgnoreCase("M")){
																out.println("Male");
																}else{
																out.println("Female");
																}%></td></tr>

		<tr><td class="NameTxt">&nbsp;Age</td><th>:</th><td><%=age%></td></tr>

		<tr><td class="NameTxt">&nbsp;State of origin</td><th>:</th><td><%=state_org%></td></tr>

		<tr><td class="NameTxt">&nbsp;Surgeon</td><th>:</th><td><%=surgeon%></td></tr>

		<tr><td class="NameTxt">&nbsp;Cardiologist</td><th>:</th><td><%=Doc_Name%></td></tr>

		<!-- <tr><td class="NameTxt">&nbsp;Blood Group</td><th>:</th><td><%//=bloodGroup%></td></tr> -->

		<tr><td class="NameTxt">&nbsp;HyperTensive</td><th>:</th><td><%if(hyperTensive.equalsIgnoreCase("N")){
																		out.println("No");
																		}else{
																		out.println("Yes");	
																		}%></td></tr>

		<tr><td class="NameTxt">&nbsp;Diabetic</td><th>:</th><td><%if(diabetic.equalsIgnoreCase("N")){
																		out.println("No");
																		}else{
																		out.println("Yes");	
																		}%></td></tr>

		<tr><td class="NameTxt">&nbsp;Angina class</td><th>:</th>
		<td><%=anginaClass%></td></tr>

		<tr><td class="NameTxt">&nbsp;Previous M.I</td><th>:</th><td><%if(prev_MI.equalsIgnoreCase("Y")){
																		out.println("Yes");
																		}else{
																		out.println("No");	
																		}%></td></tr>
	
		<tr><td class="NameTxt">&nbsp;Total Cholestrol</td><th>:</th><td><%=T_cholestrol%></td></tr>

		<tr><td class="NameTxt">&nbsp;ECG</td><th>:</th><td><%=ecg%></td></tr>

		<tr><td class="NameTxt">&nbsp;Creatinine (mgs%)</td><th>:</th><td><%=creatinine%></td></tr>

		<tr><td class="NameTxt">&nbsp;Procedure Type</td><th>:</th>
			<td>
				 <%=prev_surgery%>
			</td>
		</tr>
		
		<%
			if((no_grafts==0 || no_grafts>0) && stent.equals("null")) {
		%>
		<tr><td class="NameTxt">&nbsp;No.of Grafts</td><th>:</th>
			<td><%=no_grafts%>
			</td>
		</tr>
		<%} else{
		%>
		<tr><td class="NameTxt">&nbsp;Stent Type</td><th>:</th>
			<td><%=stent%>
			</td>
		</tr>
		<%
		}
		}%>
	</table>
		<%
		}
		}catch(Exception e) { e.printStackTrace(); } 
		%>
		<input type="hidden" name="mode">
	</td>
			</tr>
		<%if(patientSrch.size()!=0){%>
			<tr><th background="images/tableBottom.jpg" height="40" Valign="top">
				<a href="#" onclick="pageSubmit('patientReports?mode=patientEdit_mode&Patientid=<%=Patientid%>')">
					<img src="images/edit.jpg" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
				<a href="#" onclick="pageSubmit('patientReports?mode=patientDel_mode&Patientid=<%=Patientid%>')"> 
					<img src="images/delete.jpg" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="pageSubmit('patientReports?mode=patientReport_mode')"><img src="images/cancel.jpg" width="85" height="30" border="0" alt=""></a>
			</th></tr>
			<%}else{%>
			<input type="hidden" name="Patient_id" value="<%=request.getParameter("Patientid")%>">
			<tr><td class="img" align="center" ><b>No Patient Records found or No access</b><br><br></td></tr>
			<tr>
				<th background="images/tableBottom.jpg" height="40" Valign="top">
					<a href="#" onclick="pageSubmit('new_patient.jsp')"><img src="images/add.jpg" width="85" height="30" border="0" alt=""></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="pageSubmit('patientReports?mode=patientReport_mode')"><img src="images/cancel.jpg" width="85" height="30" border="0" alt=""></a>
				</th>
			</tr>

			<%}%>
		
		</table><!-- End Data Table -->
</form>
<br>
<jsp:include page="include/footer.jsp"/>

<script language="JavaScript">
var c_name="patient_ID";

function pageSubmit(url){

var urlMatch = url.match("patientDel_mode");
if(urlMatch!="patientDel_mode")
{
	srchReport.action = url;
	srchReport.submit();
}else{
	var conf = confirm("Do you want to delete this PatientID");

	if(conf==true){
		srchReport.action = url;
		srchReport.submit();
	}
}
}
function generateCookie()
{
	var p_id=document.getElementById('patient_ID').value;
	//var path="C:\\inetpub\\wwwroot\\Apollo\\";
	var path=document.getElementById("path").value;
	path=path+","+p_id;
	createCookie(c_name,path,2);

}
function createCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

</script>
