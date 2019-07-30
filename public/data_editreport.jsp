<%@ include file="include/session_check.jsp"%>

<%@ page import="java.sql.*" session="true"%>
<%@ page import="java.util.*" errorPage="error.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="com.apollo.dao.*"%>
<%	
	String windowTitle = application.getInitParameter("title");

	String diagnosArray[] = {"Two vessel disease",
							 "Triple vessel disease",
	    					 "Rheumatic heart disease",
							 "Coronary artery disease",
							 "Valvular heart disease"
							};
	int Patientid = Integer.parseInt((String) request.getAttribute("Patientid"));
	ArrayList lookupList = null;

	String firstname = "", lastname = "", gender = "", age = "", reportUrl = "", bloodGroup = "", hyperTensive = "", diabetic = "", anginaClass = "", prev_MI = "", throm = "";
	String smoker = "", smokeyear = "" , no_of_cigars = "" ,obese = "";
	String T_cholestrol = "", ecg = "", surgeryType = "", GraftType = "";
	String admitdate = "", surgerydate = "", dischargeddate = "", cardioid = "", surgeryid = "" , proceduredate = "";
	String city = "", pincode = "", state = "", location = "", country = "";
	String lvfunction = "", nografts = "", surgProc = "",proc_type = "";
	String bloodgroup[] = {"- Nil -","AB+","AB-","A+","A-","B+","B-","O+","O-"};
	String durationArray[] = {"N","<5y",">5y"};
	String anginaArray[] = {"Stable","Class I","Class II","Class III","Class IV"};
	String cadArray[] = {"LMCA","Single Vessel Disease","Two Vessel Disease","Triple Vessel Disease","Four Vessel Disease","Diffuse Disease"};
	String ecgArray[] = {"ASMI","ALMI","AWMI","IPWMI","IWMI","LVH","RBBB","LBBB"};
	String lvfunctionArray[] = {"Normal function (> 60%)","Mild dysfunction (45-60%)","Moderate dysfunction (30-45%)","Severe dysfunction (< 30%)"};
	String prevSurgeryArray[] = {"CABG","Angioplasty","Others"};

	String graftArray[] = {"LIMA","RIMA","BIMA","LRA","SVG","Others"};
	String surgeryProcArray[] = {"No","MVR","AVR","DVR","OMV","Pacemaker","ASD","VSD","MVRepair","Aneurysmectomy","Carotid Endarterectomy","Others"};
	String deathCauseArray[] = {"Low Co","Renal Failure","Bleeding/Tamponade","Acute Stent thrombosis","Sepsis","Respiratory Failure","Neurological","Others"};

	String vesselArray[] = {"LAD","Diagonal","LCX","OM","RCA","PDA","RI","PLB"};
	String cadArr[] = {}, surgProcArr[] ={};



	String cad = "",prev_surgery = "";

	String cabg_completed="",IABP = "",revasc = "",peri_op = "",Mortality = "",Death_cause = "";
	String approach = "",LMCA = "",vessel = "",no_stents = "",stent_type = "";


	try {
		lookupList = (ArrayList)request.getAttribute("lookupList");
		ArrayList editList = (ArrayList) request.getAttribute("patientEdit");

		DataAccessDO dataaccessdo = (DataAccessDO) editList.get(0);
		location = dataaccessdo.getLocation();

		firstname = dataaccessdo.getFirstName();
		lastname = dataaccessdo.getLastName();
		age = "" + dataaccessdo.getAge();
		gender = dataaccessdo.getGender();
		admitdate = "" + dataaccessdo.getAdmitDate();
		dischargeddate = dataaccessdo.getDischargeDate();
		cardioid = "" + dataaccessdo.getCardioID();
		surgeryid = "" + dataaccessdo.getSurgeryID();
		reportUrl = dataaccessdo.getReportURL();
		city = dataaccessdo.getCity();
		pincode = "" + dataaccessdo.getPinCode();
		state = dataaccessdo.getState();
		country = dataaccessdo.getCountry();

		// Details Table Record's
		surgerydate = ""+dataaccessdo.getSurgeryDate();
		smoker = ""+dataaccessdo.getSmoker();
		hyperTensive = ""+dataaccessdo.getHyperTensive();
		diabetic = ""+dataaccessdo.getDiabetic();
		obese = ""+dataaccessdo.getObese();
		smokeyear = ""+ dataaccessdo.getSmokeYear();
		no_of_cigars = ""+dataaccessdo.getNoOfCigars();


		anginaClass = ""+dataaccessdo.getAngina();
		cad = ""+dataaccessdo.getCad();
		cadArr = cad.split(",");

	 
		prev_MI = ""+ dataaccessdo.getPrevMI();
		throm = dataaccessdo.getThrombolysis();
		
		// diags Table Record's
		ecg = "" + dataaccessdo.getECG();
		lvfunction = "" + dataaccessdo.getLVFunction();
		//bloodGroup = ""+dataaccessdo.getBloodGroup();

		// surgery Table Record's
		//proc_type = ""+dataaccessdo.getProctype();
		prev_surgery = dataaccessdo.getPrevSurgery();
		surgeryType = "" + dataaccessdo.getSurgeryType();
		
		cabg_completed = ""+dataaccessdo.getSurgeryCompl();
		nografts = "" + dataaccessdo.getNoGrafts();
		GraftType = "" + dataaccessdo.getGraftTypes();
	
		surgProc = "" + dataaccessdo.getSurgeryProcedures();
 			surgProcArr = surgProc.split(",");
 		
		IABP = dataaccessdo.getIABP();
		revasc = dataaccessdo.getRevasc();
		peri_op = dataaccessdo.getPeriOp();
		Mortality = dataaccessdo.getMortality();
		Death_cause = dataaccessdo.getDeathCause();
		
		proceduredate = ""+dataaccessdo.getProcedureDate();
		approach = dataaccessdo.getApproach();
		LMCA = dataaccessdo.getLMCA();
		vessel = dataaccessdo.getVessel();
		no_stents = ""+dataaccessdo.getNoOfStents();
		stent_type = dataaccessdo.getStentType();
		
		if(surgerydate.equals("null"))
			surgerydate = proceduredate;


	} catch (Exception e) {
		//e.printStackTrace();
	}

