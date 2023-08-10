class Player
    attr_accessor :name, :marker
    def initialize(in_name, in_marker)
        @name = in_name
        @marker = in_marker
    end
end

class Game

    WINNING_COMBINATIONS = [
        [0, 1, 2], # Top row
        [3, 4, 5], # Middle row
        [6, 7, 8], # Bottom row
        [0, 3, 6], # Left column
        [1, 4, 7], # Middle column
        [2, 5, 8], # Right column
        [0, 4, 8], # Diagonal 1
        [2, 4, 6]  # Diagonal 2
    ]

    def initialize()
        @players = [Player.new("Player 1", "X"), Player.new("Player 2", "O")]
        @current_player = @players[0]
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        @game_over = false
        @turns = 9
    end

    def play
        loop do
            print_board
            puts "It's #{@current_player.name}'s turn!\n"
            place_marker!()
            check_game_over
            switch_player!
            break if @game_over
        end
    end

    def get_position
        loop do
            puts "Please enter a position (1-9):"
            position = gets.chomp.to_i - 1
            if position >=0 && position <=8 && @board[position] == " "
                return position
            else
                puts "Invalid position. Please try again."
            end
        end
    end

    def place_marker!()
        position = get_position
        @board[position] = @current_player.marker
        @turns -= 1
    end

    def switch_player!
        @current_player = @current_player == @players[0] ? @players[1] : @players[0]
    end

    def check_game_over
        if @turns == 0
            @game_over = true
            puts "It's a tie!"
            @game_over = true
        end

        if WINNING_COMBINATIONS.any? {|combination| combination == @board.each_index.select{|i| @board[i] == @current_player.marker}}
            @game_over = true
            puts "#{@current_player.name} wins!"
            @game_over = true
        end
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
game.play