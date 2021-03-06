  class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy,:show_page,:edit_city]

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    @commentable= City.find(params[:id])
    @comment=Comment.new
  end
  def show_page
   render 'cities/show_page'
  end
  
  # GET /cities/new
  def new
    @city = City.new
  end
  
  def upvote
   @city = City.find(params[:id])
    @city.upvote_by current_user
    respond_to do |format|
      format.js { render :file=>  'cities/cities.js.erb'}
    end
  end

  def downvote
   @city = City.find(params[:id])
    @city.downvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js {render :file=> 'cities/cities.js.erb'}
    end
   end

  
  # GET /cities/1/edit
  def edit
   
  end

  def comments
    @commentable= City.find(params[:id])
    @comment= @commentable.comments.create(comment_params)
    @comment.save
    redirect_to city_path
  end 

  def edit_city
    render 'cities/edit_city'
  end
  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
   respond_to do |format|
      if @city.update(city_params)
         @cities = City.all
        format.js { render :file=> 'cities/update_cities.js.erb', notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def get_cities
    @cities= City.where(:state_id=>params[:state])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_city
   @city = City.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  
  def city_params
    params.require(:city).permit(:city_name, :state_id)
  end
end
