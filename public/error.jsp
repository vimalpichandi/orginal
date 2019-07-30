<%
	String windowTitle = application.getInitParameter("title");
	String uname = (String)session.getAttribute("sess");
%>
<title>:: Error Page :: <%=windowTitle%> </title>
 <jsp:include page="include/header.jsp" /> 

				<img src="images/error.jpg" width="733" height="325" border="0" alt="">
					 
  <jsp:include page="include/footer.jsp" />  