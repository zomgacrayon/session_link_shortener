class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :urls

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  def self.authenticate (email, password)
    user = User.find_by_email(email)

    if user && user.password == password
      return user
    else

      return nil
    end
  end
end
