class VacantsController < ApplicationController
  before_action :set_vacant, only: [:show, :edit, :update, :destroy, :postulate]

  # GET /vacants
  # GET /vacants.json
  def index
    @title = 'Buscar Vacantes'
    @filterrific = initialize_filterrific(
      Vacant,
      params[:filterrific],
      :select_options => {
        with_district_id: District.options_for_select,
        with_province_id: Province.all,
        with_job_type_id: JobType.all,
        with_professional_area_id: ProfessionalArea.all
        }
      ) or return
    @vacants = @filterrific.find.reorder("created_at DESC").page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
      # There is an issue with the persisted param_set. Reset it.
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return
  end

#Postular perfil a la vacante
def postulate
  @profile = current_user.user_profile
  @postulation = Postulation.new
  @postulation.profile_id = @profile.id
  @postulation.vacant_id = @vacant.id
  @postulation.postulation_status_id = 1

  respond_to do |format|
    if @postulation.save
      format.html { redirect_to @vacant, notice: 'Postulación enviada' }
    else
      format.html { redirect_to @vacant, alert: 'Error en la postulación' }
    end
  end
end

# GET /vacants/1
# GET /vacants/1.json
def show
  @title = @vacant.position
end

# GET /vacants/new
def new
  @vacant = Vacant.new
end

# GET /vacants/1/edit
def edit
end

# POST /vacants
# POST /vacants.json
def create
  @vacant = Vacant.new(vacant_params)

  respond_to do |format|
    if @vacant.save
      format.html { redirect_to @vacant, notice: 'Vacant was successfully created.' }
      format.json { render :show, status: :created, location: @vacant }
    else
      format.html { render :new }
      format.json { render json: @vacant.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /vacants/1
# PATCH/PUT /vacants/1.json
def update
  respond_to do |format|
    if @vacant.update(vacant_params)
      format.html { redirect_to @vacant, notice: 'Vacant was successfully updated.' }
      format.json { render :show, status: :ok, location: @vacant }
    else
      format.html { render :edit }
      format.json { render json: @vacant.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /vacants/1
# DELETE /vacants/1.json
def destroy
  @vacant.destroy
  respond_to do |format|
    format.html { redirect_to vacants_url, notice: 'Vacant was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_vacant
  @vacant = Vacant.friendly.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def vacant_params
  params.require(:vacant).permit(:position, :professional_area_id, :country_id, :province_id, :district_id, :keywords,    :keyword_list, :due_date, :job_type_id, :wage_offer, :job_description, :active)
end
end
