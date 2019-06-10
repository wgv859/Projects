<%-- 
    Document   : detailsSightingPage
    Created on : May 31, 2019, 8:36:25 AM
    Author     : wgv85
--%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Super Hero Sightings</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid">
            <h1>Super Hero Sightings</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/index">Home</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/anomaliesPage">Anomaly</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/organizationsPage">Organizations</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/abilitiesPage">Abilities</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/locationsPage">Locations</a></li>
                    <li role="presentation" class ="active"><a href="${pageContext.request.contextPath}/sightingsPage">Sightings</a></li>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                <li role="presentation"><a href="${pageContext.request.contextPath}/displayUserList">User Admin</a></li>
                </sec:authorize>
                </ul>    
            </div>
                
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <h4>Hello : ${pageContext.request.userPrincipal.name}
                    | <a href="<c:url value="/j_spring_security_logout" />" > Logout</a>
                </h4>
            </c:if>
                
            <h2>Sighting Details</h2>

            <h3>Anomalies Sighted</h3>
            <ul>

                <c:forEach items="${sighting.anomalies}" var="anomaly">
                    <li>${anomaly.anomalyName}</li>
                    </c:forEach>
            </ul>
            <p>Date of Sighting: ${sighting.sightingDate}</p>
            <p>Location Name: ${sighting.location.locationName}</p>
            <p>Description: ${sighting.location.locationDescription}</p>
            <p>Street: ${sighting.location.locationStreet}</p>
            <p>City: ${sighting.location.locationCity}</p>
            <p>State: ${sighting.location.locationState}</p>
            <p>Postal Code: ${sighting.location.locationZip}</p>
            <p>Latitude: ${sighting.location.locationLatitude}</p>
            <p>Longitude: ${sighting.location.locationLongitude}</p>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>
