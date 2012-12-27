class QuestionnairesController < ApplicationController
  
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

  def answer
    @questionnaire = Questionnaire.where("date_from <= ? AND date_to >= ?", Date.today , Date.today ).first
    @users         = User.where("id != ?",current_user.id)
    respond_to do |format|
      format.html
    end
  end
end
