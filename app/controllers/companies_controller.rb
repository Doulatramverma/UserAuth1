class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy,:show_page,:edit_company]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    #@commentable=Company.find(params[:id])

  end
  def show_page
   render 'companies/show_page'
  end
  

  # GET /companies/new
  def new
    @company = Company.new
    
  end   
  # GET /companies/1/edit
  def edit
  end
   def edit_company
     render 'companies/edit_company'
    end

    def upvote
     @company = Company.find(params[:id])
     @company.upvote_by current_user
     respond_to do |format|
       format.js { render :file=>  'companies/companies.js.erb'}
      end
    end

    def downvote
     @company = Company.find(params[:id])
      @company.downvote_by current_user
      respond_to do |format|
       format.html { redirect_to :back }
       format.js {render :file=> 'companies/companies.js.erb'}
      end
    end


  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
          @companies = Company.all
        format.js { render :file=> 'companies/update_companies.js.erb', notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
        else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :country_id, :state_id, :city_id, :postcode, :start_date, :active)
    end
end
