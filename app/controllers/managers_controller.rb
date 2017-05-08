class ManagersController < ApplicationController
	  before_action :set_manager, only: [:show, :edit, :update, :destroy]

 
  def index
    @managers = User.all
  end

  
  def show
  end

  
  def new
    @manager = User.new
    if params[:start_date].present? 
        @manager = User.where('created_at > ?', params[:start_date].to_date)  
      
  end
  end   
  
  def edit
  end

 
  def create
    @manager = User.new(user_params)

    respond_to do |format|
      if @manager.save
        format.html { redirect_to @manager, notice: 'Manager was successfully created.' }
        format.json { render :show, status: :created, location: @manager }
      else
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @manager.update(user_params)
        format.html { redirect_to @manager, notice: 'Manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager }
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_manager
      @manager = User.find(params[:id])
    end

    
    def manager_params
      params.require(:user).permit(:first_name,:last_name, :company_id, :email, :role_id, :start_date,:end_date,:monthly_charge,:notes,:image_id, :active)
    end
end

end
