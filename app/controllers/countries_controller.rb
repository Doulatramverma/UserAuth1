class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy,:show_page,:edit_country]

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.all
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    @commentable=Country.find(params[:id])
    @comment=Comment.new

  end
  def show_page
   render 'countries/show_page'
  end

  def upvote
   @country = Country.find(params[:id])
    @country.upvote_by current_user
    respond_to do |format|
      format.js { render :file=>  'countries/countries.js.erb'}
    end
  end

  def downvote
   @country = Country.find(params[:id])
    @country.downvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js {render :file=> 'countries/countries.js.erb'}
    end
   end


  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
  end

  def comments
    @commentable= Country.find(params[:id])
    @comment= @commentable.comments.create(comment_params)
    @comment.save
    redirect_to country_path
  end 

  def edit_country
    render 'countries/edit_country'
 end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)
    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        @countries=Country.all
        format.js { render :file=> 'countries/update_countries.js.erb',  notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
  def set_country
    @country = Country.find(params[:id])
  end


  def comment_params
   params.require(:comment).permit(:commenter, :body)
  end

  def country_params
    params.require(:country).permit(:country_name, :country_code)
  end
end
