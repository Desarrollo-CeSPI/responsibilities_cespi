class QuestionnairesController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /questionnaires
  def index
    @questionnaires = Questionnaire.all
    @questions = Question.where("name like ?", "%#{params[:q]}%")
  end

  # GET /questionnaires/1
  def show
    @questionnaire = Questionnaire.find(params[:id])
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
  end

  # GET /questionnaires/1/edit
  def edit
    @questionnaire = Questionnaire.find(params[:id])
  end

  # POST /questionnaires
  def create
    @questionnaire = Questionnaire.new(params[:questionnaire])
    
    if @questionnaire.save
      redirect_to @questionnaire, notice: t('views.questionnaires.flashes.created')
    else
      render action: "new"
    end
  end

  # PUT /questionnaires/1
  def update
    @questionnaire = Questionnaire.find(params[:id])

    if @questionnaire.update_attributes(params[:questionnaire])
      redirect_to @questionnaire, notice: t('views.questionnaires.flashes.updated')
    else
      render action: "edit"
    end
  end

  # DELETE /questionnaires/1
  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy

    redirect_to questionnaires_url
  end

  def answer
    @questionnaire = Questionnaire.where("date_from <= ? AND date_to >= ?", Date.today , Date.today ).first

    user_questionnaire = UserQuestionnaire.find_by_questionnaire_id_and_user_id(@questionnaire.id,current_user.id)

    if (user_questionnaire.nil?)
        @users = User.find(current_user.id)
        respond_to do |format|
          format.html
        end
    else
      respond_to do |format| 
        format.html { render "_answered" }
      end
    end

  rescue => e
      respond_to do |format| 
        format.html { render "_no_questionnaire" }
      end    

  end

  def answer_questionnaire
    value_answers = params[:answer]

    value_answers.keys.each do |value_answer_key|
      new_key = value_answer_key.split('_')
      
      answer_value_temp = AnswerValue.new

      if (new_key.length < 3 )
        new_key[2] = current_user.user_name
        answer_value_temp.from = current_user
      end
    
      answer_value_temp.questionnaire_id = params[:questionnaire]
      answer_value_temp.who = User.find_by_user_name(new_key[2])
      answer_value_temp.answer_id = value_answers[value_answer_key]
      answer_value_temp.value = 0

      answer_value_temp.save
    end

    user_questionnaire = UserQuestionnaire.new

    user_questionnaire.user = current_user
    user_questionnaire.questionnaire = Questionnaire.find(params[:questionnaire])

    user_questionnaire.save

    redirect_to answer_questionnaire_url
    
    rescue ActiveRecord::RecordNotUnique => e
      redirect_to answer_questionnaire_url
  end

  def close
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.close unless (@questionnaire.date_to < Date.today)
    redirect_to questionnaires_url
  end
end
