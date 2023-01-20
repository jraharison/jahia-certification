<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<c:set var="statement"
       value="SELECT * FROM [jc:restaurant] WHERE ISDESCENDANTNODE('${currentNode.resolveSite.path}') ORDER BY [jcr:created] DESC"/>

<jcr:nodeProperty node="${currentNode}" name="maxRestaurant" var="maxRestaurant"/>

<query:definition var="listQuery" statement="${statement}" limit="${maxRestaurant.long}"/>
<c:set target="${moduleMap}" property="editable" value="false"/>
<c:set target="${moduleMap}" property="emptyListMessage"><fmt:message key="jc_lastRestaurant.views.hidden.load.no_data"/></c:set>
<c:set target="${moduleMap}" property="listQuery" value="${listQuery}"/>
<c:set target="${moduleMap}" property="subNodesView" value="${currentNode.properties['subNodesView'].string}"/>