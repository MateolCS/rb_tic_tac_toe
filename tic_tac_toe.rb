class Player
    attr_accessor :name, :marker
    def initialize(in_name, in_marker)
        @name = in_name
        @marker = in_marker
    end
end

class Game
    def initialize()
        @players = [Player.new("Player 1", "X"), Player.new("Player 2", "O")]
        @current_player = @players[0]
        @board = ["", " ", " ", " ", " ", " ", " ", " ", " "]
        @game_over = false
        @turns = 9
    end

    def play
    end

    def place_marker!
    
    end

    def switch_player!
    end

    def game_over?

    end


    def print_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
end

game = Game.new
game.print_board