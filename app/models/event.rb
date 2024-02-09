class Event < ApplicationRecord
  
  validates :name, :location, presence: true
  validates :description, length: { minimum: 25 }
  validates :capacity, numericality: { 
    only_integers: true, 
    greater_than: 0
  }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :image_file_name, format: {
    with: /\w+\.(png|jpg)\z/i,
    message: "must be JPG or PNG"
  }

  def self.upcoming
    where("starts_at > ?", Time.now).order("starts_at")
  end
  
  def free?
    price.zero? || price.blank?
  end
end
