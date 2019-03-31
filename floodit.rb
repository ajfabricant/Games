require "console_splash"
require "colorize"

def splash_screen()

    begin
        system "clear"
        splash = ConsoleSplash.new(15, 44)
        splash.write_header("FloodIt", "Andrew Fabricant", "1.0")
        splash.write_horizontal_pattern("@")
        splash.write_vertical_pattern("@")
        splash.write_center(-3, "PRESS ENTER TO CONTINUE")
        splash.splash
    end until gets == "\n"

    main_menu(12, 12, -1)

end

def main_menu(width, height, high_score)

    system "clear"

    puts "Main menu:".bold
    puts "\n"
    puts "s = " + "Start Game".underline
    puts "c = " + "Change Level".underline
    puts "q = " + "Quit".underline

    if width * height < 144
        if high_score == -1
            puts "\n"
            puts "Easy".bold.green + ": " + "No games played yet.".italic
        else high_score > -1
            puts "\n"
            puts "Best game on ".bold + "Easy".green.bold + ": " + "#{high_score} turns".italic
        end
    end

    if (width * height >= 144) && (width * height < 289)
        if high_score == -1
            puts "\n"
            puts "Medium".bold.yellow + ": " + "No games played yet.".italic
        else high_score > -1
            puts "\n"
            puts "Best game on ".bold + "Medium".yellow.bold + ": " + "#{high_score} turns".italic
        end
    end

    if width * height >= 289
        if high_score == -1
            puts "\n"
            puts "Difficult".bold.red + ": " + "No games played yet.".italic
        else high_score > -1
            puts "\n"
            puts "Best game on ".bold + "Difficult".red.bold + ": " + "#{high_score} turns".italic
        end
    end

=begin

    if high_score == -1
        puts "\n"
        puts "No games played yet.".italic
    elsif width * height >= 289
        puts "\n"
        puts "Best game ".bold + "(Difficult)".red.bold + ": " + "#{high_score} turns".italic
    elsif (width * height >= 144) && (width * height < 289)
        puts "\n"
        puts "Best game ".bold + "(Medium)".yellow.bold + ": " + "#{high_score} turns".italic
    else
        puts "\n"
        puts "Best game ".bold + "(Easy)".green.bold + ": " + "#{high_score} turns".italic
    end

=end

    puts "\n"
    puts "Please enter your choice" + ": ".blink
    status = gets.chomp

    if status.downcase == "s"
        start_game(width, height, high_score)
    elsif status.downcase == "c"
        settings(width, height, high_score)
    elsif status.downcase == "q"
        exit
    else
        main_menu(width, height, high_score)
    end

end

def settings(width, height, high_score)

    puts "\n"
    puts "Levels".bold + ":"
    puts "\n"
    puts "Easy".green.underline + ": " + "Width = 0 to 11 | Height = 0 to 11 | Maximum High Score = 30".italic
    puts "\n"
    puts "Medium".yellow.underline + ": " + "Width = 12 to 17 | Height = 12 to 17 | Maximum High Score = 40".italic
    puts "\n"
    puts "Difficult".red.underline + ": " + "Width = 17+ | Height = 17+ | Maximum High Score = 50".italic
    puts "\n"

    print "Enter new Width ".bold + "(currently #{width})" + ": ".blink
    x = gets.chomp.to_i
    while x <= 0 do
        print "Enter new Width ".bold + "(currently #{width})" + ": ".blink
        x = gets.chomp.to_i
    end

    print "Enter new Height ".bold + "(currently #{height})" + ": ".blink
    y = gets.chomp.to_i
    while y <= 0 do
        print "Enter new Height ".bold + "(currently #{height})" + ": ".blink
        y = gets.chomp.to_i
    end

    high_score = -1

    if (width != x) || (height != y)

    width = x
    height = y

    main_menu(width, height, high_score)

    end

end

