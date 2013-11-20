<%@ page import="airlinereservation.Flight" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flight.label', default: 'Flight')}" />
		<title><g:message code="Upload Logo" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#logo-flight" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="logo-flight" class="content scaffold-logo" role="main">
			<h1><g:message code="Upload Logo" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${flightInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${flightInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<fieldset>
  				<legend>Logo Upload</legend>
  				<g:form action="upload_logo" method="post" enctype="multipart/form-data">
   				 <label for="avatar">Logo (16K)</label>
   				 <g:hiddenField name="id" value="${flightInstance?.id}" />
   				 <input type="file" name="logo" id="logo" />
   				 <div style="font-size:0.8em; margin: 1.0em;">
    			</div>
   				 <input type="submit" class="buttons" value="Upload" />
 				 </g:form>
			</fieldset>

		</div>
	</body>
</html>

		