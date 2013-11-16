import airlinereservation.EndUser
import airlinereservation.Flight
import grails.util.Environment
import java.util.Date;

class BootStrap {

    def init = { servletContext ->
		environments {
			development{
				def admin = new EndUser(userName: "admin", password: "admin", firstName:"Commander", lastName:"Admin", role:"admin")
				admin.save()
				if(admin.hasErrors()){
					println admin.errors
				}
				
			
				def jdoe = new EndUser(userName:"smith", password:"pass123", firstName:"john", lastName: "smith")		
				jdoe.save()
				if(jdoe.hasErrors()){
					println jdoe.errors
				}
				
				long offset = 3;
				
				Date date = new Date(offset);
				
				def plane1 = new Flight(flightNumber: "143", airline: "US Airways", travelType: "domestic", departureTime: date ,arrivalTime: date, businessSeats: 14, commercialSeats: 20, origin: "PHX", destination:"PHI", status:"on route" )
				plane1.save()
				if(plane1.hasErrors()){
					println plane1.errors
				}
				
			}
		}
    }
    def destroy = {
    }
}
