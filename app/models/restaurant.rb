class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, 
  acceptance: { accept: ["chinese", "italian", "japanese", "french", "belgian"] }
end
