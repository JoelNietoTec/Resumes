class EstudiesController < ApplicationController
  before_action :set_estudy, only: [:show, :edit, :update, :destroy]

  # GET /estudies
  # GET /estudies.json
  def index
    @estudies = Estudy.all
  end

  # GET /estudies/1
  # GET /estudies/1.json
  def show
  end

  # GET /estudies/new
  def new
    @estudy = Estudy.new
  end

  # GET /estudies/1/edit
  def edit
  end

  # POST /estudies
  # POST /estudies.json
  def create
    @estudy = Estudy.new(estudy_params)

    respond_to do |format|
      if @estudy.save
        format.html { redirect_to @estudy, notice: 'Estudy was successfully created.' }
        format.json { render :show, status: :created, location: @estudy }
      else
        format.html { render :new }
        format.json { render json: @estudy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estudies/1
  # PATCH/PUT /estudies/1.json
  def update
    respond_to do |format|
      if @estudy.update(estudy_params)
        format.html { redirect_to @estudy, notice: 'Estudy was successfully updated.' }
        format.json { render :show, status: :ok, location: @estudy }
      else
        format.html { render :edit }
        format.json { render json: @estudy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estudies/1
  # DELETE /estudies/1.json
  def destroy
    @estudy.destroy
    respond_to do |format|
      format.html { redirect_to estudies_url, notice: 'Estudy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estudy
      @estudy = Estudy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estudy_params
      params.require(:estudy).permit(:profile_id, :institution, :title, :education_level_id, :professional_area_id, :begin_year, :end_year, :finished)
    end
end
