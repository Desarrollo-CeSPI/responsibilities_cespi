class QuestionsController < ApplicationController

  # GET /questions
  def index
    @questions = Question.all

    # FIXME: busca la clase ArrayPolice, que esta creada. Pero es muy feo !!
    authorize @questions
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
    authorize @question
  end

  # GET /questions/new
  def new
    @question = Question.new
    authorize @question
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    authorize @question
  end

  # POST /questions
  def create
    @question = Question.new(params[:question])

    authorize @question

    if @question.save
      redirect_to @question, notice: t('views.questions.flashes.created')
    else
      render action: "new"
    end
  end

  # PUT /questions/1
  def update
    @question = Question.find(params[:id])
    authorize @question
    if @question.update_attributes(params[:question])
      redirect_to @question, notice: t('views.questions.flashes.updated')
    else
      render action: "edit"
    end
  end

  # DELETE /questions/1
  def destroy
    @question = Question.find(params[:id])
    authorize @question
    @question.destroy

    redirect_to questions_url
  end
end
