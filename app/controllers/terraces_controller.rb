class TerracesController < ApplicationController
  def index
    @terraces = Terrace.all
    @markers = @terraces.geocoded.map do |terrace|
      {
        lat: terrace.latitude,
        lng: terrace.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { terrace: terrace })
      }
    end
  end

  def show
    @terrace = Terrace.find(params[:id])
  end

  def new
    @terrace = Terrace.new
  end

  def create
    @terrace = Terrace.new(terrace_params)
    if @terrace.save
      redirect_to terrace_path(@terrace.id)
    else
      render :new
    end
  end

  private

  def terrace_params
    params.require(:terrace).permit(:description, :size, :floor, :price, photos: [])
  end
end
