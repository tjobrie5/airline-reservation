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
	String price
	byte[] logo
	String logoType
	
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
		travelType(blank: false, inList: ["Domestic","International"])
		departureTime(blank: false)
		arrivalTime(blank: false)
        origin(blank: false)
        destination(blank: false)
		status(blank:false, inList: ["Boarding","En-Route", "Delayed", "On time"])
		price(blank: false)
		logo(nullable:true, maxSize: 16384/* 16K */)
		logoType(nullable:true)
    }
}
