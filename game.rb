class MontyHall
  attr_accessor :visible_doors

  def initialize(doors=3)
    @visible_doors = ["*"]*doors
    @door_cnt = doors
    @car_idx = rand(doors)
  end

  def update_visible(choice)
    if choice == @car_idx then
      @visible_doors = ["G"]*@door_cnt
      other_goat = rand(@door_cnt-1)
      if other_goat == @car_idx then
        @visible_doors[-1] = "*"
      else
        @visible_doors[other_goat] = "*"
      end
    else
      @visible_doors = ["G"]*@visible_doors.length
      @visible_doors[@car_idx] = "*"
    end
    @visible_doors[choice] = "*"
  end

  def play(player)
    choice = player.get_choice(@visible_doors)

    update_visible(choice)

    if player.switch_choice?(@visible_doors) then
      choice = (0..@visible_doors.length).select {|i| @visible_doors[i] == "*" and i != choice}[0]
    end

    return choice == @car_idx
  end

end
