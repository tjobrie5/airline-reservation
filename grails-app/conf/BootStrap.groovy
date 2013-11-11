import airlinereservation.EndUser
import grails.util.Environment;

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
			}
		}
    }
    def destroy = {
    }
}
