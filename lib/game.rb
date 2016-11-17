class Game # :nodoc:
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    score = 0
    frame = 0
    10.times do
      if strike?(frame)
        score += 10 + strike_bonus(frame)
        frame += 1
      elsif spare?(frame)
        score += 10 + spare_bonus(frame)
        frame += 2
      else
        score += sum_of_balls_in_frame(frame)
        frame += 2
      end
    end
    score
  end

  def strike?(frame)
    @rolls[frame] == 10
  end

  def sum_of_balls_in_frame(frame)
    @rolls[frame] + @rolls[frame + 1]
  end

  def spare_bonus(frame)
    @rolls[frame + 2]
  end

  def strike_bonus(frame)
    @rolls[frame + 1] + @rolls[frame + 2]
  end

  def spare?(frame)
    @rolls[frame] + @rolls[frame + 1] == 10
  end
end
