require_relative '../models/room.rb'

RSpec.describe Room do

  context "attributes" do
    it "should respond to description" do
      room = Room.new
      expect(room).to respond_to(:description)
    end

    it "should respond to title" do
      room = Room.new
      expect(room).to respond_to(:title)
    end

    it "should respond to room_to_north" do
      room = Room.new
      expect(room).to respond_to(:room_to_north)
    end

    it "should respond to room_to_south" do
      room = Room.new
      expect(room).to respond_to(:room_to_south)
    end

    it "should respond to room_to_east" do
      room = Room.new
      expect(room).to respond_to(:room_to_east)
    end

    it "should respond to room_to_west" do
      room = Room.new
      expect(room).to respond_to(:room_to_west)
    end
  end

  context "#to_s" do
    it "should print a room as a string" do
      room = Room.new('Foyer', 'The foyer is a room at the entry of the home.')
      expected_string = "Foyer\n\nThe foyer is a room at the entry of the home.\n\nThere is no way out!"
      expect(room.to_s).to eq(expected_string)
    end

    it "should print a list of the adjacent rooms" do
      room = Room.new("This is a Title", "This is a description.", "North Room Title", "South Room Title", "East Room Title", "West Room Title" )
      expected_string = "This is a Title\n\nThis is a description.\n\nExits: North South East West."
      expect(room.to_s).to eq(expected_string)
    end
  end

  context "direction accessors" do
    it "should return the correct room to the north, south, east, and west" do
      room = Room.new("This is a Title", "This is a description.", "North Room Title", "South Room Title", "East Room Title", "West Room Title")
      expect(room.room_to_north).to eq("North Room Title")
      expect(room.room_to_south).to eq("South Room Title")
      expect(room.room_to_east).to eq("East Room Title")
      expect(room.room_to_west).to eq("West Room Title")
    end
  end

end
