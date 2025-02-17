class User < ApplicationRecord
  has_secure_password
  has_many :tickets, dependent: :destroy

  def is_admin?
    email == "sjs@cinepack.com"
  end
end
