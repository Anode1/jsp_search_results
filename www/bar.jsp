<table width=100% border=0 cellpadding=10 cellspacing=0>
<tr><td bgcolor=#000000;>
<img width=1 height=1 alt=''/></td></tr></table>
<table width=100% border=0 cellpadding=0 cellspacing=0 class="bar">
<tr><td class="bar" nowrap><font size=+1>&nbsp;

<!-- title -->
<b></b>


</font>&nbsp;</td><td class="bar" align=right nowrap>
<font size=-1 color=white>

Results 



<c:if test="${result.total >0}">
	<b>
	${result.from+1}
	</b> - <b>
	${result.fromTo}
	</b> of <b>
	${result.total}
	</b>
</c:if>

<c:if test="${result.total >0}">
 &nbsp; for <b><b>
 ${param.keys}
 </b></b>
</c:if>

&nbsp;(<b>

${ms}
</b> ms)&nbsp;</font></td></tr></table>
