class UserRegionsController < ApplicationController
  before_action :set_user_region, only: [:show, :edit, :update, :destroy]

  # GET /user_regions
  # GET /user_regions.json
  def index
    @user_regions = UserRegion.all
  end

  # GET /user_regions/1
  # GET /user_regions/1.json
  def show
  end

  # GET /user_regions/new
  def new
    @user_region = UserRegion.new
  end

  # GET /user_regions/1/edit
  def edit
  end

  # POST /user_regions
  # POST /user_regions.json
  def create
    @user_region = UserRegion.new(user_region_params)
    if params[:user_region][:right_value].present?
      @user_region=UserRegion.find_by_region_id(params[:user_region][:region_id])
      @user_region.destroy
      redirect_to :back
      else
      @user_region = UserRegion.new(user_region_params)
      @user_region.right=true
      # @user_region.left == true
  
     respond_to do |format|
       if @user_region.save
         format.html { redirect_to @user_region, notice: 'User region was successfully created.' }
         format.json { render :show, status: :created, location: @user_region }
         else
         format.html { render :new }
         format.json { render json: @user_region.errors, status: :unprocessable_entity }
       end
      end
    end
  end

  # PATCH/PUT /user_regions/1
  # PATCH/PUT /user_regions/1.json
  def update
    respond_to do |format|
      if @user_region.update(user_region_params)
        format.html { redirect_to @user_region, notice: 'User region was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_region }
      else
        format.html { render :edit }
        format.json { render json: @user_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_regions/1
  # DELETE /user_regions/1.json
  def destroy
    @user_region.destroy
    respond_to do |format|
      format.html { redirect_to user_regions_url, notice: 'User region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_region
      @user_region = UserRegion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_region_params
      params.require(:user_region).permit(:region_name,:user_id, :region_id,:left,:right)
    end
end
