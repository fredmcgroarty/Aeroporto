class Plane 

	def initialize
		take_off
	end

	def grounded?
		@grounded 
	end

	def land 
		@grounded = true
	end

	def take_off
		@grounded = false
	end

end