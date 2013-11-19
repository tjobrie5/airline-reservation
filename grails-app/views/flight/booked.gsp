<%@ page import="airlinereservation.Flight" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flight.label', default: 'Flight')}" />
		<title>The Flight Has Been Booked</title>
	</head>
	<body>
		<a href="#booked-flight" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="booked-flight" class="content scaffold-booked" role="main">
			<h1>The Flight Has Been Booked</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list flight">
			
				<g:if test="${flightInstance?.flightNumber}">
				<li class="fieldcontain">
					<span id="flightNumber-label" class="property-label"><g:message code="flight.flightNumber.label" default="Flight Number" /></span>
					
						<span class="property-value" aria-labelledby="flightNumber-label"><g:fieldValue bean="${flightInstance}" field="flightNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.airline}">
				<li class="fieldcontain">
					<span id="airline-label" class="property-label"><g:message code="flight.airline.label" default="Airline" /></span>
					
						<span class="property-value" aria-labelledby="airline-label"><g:fieldValue bean="${flightInstance}" field="airline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.travelType}">
				<li class="fieldcontain">
					<span id="travelType-label" class="property-label"><g:message code="flight.travelType.label" default="Travel Type" /></span>
					
						<span class="property-value" aria-labelledby="travelType-label"><g:fieldValue bean="${flightInstance}" field="travelType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.departureTime}">
				<li class="fieldcontain">
					<span id="departureTime-label" class="property-label"><g:message code="flight.departureTime.label" default="Departure Time" /></span>
					
						<span class="property-value" aria-labelledby="departureTime-label"><g:formatDate date="${flightInstance?.departureTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.arrivalTime}">
				<li class="fieldcontain">
					<span id="arrivalTime-label" class="property-label"><g:message code="flight.arrivalTime.label" default="Arrival Time" /></span>
					
						<span class="property-value" aria-labelledby="arrivalTime-label"><g:formatDate date="${flightInstance?.arrivalTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.businessSeats}">
				<li class="fieldcontain">
					<span id="businessSeats-label" class="property-label"><g:message code="flight.businessSeats.label" default="Business Seats" /></span>
					
						<span class="property-value" aria-labelledby="businessSeats-label"><g:fieldValue bean="${flightInstance}" field="businessSeats"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.commercialSeats}">
				<li class="fieldcontain">
					<span id="commercialSeats-label" class="property-label"><g:message code="flight.commercialSeats.label" default="Commercial Seats" /></span>
					
						<span class="property-value" aria-labelledby="commercialSeats-label"><g:fieldValue bean="${flightInstance}" field="commercialSeats"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.origin}">
				<li class="fieldcontain">
					<span id="origin-label" class="property-label"><g:message code="flight.origin.label" default="Origin" /></span>
					
						<span class="property-value" aria-labelledby="origin-label"><g:fieldValue bean="${flightInstance}" field="origin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.destination}">
				<li class="fieldcontain">
					<span id="destination-label" class="property-label"><g:message code="flight.destination.label" default="Destination" /></span>
					
						<span class="property-value" aria-labelledby="destination-label"><g:fieldValue bean="${flightInstance}" field="destination"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="flight.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${flightInstance}" field="status"/></span>
					
				</li>
				</g:if>

				<g:if test="${flightInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="flight.price.label" default="price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${flightInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:if test="${session.user != null}">
          		<g:if test="${session.user.role=="admin"}">
					<g:form>
					
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${flightInstance?.id}" />						
						</fieldset>
					</g:form>
				</g:if>
			</g:if>
		</div>
	</body>
</html>