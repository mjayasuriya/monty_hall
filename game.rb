# Change 1
class MontyHall
  attr_accessor :visible_doors

  def initialize(doors=3)
    @num_doors = doors
    reset()
  end

  def reset()
    @doors = ["G"]*@num_doors
    @doors[rand(@num_doors)] = "C"
    @visible_doors = ["*"]*@num_doors
  end
   

  def update_visible(choice)
    goat_idxs = (0..@doors.length).to_a.select {|i| @doors[i] == "G"}.shuffle

    choice_is_goat = goat_idxs.index(choice)
    goat_idxs.delete_at(choice_is_goat) if choice_is_goat

    goat_idxs[0..(@doors.length-3)].each {|goat| @visible_doors[goat] = "G"}
  end

  def play(player)
    choice = player.get_choice(@visible_doors)

    update_visible(choice)

    if player.switch_choice?(@visible_doors) then
      choice = (0..@visible_doors.length).select {|i| @visible_doors[i] == "*" and i != choice}[0]
    end

    win = @doors[choice] == "C"

    reset()

    return win
  end

end
