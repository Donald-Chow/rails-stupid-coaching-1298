class QuestionsController < ApplicationController
  def ask
  end

  def answer
    @question = params['question']
    @answer = Coach.new(@question).answer
  end
end
