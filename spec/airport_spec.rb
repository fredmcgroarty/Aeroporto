require 'airport'

	describe Airport do 

		let(:airport){Airport.new}
		let(:plane){double :plane}

	it "should have a max capacity of 20" do 
		expect(airport.capacity).to eq(20)
	end

	it "should accept planes" do
		expect(airport.plane_count).to eq(0)
		airport.accept_plane(plane)
		expect(airport.plane_count).to eq(1)
	end

	it "should allow planes to take off" do 
		airport.accept_plane(plane)
		expect(airport.plane_count).to eq(1)
		airport.take_off
		expect(airport.plane_count).to eq(0)
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


end
