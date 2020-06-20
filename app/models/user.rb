class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable,
  # :registerable, :recoverable, :validatable
  devise :database_authenticatable, :rememberable
end
