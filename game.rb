# frozen_string_literal: true

class Game
  attr_accessor :board, :player_one, :player_two, :current_player

  def initialize
    @board = GameBoard.new
    @player_one = nil
    @player_two = nil
    @current_player = nil
  end

  def play
    game_setup
    board.display
    player_turn
    game_status
  end

  def game_setup
    puts "Let's play some Tic-Tac-Toe, player one enter your name:"
    @player_one = Player.new(gets.chomp, 'O')
    puts 'Excellent, player two please enter your name:'
    @player_two = Player.new(gets.chomp, 'X')
    puts "Alright! #{@player_one.name} you will be #{@player_one.token} and will be starting," \
         "\n#{@player_two.name} you will be #{@player_two.token} and be going second." \
         "\nLet's have a good game!"
    @current_player = player_one
  end

  def player_turn
    until board.full?
      puts "Alright #{current_player.name} enter a number to place your token!"
      player_input = gets.chomp.to_i
      until player_input.between?(1, 9) && board.valid_move?(player_input)
        puts 'That is not a valid square, try again...'
        player_input = gets.chomp.to_i
      end
      board.update_board(player_input - 1, current_player.token)
      break if board.game_over?

      current_player = switch_player
    end
  end

  def switch_player
    @current_player = if current_player == player_one
                        player_two
                      else
                        player_one
                      end
  end

  def game_status
    if board.game_over?
      puts "#{current_player.name} won the game!"
    else
      puts "It's a tie!"
    end
  end
end
