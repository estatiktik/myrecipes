class ReviewsController < ApplicationController
 
 
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
      render :new
    end
   end
  
  private
   
   def review_params
    params.require(:review).permit(:body, :recipe)
   end
   
   def set_recipe
      
   end
 
end