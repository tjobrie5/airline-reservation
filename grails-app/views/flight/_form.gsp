<%@ page import="airlinereservation.Flight" %>



<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'flightNumber', 'error')} required">
	<label for="flightNumber">
		<g:message code="flight.flightNumber.label" default="Flight Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="flightNumber" required="" value="${flightInstance?.flightNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'airline', 'error')} required">
	<label for="airline">
		<g:message code="flight.airline.label" default="Airline" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="airline" from="${flightInstance.constraints.airline.inList}" required="" value="${flightInstance?.airline}" valueMessagePrefix="flight.airline"/>
</div>

<g:form action ="upload_logo" method="post" enctype="multipart/form-data">
	<label for="logo"> Logo (16K)</label>
	<input type="file" name="logo" id="logo" />
	<div style="font-size:0.8em; margin: 1.0em;">
	</div>
	<input type="submit" class="buttons" value="Upload" />
</g:form>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'travelType', 'error')} required">
	<label for="travelType">
		<g:message code="flight.travelType.label" default="Travel Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="travelType" from="${flightInstance.constraints.travelType.inList}" required="" value="${flightInstance?.travelType}" valueMessagePrefix="flight.travelType"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'departureTime', 'error')} required">
	<label for="departureTime">
		<g:message code="flight.departureTime.label" default="Departure Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="departureTime" precision="day"  value="${flightInstance?.departureTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'arrivalTime', 'error')} required">
	<label for="arrivalTime">
		<g:message code="flight.arrivalTime.label" default="Arrival Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="arrivalTime" precision="day"  value="${flightInstance?.arrivalTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'businessSeats', 'error')} required">
	<label for="businessSeats">
		<g:message code="flight.businessSeats.label" default="Business Seats" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="businessSeats" type="number" value="${flightInstance.businessSeats}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'commercialSeats', 'error')} required">
	<label for="commercialSeats">
		<g:message code="flight.commercialSeats.label" default="Commercial Seats" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="commercialSeats" type="number" value="${flightInstance.commercialSeats}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'origin', 'error')} required">
	<label for="origin">
		<g:message code="flight.origin.label" default="Origin" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="origin" required="" value="${flightInstance?.origin}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'destination', 'error')} required">
	<label for="destination">
		<g:message code="flight.destination.label" default="Destination" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="destination" required="" value="${flightInstance?.destination}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="flight.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${flightInstance.constraints.status.inList}" required="" value="${flightInstance?.status}" valueMessagePrefix="flight.status"/>
</div>

