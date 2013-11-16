package airlinereservation

import org.springframework.dao.DataIntegrityViolationException

class FlightController {

    def index() { 
		def allFlights = Flight.list()
		[allFlights: allFlights]
	}
	
	def list(){
		
		def flights = Flight.list()
		render(view:'list',
			model:[flightInstanceList: flights,
					flightInstanceTotal: flights.size()])
	}
	
	def create() {
		if(session.user == null){
			flash.message = "You do not have permission to access this page"
			redirect(uri:"/")
			
		}else if(session.user.role != "admin"){
			flash.message = "You do not have permission to access this page"
			redirect(uri:"/")
		}else{
		
			[flightInstance: new Flight(params)]
		}
	}
	
	def save() {
		def flightInstance = new Flight(params)
		if (!flightInstance.save(flush: true)) {
			render(view: "create", model: [flightInstance: flightInstance])
			return
		}
		
		flash.message = "Flight Successfully Created!"
		redirect(action: "show", id: flightInstance.id)
	}
	
	def show(Long id){
		def flightInstance = Flight.get(id)
		if (!flightInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), id])
			redirect(action: "list")
			return
		}

		[flightInstance: flightInstance]
	}
	
	def edit(Long id) {
		def flightInstance = Flight.get(id)
		if (!flightInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), id])
			redirect(action: "list")
			return
		}

		[flightInstance: flightInstance]
	}
	
	def update(Long id, Long version) {
		def flightInstance = Flight.get(id)
		if (!flightInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), id])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (flightInstance.version > version) {
				flightInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						  [message(code: 'flight.label', default: 'Flight')] as Object[],
						  "Another admin has updated this Flight while you were editing")
				render(view: "edit", model: [flightInstance: flightInstance])
				return
			}
		}

		flightInstance.properties = params

		if (!flightInstance.save(flush: true)) {
			render(view: "edit", model: [flightInstance: flightInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'flight.label', default: 'Flight'), endUserInstance.id])
		redirect(action: "show", id: flightInstance.id)
	}
	
	def delete(Long id) {
		def flightInstance = Flight.get(id)
		if (!flightInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), id])
			redirect(action: "list")
			return
		}

		try {
			flightInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'flight.label', default: 'Flight'), id])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'flight.label', default: 'Flight'), id])
			redirect(action: "show", id: id)
		}
	}
}
