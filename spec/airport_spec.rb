require 'airport'
require 'plane'
require 'weather'

	describe Airport do 

		let(:airport){Airport.new}
		let(:plane){Plane.new}

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

	context "#good weather" do
		let(:airport) do
			Weather.stub(:stormy? => false)
			Airport.new
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
		let(:airport) do 
			Weather.stub(:stormy? => true)
			Airport.new
		end

		it "should not allow planes to land in stormy weather" do 
   	  expect(weather).to be_stormy
   	  lambda {airport.accept_plane(plane)}.should raise_error("she just cant take it captain!")
		end

	end




end




	

