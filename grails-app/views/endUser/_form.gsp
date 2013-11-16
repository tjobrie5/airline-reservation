<%@ page import="airlinereservation.EndUser" %>



<div class="fieldcontain ${hasErrors(bean: endUserInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="endUser.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${endUserInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: endUserInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="endUser.fullName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${endUserInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: endUserInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="endUser.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${endUserInstance?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: endUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="endUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${endUserInstance?.password}"/>
</div>



