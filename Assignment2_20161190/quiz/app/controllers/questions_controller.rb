class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize_admin, only: [:quizindex, :fifty_fifty, :audience_poll]
  # GET /questions
  # GET /questions.json
  def index
    set_subgenre
    @questions = @subgenre.questions.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def fifty_fifty
    set_subgenre
    @stat = Stat.find_by(subgenre_id: @subgenre.id, user_id: session['user_id'])
    @questions = @subgenre.questions.all
    @question = @questions[$Iterator]
    @stat.update_attributes(fifty_fifty: 0)
    @options = @question.options.all
    @notAnswer = Array.new
    for option in @options
      if @notAnswer.length == 2
        break
      end
      if option.isanswer == 0
        @notAnswer.push(option.id)
      end
    end
    respond_to do |format|
      format.html{ render :lifelines, notice: 'Audience Poll lifeline.' }
      format.json{ render json: "lifeline has been used", status: :success}
    end
  end

  def audience_poll
    set_subgenre
    @stat = Stat.find_by(subgenre_id: @subgenre.id, user_id: session['user_id'])
    @questions = @subgenre.questions.all
    @question = @questions[$Iterator]
    @stat.update_attributes(audience_poll: 0)
    @options = @question.options.all
    @audiencePoll = Array.new
    set_poll
    respond_to do |format|
      format.html{ render :lifelines, notice: '50-50 lifeline.' }
      format.json{ render json: "lifeline has been used", status: :success}
    end
  end

  def show
  end

  def quizindex
    if !@notAnswer
      set_subgenre
      set_leaderboard
      set_length
      set_score
      set_stat
      increment
      @questions = @subgenre.questions.all
      @question = @questions[$Iterator]
      if @question
        @options = @question.options.all
      else
        @options = nil
      end
    end
  end
  # GET /questions/new
  def new
    set_subgenre
    @question = @subgenre.questions.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    set_subgenre
    @question = @subgenre.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_link_url, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to questions_link_url(@question.subgenre_id), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_link_url(@question.subgenre_id), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_score
      if $Iterator >= 0 && $Iterator < $Length
        @questions = @subgenre.questions.all
        @question = @questions[$Iterator]
        @options = @question.options.all
        @useranswers = params[:answer_ids]
        flag = 0
        if !@useranswers
          flag = 1
        else
          for option in @options
            if @useranswers.include? (option.id).to_s && option.isanswer == 0
              flag = 1
              break
            elsif option.isanswer == 1 &&  !(@useranswers.include? (option.id).to_s)
              flag = 1
              break
            end
          end
        end
        if flag == 0
          @stat = Stat.find_by(subgenre_id: @subgenre.id, user_id: session['user_id'])
          x = @stat.score
          y = @question.score
          @stat.update_attributes(score: x+y)
        end
     end
    end
    def set_leaderboard
      @leaderboard = Leaderboard.find_by(user_id: session['user_id'], subgenre_id: params[:subgenre_id], genre_id: @subgenre.genre_id)
    end
    def set_length
      $Length = @subgenre.questions.all.length
    end

    def set_question
      @question = Question.find(params[:id])
    end

    def set_subgenre
      @subgenre = Subgenre.find(params[:subgenre_id])
    end

    def set_stat
      @stat = Stat.find_by(subgenre_id: @subgenre.id, user_id: session['user_id'])
      if $Iterator + 1 == $Length
        @leaderboard.update_attributes(score: @stat.score)
        @stat.destroy
      else
        @stat.update_attributes(qnumber: $Iterator)
      end
    end

    def set_poll
      val = 0
      x = 0
      for option in @options
        if option.isanswer == 1
          val = rand(61..100)
          @audiencePoll[option.id] = val
        end
      end
      for option in @options
        if option.isanswer == 0
          x = rand(100-val)
          @audiencePoll[option.id] = x
          val += x
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:qtype, :qstring, :subgenre_id, :score, :answer_ids, :picture, :video)
    end
end
