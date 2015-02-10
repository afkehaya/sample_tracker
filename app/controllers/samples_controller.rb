class SamplesController < ApplicationController
  before_action :set_sample, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  respond_to :html
  def home
    @samples = Sample.all
    authorize @samples 
  end

  def admin_only
  end
  
  def index
    @q = Sample.search(params[:q])
    @samples = @q.result(distinct: true).order("created_at DESC").paginate(:page => params[:page], :per_page => 10 )
    respond_with(@samples)
    authorize @samples
  end

  def mysample
    @samples = Sample.all
    authorize @samples
  end

  def import
    @samples = Sample.all
    if params[:file].present?
    Sample.import(params[:file], current_user.id)
    redirect_to root_url, notice: "Samples Imported"
    else
    redirect_to root_url, notice: "You need to choose a file first!"
    end
    authorize @samples
  end

  def show
    respond_with(@sample)
  end

  def new
    @sample = Sample.new
    @checkins = Checkin.all
    respond_with(@sample)
    authorize @sample
  end

  def edit
  end

  def create
    params[:sample][:user_id] = current_user.id
    @sample = Sample.new(sample_params)
    @sample.save
    params[:sample][:checkin_ids].each do |checkin_id| 
        @checkin = Checkin.find(checkin_id)
        @sample.checkins << @checkin
    end

    authorize @sample
    if @sample.save
      redirect_to mysample_url, notice: 'Sample was successfully created.'
    else
      render action: 'new'
    end

  end

  def update
    if @sample.update(sample_params)
      redirect_to root_url, notice: 'Sample was successfully updated.'
    else
      render action: 'edit'
    end
  end


  def destroy
    @sample.destroy
    authorize @sample
    respond_with(@sample)
  end

  private
    def set_sample
      @sample = Sample.find(params[:id])
       authorize @sample
    end

    def sample_params
      params.require(:sample).permit(:line, :season, :style, :color, :date_out, :to_who, :date_in, :location,:user_id)
    end
end
