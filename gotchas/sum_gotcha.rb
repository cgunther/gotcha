class SumGotcha < Gotcha::Base

  DEFAULT_MIN = 0
  DEFAULT_MAX = 20

  def initialize
    @rand1 = self.class.random_number_in_range
    @rand2 = self.class.random_number_in_range

    @question_variation = rand(2)
    # @question = ["What is the sum of #{rand1} and #{rand2}?", "What is #{rand1} + #{rand2}?"][rand(2)]
    @answer = @rand1 + @rand2
  end

  private

  def self.max
    @@max ||= DEFAULT_MAX
  end

  def self.min
    @@min ||= DEFAULT_MIN
  end

  def self.random_number_in_range
    rand(self.max - self.min) + self.min
  end

  def i18n_question_key
    "#{super}_#{@question_variation + 1}"
  end

  def default_i18n_question
    ["What is the sum of %{number_1} and %{number_2}?", "What is %{number_1} + %{number_2}?"][@question_variation]
  end

  def i18n_interpolations
    {
      :number_1 => @rand1,
      :number_2 => @rand2,
    }
  end

end

Gotcha.register_type SumGotcha
