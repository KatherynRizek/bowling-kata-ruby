class Game
    def initialize()
        @score = 0
        @frame_scores = Array.new(21, 0)
        @current_roll = 0
        @isSpare = false
    end

    def roll(pins)
        @frame_scores[@current_roll] = pins
        @current_roll += 1
    end


    def score()
        scoreSum = 0
        prevScore = 0
        @frame_scores.each do |scoreNow|
            scoreNow = scoreNow.to_i
            if @isSpare
                scoreNow = scoreNow * 2
                @isSpare = false
            end
            if prevScore + scoreNow == 10
                @isSpare = true
            end
            scoreSum += scoreNow
            prevScore = scoreNow
        end
        return scoreSum
    end

end