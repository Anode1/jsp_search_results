--
-- Current version uses jsp and java.
--

TODO

The following will work only when TLD implemented (for now - just copy JSPs into existing project and modify pages accordingly):
1) Insert the following into web deployment descriptor web.xml"
    <taglib>
		<taglib-uri>http://sourceforge.net/projects/aissearch</taglib-uri>
		<taglib-location>/WEB-INF/aissearch.tld</taglib-location>
    </taglib>
2) In JSP:

<%@ taglib uri="http://sourceforge.net/projects/aissearch" prefix="a" %>
<%-- Tags are not implemented yet --%>
	<a:bar>
		... optional text/nested tags ...
	</a:bar>
		Put results here
	<a:search>
		... optional text/nested tags ...
	</a:search>
