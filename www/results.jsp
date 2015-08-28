<%@ page import="org.is.aissearch.*" %>


<% 
	//Fetch results using "keys", "from" and "num" parameters (only 1st is required)
	//if keys is not passed - it is the first hit of this page - display nothing
	
	Result result = null;
	
	String keys=request.getParameter(Constants.CGI_PARAM_KEYS);
	if(keys!=null)
		keys=keys.trim();
	pageContext.setAttribute("keys", keys);
	
	int from;
	String fromString=request.getParameter(Constants.CGI_PARAM_FROM);
	if(fromString!=null && !fromString.equals("")){
		try{
			from=Integer.parseInt(fromString);
		}
		catch(NumberFormatException nfe){
			from=0;
		}
	}
	else{
		from=0;
	}
	
	int num;
	String numString=request.getParameter(Constants.CGI_PARAM_NUM);
	if(numString!=null && !numString.equals("")){
		try{
			num=Integer.parseInt(numString);
		}
		catch(NumberFormatException nfe){
			num=Constants.NUM_RECORDS_TO_SHOW;
		}
	}
	else{
		num=Constants.NUM_RECORDS_TO_SHOW;
	}		

	if(keys!=null && !keys.equals("")){
		try{
			long t0 = System.currentTimeMillis();

			//Fetch results from database or from Lucene index here:
			//result = IndexLocal.getInstance(MainServlet.getIndexPath(request, response)).get(keys, from, num);
			result = Util.get(keys, from, num);
			
			long total = System.currentTimeMillis()-t0;
			pageContext.setAttribute("ms", Long.toString(total));
		}
		catch(Exception e){
			//report into the appropriate for your project log system
			//log.error("", e); 
		}

		pageContext.setAttribute("result", result);
	}
%>

<c:if test="${fn:length(result.list)==0 && result!=null}">
	No records found.
</c:if>


<c:if test="${fn:length(result.list)>0}">


	<%@ include file="bar.jsp" %>

	<!-- <H1>Health Research Expertise Database</H1> -->
	
	<div style="text-align:left;">
	
	<table cellspacing="10" cellpadding="0" border="0" width="640">
	

    <c:forEach items="${result.list}" var="record">
    	
		<c:url value="record.jsp" var="url">
			<c:param name="id" value="${record.id}"/>
			<c:param name="keys" value="${param.keys}"/>
			<c:param name="from" value="${param.from}"/>
		</c:url>    	
    	
		<tr>
			<td><a href='<c:out value="${url}" />'>${record.title}</a></td>
			<td><a href='<c:out value="${url}" />'>${record.uri}</a></td>
			<td>${record.description}</td>
		</tr>
	</c:forEach>
	
	<tr>
		<td>
	&nbsp;
		</td>
	</tr>
	
	</table>
	
	</div>

	<p style="text-align:center;">
	<%@ include file="paginator.jsp" %>
	</p>

</c:if>
