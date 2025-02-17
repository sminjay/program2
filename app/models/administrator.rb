class Administrator < ApplicationRecord
  has_secure_password

  def is_admin?
    true
  end
end
