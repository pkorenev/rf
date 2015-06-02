class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  
  attr_accessible :email, :password, :password_confirmation
  
  
  # User info
  attr_accessible :first_name
  attr_accessible :last_name
  attr_accessible :country
  attr_accessible :city
  attr_accessible :zip_code
  attr_accessible :company_url
  attr_accessible :username
  attr_accessible :image
  #attr_accessible :email
  attr_accessible :billing_cardholder_name
  attr_accessible :billing_address
  attr_accessible :billing_card_number
  attr_accessible :billing_cvv_number



end
