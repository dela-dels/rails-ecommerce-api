class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  # this is a method to return a filtered version of the attributes of
  # our model. This prevents us from exposing certain sensitive attributes
  # by default
  def as_json(options = {})
  super(options.merge(
    except: [ :password_digest, :created_at, :updated_at ],
  ))
  end
end
