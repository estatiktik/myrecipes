require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

def setup
    @chef = Chef.create(chefname: "bob2", email: "bob2@example.com")
    @recipe = @chef.recipes.build(name: "chicken parm 2222", summary: "this is the best chicken parm recipe ever 222", description: "heat oil, add onions, add tomato sauce, add chicken, cook for 20 minutes 222")
    @review = @recipe.reviews.build(body: "wow amazing recipe, you are great")
end

  test "review should be vaild" do
    assert @review.vaild?
  end
  
  test "chef_id shoule be present" do
    @review.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "body must be present" do
    @review.body = " "
    assert_not @review.valid?
  end
  
  test "body length should not be too long" do
    @review.body = "a" * 151
    assert_not @review.valid?
  end

end