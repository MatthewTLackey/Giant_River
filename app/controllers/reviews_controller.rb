class ReviewsController < ApplicationController
  before_filter :load_product
  before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]

  def index
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save 
      redirect_to products_path, notice: "Review created successfully"
    else
      render :action => :show
    end
  end

  def new
  end

  def edit
  end

  def show
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:content, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end


end
