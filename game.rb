require './player'

class Game
    def initialize (player1, player2)
        @player1 = player1
        @player2 = player2
        @game_start = false
        @turn = @player1
    end

    def start_game
        @game_start = true
        while(@game_start)
            question = createQuestion
            puts formatQuestion(@turn, question)
            user_input = gets.chomp.to_i
            result = checkAnswer(@turn, question, user_input)
            if result
                puts "#{@turn.points}"
                @turn.points += 1
                @turn.games_played += 1
                puts "#{@turn.name}: YES! You are correct."
            else
                @turn.games_played += 1
                @turn.remaining_turns -= 1
                puts "#{@turn.name}: Seriously? No!"
            end
            
            if @turn.remaining_turns > 0
                displayPoints(@player1, @player2)
                puts "---- NEW TURN ----"
            else
                if @player1.points > @player2.points
                    winner = @player1
                else
                    winner = @player2
                end
                @game_start = false
                puts "#{winner.name} wins with a score of #{winner.points}/#{winner.games_played} "
                puts "----GAME OVER ----"
                puts "Good bye!"
            end
    
            if @turn.name == @player1.name
                @turn = @player2
            else
                @turn = @player1
            end
        end
    end
end

def createQuestion
    num = [1,2,3,4,5,6,7,8,9,0]
    a = rand(10)
    b = rand(10)
    return [a, b, a+b]
end

def formatQuestion current_player, qArr
    return "#{current_player.name}: What does #{qArr[0]} plus #{qArr[1]} equal?"
end

def displayPoints player1, player2
    return "P1: #{player1.points}/#{player1.games_played} 
    vs #{player2.points}/#{player2.games_played}"
end

def checkAnswer current_player, qArr, answer
    qArr[2] == answer
end