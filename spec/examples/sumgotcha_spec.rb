require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../gotchas/sum_gotcha'

describe SumGotcha do

  before(:all) do
    Gotcha.unregister_all_types
    Gotcha.register_type(SumGotcha)
  end

  it 'should be able to pose a question for a sum of two numbers' do
    gotcha = Gotcha.random
    matches = gotcha.question.match(/\AWhat is the sum of (\d+) and (\d+)\?\z/) || gotcha.question.match(/\AWhat is (\d+) \+ (\d)+\?\z/)

    # should get the right answer for this simple one
    matches.should_not be_nil
    gotcha.correct?($1.to_i + $2.to_i).should be_true
  end

  it 'can internationalize the question' do
    gotcha = Gotcha.random

    store_translations(:en, :gotcha => { :sum_gotcha => { :question_1 => "Add %{number_1} and %{number_2}", :question_2 => "Sum %{number_1} and %{number_2}" } }) do
      matches = gotcha.question.match(/\AAdd (\d+) and (\d+)\z/) || gotcha.question.match(/\ASum (\d+) and (\d+)\z/)
      matches.should_not be_nil
    end
  end

end
