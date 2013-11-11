<html>
<head>
	<title>Flight List</title>
</head>
<body>
  <table border="1">
  <caption>Flight Details</caption>
  <tr>
    <th>Airline</th>
    <th>Flight Number</th>
    <th>Departure Time</th>
    <th>Arrival Time</th>
    <th>Status</th>
  </tr>
  <g:each in="${allFlights}" status="i" var="currentProject">
    <tr>
      <td>${currentProject.airline}</td>
      <td>${currentProject.flightNumber}</td>
      <td>${currentProject.departureTime}</td>
      <td>${currentProject.arrivalTime}</td>
      <td>${currentProject.status}</td>
    </tr>
  </g:each>
</table>
</body>
</html>