class TerracesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @terraces = policy_scope(Terrace).all
    if params[:query].present?
      @markers = @terraces.near(params[:query]).geocoded.map do |terrace|
        {
          lat: terrace.latitude,
          lng: terrace.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { terrace: terrace })
        }
      end
    else
      @markers = @terraces.geocoded.map do |terrace|
        {
          lat: terrace.latitude,
          lng: terrace.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { terrace: terrace })
        }
      end
    end

    if params[:query].present?
      @terraces = policy_scope(Terrace).near(params[:query])
    else
      @terraces = policy_scope(Terrace).all
    end
  end

  def show
    @terrace = Terrace.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @markers = [{
      lat: @terrace.latitude,
      lng: @terrace.longitude
    }]
  end

  def new
    @terrace = Terrace.new
  end

  def create
    @terrace = Terrace.new(terrace_params)
    @terrace.user = current_user
    authorize @terrace
    if @terrace.save
      redirect_to terrace_path(@terrace.id)
    else
      render :new
    end
  end

  def edit
    @terrace = Terrace.find(params[:id])
    authorize @terrace
  end

  def update
    @terrace = Terrace.find(params[:id])
    @terrace.update(terrace_params)

    redirect_to terrace_path(@terrace.id)
    authorize @terrace
  end

  def destroy
    @terrace = Terrace.find(params[:id])
    @terrace.destroy

    redirect_to terraces_path
    authorize @terrace
  end

  private

  def terrace_params
    params.require(:terrace).permit(:title, :description, :size, :floor, :price, :address, photos: [])
  end
end
