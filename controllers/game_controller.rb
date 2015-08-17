require_relative '../models/level.rb'

class GameController
  attr_accessor :level

  def initialize
    @level = Level.new
    @ladders = 3
  end

  def load_level(filename)
    begin
      level.load_level_from_csv(filename)
    rescue
      puts "Cannot load level: \"#{filename}\" not found."
    end
  end

  def room_menu
    room = level.current_room
    if room.title == "Ruby"
      game_won
    end
    print "\n----------------------\n"
    puts room.to_s
    print "\nDirection (N,S,E,W), (C)limb Ladder, or (G)ive up? "
    selection = gets.chomp.upcase
    case selection
    when "C"
      if level.current_room.is_a_pit?
        if @ladders > 0
          @ladders -= 1
          puts "\nYou climb one of your makeshift rope ladders."
          puts "You have #{@ladders} left.\n\n"
          level.restore_previous_room
        else
          puts "\nYou have used your last ladder!\n\nReluctantly, you must give up.\n\n"
          game_lost
        end
      else
        puts "\nYou better save your ladders for when you're stuck in a pit!\n\n"
      end
      room_menu
    when "G"
      puts "\nUntil next time...\n\n"
      exit(0)
    when "N"
      if level.switch_to_room(level.current_room.room_to_north) == false
        puts "You cannot go in that direction!"
      end
      room_menu
    when "S"
      if !level.switch_to_room(level.current_room.room_to_south) == false
        puts "You cannot go in that direction!"
      end
      room_menu
    when "E"
      if !level.switch_to_room(level.current_room.room_to_east) == false
        puts "You cannot go in that direction!"
      end
      room_menu
    when "W"
      if !level.switch_to_room(level.current_room.room_to_west) == false
        puts "You cannot go in that direction!"
      end
      room_menu
    else
      puts "\nI don't know how to do that."
      room_menu
    end
  end

  def game_lost

print "\n\n\n"
puts <<END
oooooo   oooo                          ooooo                                               .o.
 `888.   .8'                           `888'                                               888
  `888. .8'    .ooooo.  oooo  oooo      888          .ooooo.   .ooooo.   .oooo.o  .ooooo.  888
   `888.8'    d88' `88b `888  `888      888         d88' `88b d88' `88b d88(  "8 d88' `88b Y8P
    `888'     888   888  888   888      888         888   888 888   888 `"Y88b.  888ooo888 `8'
     888      888   888  888   888      888       o 888   888 888   888 o.  )88b 888    .o .o.
    o888o     `Y8bod8P'  `V88V"V8P'    o888ooooood8 `Y8bod8P' `Y8bod8P' 8""888P' `Y8bod8P' Y8P

END
exit(0)

end

  def game_won
print "\n\n\n"
puts <<END
As you enter a closet in this old keep, you can see a faint red glow
pressing through the cracks of an old chest.  Opening the chest, you see that
it's the gem you've been seeking!  Almost immediately, you find yourself sitting
in your favorite chair in your den, holding a shimmering red ruby of untold value.

Congratulations!

M""MMMM""M                      M""MMM""MMM""M oo          dP
M. `MM' .M                      M  MMM  MMM  M             88
MM.    .MM .d8888b. dP    dP    M  MMP  MMP  M dP 88d888b. 88
MMMb  dMMM 88'  `88 88    88    M  MM'  MM' .M 88 88'  `88 dP
MMMM  MMMM 88.  .88 88.  .88    M  `' . '' .MM 88 88    88
MMMM  MMMM `88888P' `88888P'    M    .d  .dMMM dP dP    dP oo
MMMMMMMMMM                      MMMMMMMMMMMMMM


END
  exit(0)

  end

end