%>
<title>:: Patient Edit Details :: <%=windowTitle%></title>
<jsp:include page="include/mgmt_header.jsp"/>

<br>
<br>
<form name="patientReports" method="post" action="patientReports" onsubmit="return editValidate()">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<th background="images/tableTop.jpg" height=23>Edit Patient Details</th>
	</tr>
	<tr>
		<td class="img">
		<table border="0" width="490" valign="top" cellspacing="3"
			cellpadding="3">
			<tr>
				<td class="NameTxt">&nbsp;Patient ID</td>
				<th>:</th>
				<td><%=Patientid%></td>
				<input type="hidden" name="Patientid" value="<%=Patientid%>">
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Location</td>
				<th>:</th>
				<td><%=location%></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Patient Name</td>
				<th>:</th>
				<td><%=firstname + "  " + lastname%></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Age</td>
				<th>:</th>
				<td><%=age%></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Gender</td>
				<th>:</th>
				<td><%if(gender.equalsIgnoreCase("M")){
						out.println("Male");
						}else{
						out.println("Female");	
						}%></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Date of Admission</td>
				<th>:</th>
				<td><%=admitdate.substring(0,10)%>&nbsp;(yyyy/mm/dd)</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Date of Surgery / Cathetor</td>
				<th>:</th>
				<td><%=surgerydate.substring(0,10)%>&nbsp;(yyyy/mm/dd)</td>
			</tr>			
			<tr>
				<td class="NameTxt">&nbsp;Cardiologist</td>
				<th>:</th>
				<%
					try {
						ArrayList docList = (ArrayList) request
								.getAttribute("doctorCardioList");
						Iterator itr = docList.iterator();
				%>
				<td><select name="Cardio" disabled>
					<%
						while (itr.hasNext()) {
								String optionValue[] = itr.next().toString().split(":");
					%><option value="<%=optionValue[0]%>"
						<%if(cardioid.equals(optionValue[0])){%> selected <%}%>><%=optionValue[1]%></option>
					<%
						}
						} catch (Exception e) {
							//e.printStackTrace();
						}
					%>
				</select></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Cardiac Surgeon</td>
				<th>:</th>
				<%
					try {
						ArrayList docList = (ArrayList) request
								.getAttribute("doctorCardioList");
						Iterator itr = docList.iterator();
				%>
				<td><select name="Cardio" disabled>
					<%
						while (itr.hasNext()) {
								String optionValue[] = itr.next().toString().split(":");
					%><option value="<%=optionValue[0]%>"
						<%if(surgeryid.equals(optionValue[0])){%> selected <%}%>><%=optionValue[1]%></option>
					<%
						}
						} catch (Exception e) {
							//e.printStackTrace();
						}
					%>
				</select>
				
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Report URL</td>
				<th>:</th>
				<td><%=reportUrl%></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;City</td>
				<th>:</th>
				<td><%=city%></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Pincode</td>
				<th>:</th>
				<td><%=pincode%></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;State</td>
				<th>:</th>
				<td><%=state%></td>
			</tr>
			
			<tr>
				<td class="NameTxt">&nbsp;Country</td>
				<th>:</th>
				<td><%=country%></td>
			</tr>
			<tr>
				<td colspan="3">
				<hr color="white" width="95%">
				</td>
			</tr>

			<!-- 			Data Details          -->

			<tr>
				<td class="NameTxt">&nbsp;Smoker</td>
				<th>:</th>
				<td><select name="R_Smoker" onchange="enableSmokeYrs(this.value)">
					<option value="select">- Nil -</option>
					<option <%if(smoker.equals("Y")) {%> selected <%}%> value="Y">Smoker</option>
					<option <%if(smoker.equals("E")) {%> selected <%}%> value="E">EX-Smoker</option>
					<option <%if(smoker.equals("N")) {%> selected <%}%> value="N">No</option>
				</select></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Smoked Year(s)</td>
				<th>:</th>
				<td><input type="text" name="sel_Smoke_Yrs" id="sel_Smoke_Yrs" value="<%=smokeyear%>" size="5" <%if(smoker.equals("N")){%>disabled<%}%>>
					<input type="text" name="sel_No_of_cigars" id="sel_No_of_cigars" value="<%=no_of_cigars%>" size="5" <%if(smoker.equals("N")){%>disabled<%}%>>
					<input type="hidden" name="Smoke_Yrs" value="-1">
					<input type="hidden" name="No_of_cigars" value="-1">
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;HyperTensive</td>
				<th>:</th>
				<td><select name="R_HY_Tensive">
					<option value="NA">NA</option>
					<%for(int h=0;h<durationArray.length;h++){
							
						if(hyperTensive.equals(durationArray[h])){
						%>
						<option value="<%=durationArray[h]%>" selected><%=durationArray[h]%></option>
						<%}else{%>
						<option value="<%=durationArray[h]%>"><%=durationArray[h]%></option>
					<%}
				}%>
				</select></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Diabetic</td>
				<th>:</th>
				<td><select name="R_Diabetic">
					<option value="NA">NA</option>
					<%for(int h=0;h<durationArray.length;h++){
							
						if(diabetic.equals(durationArray[h])){
						%>
						<option value="<%=durationArray[h]%>" selected><%=durationArray[h]%></option>
						<%}else{%>
						<option value="<%=durationArray[h]%>"><%=durationArray[h]%></option>
					<%}
					}%>
				</select></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Obese</td>
				<th>:</th>
				<td><select name="R_Obese">
					<option value="select">- Nil -</option>
					<option <%if(obese.equals("Y")) {%> selected <%}%> value="Y">Yes</option>
					<option <%if(obese.equals("N")) {%> selected <%}%> value="N">No</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="3">
				<hr color="white" width="95%">
				</td>
			</tr>
			
			<tr>
				<td class="NameTxt">&nbsp;Angina Class</td>
				<th>:</th>
				<td> 
					<select name="Angina_Cls"> 
						
						<%	
							for(int aa=0;aa<anginaArray.length;aa++){

							if(anginaClass.equals(anginaArray[aa])){
						%>
							<option value="<%=anginaArray[aa]%>" selected><%=anginaArray[aa]%></option>
						<%	
							}
							else{
						%>
							<option value="<%=anginaArray[aa]%>"><%=anginaArray[aa]%></option>
						<%
							}
						}%>
					</select>
				</td>
			</tr>

			<tr>
				<td class="NameTxt">&nbsp;CAD</td>
				<th>:</th>
				<td> 
					<select name="cad" multiple>
						<%
						boolean chk=false;
						for(int aa=0;aa<cadArray.length;aa++){
							chk = false;

							for(int ab=0;ab < cadArr.length; ab++) {
							
								if(chk == false) {

									if(cadArr[ab].equals(cadArray[aa])) {
										chk = true;
							%>
									<option value="<%=cadArray[aa]%>" selected><%=cadArray[aa]%></option>
							<%	
									} else {
										chk = true;
							%>
									<option value="<%=cadArray[aa]%>"><%=cadArray[aa]%></option>
							<%
									}
								}
							}
						}%>
					</select>
					
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Previous M.I</td>
				<th>:</th>
				<td><select name="PreviousMI">
					<option value="select">- Nil -</option>
					<option <%if(prev_MI.equals("Y")) {%> selected <%}%> value="Y">Yes</option>
					<option <%if(prev_MI.equals("N")) {%> selected <%}%> value="N">No</option>
				</select></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Thrombolysis</td>
				<th>:</th>
				<td><select name="thrombolysis">
					<option value="select">- Nil -</option>
					<option <%if(throm.equals("Y")) {%> selected <%}%> value="Y">Yes</option>
					<option <%if(throm.equals("N")) {%> selected <%}%> value="N">No</option>
				</select></td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;LV function</td>
				<th>:</th>
				<td>
					<select name="lvfunction">
						<%for(int aa=0;aa<lvfunctionArray.length;aa++){

							if(lvfunction.equals(lvfunctionArray[aa])){
						%>
							<option value="<%=lvfunctionArray[aa]%>" selected><%=lvfunctionArray[aa]%></option>
						<%	
							}
							else{
						%>
							<option value="<%=lvfunctionArray[aa]%>"><%=lvfunctionArray[aa]%></option>
						<%
							}
						}%>
						</select>
				</td>
			</tr>
			

