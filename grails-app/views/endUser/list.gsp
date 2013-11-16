
<%@ page import="airlinereservation.EndUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'endUser.label', default: 'EndUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-endUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-endUser" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'endUser.fullName.label', default: 'First Name')}" />
						
						<g:sortableColumn property="LastName" title="${message(code: 'endUser.fullName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="userName" title="${message(code: 'endUser.userName.label', default: 'User Name')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'endUser.password.label', default: 'Password')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${endUserInstanceList}" status="i" var="endUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${endUserInstance.id}">${fieldValue(bean: endUserInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: endUserInstance, field: "userName")}</td>
					
						<td>${fieldValue(bean: endUserInstance, field: "password")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${endUserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
