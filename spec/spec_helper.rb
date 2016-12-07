require 'bundler/setup'
require 'action_view'
require 'action_controller'
require File.dirname(__FILE__) + '/../lib/gotcha'

module MiscHelpers
  def store_translations(locale, translations, &block)
    begin
      I18n.backend.store_translations locale, translations
      yield
    ensure
      I18n.reload!
    end
  end
end

RSpec.configure do |config|
  config.include MiscHelpers
end
