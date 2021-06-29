# frozen_string_literal: true

require_relative 'player'
require_relative 'gameboard'
require_relative 'game'

def start_game
  game = Game.new
  game.play
end

start_game
