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
<jcr:nodeProperty node="${currentNode}" name="address" var="address"/>
<jcr:nodeProperty node="${currentNode}" name="phone" var="phone"/>
<jcr:nodeProperty node="${currentNode}" name="email" var="email"/>
<jcr:nodeProperty node="${currentNode}" name="photos" var="photos"/>
<jcr:nodeProperty node="${currentNode}" name="price" var="price"/>
<jcr:nodeProperty node="${currentNode}" name="food_type" var="food_type"/>
<jcr:nodeProperty node="${currentNode}" name="description" var="description"/>

<div>
    <h2><fmt:message key="jc_restaurant.views.detail.restaurantPage"/></h2>

    <c:url var="vCardUrl" value="${url.base}${currentNode.path}.vcf"/>
    <a href="${vCardUrl}" role="button"><fmt:message key="jc_restaurant.views.detail.getVCard"/></a>

    <%--Name--%>
    <h3><fmt:message key="jc_restaurant.name"/></h3>
    <c:if test="${not empty name}">
        <p>${fn:escapeXml(name.string)}</p>
    </c:if>

    <%--Address--%>
    <h3><fmt:message key="jc_restaurant.address"/></h3>
    <c:if test="${not empty address}">
        <p>${fn:escapeXml(address.string)}</p>
    </c:if>

    <%--Phone--%>
    <h3><fmt:message key="jc_restaurant.phone"/></h3>
    <c:if test="${not empty phone}">
        <p>${fn:escapeXml(phone.string)}</p>
    </c:if>

    <%--Email--%>
    <h3><fmt:message key="jc_restaurant.email"/></h3>
    <c:if test="${not empty email}">
        <p>${fn:escapeXml(email.string)}</p>
    </c:if>

    <%--Photos--%>
    <h3><fmt:message key="jc_restaurant.photos"/></h3>
    <ul>
        <c:forEach var="photo" items="${photos}">
            <c:url var="photoSrc" value="${photo.node.url}"/>
            <li><img src="${photoSrc}" alt="<fmt:message key="jc_restaurant.photos"/>"/></li>
        </c:forEach>
    </ul>

    <%--Price--%>
    <h3><fmt:message key="jc_restaurant.price"/></h3>
    <p>${fn:escapeXml(price.string)}</p>

    <%--Food type--%>
    <h3><fmt:message key="jc_restaurant.food_type"/></h3>
    <p>${fn:escapeXml(food_type.string)}</p>

    <%--Description--%>
    <h3><fmt:message key="jc_restaurant.description"/></h3>
    ${description}
</div>