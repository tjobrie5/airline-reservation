<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Air America Reservation System"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="aaLogo" role="banner"><a href="http://localhost:8080/AirlineReservation"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>

    <div id="viewFlight" role="button"><g:link controller="Flight" action="list">
      <input type="button" value="View Flights" class="button"/></g:link></div>

    <g:if test="${session.user==null}">
        <div id="signupButton" role="button"><g:link controller= "EndUser" action="create">
        <input type="button" value="Sign Up!" class="button"/>
        </g:link></div>
        <div id="loginButton" role="button"><g:link controller= "EndUser" action="login">
          <input type="button" value="Login" class="button"/>
        </g:link></div>
        </g:if>
        <g:if test="${session.user!=null}">
          <div id="userIdBlock" role="button"><g:link controller="EndUser" action="edit">
            <input type="button" value="Logged In As: ${session.user.firstName}" class="button"/></g:link></div>
          <g:if test="${session.user.role=="admin"}">
            <div id="editFlight" role="button"><g:link controller="Flight" action="edit">
              <input type="button" value="Create/Edit Flights" class="button"/></g:link></div>
            <div id="editUser" role="button"><g:link controller="endUser" action="edit">
              <input type="button" value="Create/Edit Users" class="button"/></g:link></div>
          </g:if>
        </g:if>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
