class QuestionsController < ApplicationController
  def home
  end

  def ask
  end

  def answer
    @question = params['question']
    @answer = Coach.new(@question).answer
    respond_to do |format|
      format.html { render 'answer' }
      format.json do
        render json: {
          question: render_to_string(partial: 'questions/reply',
                                     formats: :html,
                                     locals: { author: 'You',
                                               text: @question }),
          answer: render_to_string(partial: 'questions/reply',
                                   formats: :html,
                                   locals: { author: 'Coach',
                                             text: @answer })
        }.to_json
      end
    end
  end
end
