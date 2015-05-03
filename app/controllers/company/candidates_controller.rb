class Company::CandidatesController < Company::BaseController
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
    @title = "Perfil del Candidato: #{@profile.forenames} #{@profile.surnames}"
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
