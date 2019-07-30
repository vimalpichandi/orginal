<%@ page import="java.sql.*" session="true"%>
<%@ page import="java.util.*" errorPage="error.jsp"%>
<%@ page import="java.io.*" %>
<%
	
	String windowTitle = application.getInitParameter("title");

	String sess = (String)session.getAttribute("sess");

	if(!sess.equals("admin")){
		response.sendRedirect("user_menu.jsp");
	}

	String usrStatusResult = (String)request.getAttribute("usrStatusResult");
	String mode =(String)request.getAttribute("mode");

	if(mode==null)
		mode="";
%> 
<title>:: Delete Doctor :: <%=windowTitle%> </title>

<jsp:include page="include/header.jsp"/>
<form name="frmDelete" method="post" action="login" onsubmit="return confirmBox()"> 

	<table width="400" border="0" cellspacing="0" cellpadding="2">
		<% if (usrStatusResult != null && usrStatusResult.startsWith("Msg")) {%>
		<tr>														
			<td align="center"><font size="2" color="GREEN">
			<%= usrStatusResult.substring(usrStatusResult.indexOf(":")+1) %>
			</td></tr>
			<% } else if (usrStatusResult != null && usrStatusResult.startsWith("Error")) {%>
		<tr>
			<td align="center"><font size="2" color="RED">
			<%= usrStatusResult.substring(usrStatusResult.indexOf(":")+1) %>
			</td></tr>
			<% } %>
	</table><br><input type="hidden" name="mde" value='<%=mode%>'>

	<table border="0" width="424" cellspacing="0" cellpadding="0">
		<%
			try {
				if(mode.equals("deleteUser_mode")) { %>

				<%  ArrayList ts = (ArrayList)request.getAttribute("selectUserList");
					Iterator itr = ts.iterator();
				%>
				<tr><td colspan="2" background="images/U_top.jpg" height="22" class="NameTxt" >&nbsp;Delete User</td></tr>
				<tr><td colspan="2" class="userimg" height="22">&nbsp;</td></tr>
				<tr><th class="userimg" align="center">
							
					<table><tr>
					<td class="NameTxt">Select User :</td>
					<td><select name="userName">
						<option selected value="select">---User Name---</option>
						<%
							while(itr.hasNext())
							{
							String optionValue = itr.next().toString();
							if(!optionValue.equals("admin")){
						%>
						<option value="<%=optionValue%>"><%=optionValue%></option>
						<%}
						  }	%>
						</select>
						</td></tr></table>
						
						</th></tr>
		<%  } else if(mode.equals("doctorDelete_mode")) { %>
		
				<%  ArrayList ts = (ArrayList)request.getAttribute("selectDoctorList");
					Iterator itr = null;
				%>
				<tr><td colspan="2" background="images/U_top.jpg" height="22" class="NameTxt" >&nbsp;Delete Cardiologist</td></tr>
					<tr><td colspan="2" class="userimg" height="22">&nbsp;</td></tr>
				<tr><th class="userimg" align="center">
				
					<table>
						<tr>
							<td class="NameTxt">Delete from :</td>
							<td><select name="cardioName" title="Delete cardiologist you wish to">
								<option selected value="select">------Doctor Name------</option>
								<%
									itr = ts.iterator();

									while(itr.hasNext())
									{
									String optionValue[] = itr.next().toString().split(":");
									if(!optionValue.equals("admin")){
									%><option value="<%=optionValue[0]%>"><%=optionValue[1]%></option>
									<%}
									}
									%>
								</select>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="NameTxt">Migrate to :</td>
							<td><select name="migrateName" title="Migrate the deleted cardiologist details you wish to">
								<option selected value="select">------Doctor Name------</option>
								<%	
									itr = ts.iterator();

									while(itr.hasNext())
									{
									String optionValue[] = itr.next().toString().split(":");
									if(!optionValue.equals("admin")){
									%><option value="<%=optionValue[0]%>"><%=optionValue[1]%></option>
									<%}
									}
									%>
								</select>
							</td>
						</tr>

					</table>
						
						</th></tr>
		<% }
		} catch(Exception e) {} %>
	<tr><td colspan="2" class="userimg" height="22">&nbsp;</td></tr>
	<tr><th colspan="2"  background="images/U_bottom.jpg" height="40" Valign="top">
		<input type="hidden" name="mode" value="<%=mode%>">
		
		<input type="image" name="imageName" src="images/delete.jpg"> 
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="menu.jsp"><img src="images/cancel.jpg" width="85" height="30" border="0" alt=""></a>
			</th></tr></table>	

<jsp:include page="include/footer.jsp"/>

 <script language="javascript">

function confirmBox(){	
	
	var cardio = document.frmDelete.cardioName.value;
	var surgeon = document.frmDelete.migrateName.value;

	if(surgeon==cardio){
		alert("Both Doctor name can't be same!!!");
		return false;
	}
	
	var mde = document.frmDelete.mde.value;
	var option = ""; 
	var msg="";
	if(mde=='deleteUser_mode') {
		option = document.frmDelete.userName.value;
		msg="Select a User Name !!!";
	}else {
		option = document.frmDelete.doctorName.value;
		msg="Select a Doctor Name !!!";
	}

	if(option!="select"){
		var ans = confirm("Are you sure to Delete !!!");
		if(ans==true){
			return true;
		}else{
			return false;
		}
	}
	if(option=="select"){
		alert(msg);
		return false;
	}
}
</script>