package airlinereservation

class Flight {
	String airline
	String flightNumber
	Date departureTime
	Date arrivalTime
	String status
	Integer seats
    String origin
    String destination
	
	String toString() {
		"${flightNumber}"
	}
	
	static hasMany = [passengers: Passenger]

    static constraints = {
		flightNumber(blank: false, unique: true)
		airline(blank: false, inList: ["US Airways", "Delta", "American Airlines", "SouthWest", "United Airlines"])
		departureTime(blank: false)
		arrivalTime(blank: false)
		seats(blank: false)
        origin(blank: false)
        destination(blank: false)
    }
}
