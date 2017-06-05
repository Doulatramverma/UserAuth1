class ManagersController < ApplicationController
	  before_action :set_manager, only: [:show, :edit, :update, :destroy,:show_page,:edit_manager]

 
  def index
    @managers = User.all
  end

  
  def show
  end
 def show_page
   render 'managers/show_page'
  end
  
  def new
    @manager = User.new
    # if params[:start_date].present? 
    #   @manager = User.where('created_at > ? AND created_at < ?', params[:start_date].to_date, params[:end_date].to_date) 
    # end
  end   
  
  def edit
  end
  def edit_manager
     render 'managers/edit_manager'
    end
 
  def create
    @manager = User.new(manager_params)
     @manager.password = 12345678
    respond_to do |format|
      if @manager.save

     Image.create(:image_name=> params[:user][:image_id], :imageable_id=> @manager.id, :imageable_type=> "User")
      #@user.images.create(:image_name=> params[:user][:image_id])
       
        format.html { redirect_to  managers_path, notice: 'Manager was successfully created.' }
        format.json { render :show, status: :created, location: @manager }
       else
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @manager.update(manager_params)
         @managers=User.all
        format.js { render :file=> 'managers/update_managers.js.erb',  notice: 'Manager was successfully updated.'}
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
      format.html { redirect_to managers_path, notice: 'Manager was successfully destroyed.' }
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


