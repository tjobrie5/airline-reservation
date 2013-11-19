package airlinereservation

import org.springframework.dao.DataIntegrityViolationException

class FlightController {

    def index() { 
		def allFlights = Flight.list()
		[allFlights: allFlights]
	}

  def bull() {
    render "${params.origin}"
  }
	
	def list(){
		
		def flights = Flight.createCriteria().list(params) {
          if (params.origin && params.destination) {
            eq("origin", "${params.origin}".toUpperCase())
            eq("destination", "${params.destination}".toUpperCase())
          }
        }
		[flightInstanceList: flights,
					flightInstanceTotal: flights.size()]
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

	def booked(Long id){
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
	
	def upload_logo = {
		def flight = Flight.current(session)
		
		def f = request.getFile('logo')
		
		def okcontents = ['image/png', 'image/jpeg', 'image/jpg']
	
		if(!okcontents.contatins(f.getContentType())){
			flash.message = "Logo must be one of: ${okcontents}"
			render(view:'select_logo', model:[flight:flight])
			return;
		}
		
		flight.logo = f.getBytes()
		flight.logoType = f.getContentType()
		log.info("File uploaded: " + flight.logoType)
		
		if(flight.save()){
			render(view:'select_log', model:[flight:flight])
			return;
		}	
		
		flash.message = "Logo (${flight.logoType}, ${flight.logo.size()} bytes) uploaded."
		redirect(action:'show')
	}
	
	def logo_image = {
		def logoFlight = Flight.get(params.id)
		if (!logoFlight || !logoFlight.logo || !logoFlight.logoType) {
			response.sendError(404)
			return;
		}
		
		response.setContentType(logoFlight.logoType)
		response.setContentLength(logoFlight.log0.size())
		OutputStream out = response.getOutputStream();
		out.write(logoFlight.logo);
		out.close();
		
	}
}
