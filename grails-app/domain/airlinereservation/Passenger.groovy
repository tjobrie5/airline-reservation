package airlinereservation

class Passenger {
	
	String firstName
	String lastName
	String address
	String phoneNumber
	
	String toString() {
		return firstName + " " + lastName
	}
	
	static belongsTo = [flight: Flight, user: EndUser]

    static constraints = {
		firstName(blank: false)
		lastName(blank: false)
		address()
		phoneNumber()
    }
}
