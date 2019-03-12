class Admin::PoisController < Admin::BaseController
  before_action :set_poi, only: [:show, :edit, :update, :destroy]

  # GET /pois
  # GET /pois.json
  def index
    @pois = Poi.all
                    
    #render json: @pois, :include => [:landmarks => {:only => :id}]            
  end

  # GET /pois/1
  # GET /pois/1.json
  def show
  end

  # GET /pois/new
  def new
    @poi = Poi.new
    gon.lat = nil
    gon.lng = nil
  end

  # GET /pois/1/edit
  def edit
  end

  # POST /pois
  # POST /pois.json
  def create
    @poi = Poi.new(poi_params)

    respond_to do |format|
      if @poi.save
        format.html { redirect_to admin_pois_index_path, notice: 'Poi was successfully created.' }
        format.json { render :show, status: :created, location: @poi }
      else
        format.html { render :new }
        format.json { render json: @poi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pois/1
  # PATCH/PUT /pois/1.json
  def update
    respond_to do |format|
      if @poi.update(poi_params)
        format.html { redirect_to admin_pois_index_path, notice: 'Poi was successfully updated.' }
        format.json { render :show, status: :ok, location: @poi }
      else
        format.html { render :edit }
        format.json { render json: @poi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pois/1
  # DELETE /pois/1.json
  def destroy
    @poi.destroy
    respond_to do |format|
      format.html { redirect_to admin_pois_index_path, notice: 'Poi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poi
      @poi = Poi.find(params[:id])
      coordinate = @poi.coordinate
      if coordinate
        lat = coordinate.split(",").first.to_f
        lng = coordinate.split(",").second.to_f
        gon.lat = lat
        gon.lng = lng
      else
        gon.lat = nil
        gon.lng = nil
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poi_params
      params.require(:poi).permit(:title, :description, :coordinate, :popular,:city,:country_id, :lat, :lng, :address,:avatar, landmark_attributes: [:id, :lat, :lng, :name, :description, :_destroy, :cover_photo])
    end
end
