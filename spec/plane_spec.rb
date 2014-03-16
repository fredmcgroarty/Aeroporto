require 'plane'

describe Plane do 

	let(:plane){Plane.new}

	it "should be in the air after creation" do
		expect(plane).not_to be_grounded
	end

	it "should know when it is grounded" do 
		expect(plane).not_to be_grounded
		plane.land
		expect(plane).to be_grounded
	end 

	it "should know when it is flying" do 
		plane.land
		expect(plane).to be_grounded
		plane.take_off 
		expect(plane).not_to be_grounded
	end


end