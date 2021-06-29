# frozen_string_literal: true

class GameBoard
  WAYSTOWIN = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze
  attr_accessor :squares

  def initialize
    @squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display
    puts <<~HEREDOC
       #{squares[0]} | #{squares[1]} | #{squares[2]}
      ---+---+---
       #{squares[3]} | #{squares[4]} | #{squares[5]}
      ---+---+---
       #{squares[6]} | #{squares[7]} | #{squares[8]}
    HEREDOC
  end

  def update_board(number, token)
    @squares[number] = token
    display
  end

  def full?
    squares.all? { |cell| cell =~ /[^0-9]/ }
  end

  def valid_move?(number)
    squares[number - 1] == number
  end

  def game_over?
    WAYSTOWIN.any? do |combo|
      [squares[combo[0]], squares[combo[1]], squares[combo[2]]].uniq.length == 1
    end
  end
end
