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
				
				////Pheonix to Philadelphia
				def plane1 = new Flight(flightNumber: "143", airline: "US Airways", travelType: "Domestic", departureTime: depart ,arrivalTime: arrive, businessSeats: 14, commercialSeats: 199, origin: "PHX", destination:"PHI", status:"On time", price:"420" )
				plane1.save()
				if(plane1.hasErrors()){
					println plane1.errors
				}
				//Los Angeles to New York City
				def plane2 = new Flight(flightNumber: "654", airline: "Delta", travelType: "Domestic", departureTime: depart ,arrivalTime: arrive, businessSeats: 14, commercialSeats: 199, origin: "LAX", destination:"NYC", status:"On time", price:"610" )
				plane2.save()
				if(plane2.hasErrors()){
					println plane2.errors
				}
				//Seattle to Miami
				def plane3 = new Flight(flightNumber: "243", airline: "American Airlines", travelType: "Domestic", departureTime: depart ,arrivalTime: arrive, businessSeats: 14, commercialSeats: 199, origin: "SEA", destination:"MIA", status:"On time", price:"760" )
				plane3.save()
				if(plane3.hasErrors()){
					println plane3.errors
				}
				//Dallas to Chicago
				def plane4 = new Flight(flightNumber: "443", airline: "SouthWest", travelType: "Domestic", departureTime: depart ,arrivalTime: arrive, businessSeats: 14, commercialSeats: 199, origin: "DFW", destination:"ORD", status:"On time", price:"350" )
				plane4.save()
				if(plane4.hasErrors()){
					println plane4.errors
				}
				//Los Angeles to Chicago
				def plane5 = new Flight(flightNumber: "325", airline: "United Airlines", travelType: "Domestic", departureTime: depart ,arrivalTime: arrive, businessSeats: 14, commercialSeats: 199, origin: "LAX", destination:"ORD", status:"On time", price:"530" )
				plane5.save()
				if(plane5.hasErrors()){
					println plane5.errors
				}
				//Phoenix to Tokyo
				def plane6 = new Flight(flightNumber: "249", airline: "US Airways", travelType: "International", departureTime: depart ,arrivalTime: arrive, businessSeats: 14, commercialSeats: 199, origin: "PHX", destination:"HND", status:"On time", price:"2420" )
				plane6.save()
				if(plane6.hasErrors()){
					println plane6.errors
				}
				//Los Angeles to Hong Kong
				def plane7 = new Flight(flightNumber: "754", airline: "Delta", travelType: "International", departureTime: depart ,arrivalTime: arrive, businessSeats: 14, commercialSeats: 199, origin: "LAX", destination:"HKG", status:"On time", price:"2280" )
				plane7.save()
				if(plane7.hasErrors()){
					println plane7.errors
				}
				//Seattle to Cape Town South Africa
				def plane8 = new Flight(flightNumber: "343", airline: "American Airlines", travelType: "International", departureTime: depart ,arrivalTime: arrive, businessSeats: 14, commercialSeats: 199, origin: "SEA", destination:"CTP", status:"On time", price:"2690" )
				plane8.save()
				if(plane8.hasErrors()){
					println plane8.errors
				}
				//Dallas to Rio de Janeiro
				def plane9 = new Flight(flightNumber: "543", airline: "SouthWest", travelType: "International", departureTime: depart ,arrivalTime: arrive, businessSeats: 14, commercialSeats: 199, origin: "DFW", destination:"GIG", status:"On time", price:"1490" )
				plane9.save()
				if(plane9.hasErrors()){
					println plane9.errors
				}
				//New York to London Heathrow
				def plane10 = new Flight(flightNumber: "425", airline: "United Airlines", travelType: "International", departureTime: depart ,arrivalTime: arrive, businessSeats: 14, commercialSeats: 199, origin: "NYC", destination:"LHR", status:"On time", price:"1220" )
				plane10.save()
				if(plane10.hasErrors()){
					println plane10.errors
				}
				
			}
		}
    }
    def destroy = {
    }
}
