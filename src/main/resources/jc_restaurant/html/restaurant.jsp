<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<jcr:nodeProperty node="${currentNode}" name="name" var="name"/>
<jcr:nodeProperty node="${currentNode}" name="description" var="description"/>

<div>
    <h3><fmt:message key="jc_restaurant.name"/></h3>
    <c:if test="${not empty name}">
        <p>${fn:escapeXml(name.string)}</p>
    </c:if>

    <h3><fmt:message key="jc_restaurant.description"/></h3>
    <c:if test="${not empty description}">
        <c:choose>
            <c:when test="${fn:length(description.string) > 15}">
                ${fn:substring(description.string,0,200)} &mldr;
            </c:when>
            <c:otherwise>
                ${description.string}
            </c:otherwise>
        </c:choose>
    </c:if>

    <c:url var="detailPath" value="${url.base}${currentNode.path}.details-template.html"/>
    <a href="${detailPath}" role="button"><fmt:message key="jc_restaurant.views.default.details"/></a>
</div>