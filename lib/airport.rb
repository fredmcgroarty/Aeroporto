require 'weather'
class Airport
include Weather

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
			raise "she just cant take it captain!" if Weather.stormy? 
			raise "we are full!" if full?
			plane.land
			@planes << plane
		
	end

	def take_off(plane)
		plane.take_off
		@planes.pop
	end

	def full?
		capacity <= plane_count
	end

end