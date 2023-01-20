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

<template:addResources type="inlinejavascript">
    <script type="text/javascript">
        const search = () => {
            const searchInput = document.getElementById('restaurant_search_select').value;

            fetch('/modules/graphql', {
                method: 'POST',
                body: JSON.stringify({
                    query: `query($workspace: Workspace!, $lang: String!) {
                            jcr(workspace: $workspace) {
                                nodesByCriteria(
                                  criteria: {
                                    nodeType: "jc:restaurant"
                                    language: $lang
                                    nodeConstraint: { property: "food_type", contains: "` + searchInput + `" }
                                  }
                                ) {
                                  nodes {
                                    name: property(name: "name", language: $lang) {
                                      value
                                    }
                                    path: property(name: "j:fullpath") {
                                      value
                                    }
                                  }
                                }
                            }
                        }`,
                    variables: {
                        workspace: '${renderContext.previewMode ? 'EDIT' : 'LIVE'}',
                        lang: '${renderContext.mainResourceLocale}'
                    }
                })
            }).then(response => response.json()).then(data => {
                alert(data.toString());
            }).catch(() => {
                alert('error trying to get the restaurant information on the graphQL API');
            });
        };
    </script>
</template:addResources>

<div>
    <label for="restaurant_search_select"><fmt:message key="jc_restaurantSearch"/></label>

    <select name="restaurant_search_input" id="restaurant_search_select">
        <option selected="selected" value=""></option>
        <option value="burger">Burgers</option>
    </select>

    <button onclick="search()">Submit</button>

    <div id="restaurant_search_results">

    </div>
</div>