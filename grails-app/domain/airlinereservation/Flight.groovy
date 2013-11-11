package airlinereservation

class Flight {
	String airline
	String flightNumber
	Date departureTime
	Date arrivalTime
	String status
	Integer seats
	
	String toString() {
		"${flightNumber}"
	}
	
	static hasMany = [passengers: Passenger]

    static constraints = {
		flightNumber(blank: false, unique: true)
		airline(blank: false)
		departureTime(blank: false)
		arrivalTime(blank: false)
		seats(blank: false)
		
    }
}
