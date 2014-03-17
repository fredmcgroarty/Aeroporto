require 'airport'
require 'plane'
require 'weather'

	describe Airport do 

		let(:airport){Airport.new(weather)}
		let(:plane){Plane.new}
		let(:weather){weather = double("weather")}

	context "#good weather" do
		before(:each) do
   	  weather.stub(:stormy?).and_return(false)
   	  expect(weather.stormy?).to be_false
  	end

		it "should have a max capacity of 20" do 
			expect(airport.capacity).to eq(20)
		end
	
		it "should know when it is full" do
			20.times{airport.accept_plane(plane)}
			expect(airport.plane_count).to eq(20)
			expect(airport).to be_full
		end
	
		it "should not allow plane to land if its full" do
			20.times{airport.accept_plane(plane)}
			lambda {airport.accept_plane(plane)}.should raise_error("we are full!")
		end

		it "should accept planes" do
			expect(airport.plane_count).to eq(0)
			airport.accept_plane(plane)
			expect(airport.plane_count).to eq(1)
		end
	
		it "should allow planes to take off" do 
			airport.accept_plane(plane)
			expect(airport.plane_count).to eq(1)
			airport.take_off(plane)
			expect(airport.plane_count).to eq(0)
		end
			
	end

	context "#stormy weather" do
		before(:each) do
   	  weather.stub(:stormy?).and_return(true)
   	  expect(weather.stormy?).to be_true
  	end

		it "should not allow planes to land in stormy weather" do 
   	  lambda {airport.accept_plane(plane)}.should raise_error("she just cant take it captain!")
		end

		it "should not allow planes to take off in stormy weather" do 
			lambda {airport.take_off(plane)}.should raise_error("the weather is shite mate")
		end

	end

end




	

