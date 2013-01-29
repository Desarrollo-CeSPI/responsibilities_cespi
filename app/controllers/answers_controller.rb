class AnswersController < ApplicationController
  
  # GET /answers
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  def show
    @answer = Answer.find(params[:id])
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  def create
    @answer = Answer.new(params[:answer])

    if @answer.save
      redirect_to @answer, notice: t('views.answers.flashes.created')
    else
      render action: "new"
    end
  end

  # PUT /answers/1
  def update
    @answer = Answer.find(params[:id])

    if @answer.update_attributes(params[:answer])
      redirect_to @answer, notice: t('views.answers.flashes.updated')
    else
      format.html { render action: "edit" }
    end
  end

  # DELETE /answers/1
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    
    format.html { redirect_to answers_url }
  end
end
