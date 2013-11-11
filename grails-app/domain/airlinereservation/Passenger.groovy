package airlinereservation

class Passenger {
	
	String fullName
	String address
	String phoneNumber
	
	String toString() {
		"${fullName}"
	}
	
	static belongsTo = [flight: Flight, user: EndUser]

    static constraints = {
		fullName(blank: false)
		address()
		phoneNumber()
    }
}
