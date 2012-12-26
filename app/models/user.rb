class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # accessors
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :user_name

  # validation
<<<<<<< HEAD
   validates :first_name, :last_name, :user_name, presence: :true, on: :update
   validates :user_name, uniqueness: :true, on: :update
=======
  # validates :first_name, :last_name, :user_name, presence: :true
  # validates :user_name, uniqueness: :true
>>>>>>> 364af39ae1116d14437dd5ea8fc5a4fb90926df7
end
