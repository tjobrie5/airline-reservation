
<%@ page import="airlinereservation.Flight" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flight.label', default: 'Flight')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-flight" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-flight" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="flightNumber" title="${message(code: 'flight.flightNumber.label', default: 'Flight Number')}" />
					
						<g:sortableColumn property="airline" title="${message(code: 'flight.airline.label', default: 'Airline')}" />
					
						<g:sortableColumn property="travelType" title="${message(code: 'flight.travelType.label', default: 'Travel Type')}" />
					
						<g:sortableColumn property="departureTime" title="${message(code: 'flight.departureTime.label', default: 'Departure Time')}" />
					
						<g:sortableColumn property="arrivalTime" title="${message(code: 'flight.arrivalTime.label', default: 'Arrival Time')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'flight.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${flightInstanceList}" status="i" var="flightInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${flightInstance.id}">${fieldValue(bean: flightInstance, field: "flightNumber")}</g:link></td>
					
						<td>${fieldValue(bean: flightInstance, field: "airline")}</td>
					
						<td>${fieldValue(bean: flightInstance, field: "travelType")}</td>
					
						<td><g:formatDate date="${flightInstance.departureTime}" /></td>
					
						<td><g:formatDate date="${flightInstance.arrivalTime}" /></td>
					
						<td>${fieldValue(bean: flightInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${flightInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
