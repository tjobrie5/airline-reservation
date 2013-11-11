package airlinereservation

class EndUser {
	String userName
	String password
	String firstName
	String lastName
	String role = "user"

	
	
	static constraints = {
		userName(size:5..64,blank:false, nullable:false, unique: true)
		password(blank:false, password:true)
		firstName(blank: false)
		lastName(blank: false)
		role(inList: ["admin", "user"])
	}
	
	
	
	static transients = ['admin']
	
	boolean isAdmin(){
		return role == "admin"
	}
	
	String toString(){
		return userName
	}
	
	static hasMany = [passenger: Passenger]
}
