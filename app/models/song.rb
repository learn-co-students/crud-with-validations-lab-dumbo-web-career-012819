class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: { scope: :release_year }
  
  with_options if: :released do |year|
    year.validates :release_year, numericality: { less_than_or_equal_to: Time.current.year }
    year.validates :release_year, presence: true
  end

end
