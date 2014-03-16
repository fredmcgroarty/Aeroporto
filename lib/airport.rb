class Airport 


	def initialize 
		@capacity ||= 20
		@planes = []
	end

	def capacity
		@capacity 
	end

	def plane_count
		@planes.count
	end

	def accept_plane(plane)
		if full?
			raise "we are full!"
		else
			plane.land
			@planes << plane
		end
	end

	def take_off(plane)
		plane.take_off
		@planes.pop
	end

	def full?
		capacity <= plane_count
	end

end