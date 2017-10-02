class OptionsController < ApplicationController
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  # GET /options
  # GET /options.json
  def index
    set_question
    @options = @question.options.all
  end

  # GET /options/1
  # GET /options/1.json
  def show
  end

  # GET /options/new
  def new
    set_question
    @option = @question.options.new
  end

  # GET /options/1/edit
  def edit
  end

  # POST /options
  # POST /options.json
  def create
    set_question
    @option = @question.options.new(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to options_link_url, notice: 'Option was successfully created.' }
        format.json { render :show, status: :created, location: @option }
      else
        format.html { render :new }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /options/1
  # PATCH/PUT /options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to options_link_url(@option.question_id), notice: 'Option was successfully updated.' }
        format.json { render :show, status: :ok, location: @option }
      else
        format.html { render :edit }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to options_link_url(@option.question_id), notice: 'Option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_params
      params.require(:option).permit(:answer, :isanswer, :question_id)
    end
end
