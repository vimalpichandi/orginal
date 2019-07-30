<%@ page import="java.sql.*" session="true"%>
<%@ page import="java.util.*,java.util.Date" errorPage="error.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%	
	String windowTitle = application.getInitParameter("title");

	String sess = (String) session.getAttribute("sess");

	String cardio_id = (String)request.getAttribute("doc_id");

	Date dat = new Date();
	int year = 2015;//dat.getYear() + 1900;

	String errorMsg = "";
	String patient_ID = (String)session.getAttribute("PatientId");
	String location = (String)request.getAttribute("location");
	String month[] = {"select","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};

	String country[] = {"INDIA","BANGLADESH","SRILANKA","INDONESIA","MALAYSIA","PAKISTAN","IRAN","IRAQ","CHINA","USA","BHUTAN","NEPAL","BURMA","SINGAPORE","Others"};
	String state[] = {"Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chhattisgarh","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir","Jharkhand","Karnataka","Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Orissa","Punjab","Pondicherry","Rajasthan","Sikkim","Tamil Nadu","Tripura","Uttar Pradesh","Uttarakhand","West Bengal","Others"};
%>
<title>:: Patient Master :: <%=windowTitle%></title>
<jsp:include page="include/header.jsp"/>

<form method='post' name="frmMaster" onsubmit="return validateMaster();" action="patientDetails" >

		
		<table border="0" cellspacing="0" cellpadding="0">
			<tr><th background="images/tableTop.jpg" height=23> Patient Master </th></tr>
			<tr>
				<td class="img">
				<table width="490" border="0" cellspacing="3" cellpadding="3" ><!--Data Table -->
					<tr><td class="NameTxt">&nbsp;Patient ID</td><th>:</th>
						<td><%=patient_ID%><input type="hidden" name="TxtPat_id" value="<%=patient_ID%>"></td></tr>
						
					<tr><td class="NameTxt">&nbsp;Location</td><th>:</th>
						<td><%=location%><input type="hidden" name="Txtlocation" value="<%=location%>"></td></tr>
		
					<tr><td class="NameTxt">&nbsp;First Name</td><th>:</th>
						<td><input type="text" name="TxtPFName" id="TxtPFName" size="30" maxlength="20"></td></tr>
		
					<tr><td class="NameTxt">&nbsp;Last Name</td><th>:</th>
						<td><input type="text" name="TxtPLName" id="TxtPLName" size="30" maxlength="10"></td></tr>
		
					<tr><td class="NameTxt">&nbsp;Age</td><th>:</th>
						<td><input type="text" name="TxtAge" id="TxtAge" size="3" Maxlength="2" onkeyup="Numeric(this)"/></td></tr>
		
					<tr><td class="NameTxt">&nbsp;Gender</td><th>:</th>
						<td><input type="radio" name="Gender" id="Male" value="M" checked>&nbsp;Male
							<input type="radio" name="Gender" id="Female" value="F">&nbsp;Female</td></tr>
					<tr><td class="NameTxt">&nbsp;State of Origin</td><th>:</th>
						<td>
							<select name="TxtStateorg" id="TxtStateorg">
								<option value="select" selected>---State---</option>
								<%	
								for(int s=0;s<state.length;s++){
									%>
										
									<option value="<%=state[s]%>"><%=state[s]%></option>
									
									<%
								}
								%>
							</select>
						</td>
					</tr>

					<tr><td class="NameTxt">&nbsp;Date Of Admission</td><th>:</th>
						<td><select name="Adm_Date"> 
								<option selected value="select">-Date-</option>
								<%
									for (int i = 1; i <= 31; i++) {
								%><option value="<%=i%>"><%=i%></option><%
									}
								%>
							</select>&nbsp;
							<select name="Adm_Month"> 
								<option selected value="select">-Month-</option>
								<%
									for (int i = 1; i < month.length; i++) {
								%><option value="<%=i%>"><%=month[i]%></option><%
									}
								%>
							</select>&nbsp;
							<select name="Adm_Year"> 
								<option selected value="select">-Year-</option>
								<%
									for (int i = 2000; i <= year; i++) {
								%><option value="<%=i%>"><%=i%></option><%
									}
								%>
							</select>&nbsp;
						</td></tr>

					

					<tr><td class="NameTxt">&nbsp;Date of Discharge</td><th>:</th>
						<td><select name="Dchge_Date"> 
								<option selected value="select">-Date-</option>
								<%
									for (int i = 1; i <= 31; i++) {
								%><option value="<%=i%>"><%=i%></option><%
									}
								%>
							</select>&nbsp;
							<select name="Dchge_Month"> 
								<option selected value="select">-Month-</option>
								<%
									for (int i = 1; i < month.length; i++) {
								%><option value="<%=i%>"><%=month[i]%></option><%
									}
								%>
							</select>&nbsp;
							<select name="Dchge_Year"> 
								<option selected value="select">-Year-</option>
								<%
									for (int i = 2000; i <= year; i++) {
								%><option value="<%=i%>"><%=i%></option><%
									}
								%>
							</select>&nbsp;</td></tr>

					<tr><td class="NameTxt">&nbsp;Cardiologist</td><th>:</th>
						<%
							try {
								ArrayList docList = (ArrayList) request
										.getAttribute("doctorCardioList");
								Iterator itr = docList.iterator();
								String cardioId = "";

						%>
						<td>
							<select name="Cardio" <%if(!sess.equals("admin")){%> disabled <%}%> >
								<option value="select">-------Cardiologist-------</option>
							<%
								while (itr.hasNext()) {
										String optionValue[] = itr.next().toString().split(":");
								if(cardio_id.equals(optionValue[0])){
									cardioId = cardio_id;
								%><option value="<%=optionValue[0]%>" selected><%=optionValue[1]%></option>
								<%
								}else{
							%><option value="<%=optionValue[0]%>"><%=optionValue[1]%></option>
							<%
								}
								}

								if(!sess.equals("admin")){%>
									<input type="hidden" name="Cardio" value="<%=cardioId%>">
								<%}
								} catch (Exception e) {
									//e.printStackTrace();
								}
							%>
							</select>
							</td>
						</tr>
					<tr><td class="NameTxt">&nbsp;Surgeon</td><th>:</th>
						<%
							try {
								ArrayList docList = (ArrayList) request	.getAttribute("doctorSurgeonList");
								Iterator itr = docList.iterator();
						%>
						<td><select name="Surgeon"> 
							<option selected value="select">---------Surgeon---------</option>
							<%
								while (itr.hasNext()) {
										String optionValue[] = itr.next().toString().split(":");
							%><option value="<%=optionValue[0]%>"><%=optionValue[1]%></option>
							<%
								}
								} catch (Exception e) {
									e.printStackTrace();
								}
							%>
						</select></td></tr>
					<tr><td class="NameTxt">&nbsp;Report Link</td><th>:</th>
						<td><input type="text" id="TxtR_URL_hidden" size="38" value="cardiology/<%=patient_ID%>/menu.html" disabled/>
						<input type="checkbox" name="CBoxR_URL" id="CBoxR_URL" value="unchecked" onclick="disableURLLink('cardiology/<%=patient_ID%>/menu.html')">
						<input type="hidden" id="TxtR_URL" name="TxtR_URL" value="cardiology/<%=patient_ID%>/menu.html">
						</td></tr>
					<tr><td class="NameTxt">&nbsp;Country</td><th>:</th>
						<td>
							<select name="TxtCountry" id="TxtCountry">
									<option value="select" selected>---Country---</option>
								<%for(int i=0;i<country.length;i++){%>
									<option value="<%=country[i]%>"><%=country[i]%></option>
								<%}%>
							</select>
						</td>
					</tr>
					<tr><td class="NameTxt">&nbsp;State</td><th>:</th>
						<td>
							<select name="TxtState" id="TxtState">
							<option value="select">---State---</option>
							<%	
							for(int s=0;s<state.length;s++){
								%>
									
								<option value="<%=state[s]%>"><%=state[s]%></option>
								
								<%
							}
							%>
							</select>
							<!-- <input type="text" name="TxtState" id="TxtState" onblur="caps(this)" size="38"> -->
						</td>
					</tr>
					<tr><td class="NameTxt">&nbsp;City</td><th>:</th>
						<td><input type="text" name="TxtCity" id="TxtCity" onblur="caps(this)" size="38"></td></tr>
					<tr><td class="NameTxt">&nbsp;Pin code</td><th>:</th>
						<td><input type="text" name="TxtPCode" id="TxtPCode" size="38" onkeyup="Numeric(this)" maxlength="8"></td></tr>
					</table></td>
					
</tr>
<tr><th background="images/tableBottom.jpg" height=40 Valign="top">
<input type="hidden" name="mode" value="masterDetail_mode"> <input type="image" name="imageName" src="images/next.jpg"></th></tr>
</table><!-- End Data Table -->
<br>


<jsp:include page="include/footer.jsp"/>

<script language="JavaScript">
function onload() {
	
	document.getElementById("TxtPFName").focus();
	
}	
 
</script>
<script type="text/javascript" src="include/validate.js"></script>