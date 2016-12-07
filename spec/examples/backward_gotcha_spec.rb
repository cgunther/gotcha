require File.dirname(__FILE__) + '/../spec_helper'

describe BackwardGotcha do

  before(:all) do
    Gotcha.unregister_all_types
    Gotcha.register_type BackwardGotcha
  end

  it 'should be able to ask a question' do
    gotcha = Gotcha.random
    gotcha.question.should match(/\AWhat is '[a-z0-9]+' backwards\?\z/)
  end

  it 'can internationalize the question' do
    gotcha = Gotcha.random

    store_translations(:en, :gotcha => { :backward_gotcha => { :question => "Spell '%{string}' backwards" } }) do
      gotcha.question.should match(/\ASpell '[a-z0-9]+' backwards\z/)
    end
  end

end
