	<%
			String[] tab_names  =   new String[]{"CABG","DIAGNOSIS","DIABETOLOGY"};
			String[] tab_urls = new String[]{"custom_cabg.jsp?selectedId=0","custom_diags.jsp?selectedId=1","custom_diabetic.jsp?selectedId=2"};

			String[] tabs_class = new String[]{"","",""};
			String selectedId = request.getParameter("selectedId");
					int selId = 0;
						if(selectedId != null && selectedId.length() > 0){
								selId = Integer.parseInt(selectedId);
						}
						if(selId >= tabs_class.length){
							    selId = 0;
						}
						tabs_class[selId] = "selected";

			String one_tab_name = "";
		%>
			<ul id="maintab" class="basictab">
	    <%
		    for(int i=0;i<tab_names.length;i++){
	    %>
		    <li class="<%=tabs_class[i]%>">
			<%if(i!=selId){%>
            <a href="<%=tab_urls[i]%>"> <%=tab_names[i]%> </a>
			<%}else{%>
			<a href="#" onclick="return false;"> <%=tab_names[i]%> </a>
			<%}%>
            <%=one_tab_name%>
			</li>
    <%}%>    <font size="" color=""></font>
		</ul>