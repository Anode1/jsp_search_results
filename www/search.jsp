<%@ include file="header.jsp" %>

<table cellspacing="0" cellpadding="0" border="0" width="640">
<tr><td height="30">
</td></tr>


<tr>
	<td style="text-align: center;"><H1>Title</H1></td>
</tr>

<tr><td>

<!-- SEARCH -->

<form action="search.jsp" method="post" name="localForm" charset="UTF-8">

	<script>document.write('<input type="hidden" name="rand" value="'+Math.random()+'">');</script>
	
	<table align="center" width="640">
		<tr>
			<td style="text-align: center;">
				<input id="keys" name="keys" size="60" type="text"/>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;">
				&nbsp;
			</td>
		</tr>		
		<tr>
			<td style="text-align: center;">
				<input value="Search" id="Search" type="submit"/>
			</td>
		</tr>
	</table>
	
</form>

<script>
	document.localForm.keys.focus();
</script>

<!-- /SEARCH -->

</td></tr>


<tr><td>

<!-- RESULTS -->

<%@ include file="results.jsp" %>

<!-- /RESULTS -->


</td></tr>


<tr><td height="30">
</td></tr>
</table>


<%@ include file="footer.jsp" %>
