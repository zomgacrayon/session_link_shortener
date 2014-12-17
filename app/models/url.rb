class Url < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user

  before_create :shortener

  def shortener
    self.shorten_url = SecureRandom.hex(3)
  end

  def click_count
    self.times_clicked += 1
    save
  end
end
