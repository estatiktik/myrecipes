class Review < ActiveRecord::Base
  
  validates :chef_id, presence: true
  validates :body, presence: true, length: { minimum: 10, maximum: 150 }
  
  belongs_to :chef
  belongs_to :recipe
  
 
end