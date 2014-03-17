require 'weather'
class Airport

attr_reader :capacity

	def initialize(weather) 
		@capacity ||= 20
		@planes = []
		@weather = weather
	end

	def plane_count
		@planes.count
	end

	def accept_plane(plane)
			raise "we are full!" if full?
			raise "she just cant take it captain!" if @weather.stormy? 
			plane.land
			@planes << plane
	end

	def take_off(plane)
		raise "the weather is shite mate" if @weather.stormy?
		plane.take_off
		@planes.pop
	end

	def full?
		capacity <= plane_count
	end

end