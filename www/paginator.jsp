
<c:if test="${result.from >= result.maxRecordsToShow}">
	<big><b><a href=
		"<c:url value="search.jsp">
		  <c:param name="from" value="${result.from - result.maxRecordsToShow}"/>
		  <c:param name="keys" value="${keys}"/>
		</c:url>"
	>&lt;Prev</a></b>&nbsp;</big>
</c:if>

<% 
	long totalRecordsFound=result.getTotal();
	pageContext.setAttribute("totalRecordsFound", Long.toString(totalRecordsFound));
	int totalPages=(int)(totalRecordsFound/Constants.NUM_RECORDS_TO_SHOW)+((totalRecordsFound%Constants.NUM_RECORDS_TO_SHOW)>0?1:0);
	pageContext.setAttribute("totalPages", Integer.toString(totalPages));
	
	
%>

<c:if test="${totalPages>1}">
	
		
	<c:forEach var="i" begin="${result.loopStart}" end="${result.loopEnd}">
		
		<c:choose>
		  <c:when test="${result.total < (i+1)*result.maxRecordsToShow}">
		    <c:set var="end" value="${result.total}"/>
		  </c:when>
		  <c:otherwise>
		    <c:set var="end" value="${(i+1)*result.maxRecordsToShow}"/>
		  </c:otherwise>
		</c:choose>
		<c:if test="${result.from >= (i*result.maxRecordsToShow)}">
			<c:if test="${result.from < end}">
			<big><b><a 
				>${i*result.maxRecordsToShow+1}-${(i+1)*result.maxRecordsToShow}</a></b>&nbsp;</big>
			</c:if>		
		</c:if>
	    <c:if test="${result.from < (i)*result.maxRecordsToShow}">
	    <a href=
			"<c:url value="search.jsp">
			  <c:param name="from" value="${i*result.maxRecordsToShow}"/>
			  <c:param name="keys" value="${keys}"/>
			</c:url>"	    
	    >${i*result.maxRecordsToShow+1}-${end}</a>&nbsp;
	    </c:if>
	    <c:if test="${result.from >= end}">
	    <a href=
			"<c:url value="search.jsp">
			  <c:param name="from" value="${i*result.maxRecordsToShow}"/>
			  <c:param name="keys" value="${keys}"/>
			</c:url>"	    
	    >${i*result.maxRecordsToShow+1}-${end}</a>&nbsp;
	    </c:if>

    </c:forEach>

</c:if>

<% 
	long next=result.getFrom()+Constants.NUM_RECORDS_TO_SHOW;
	pageContext.setAttribute("next", Long.toString(next));
%>
	
<%-- 
	Pretty funny: ${next<totalRecordsFound} which is 100<4 is been evaluated to true, so 
	we can't use JSTL for evaluation of 2 attribute, so have to use at least one bean.
	To reproduce the bug - uncomment the following block and check by yourself
-------------------------
next=${next},totalRecordsFound=${totalRecordsFound},
${next}&lt;${totalRecordsFound} is ${next<totalRecordsFound}
------------------------- 
--%>


<c:if test="${result.next < totalRecordsFound}">
	<big><b><a href=
		"<c:url value="search.jsp">
		  <c:param name="from" value="${next}"/>
		  <c:param name="keys" value="${keys}"/>
		</c:url>"
	>Next&gt;</a></b></big>
</c:if>

