class ReviewsController < ApplicationController
 
  before_action :require_user_review, only: [:new]
  before_action :require_different_user, only: [:new]

  
  def new
    @review = Review.new
  end
 

   def create
    @review = Review.new(review_params)
    @review.chef = current_user
    @review.recipe = Recipe.find(params[:recipe])

    if @review.save
      flash[:success] = @review.chef.chefname + " Your review was submited successfully! " 
      redirect_to recipe_path(@review.recipe)
    else
      @review.errors.full_messages.each do |msg|
        flash[:danger] = msg
      end
      redirect_to new_review_path(@review.recipe)
    end
   end
  
  def show
  
  end
   
  
  private
   
   def review_params
    params.require(:review).permit(:body, :recipe)
   end
   
   def set_recipe

   end
   
   def require_user_review
      if !logged_in?
        flash[:danger] = "You must be logged in to perform that action."
        redirect_to recipe_path(params[:id])
      end
   end
   
   def require_different_user
     @recipe = Recipe.find(params[:id])
      if current_user == @recipe.chef
        flash[:danger] = "You can't review your own recipe."
        redirect_to recipe_path(params[:id])
      end
    end
 
end