class QuestionsController < ApplicationController
  def home
  end

  def ask
  end

  def answer
    @question = params['question']
    @answer = Coach.new(@question).answer
  end
end
