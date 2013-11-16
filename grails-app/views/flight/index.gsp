<%@ page import="airlinereservation.Flight" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Air America</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 1em 1em 1.25em 1em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 720px) {

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
		<div id="page-body" role="main">
			<h1>Welcome to Air America Online Reservation System!</h1>
			<p>Congratulations, you have happened upon the best flight reservation system available! A list of flights
			   is provided below for your viewing pleasure. If you already have an account, feel free to log in in order
			   to reserve a seat on a plane. If you do not have an account, you must make one in order to reserve a flight</p>
		</div>
    <div>
      <table border="1">
        <caption>Flight Details</caption>
        <tr>
          <th>Airline</th>
          <th>Flight Number</th>
          <th>Departure Time</th>
          <th>Arrival Time</th>
          <th>Status</th>
        </tr>
        <g:each controller="flight" in="${allFlights}" status="i" var="currentProject">
          <tr>
            <td>${currentProject.airline}</td>
            <td>${currentProject.flightNumber}</td>
            <td>${currentProject.dateFormat(currentProject.departureTime)}</td>
            <td>${currentProject.dateFormat(currentProject.arrivalTime)}</td>
            <td>${currentProject.status}</td>
          </tr>
        </g:each>
      </table>
    </div>
	</body>
</html>