<!-- 			Data Diagnosis			 -->

			<tr>
				<td colspan="3">
				<hr color="white" width="95%">
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;ECG</td>
				<th>:</th>
				<td>
					<select name="ecg">
						<%for(int aa=0;aa<ecgArray.length;aa++){

							if(ecg.equals(ecgArray[aa])){
						%>
							<option value="<%=ecgArray[aa]%>" selected><%=ecgArray[aa]%></option>
						<%	
							}
							else{
						%>
							<option value="<%=ecgArray[aa]%>"><%=ecgArray[aa]%></option>
						<%
							}
						}%>
					</select>
				</td>
			</tr>
			
			<%
				try{
				if(cabg_completed.equals("Y")){%>
			<tr>
				<td class="NameTxt">&nbsp;Previous Surgery</td>
				<th>:</th>
				<td>
					<select name="prevSurgery">
						<%for(int aa=0;aa<prevSurgeryArray.length;aa++){

							if(prev_surgery.equals(prevSurgeryArray[aa])){
						%>
							<option value="<%=prevSurgeryArray[aa]%>" selected><%=prevSurgeryArray[aa]%></option>
						<%	
							}
							else{
						%>
							<option value="<%=prevSurgeryArray[aa]%>"><%=prevSurgeryArray[aa]%></option>
						<%
							}
						}%>
					</select>
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Surgery Type</td>
				<th>:</th>
				<td>
					<select name="surgeryType">
						<option value="On Pump" <%if(surgeryType.equals("On Pump")){%> selected <%}%>>On Pump</option>
						<option value="Off Pump" <%if(surgeryType.equals("Off Pump")){%> selected <%}%>>Off Pump</option>				
					</select>

				</td>
			</tr>
		
			<tr>
				<td colspan="3">
				<hr color="white" width="95%">
				</td>
			</tr>

			<tr>
				<td class="NameTxt">&nbsp;No of Grafts</td>
				<th>:</th>
				<td>
					<select name="TxtNo_Grafts">
					<%if(nografts.equals("0")){%>
					<option value="0">-Nil-</option>
					<%}%>
					<%for(int h=1;h<=6;h++){
						if(nografts.equals(""+h)){
						%>
						<option value="<%=h%>" selected><%=nografts%></option>
						<%}else{%>
						<option value="<%=h%>"><%=h%></option>
					<%}}%>
					</select>
				</td>
			</tr>
			<!-- <tr>
				<td class="NameTxt">&nbsp;Graft Type:</td>
				<th>:</th>
				<td>
					<select name="graft_type">
						<%for(int aa=0;aa<graftArray.length;aa++){

							if(GraftType.equals(graftArray[aa])){
						%>
							<option value="<%=graftArray[aa]%>" selected><%=graftArray[aa]%></option>
						<%	
							}
							else{
						%>
							<option value="<%=graftArray[aa]%>"><%=graftArray[aa]%></option>
						<%
							}
						}%>
					</select>
				</td>
			</tr> -->
			<tr>
				<td class="NameTxt">&nbsp;Surgery Procedure</td>
				<th>:</th>
				<td>
					<select name="surgery_proc" multiple>
						<%
						boolean sur=false;
							for(int aa=0;aa<surgeryProcArray.length;aa++){
						
							sur = false;

							for(int ab=0;ab < cadArr.length; ab++) {
							
								if(sur == false) {

							if(surgProcArr[ab].equals(surgeryProcArray[aa])){
								sur = true;
						%>
							<option value="<%=surgeryProcArray[aa]%>" selected><%=surgeryProcArray[aa]%></option>
						<%	
							} else{
							sur = true;
						%>
							<option value="<%=surgeryProcArray[aa]%>"><%=surgeryProcArray[aa]%></option>
						<%
							}
								}
							}
						}%>
					</select>

				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;IABP</td>
				<th>:</th>
				<td>
					<select name="IABP">
						<option value="select">- Nil -</option>
						<option <%if(IABP.equals("Y")) {%> selected <%}%> value="Y">Yes</option>
						<option <%if(IABP.equals("N")) {%> selected <%}%> value="N">No</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Revascularisation</td>
				<th>:</th>
				<td>
					<select name="revasc">
						<option value="Total" <%if(revasc.equals("Total")){%> selected <%}%>>Total</option>
						<option value="Optimal" <%if(revasc.equals("Optimal")){%> selected <%}%>>Optimal</option>
						<option value="Sub-Optiomal" <%if(revasc.equals("Sub-Optiomal")){%> selected <%}%>>Sub-Optiomal</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Peri-Op</td>
				<th>:</th>
				<td>
					<select name="peri_op">
						<option value="select">- Nil -</option>
						<option <%if(peri_op.equals("Y")) {%> selected <%}%> value="Y">Yes</option>
						<option <%if(peri_op.equals("N")) {%> selected <%}%> value="N">No</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Mortality</td>
				<th>:</th>
				<td>
					<select name="mortality" onchange="disableDeathCause(this.value)">
						<option value="select">- Nil -</option>
						<option <%if(Mortality.equals("Y")) {%> selected <%}%> value="Y">Yes</option>
						<option <%if(Mortality.equals("N")) {%> selected <%}%> value="N">No</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="NameTxt">&nbsp;Cause of Death</td>
				<th>:</th>
				<td>
					<select name="sel_deathcause" <%if(Mortality.equals("N")) {%> disabled <%}%>>
						<%for(int aa=0;aa<deathCauseArray.length;aa++){

							if(Death_cause.equals(deathCauseArray[aa])){
						%>
							<option value="<%=deathCauseArray[aa]%>" selected><%=deathCauseArray[aa]%></option>
						<%	
							}
							else{
						%>
							<option value="<%=deathCauseArray[aa]%>"><%=deathCauseArray[aa]%></option>
						<%
							}
						}%>
					</select>
				<input type="hidden" name="deathcause" value="Nil">
				</td>
			</tr>
			<!-- for surgery type (CABG / Angio) -->
			<input type="hidden" name="type" value="CABG">
			<%}
				
			if(cabg_completed.equals("null")){%>
				<tr>
					<td class="NameTxt">&nbsp;Approach</td>
					<th>:</th>
					<td>
						<select name="sel_approach">
							<option value="Radial" <%if(approach.equals("Radial")){%>selected<%}%>>Radial</option>
							<option value="Femoral" <%if(approach.equals("Femoral")){%>selected<%}%>>Femoral</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="NameTxt">&nbsp;LMCA</td>
					<th>:</th>
					<td>
						<select name="sel_LMCA">
							<option value="Normal" <%if(LMCA.equals("Normal")){%>selected<%}%>>Normal</option>
							<option value="Short" <%if(LMCA.equals("Short")){%>selected<%}%>>Short</option>
							<option value="Long" <%if(LMCA.equals("Long")){%>selected<%}%>>Long</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="NameTxt">&nbsp;Vessel tackled</td>
					<th>:</th>
					<td>
						<select name="sel_vessel">
							<%for(int t=0;t<vesselArray.length;t++){
								if(vesselArray[t].equals(vessel)){
							%>
								<option value="<%=vesselArray[t]%>" selected><%=vesselArray[t]%></option>
							<%
								}else{
							%>
								<option value="<%=vesselArray[t]%>"><%=vesselArray[t]%></option>
							<%}
							}%>
						</select>
					</td>
				</tr>
				<tr>
					<td class="NameTxt">&nbsp;Number of Stents</td>
					<th>:</th>
					<td>
						<input type="text" name="no_of_stents" size="2" maxlength="2" onkeyup="Numeric(this)" value="<%=no_stents%>"> 
					</td>
				</tr>
				<tr>
					<td class="NameTxt">&nbsp;Type of Stent</td>
					<th>:</th>
					<td>
						<select name="stentType">
							<option value="DES" <%if(stent_type.equals("DES")){%>selected<%}%>>DES</option>
							<option value="BMS" <%if(stent_type.equals("BMS")){%>selected<%}%>>BMS</option>
							<option value="POBA" <%if(stent_type.equals("POBA")){%>selected<%}%>>POBA</option>
						</select>
					</td>
				</tr>
				<!-- for surgery type (CABG / Angio) -->
			<input type="hidden" name="type" value="angio">

			<%}
			}catch(Exception e){e.printStackTrace();}
			%>

		</table>
	</tr>
	<tr>
		<th background="images/tableBottom.jpg" height="40" Valign="top">
		<input type="image" name="imageName" src="images/update.jpg">&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="patientReports?mode=patientSrch_mode&Patientid=<%=Patientid%>"><img src="images/cancel.jpg" width="85" height="30" border="0" alt=""></a>
		</th>
	</tr>
