class User < ActiveRecord::Base
  has_many :dog_queries, dependent: :destroy
  has_many :dogs, through: :dog_queries

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
