class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @terrace = Terrace.find(params[:terrace_id])
    @review = Review.new(review_params)
    @review.terrace = @terrace
    @review.user = current_user
    raise
    if @review.save
      redirect_to terrace_path(@terrace)
    else
      render 'terraces/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
