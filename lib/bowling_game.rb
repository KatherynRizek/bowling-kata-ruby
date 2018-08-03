class Game
    def initialize()
        @frame_scores = Array.new(21, 0)
        @current_roll = 0
    end

    def roll(pins)
        @frame_scores[@current_roll] = pins
        @current_roll += 1
    end

    def score()
        score = 0
        frame_roll = 0
        10.times do 
            if self.isStrike(frame_roll)
                score += 10 + @frame_scores[frame_roll + 1] + @frame_scores[frame_roll + 2]
                frame_roll += 1
            elsif self.isSpare(frame_roll)
                score += 10 + @frame_scores[frame_roll + 2]
                frame_roll += 2
            else
                score += @frame_scores[frame_roll] + @frame_scores[frame_roll + 1]
                frame_roll += 2
            end
        end
        return score
    end

    def isSpare(roll)
        if (@frame_scores[roll] + @frame_scores[roll + 1]) == 10
            return true
        else
            return false
        end
    end

    def isStrike(roll)
        if @frame_scores[roll] == 10
            return true
        else
            return false
        end
    end

    def multiRolls(numRolls)
        numRolls.times do
          self.roll(0)
        end
    end
end