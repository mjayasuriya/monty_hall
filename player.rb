#hotfix
module Players
  class MontyHallPlayer
  
    def initialize(switch_doors = :no)
      @switch_doors = switch_doors
    end

    def get_choice(doors)
      return rand(doors.length)
    end

    def switch_choice?(doors)
      if @switch_doors == :random then
        return 0 == rand(2)
      end
      return @switch_doors == :yes
    end
  end


  class InteractiveMHPlayer
    def get_choice(doors)
      puts "Doors #{doors}"
      puts "Door 0-#{doors.length-1}? "
      choice = gets
      choice.to_i
    end

    def switch_choice?(doors)
      puts doors.join(" ")
      puts "Switch? [y/n]: "
      choice = gets.chomp
      return choice == "y"
    end
  end
end

require_relative 'game'

#i = Players::InteractiveMHPlayer.new
#
#g = MontyHall.new(3)
#
#puts g.play(i)
