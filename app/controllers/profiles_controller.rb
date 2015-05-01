class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json


  def index
    @title = 'Buscar Candidatos'
    @filterrific = initialize_filterrific(
      Profile,
      params[:filterrific],
      :select_options => {
        with_education_level: EducationLevel.all,
        with_district_id: District.options_for_select,
        with_province_id: Province.all,
        with_professional_area: ProfessionalArea.all,
        with_educative_area: EducativeArea.options_for_select
        }
      ) or return
    @profiles = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
      # There is an issue with the persisted param_set. Reset it.
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return
    end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @title = "#{@profile.forenames} #{@profile.surnames}"
  end

  # GET /profiles/new
  def new
    @title = current_user.email
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :forenames, :surnames, :email, :sex_id, :marital_status_id, :birth_date, :professional_title, :nationality_id, :country_id, :province_id, :district_id, :township_id, :address, :phone_number, :skills, :wage_aspiration, :presentation, :avatar, :skill_list,
        experiences_attributes: [
          :id, :company, :position, :professional_area_id, :starting_salary, :final_salary, :begin_date, :end_date, :job_description, :_destroy
          ],
        studies_attributes: [
          :id, :institution, :title, :education_level_id, :educative_area_id, :begin_year, :end_year, :finished, :_destroy
          ]
        )
    end
end
