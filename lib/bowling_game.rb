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
        if self.isStrike(@frame_scores[@current_roll-1], @frame_scores.length - 1)
            @current_roll += 1
        end
    end


    def score()
        scoreSum = 0
        i = 0
        isNotFirstStrike = false
        @frame_scores.each do |scoreNow|
            scoreNow = scoreNow.to_i
            if (i >= 2) && self.isSpare(@frame_scores[i-1].to_i, @frame_scores[i-2].to_i, i)
                scoreNow = scoreNow * 2
            elsif (i >= 4) && self.isStrike(@frame_scores[i-4].to_i, i)
                scoreNow = @frame_scores[i-1].to_i  + @frame_scores[i-2].to_i
                if isNotFirstStrike
                    scoreNow += 10
                end
                isNotFirstStrike = true
            end
            i += 1
            scoreSum += scoreNow
        end
        return scoreSum
    end

    def isSpare(previous_score, two_previous_score, frameNum)
        #spares can only be calculated on 3rd and beyond roll of frame
        if (frameNum % 2 == 0) && (previous_score + two_previous_score == 10) && (previous_score != 0)
            return true
        else
            return false
        end
    end

    def isStrike(previous_score, frameNum)
        if (frameNum % 2 == 0) && (previous_score == 10)
            return true
        else
            return false
        end
    end

    def manyRolls(numRolls)
        i = 0
        until i >= numRolls do
          self.roll(0)
          i += 1
        end
    end

end