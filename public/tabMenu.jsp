	<%
			String[] tab_names  =   new String[]{"DIABETOLOGY","DIAGNOSIS","CABG","ANGIO"};
			String[] tab_urls = new //String[]{"reports?mode=blood_type&selectedId=0","reports?mode=diabetic&selectedId=1","reports?mode=diagnosis&selectedId=2","reports?mode=surgery&selectedId=3","#"};
			String[]{"reports?mode=diabetic&selectedId=0","reports?mode=diagnosis&selectedId=1","reports?mode=surgery&selectedId=2","reports?mode=angio&selectedId=3"};

			String[] tabs_class = new String[]{"","","","",""};
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
            <a href="<%=tab_urls[i]%>"><%=tab_names[i]%> </a>
			<%}else{%>
			<a href="#"> <%=tab_names[i]%> </a>
			<%}%>
            <%=one_tab_name%>
			</li>
    <%}%>    <font size="" color=""></font>
		</ul>