</table>
	<input type="hidden" name="mode" value="patientUpdate_mode">
</form>
<!-- End Data Table -->
<jsp:include page="include/footer.jsp" />

<script language="JavaScript">

function editValidate(){
	document.patientReports.Smoke_Yrs.value = document.patientReports.sel_Smoke_Yrs.value;
	document.patientReports.No_of_cigars.value = document.patientReports.sel_No_of_cigars.value;
	
	if(document.patientReports.mortality.value=="Y")
	document.patientReports.deathcause.value = document.patientReports.sel_deathcause[document.patientReports.sel_deathcause.selectedIndex].value;

}
function enableSmokeYrs(optValue){

	if(optValue=="E" || optValue=="Y"){
		document.patientReports.sel_Smoke_Yrs.value = "";
		document.patientReports.sel_No_of_cigars.value = "";
		document.patientReports.sel_Smoke_Yrs.disabled = false;
		document.patientReports.sel_No_of_cigars.disabled = false;
		document.patientReports.sel_Smoke_Yrs.focus();
	}else{
		document.patientReports.Smoke_Yrs.value = -1;
		document.patientReports.sel_Smoke_Yrs.value = -1;
		document.patientReports.sel_No_of_cigars.value = -1;
		document.patientReports.sel_Smoke_Yrs.disabled = true;
		document.patientReports.sel_No_of_cigars.disabled = true;
	}
}

function disableDeathCause(cause){
	
	if(cause=="Y"){
		document.patientReports.sel_deathcause.disabled = false;
	}
	if(cause=="N"){
		document.patientReports.sel_deathcause.disabled = true;
		document.patientReports.deathcause.value = "Nil";
	}

}

</script>
<script type="text/javascript" src="include/validate.js"></script> 