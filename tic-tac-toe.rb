class Tic_tac_toe
    @@board =  "___|___|___\n___|___|___\n   |   |   "
    @@rows = []
    def initialize (player, letter)
        @player = player
        @letter = letter
    end

    class << self
        def rows 
            @@rows = [
                #board
                row1 = [@@board[1], @@board[5], @@board[9]],
                row2 = [@@board[13], @@board[17], @@board[21]],
                row3 = [@@board[25], @@board[29], @@board[33]],
            
                row4 = [@@board[1], @@board[13], @@board[25]],
                row5 = [@@board[5], @@board[17], @@board[29]],
                row6 = [@@board[9], @@board[21], @@board[33]],
                row7 = [@@board[1], @@board[17], @@board[33]],
                row8 = [@@board[9], @@board[17], @@board[25]]
            ]
        end
    end

    def check
        @@rows.each_with_index do |row, num|
            if row.all? {|place| place == @letter}
                puts "#{@player}! You won!"
                $win = true
            end
        end
    end

    class << self 
        def reset_board
            @@board = "___|___|___\n___|___|___\n   |   |   "
        end
    end

    class << self
        def show_board
            puts @@board
        end
    end

    def move
        puts "#{@player}, what is your move?"
        mv = gets.chomp
        if mv == 'exit'
            puts 'exiting...'
            $brk = true
        elsif mv == 'restart'
            puts 'restarting...'
            $restart = true
            @@board = "___|___|___\n___|___|___\n   |   |   "
        elsif mv != 'exit' || mv != 'restart'
            #place letters on board
            allowed_nums = [0, 1, 2]
            row = mv[0].to_i
            column = mv[2].to_i
            if allowed_nums.any? {|e| e == row} == true && allowed_nums.any? {|e| e == column} && mv.length == 3
                if row == 0 
                    if column == 0 
                        if @@board[1] == '_'
                            @@board.insert(1, @letter)
                            @@board.slice!(2)
                            puts @@board
                        else 
                            puts "ERROR\nPlace already taken."
                            puts @@board
                            move()
                        end
                    end
                    if column == 1
                        if @@board[5] == '_'
                            @@board.insert(5, @letter)
                            @@board.slice!(6)
                            puts @@board
                        else
                            puts "ERROR\nPlace already taken."
                            puts @@board
                            move()
                        end
                    end
                    if column == 2 
                        if @@board[9] == '_'
                            @@board.insert(9, @letter)
                            @@board.slice!(10)
                            puts @@board
                        else
                            puts "ERROR\nPlace already taken."
                            puts @@board
                            move()
                        end
                    end
                end
    
                if row == 1
                    if column == 0
                        if @@board[13] == '_'
                            @@board.insert(13, @letter)
                            @@board.slice!(14)
                            puts @@board
                        else
                            puts "ERROR\nPlace already taken."
                            puts @@board
                            move()
                        end
                    end
                    if column == 1 
                        if @@board[17] == '_'
                            @@board.insert(17, @letter)
                            @@board.slice!(18)
                            puts @@board
                        else 
                            puts "ERROR\nPlace already taken."
                            puts @@board
                            move()
                        end
                    end
                    if column == 2 
                        if @@board[21] == '_'
                            @@board.insert(21, @letter)
                            @@board.slice!(22)
                            puts @@board
                        else
                            puts "ERROR\nPlace already taken."
                            puts @@board
                            move()
                        end
                    end
                end
    
                if row == 2
                    if column == 0
                        if @@board[25] == ' '
                            @@board.insert(25, @letter)
                            @@board.slice!(26)
                            puts @@board
                        else
                            puts "ERROR\nPlace already taken."
                            puts @@board
                            move()
                        end
                    end
                    if column == 1
                        if @@board[29] == ' '
                            @@board.insert(29, @letter)
                            @@board.slice!(30)
                            puts @@board
                        else
                            puts "ERROR\nPlace already taken."
                            puts @@board
                            move()
                        end
                    end
                    if column == 2
                        if @@board[33] == ' '
                            @@board.insert(33, @letter)
                            @@board.slice!(34)
                            puts @@board
                        else
                            puts "ERROR\nPlace already taken."
                            puts @@board
                            move()
                        end
                    end
                end
            elsif allowed_nums.any? {|e| e != row} && allowed_nums.any? {|e| e != column} && mv.length != 3
                puts "ERROR"
                puts "Move must be a row number followed by a space, then a column number e.g.(0 1)."
                puts "Only 0, 1, and 2 are available numbers to use."
                puts @@board
                move()
            elsif allowed_nums.any? {|e| e != row} && allowed_nums.any? {|e| e != column}
                puts "ERROR"
                puts "Numbers out of range."
                puts "Only 0, 1, and 2 are available numbers to use."
                puts @@board
                move()
            end
        end
    end
end


def round
    $win = false
    Tic_tac_toe.show_board 
    for a in 1..5 do
        #player1 sequence
        $player1.move
        if $brk == true
            exit
        end
        if $restart == true
            game()
        end
        Tic_tac_toe.rows
        $player1.check
        if $win == true
            Tic_tac_toe.reset_board
            round()
        elsif a == 5 && $win != true
            puts "Draw."
            Tic_tac_toe.reset_board
            round()
        end

        #player2 sequence
        $player2.move
        if $brk == true
            exit
        end
        if $restart == true
            game()
        end
        Tic_tac_toe.rows
        $player2.check
        if $win == true
            Tic_tac_toe.reset_board
            round()
        end
    end
end
    
def game
    $restart = false
    $win = false
    puts "Tic-Tac-Toe\nThe rules are simple.\nEnter the row number first followed by a space, then enter the column number\n(e.g. '0 1').\nFirst one to line three of their letters in a row, wins."
    
    #player1 
    puts "Player 1. What is your name?"
    p1name = gets.chomp.to_s
    puts "#{p1name} what letter do you choose? X or O"
    p1letter = gets.chomp.to_s.upcase
    until p1letter == 'X' || p1letter == 'O' do
        puts "ERROR. Invalid letter."
        puts "#{p1name} what letter do you choose? X or O"
        p1letter = gets.chomp.to_s.upcase
    end
    $player1 = Tic_tac_toe.new(p1name, p1letter)

    #player2
    puts "Player 2. What is your name?"
    p2name = gets.chomp.to_s
    if p1letter == 'X'
        p2letter = 'O'
    else 
        p2letter = 'X'
    end
    $player2 = Tic_tac_toe.new(p2name, p2letter)
    if $restart == false 
        round()
    end
end

game()