package airlinereservation

class EndUser {
	String userName
	String password
	String fullName
	
	String toString() {
		"${userName}"
	}
	
	static hasMany = [passenger: Passenger]
	
    static constraints = {
		fullName(blank: false)
		userName(blank: false, unique: true)
		password(blank: false, password: true)
    }
}
