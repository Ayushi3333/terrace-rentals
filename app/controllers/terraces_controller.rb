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
end
