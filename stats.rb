#bug 2
class Stats
  def initialize(game, player, rounds=1e6.to_i)
    @game = game
    @player = player
    @rounds = rounds
  end

  def simulate
    wins = 0
    (0..@rounds).each {wins += 1 if @game.play(@player)}

    return wins.to_f/@rounds
  end
end

require_relative 'game'
require_relative 'player'

game = MontyHall.new

[[:no, "Don't change"], [:random, "50/50"], [:yes, "Always switch"]].each do |strategy, text|
  player = Players::MontyHallPlayer.new(strategy)
  simulator = Stats.new(game, player)
  
  puts "#{text}\t#{simulator.simulate}"
end

game = MontyHall.new(10)
player = Players::MontyHallPlayer.new(:yes)
simulator = Stats.new(game, player)

puts "10 Doors Always Switch\t#{simulator.simulate}"
