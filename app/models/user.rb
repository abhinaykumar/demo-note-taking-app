class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :notes
  has_many :shared_notes, class_name: 'ShareNote', foreign_key: 'shared_with_id'
end
