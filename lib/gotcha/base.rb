module Gotcha

  class Base

    attr_reader :answer

    # Determine whether or not an answer is correct
    def correct?(str)
      str = str.is_a?(String) ? str : str.to_s
      str == (@answer.is_a?(String) ? @answer : @answer.to_s) # don't change @answer type
    end

    # A default implementation of down_transform - adds the ability to make transforms fuzzy
    def self.down_transform(text)
      text = text.is_a?(String) ? text.dup : text.to_s
      text.downcase!
      text.gsub! /\s+/, ' '
      text.strip!
      text
    end

    def question
      I18n.t(i18n_question_key, i18n_interpolations.merge(default: default_i18n_question))
    end

    def i18n_question_key
      "gotcha.#{self.class.name.underscore}.question"
    end

    def default_i18n_question
      raise NotImplementedError, "#{self.class} must implement #default_i18n_question to be used when translation is not available"
    end

    # Override in specific gotcha class to pass variables to translated question
    def i18n_interpolations
      {}
    end

  end

end