def start_game(width, height, high_score)

    board = get_board(width, height)
    game_play(board, false, 0, high_score)

end

def get_board(width, height)

    color = [:red, :light_red, :green, :light_green, :blue, :light_blue, :yellow, :light_yellow, :magenta, :light_magenta, :cyan, :light_cyan]
    return Array.new(height) { Array.new(width) { color[rand(0..11)] } }

end

def free_board(width, height)

  return Array.new(height) { Array.new(width) {-1} }

end

def game_play(board, game_won, counter_turns, high_score)

    system "clear"
    width = board[0].length
    height = board.length

    print_board(board)

    puts "\n"
    puts "Turns taken: #{counter_turns}"

    if width * height >= 289

        if (50 - counter_turns) >= 15

            puts "Turns left: " + "#{50 - counter_turns}".green

        elsif ((50 - counter_turns) >= 11) && ((50 - counter_turns) < 15)

            puts "Turns left: " + "#{50 - counter_turns}".yellow

        else

            puts "Turns left: " + "#{50 - counter_turns}".red.blink

        end

        percentage = completed_percent(board)
        puts "Current completion: #{percentage}%"

        if 50 - counter_turns == 0

            puts "GAME OVER".red.blink
            puts "Press Enter to Return to Main Menu"

            user_response = gets

            while user_response != "\n" do
                user_response = gets
            end

            main_menu(width, height, high_score)

        end

    elsif (width * height >= 144) && (width * height < 289)

        if (40 - counter_turns) >= 15

            puts "Turns left: " + "#{40 - counter_turns}".green

        elsif ((40 - counter_turns) >= 11) && ((40 - counter_turns) < 15)

            puts "Turns left: " + "#{40 - counter_turns}".yellow

        else

            puts "Turns left: " + "#{40 - counter_turns}".red.blink

        end

        percentage = completed_percent(board)
        puts "Current completion: #{percentage}%"

        if 40 - counter_turns == 0

            puts "GAME OVER".red.blink
            puts "Press Enter to Return to Main Menu"

            user_response = gets

            while user_response != "\n" do
                user_response = gets
            end

            main_menu(width, height, high_score)

        end

    else

        if (30 - counter_turns) >= 15

            puts "Turns left: " + "#{30 - counter_turns}".green

        elsif ((30 - counter_turns) >= 11) && ((30 - counter_turns) < 15)

            puts "Turns left: " + "#{30 - counter_turns}".yellow

        else

            puts "Turns left: " + "#{30 - counter_turns}".red.blink

        end

        percentage = completed_percent(board)
        puts "Current completion: #{percentage}%"

        if 30 - counter_turns == 0

            puts "GAME OVER".red.blink
            puts "Press Enter to Return to Main Menu"

            user_response = gets

            while user_response != "\n" do
                user_response = gets
            end

            main_menu(width, height, high_score)

        end

    end

    if (!game_won)

        puts "\n"
        puts "Choose a color: ".bold
        color_input = gets.chomp

        if color_input.downcase == "r" && board[0][0] != :red
            board = update_board(board, :red, board[0][0], 0, 0, free_board(width, height))
            game_won = true if completed_percent(board) == 100
            game_play(board, game_won, counter_turns + 1, high_score)

        elsif color_input.downcase == "lr" && board[0][0] != :light_red
            board = update_board(board, :light_red, board[0][0], 0, 0, free_board(width, height))
            game_won = true if completed_percent(board) == 100
            game_play(board, game_won, counter_turns + 1, high_score)

        elsif color_input.downcase == "g" && board[0][0] != :green
            board = update_board(board, :green, board[0][0], 0, 0, free_board(width, height))
            game_won = true if completed_percent(board) == 100
            game_play(board, game_won, counter_turns + 1, high_score)

        elsif color_input.downcase == "lg" && board[0][0] != :light_green
            board = update_board(board, :light_green, board[0][0], 0, 0, free_board(width, height))
            game_won = true if completed_percent(board) == 100
            game_play(board, game_won, counter_turns + 1, high_score)

        elsif color_input.downcase == "b" && board[0][0] != :blue
            board = update_board(board, :blue, board[0][0], 0, 0, free_board(width, height))
            game_won = true if completed_percent(board) == 100
            game_play(board, game_won, counter_turns + 1, high_score)

        elsif color_input.downcase == "lb" && board[0][0] != :light_blue
            board = update_board(board, :light_blue, board[0][0], 0, 0, free_board(width, height))
            game_won = true if completed_percent(board) == 100
            game_play(board, game_won, counter_turns + 1, high_score)

        elsif color_input.downcase == "y" && board[0][0] != :yellow
            board = update_board(board, :yellow, board[0][0], 0, 0, free_board(width, height))
            game_won = true if completed_percent(board) == 100
            game_play(board, game_won, counter_turns + 1, high_score)

        elsif color_input.downcase == "ly" && board[0][0] != :light_yellow
            board = update_board(board, :light_yellow, board[0][0], 0, 0, free_board(width, height))
            game_won = true if completed_percent(board) == 100
            game_play(board, game_won, counter_turns + 1, high_score)

        elsif color_input.downcase == "m" && board[0][0] != :magenta
            board = update_board(board, :magenta, board[0][0], 0, 0, free_board(width, height))
            game_won = true if completed_percent(board) == 100
            game_play(board, game_won, counter_turns + 1, high_score)

        elsif color_input.downcase == "lm" && board[0][0] != :light_magenta
            board = update_board(board, :light_magenta, board[0][0], 0, 0, free_board(width, height))
            game_won = true if completed_percent(board) == 100
            game_play(board, game_won, counter_turns + 1, high_score)

        elsif color_input.downcase == "c" && board[0][0] != :cyan
            board = update_board(board, :cyan, board[0][0], 0, 0, free_board(width, height))
            game_won = true if completed_percent(board) == 100
            game_play(board, game_won, counter_turns + 1, high_score)

        elsif color_input.downcase == "lc" && board[0][0] != :light_cyan
            board = update_board(board, :light_cyan, board[0][0], 0, 0, free_board(width, height))
            game_won = true if completed_percent(board) == 100
            game_play(board, game_won, counter_turns + 1, high_score)

        elsif color_input.downcase == "q"
            main_menu(width, height, high_score)

        else
            game_play(board, game_won, counter_turns, high_score)

        end

    else

        puts "You won in #{counter_turns} turns!".green.blink

        if high_score == -1
            high_score = counter_turns
        elsif high_score > counter_turns
            high_score = counter_turns
        end

        user_response = gets

        while user_response != "\n" do
            user_response = gets
        end

        main_menu(width, height, high_score)

    end

end

def print_board(board)
    board.each do |row|
        row.each do |x|
            print "  ".colorize(:background => x)
        end
        puts
    end
end

def update_board(board, x, old, i, j, arr)

    width = board[0].length
    height = board.length

    board[i][j] = x

    arr[i][j] = 0

    if i < height - 1 && board[i+1][j] == old && arr[i+1][j] == -1
        update_board(board, x, old, i + 1, j, arr)
    end

    if i > 0 && board[i-1][j] == old && arr[i-1][j] == -1
        update_board(board, x, old, i - 1, j, arr)
    end

    if j < width - 1 && board[i][j+1] == old && arr[i][j+1] == -1
        update_board(board, x, old, i, j + 1, arr)
    end

    if j > 0 && board[i][j-1] == old && arr[i][j-1] == -1
        update_board(board, x, old, i, j - 1, arr)
    end

    return board

end

def completed_percent(board)

    color_to_search = board[0][0]
    num = 0
    board.each do |row|
        row.each do |cell|
            num += 1 if cell == color_to_search
        end
    end

    total_blocks = board[0].length * board.length
    return (num * 100) / total_blocks

end

splash_screen
