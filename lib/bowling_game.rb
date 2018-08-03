class Game
    def initialize()
        @frame_scores = Array.new(21, 0)
        @current_roll = 0
    end

    def roll(pins)
        @frame_scores[@current_roll] = pins
        puts @frame_scores[@current_roll]
        @current_roll += 1
    end

    def score()
        score = 0
        current_frame = 0
        i = 0
        until i >= 10 do 
            if self.isStrike(current_frame)
                score += 10 + @frame_scores[current_frame + 1] + @frame_scores[current_frame + 2]
                current_frame += 1
            elsif self.isSpare(current_frame)
                score += 10 + @frame_scores[current_frame + 2]
                current_frame += 2
            else
                score += @frame_scores[current_frame] + @frame_scores[current_frame + 1]
                #puts score
                current_frame += 2
            end
            i += 1
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
        i = 0
        until i >= numRolls do
          self.roll(0)
          i += 1
        end
    end

end