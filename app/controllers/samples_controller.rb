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
    @samples = @q.result(distinct: true)
    respond_with(@samples)
    authorize @samples
  end

  def show
    respond_with(@sample)
  end

  def new
    @sample = Sample.new
    respond_with(@sample)
    authorize @sample
  end

  def edit
  end

   def create
    @sample = Sample.new(sample_params)
   
    if @sample.save
      redirect_to @sample, notice: 'Sample was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @sample.update(sample_params)
      redirect_to @sample, notice: 'Sample was successfully updated.'
    else
      render action: 'edit'
    end
  end


  def destroy
    @sample.destroy
    respond_with(@sample)
  end

  private
    def set_sample
      @sample = Sample.find(params[:id])
       authorize @sample
    end

    def sample_params
      params.require(:sample).permit(:line, :season, :style, :color, :date_out, :to_who, :date_in, :location)
    end
end
