class QuestionnairesController < ApplicationController
  before_filter :authenticate_user!
  # GET /questionnaires
  # GET /questionnaires.json

  def index
    @questionnaires = Questionnaire.all

    @questions = Question.where("name like ?", "%#{params[:q]}%")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions.all.to_json(:only => [:id, :name_and_type], :methods => [:name_and_type]) }
    end
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
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(params[:questionnaire])
    
    # raise params[:questionnaire].to_yaml

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
        format.json { render json: @questionnaire, status: :created, location: @questionnaire }
      else
        format.html { render action: "new" }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questionnaires/1
  # PUT /questionnaires/1.json
  def update
    @questionnaire = Questionnaire.find(params[:id])

    respond_to do |format|
      if @questionnaire.update_attributes(params[:questionnaire])
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  def answer

    @questionnaire = Questionnaire.where("date_from <= ? AND date_to >= ?", Date.today , Date.today ).first

    user_questionnaire = UserQuestionnaire.find_by_questionnaire_id_and_user_id(@questionnaire.id,current_user.id)

    if (user_questionnaire.nil?)
        @users         = User.where("id != ?",current_user.id)
        respond_to do |format|
          format.html
        end
    else
      respond_to do |format| 
        format.html { render "_answered" }
      end
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
    answer_value_temp.who              = User.find_by_user_name(new_key[2])

    answer_value_temp.answer_id        = value_answers[value_answer_key]
    answer_value_temp.value            = 0

    answer_value_temp.save
  end

  user_questionnaire = UserQuestionnaire.new

  user_questionnaire.user = current_user
  user_questionnaire.questionnaire = Questionnaire.find(params[:questionnaire])

  user_questionnaire.save

  rescue ActiveRecord::RecordNotUnique => e
    redirect_to questionnaires_url
end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy

    respond_to do |format|
      format.html { redirect_to questionnaires_url }
      format.json { head :no_content }
    end
  end

  def close
    @questionnaire = Questionnaire.find(params[:id])
    
    @questionnaire.close unless (@questionnaire.date_to < Date.today)

    respond_to do |format|
      format.html { redirect_to questionnaires_url }
      format.json { head :no_content }
    end
  end

  def answer
    @questionnaire = Questionnaire.where("date_from <= ? AND date_to >= ?", Date.today , Date.today ).first
    @users         = User.where("id != ?",current_user.id)
    respond_to do |format|
      format.html
    end
  end

end
