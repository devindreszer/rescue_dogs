class User < ActiveRecord::Base
  has_many :dog_matches, dependent: :destroy
  has_many :dogs, through: :dog_matches

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
