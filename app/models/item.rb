class Item < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, limit: { minimum: 5 }
                
end
