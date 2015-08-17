
class Room
  attr_accessor :title, :description

  def initialize( title = "Empty Room",
                  description = "This is an empty room.",
                  north_title = "empty",
                  south_title = "empty",
                  east_title = "empty",
                  west_title = "empty" )
    @title = title
    @description = description
    @adjacent_room_titles = { north: north_title, south: south_title, east: east_title, west: west_title }
  end

  def room_to_north
    @adjacent_room_titles[:north]
  end

  def room_to_south
    @adjacent_room_titles[:south]
  end

  def room_to_east
    @adjacent_room_titles[:east]
  end

  def room_to_west
    @adjacent_room_titles[:west]
  end

  def is_a_pit?
    if @title == "Pit"
      true
    else
      false
    end
  end

  def to_s
    s = "#{@title}\n\n#{@description}\n\n"
    if ( @adjacent_room_titles[:north] == "empty" &&
         @adjacent_room_titles[:south] == "empty" &&
         @adjacent_room_titles[:east] == "empty" &&
         @adjacent_room_titles[:west] == "empty" )
      s += "There is no way out!"
    else
      s += "Exits:"
      s += (@adjacent_room_titles[:north] == "empty" ? "" : " North") +
           (@adjacent_room_titles[:south] == "empty" ? "" : " South") +
           (@adjacent_room_titles[:east] == "empty" ? "" : " East") +
           (@adjacent_room_titles[:west] == "empty" ? "" : " West")
      s += "."

    end
    return s
  end

end
