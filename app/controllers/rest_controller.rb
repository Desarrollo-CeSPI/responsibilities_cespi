class RestController < ApplicationController
  before_filter :authenticate_user!
  def updateQuestionWeight

    @questionnaire = Questionnaire.find(params[:questionnaire_id])

    @questionnaire_question = @questionnaire.questionnaire_questions.where("question_id = ?",params[:question_id])

    @questionnaire_question.first.weight = params[:value]

    @questionnaire_question.first.save();

    respond_to do |format|
      format.json { render json: @questionnaire_question}
    end

  end

  def updateAnswerWeight

    @answer = Answer.find(params[:answer_id])

    @answer.percentage = params[:value]

    @answer.save();


    respond_to do |format|
      format.json { render json: @answer}
    end

  end

  def allQuestions

    @questions = Question.find(:all,:order => "question_type")

    respond_to do |format|
      format.json { render json: @questions.to_json(:only => [:id, :name_and_type], :methods => [:name_and_type]) }
    end
  end

end
