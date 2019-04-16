require './player'
require './game'

player1 = Player.new 'player1'
player2 = Player.new 'player2'

game = Game.new player1, player2
game.start_game