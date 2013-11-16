package airlinereservation

class LoginTagLib {
	def loginControl = {
		if(request.getSession(false) && session.user){
			out <<"Hello ${session.user.firstName} "
			out <<"""[${link(action:"logout", controller:"EndUser"){"Logout"}}]"""
			
		}else{
			out <<"""[${link(action:"login", controller:"EndUser"){"Login"}}]"""
			out <<"""[${link(action:"create", controller:"EndUser"){"Sign up"}}]"""
		}
	}
}
