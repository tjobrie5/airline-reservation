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
				
				long offset = 0;
				Date date = new Date()
				Date depart = new Date(date.getTime() + offset);
				offset = 10800000;
				Date arrive = new Date(date.getTime() + offset);
				
				def plane1 = new Flight(flightNumber: "143", airline: "US Airways", travelType: "Domestic", departureTime: depart ,arrivalTime: arrive, businessSeats: 14, commercialSeats: 20, origin: "PHX", destination:"PHI", status:"On time" )
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
