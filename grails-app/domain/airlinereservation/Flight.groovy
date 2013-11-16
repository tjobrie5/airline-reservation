package airlinereservation

import java.text.DateFormat
import java.text.SimpleDateFormat

class Flight {
	String airline
	Integer flightNumber
	Date departureTime
	Date arrivalTime
	String status
	Integer businessSeats
	Integer commercialSeats
    String origin
    String destination
	String travelType
	
	String toString() {
		"${flightNumber}"
	}
	
	String dateFormat(Date d){
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		String date = df.format(d);
		
		return date
	}
	
	static hasMany = [passengers: Passenger]

    static constraints = {
		flightNumber(blank: false, unique: true, min: 100)
		airline(blank: false, inList: ["US Airways", "Delta", "American Airlines", "SouthWest", "United Airlines"])
		travelType(blank: false, inList: ["domestic","international"])
		departureTime(blank: false)
		arrivalTime(blank: false)
		businessSeats(blank: false, min: 0, max: 200)
		commercialSeats(blank: false, min: 0,max: 200 )
        origin(blank: false)
        destination(blank: false)
		status(blank:false, inList: ["boarding","on route", "delayed", "on time"])
    }
}
