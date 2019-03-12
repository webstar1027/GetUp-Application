class LandmarksController < ApplicationController
  before_action :set_landmark, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :user_admin!
  layout 'dashboard'

  # GET /landmarks
  # GET /landmarks.json
  def index
    @landmarks = Landmark.all
  end

  # GET /landmarks/1
  # GET /landmarks/1.json
  def show
  end

  # GET /landmarks/new
  def new
    @landmark = Landmark.new
    gon.lat = nil
    gon.lng = nil
  end

  # GET /landmarks/1/edit
  def edit
  end

  # POST /landmarks
  # POST /landmarks.json
  def create
    @landmark = Landmark.new(landmark_params)

    respond_to do |format|
      if @landmark.save
        format.html { redirect_to @landmark, notice: 'Landmark was successfully created.' }
        format.json { render :show, status: :created, location: @landmark }
      else
        format.html { render :new }
        format.json { render json: @landmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landmarks/1
  # PATCH/PUT /landmarks/1.json
  def update
    respond_to do |format|
      if @landmark.update(landmark_params)
        format.html { redirect_to @landmark, notice: 'Landmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @landmark }
      else
        format.html { render :edit }
        format.json { render json: @landmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landmarks/1
  # DELETE /landmarks/1.json
  def destroy
    @landmark.destroy
    respond_to do |format|
      format.html { redirect_to landmarks_url, notice: 'Landmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landmark
      @landmark = Landmark.find(params[:id])
      gon.lat = @landmark.lat
      gon.lng = @landmark.lng
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def landmark_params
      params.require(:landmark).permit(:lat, :lng, :name, :description)
    end
end
