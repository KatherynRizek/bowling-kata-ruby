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
        i = 0
        @frame_scores.each do |scoreNow|
            scoreNow = scoreNow.to_i
            if (i >= 2) 
                if (self.isSpare(@frame_scores[i-1].to_i, @frame_scores[i-2].to_i)) == true
                    scoreNow = scoreNow * 2
                end
            end
            i += 1
            scoreSum += scoreNow
        end
        return scoreSum
    end

    def isSpare(previous_score, two_previous_score)
        #spares can only be calculated on 3rd and beyond roll of frame
        if (@current_roll % 2 == 0) && (previous_score + two_previous_score == 10)
            return true
        else
            return false
        end
    end

end