require_relative '../models/level.rb'

RSpec.describe Level do

  let(:level) { Level.new }

  context "attributes" do
    it "should respond to current_room" do
      expect(level).to respond_to(:current_room)
    end

    it "should respond to rooms" do
      expect(level).to respond_to(:rooms)
    end

    it "should initialize the current room to nil" do
      expect(level.current_room).to eq nil
    end
  end

  context "#add_room" do
    it "should add a room correctly" do
      level.add_room("This is title", "This is a description", "North Room Title", "South Room Title", "East Room Title", "West Room Title" )
    end
  end

  context "#import_from_csv" do
    it "should import the correct number of entries" do
      level.load_level_from_csv("sample_level.csv")
      expect(level.rooms.size).to eql 6
    end

    it "import the 1st entry in \"sample_level.csv\"" do
      level.load_level_from_csv("sample_level.csv")
      room = level.current_room
      expect(room.title).to eql "Round Room"
    end
  end

  context "#switch_to_room" do
    it "should correctly change the current room to the room with the given title" do
      level.load_level_from_csv("sample_level.csv")
      room = level.current_room
      expect(room.title).to eql "Round Room"
      level.switch_to_room("Fountain")
      room = level.current_room
      expect(room.title).to eql "Fountain"      
    end
  end


end
