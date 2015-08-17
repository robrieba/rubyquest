require_relative "room.rb"
require "csv"

class Level
  attr_accessor :rooms

  def initialize
    @current_room_index = 0
    @previous_room_index = 0
    @rooms = []
  end

  def load_level_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    csv.each do |row|
      row_hash = row.to_hash
      add_room(row_hash["title"], row_hash["description"], row_hash["north"], row_hash["south"], row_hash["east"], row_hash["west"])
    end
  end

  def add_room(title, description, room_to_north, room_to_south, room_to_east, room_to_west)
    room = Room.new(title, description, room_to_north, room_to_south, room_to_east, room_to_west)
    @rooms << room
  end

  def current_room
    @rooms[@current_room_index]
  end

  def restore_previous_room
    @current_room_index = @previous_room_index
  end

  def switch_to_room(room_title)
    @rooms.each_with_index do |r, i|
      if r.title == room_title
        @previous_room_index = @current_room_index
        @current_room_index = i
        return true
      end
    end
    return false
  end

end
