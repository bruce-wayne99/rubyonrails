class SubgenresController < ApplicationController
  before_action :set_subgenre, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize_admin, only: [:index, :show]
  # GET /subgenres
  # GET /subgenres.json
  def index
    set_genre
    @subgenres = @genre.subgenres.all
  end

  # GET /subgenres/1
  # GET /subgenres/1.json
  def show
  end

  # GET /subgenres/new
  def new
    set_genre
    @subgenre = @genre.subgenres.new
  end

  # GET /subgenres/1/edit
  def edit
  end

  # POST /subgenres
  # POST /subgenres.json
  def create
    set_genre
    @subgenre = @genre.subgenres.new(subgenre_params)

    respond_to do |format|
      if @subgenre.save
        format.html { redirect_to subgenres_link_url, notice: 'Subgenre was successfully created.' }
        format.json { render :show, status: :created, location: @subgenre }
      else
        format.html { render :new }
        format.json { render json: @subgenre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subgenres/1
  # PATCH/PUT /subgenres/1.json
  def update
    respond_to do |format|
      if @subgenre.update(subgenre_params)
        format.html { redirect_to subgenres_link_url(@subgenre.genre_id), notice: 'Subgenre was successfully updated.' }
        format.json { render :show, status: :ok, location: @subgenre }
      else
        format.html { render :edit }
        format.json { render json: @subgenre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subgenres/1
  # DELETE /subgenres/1.json
  def destroy
    @subgenre.destroy
    respond_to do |format|
      format.html { redirect_to subgenres_link_url(@subgenre.genre_id), notice: 'Subgenre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subgenre
      @subgenre = Subgenre.find(params[:id])
    end
    def set_genre
      @genre = Genre.find(params[:genre_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def subgenre_params
      params.require(:subgenre).permit(:name, :no_of_questions, :genre_id)
    end
end
