class BackwardGotcha < Gotcha::Base

  MIN_STRING_LENGTH = 8
  MAX_STRING_LENGTH = 15

  CHARS = ('a'..'z').to_a + ('0'..'9').to_a

  def initialize
    string_length = rand(MAX_STRING_LENGTH - MIN_STRING_LENGTH) + MIN_STRING_LENGTH
    @string = (0...string_length).collect { CHARS[Kernel.rand(CHARS.length)] }.join

    @answer = @string.reverse
  end

  def default_i18n_question
    "What is '%{string}' backwards?"
  end

  def i18n_interpolations
    { :string => @string }
  end

end

Gotcha.register_type BackwardGotcha
