class RestController < ApplicationController

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

end