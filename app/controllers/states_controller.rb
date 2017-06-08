class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy,:show_page,:edit_state]

  # GET /states
  # GET /states.json
  def index
    @states = State.all
  end

  # GET /states/1
  # GET /states/1.json
  def show
    @commentable=State.find(params[:id])
    @comment=Comment.new
  end
   def show_page
    render 'states/show_page' 
   end
  # GET /states/new
  def new
    @state = State.new
  end

  # GET /states/1/edit
  def edit
  end

  def upvote
   @state = State.find(params[:id])
    @state.upvote_by current_user
    respond_to do |format|
      format.js { render :file=>  'states/states.js.erb'}
    end
  end

  def downvote
   @state = State.find(params[:id])
    @state.downvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js {render :file=> 'states/states.js.erb'}
    end
   end


  def comments
    @commentable=State.find(params[:id])
    @comment=@commentable.comments.create(comment_params)
    @comment.save
    redirect_to state_path
  end
  def edit_state
    render 'states/edit_state'
  end

  # POST /states
  # POST /states.json
  def create
    @state = State.new(state_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to @state, notice: 'State was successfully created.' }
        format.json { render :show, status: :created, location: @state }
      else
        format.html { render :new }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
    respond_to do |format|
      if @state.update(state_params)
        @states=State.all
        format.js { render :file=>'states/update_states.js.erb', notice: 'State was successfully updated.' }
        format.json { render :show, status: :ok, location: @state }
      else
        format.html { render :edit }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
    @state.destroy
    respond_to do |format|
      format.html { redirect_to states_url, notice: 'State was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def get_states
    @states= State.where(:country_id=>params[:country])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_state
    @state = State.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:commenter,:body)
  end

    
  def state_params
   params.require(:state).permit(:state_name, :country_id)
  end
end
