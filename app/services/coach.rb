class Coach
  def initialize(question)
    @question = question
  end

  def coach_answer
    # TODO: return coach answer to your_message
    return "Great!" if @question == "I am going to work right now!"

    return "Silly question, get dressed and go to work!" if @question[-1] == "?"

    "I don't care, get dressed and go to work!"
  end

  def answer
    # TODO: return coach answer to your_message, with additional custom rules of yours!
    return "" if @question == "I am going to work right now!".upcase

    case @question == @question.upcase
    when true
      "I can feel your motivation! #{coach_answer}"
    when false
      coach_answer
    end
  end
end
