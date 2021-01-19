class ReviewsController < ApplicationController
  def new
    @terrace = Terrace.find(params[:terrace_id])
    @review = Review.new(review_params)
    @review.terrace = @terrace
    authorize @review
  end

  def create
    @terrace = Terrace.find(params[:terrace_id])
    if show_review
      @review = Review.new(review_params)
      @review.terrace = @terrace
      @review.user = current_user
      if @review.save
        redirect_to terrace_path(@terrace)
      else
        render 'terraces/show'
      end
    else
      flash[:alert] = "You cannot review your own terrace"
      redirect_to terrace_path(@terrace)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def show_review
    Terrace.find(params[:terrace_id]).user_id != current_user.id
  end
end
