class Player
    attr_accessor :points, :games_played, :name, :remaining_turns

    def initialize (name)
        @name = name
        @points = 0
        @games_played = 0
        @remaining_turns = 3
    end
end
